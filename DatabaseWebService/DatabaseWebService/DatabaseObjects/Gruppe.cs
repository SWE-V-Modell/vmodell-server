using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Scaffolding.Metadata;
using MySql.Data.MySqlClient;

namespace DatabaseWebService.DatabaseObjects
{
    [Serializable]
    [DatabaseTable("Gruppe")]
    public class Gruppe
    {
        [DatabaseColumn("Id", DefaultValue = -1)]
        public int? Id { get; set; } = -1;
    }
}