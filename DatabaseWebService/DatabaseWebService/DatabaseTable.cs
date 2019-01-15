using System;

namespace DatabaseWebService
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false)]
    public class DatabaseTable : Attribute
    {
        public string TableName { get; }
        
        public DatabaseTable(string tablename)
        {
            TableName = tablename;
        }
    }
}