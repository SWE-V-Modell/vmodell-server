using System;
using System.Collections.Generic;
using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Veranstalter")]
    public class Veranstalter
    {
        [DatabaseColumn("Id", DefaultValue = -1)]
        public int? Id { get; set; } = -1;
        [DatabaseColumn("Modul")]
        public int? Modul { get; set; }
        [DatabaseColumn("Datum")]
        public DateTime? Datum { get; set; }
        [DatabaseColumn("Zeit_von")]
        public DateTime? Von { get; set; }
        [DatabaseColumn("Zeit_bis")]
        public DateTime? Bis { get; set; }
        [DatabaseColumn("Anmerkung")]
        public string Anmerkung { get; set; }
    
    }
}