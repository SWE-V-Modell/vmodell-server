using System;
using MySql.Data.MySqlClient;

namespace DatabaseWebService
{
    public static class MySqlExtensions
    {
        public static int GetOrdinalSave(this MySqlDataReader reader, string columnName)
        {
            var ordinal = -1;
            try
            {
                ordinal = reader.GetOrdinal(columnName);
            }
            catch (IndexOutOfRangeException)
            {

            }

            return ordinal;
        }
    }
}