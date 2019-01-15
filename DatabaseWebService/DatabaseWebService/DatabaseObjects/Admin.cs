using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Admin")]
    public class Admin
    {
        [DatabaseColumn("Id")]
        public int? Id { get; set; }
        [DatabaseColumn("Name")]
        public string Name { get; set; }
        [DatabaseColumn("E_Mail")]
        public string EMail { get; set; }
        [DatabaseColumn("Password")]
        public string Password { get; set; }
    }
}