// /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/java/datos/Conexion.java
package datos;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author ubaldo
 */
public class Conexion {
    private static final String JDBC_URL = 
            "jdbc:mysql://localhost:3306/info_empleo_db?"
            + "useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "0613";
    private static BasicDataSource dataSource;
    
    public static DataSource getDataSource(){
        if(dataSource == null){
            dataSource = new BasicDataSource();
            dataSource.setUrl(JDBC_URL);
            dataSource.setUsername(JDBC_USER);
            dataSource.setPassword(JDBC_PASSWORD);
            dataSource.setInitialSize(10);
            dataSource.setMaxTotal(50);
        }
        return dataSource;
    }
    
    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }
}
