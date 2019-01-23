using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Modul")]
    public class Modul
    {
        [DatabaseColumn("Id", IsPrimary = true, DefaultValue = -1)]
        public int? Id { get; set; } = -1;
        [DatabaseColumn("Dozent")]
        public int? Dozent { get; set; }
        [DatabaseColumn("Beschreibung")]
        public string Beschreibung { get; set; }
    }
}