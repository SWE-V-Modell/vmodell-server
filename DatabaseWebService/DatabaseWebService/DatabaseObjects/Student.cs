using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Student")]
    public class Student
    {
        [DatabaseColumn("Id", DefaultValue = -1)]
        public int? Id { get; set; } = -1;
        [DatabaseColumn("Name")]
        public string Name { get; set; }
        [DatabaseColumn("E_Mail")]
        public string EMail { get; set; }
        [DatabaseColumn("Gruppe")]
        public int? Gruppe { get; set; }
        [DatabaseColumn("Password")]
        public string Password { get; set; }
      
    }
}