using System.Data;
using MySql.Data.MySqlClient;

namespace DatabaseWebService
{
    public class DatabaseConnection
    {
        private const string ConnectionString = "Server=127.0.0.1;Database=swe;Uid=root;Pwd=12345;";
        private static MySqlConnection _connection;

        public MySqlConnection GetInstance()
        {
            if(_connection == null) _connection = new MySqlConnection(ConnectionString);
            if(_connection.State == ConnectionState.Closed) _connection.Open();
            return _connection;
        }
    }
}