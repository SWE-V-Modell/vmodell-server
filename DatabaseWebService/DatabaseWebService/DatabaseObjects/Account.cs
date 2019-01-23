using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Account")]
    public class Account
    {
        [DatabaseColumn("Id", IsPrimary = true)]
        public int? Id { get; set; }
        [DatabaseColumn("Email")]
        public string EMail { get; set; }
        [DatabaseColumn("Password")]
        public string Password { get; set; }
    }
}