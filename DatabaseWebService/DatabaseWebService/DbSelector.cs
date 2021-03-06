using System;
using System.Collections.Generic;
using DatabaseWebService.DatabaseObjects;

namespace DatabaseWebService
{
    public static class DbSelector
    {
        public static List<object> MatchTemplate(object template)
        {
            //The result list to be returned
            var output = new List<object>();
            var connection = DatabaseConnection.GetInstance();
            var command = connection.CreateCommand();
            var paramCount = 0;
            
            //Receive the Mappable classes Table attribute, to know the database table to select from
            var tableAttribute = template.GetType().GetCustomAttributes(typeof(DatabaseTable), false);
            command.CommandText = $"SELECT * FROM {((DatabaseTable)tableAttribute[0]).TableName}";

            //Add an Equals request for every submitted property in the template
            foreach (var property in template.GetType().GetProperties())
            {
                var val = property.GetValue(template);
                //receive the properties column attribute to know the column name
                var attributes = property.GetCustomAttributes(typeof(DatabaseColumn), false);
                
                //if the property has not column attribute ignore it
                if (attributes.Length == 0) continue;
                var columnAtt = (DatabaseColumn) attributes[0];
                
                //if the properties value is equal to its own default value ignore it
                if (columnAtt.DefaultValue?.Equals(val) ?? val == null) continue;
                
                //decide whether to put AND or WHERE based on the parameterCount
                command.CommandText += paramCount > 0 ? " AND " : " WHERE ";

                //put '' around string literals
                if (property.GetValue(template) is string)
                    command.CommandText += $"{columnAtt.ColumnName} = '{val}'";
                else
                    command.CommandText += $"{columnAtt.ColumnName} = {val}";

                paramCount++;
            }

            command.CommandText += ";";

            //create a new db object and map it from the sql reader
            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var obj = Activator.CreateInstance(template.GetType());
                    //compare each property of the target object to its respective database-column in the reader (if existent)
                    foreach (var property in template.GetType().GetProperties())
                    {
                        //skip if property has no column description or is not a DatabaseColumn attribute
                        if (!(property.GetCustomAttributes(typeof(DatabaseColumn), false)?[0] is DatabaseColumn attribute)) continue;
                    
                        //find the column-index to receive the value
                        var ordinal = reader.GetOrdinalSave(attribute.ColumnName);
                        if(ordinal > -1)
                            property.SetValue(obj, reader.GetValue(ordinal));
                                
                    }
                    output.Add(obj);
                }
            }

            DatabaseConnection.CloseInstance(connection);
            
            return output;
        }

        public static void Insert(object data)
        {
            var connection = DatabaseConnection.GetInstance();
            var command = connection.CreateCommand();
            var columns = "";
            var values = "";
            
            foreach (var property in data.GetType().GetProperties())
            {
                var t = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
                if (!(property.GetCustomAttributes(typeof(DatabaseColumn), false)?[0] is DatabaseColumn databaseColumn)) continue;
                if (databaseColumn.IsPrimary) continue;
                columns += $"{databaseColumn.ColumnName},";
                
                if(t == typeof(string))
                    values += $"\"{property.GetValue(data)}\",";
                else if(t == typeof(DateTime)) 
                    values += $"\"{((DateTime)property.GetValue(data)).ToString("yyyy-MM-dd HH:mm:ss")}\",";
                else
                    values += $"{property.GetValue(data)},";
            }

            columns = columns.Substring(0, columns.Length - 1);
            values = values.Substring(0, values.Length - 1);
            
            //Receive the Mappable classes Table attribute, to know the database table to select from
            var tableAttribute = data.GetType().GetCustomAttributes(typeof(DatabaseTable), false);
            command.CommandText = $"INSERT INTO {((DatabaseTable)tableAttribute[0]).TableName}({columns}) VALUES ({values}); ";

            command.ExecuteNonQuery();
            DatabaseConnection.CloseInstance(connection);
        }
      
        public static void Update(int id, object data)
        {
            var connection = DatabaseConnection.GetInstance();
            var command = connection.CreateCommand();
            var sets = "";
        
            foreach (var property in data.GetType().GetProperties())
            {
                var t = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
                var value = property.GetValue(data);
                if(!(property.GetCustomAttributes(typeof(DatabaseColumn), false)?[0] is DatabaseColumn columnAtt)) continue;
                if (columnAtt.DefaultValue?.Equals(value) ?? value == null) continue;
                
                sets += $"{columnAtt.ColumnName} = ";
                
                if(t == typeof(string))
                    sets += $"\"{property.GetValue(data)}\",";
                else if (t == typeof(DateTime))
                    sets += $"\"{((DateTime)property.GetValue(data)).ToString("yyyy-MM-dd HH:mm:ss")}\",";
                else
                    sets += $"{property.GetValue(data)},";
            }

            sets = sets.Substring(0, sets.Length - 1);
            
            //Receive the Mappable classes Table attribute, to know the database table to select from
            var tableAttribute = data.GetType().GetCustomAttributes(typeof(DatabaseTable), false);
            command.CommandText = $"UPDATE {((DatabaseTable)tableAttribute[0]).TableName} SET {sets} WHERE Id = {id}; ";

            command.ExecuteNonQuery();
            DatabaseConnection.CloseInstance(connection);
        }
        
        public static void Delete(int id, Type type)
        {
            var connection = DatabaseConnection.GetInstance();
            var command = connection.CreateCommand();
        
            //Receive the Mappable classes Table attribute, to know the database table to select from
            var tableAttribute = type.GetCustomAttributes(typeof(DatabaseTable), false);
            command.CommandText = $"DELETE FROM {((DatabaseTable)tableAttribute[0]).TableName} WHERE Id = {id}; ";

            command.ExecuteNonQuery();
            DatabaseConnection.CloseInstance(connection);
        }
    }
}