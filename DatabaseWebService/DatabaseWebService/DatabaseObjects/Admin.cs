using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Admin")]
    public class Admin
    {
        [DatabaseColumn("Id", IsPrimary = true)]
        public int? Id { get; set; }
        [DatabaseColumn("Name")]
        public string Name { get; set; }
        [DatabaseColumn("Account")]
        public int? Account { get; set; }
    }
}