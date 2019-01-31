using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Student")]
    public class Student
    {
        [DatabaseColumn("Id", IsPrimary = true)]
        public int? Id { get; set; }
        [DatabaseColumn("Name")]
        public string Name { get; set; }
        [DatabaseColumn("GruppeId")]
        public int? GruppeId { get; set; }
        [DatabaseColumn("AccountId")]
        public int? AccountId { get; set; }
      
    }
}