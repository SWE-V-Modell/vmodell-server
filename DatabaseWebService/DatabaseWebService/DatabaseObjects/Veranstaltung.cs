using System;
using System.Collections.Generic;
using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Veranstaltung")]
    public class Veranstaltung
    {
        [DatabaseColumn("Id", IsPrimary = true, DefaultValue = -1)]
        public int? Id { get; set; } = -1;
        [DatabaseColumn("Title")]
        public string Titel { get; set; }
        [DatabaseColumn("Date_Begin")]
        public DateTime? Date_Begin { get; set; }
        [DatabaseColumn("Date_End")]
        public DateTime? Date_End { get; set; }
        [DatabaseColumn("Anmerkung")]
        public string Anmerkung { get; set; }
        [DatabaseColumn("DozentId", DefaultValue = -1)]
        public int? DozentId { get; set; } = -1;
    }
}