using System;

namespace DatabaseWebService
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DatabaseColumn : Attribute
    {
        public string ColumnName { get; }
        public bool IsPrimary { get; set; }
        public object DefaultValue { get; set; }
        
        public DatabaseColumn(string columName)
        {
            ColumnName = columName;
        }
    }
}