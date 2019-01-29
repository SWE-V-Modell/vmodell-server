using System.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace DatabaseWebService
{
    public class DatabaseConnection
    {
        private const string ConnectionString = "Server=127.0.0.1;Database=swe;Uid=root;Pwd=12345;";
        private static List<MySqlConnection> _connections;

        public static MySqlConnection GetInstance()
        {
            if (_connections == null) _connections = new List<MySqlConnection>();

            var connection = new MySqlConnection(ConnectionString);
            _connections.Add(connection);

            if(connection.State == ConnectionState.Closed) connection.Open();

            return connection;
        }

        public static void CloseInstance(MySqlConnection connection)
        {
            connection.Close();
            _connections.Remove(connection);
        }
    }
}