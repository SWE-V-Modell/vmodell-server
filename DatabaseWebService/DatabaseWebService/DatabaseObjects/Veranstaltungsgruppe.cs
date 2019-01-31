using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Veranstaltungsgruppen")]
    public class Veranstaltungsgruppe
    {
        [DatabaseColumn("Id", IsPrimary = true, DefaultValue = -1)]
        public int? Id { get; set; } = -1;
        [DatabaseColumn("GruppeId")]
        public int? GruppeId { get; set; }
        [DatabaseColumn("VeranstaltungId")]
        public int? VeranstaltungId { get; set; }
    }
}