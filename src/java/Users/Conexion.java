package Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    // Datos de conexión a la base de datos 
    private final String dbURL = "jdbc:mysql://barberiabyl.mysql.database.azure.com:3306/bdbarberia?useSSL=true&requireSSL=false&serverTimezone=UTC";
    private final String dbUser = "AdminBarberiaByL"; 
    private final String dbPassword = "BarberiaByL123"; 

    // Método para establecer la conexión
    public Connection conecta() throws ClassNotFoundException, SQLException {
        // Cargar el driver JDBC de MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establecer la conexión
        return DriverManager.getConnection(dbURL, dbUser, dbPassword);
    }
}