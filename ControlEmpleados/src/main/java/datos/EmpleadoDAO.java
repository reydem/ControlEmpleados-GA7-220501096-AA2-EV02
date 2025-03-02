// /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/java/datos/EmpleadoDAO.java
package datos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Empleado;

/**
 *
 * @author ubaldo
 */
public class EmpleadoDAO {
    // CRUD - Create - Read - Update - Delete 
    private static final String SQL_SELECT = 
            "SELECT id, nombre, empresa, descripcion, salario FROM info_empleo";
    private static final String SQL_INSERT = 
            "INSERT INTO info_empleo(nombre, empresa, descripcion, salario) VALUES(?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = 
            "SELECT id, nombre, empresa, descripcion, salario FROM info_empleo WHERE id = ?";
    private static final String SQL_UPDATE = 
            "UPDATE info_empleo SET nombre=?, empresa=?, descripcion=?, salario=? WHERE id=?";
    private static final String SQL_DELETE = 
            "DELETE FROM info_empleo WHERE id = ?";
    
    public List<Empleado> listar(){
        List<Empleado> empleados = new ArrayList<>();
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT);
                ResultSet rs = stmt.executeQuery()){
            // Iteramos los empleados de la BD
            while(rs.next()){
                Empleado empleado = new Empleado(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("empresa"),
                        rs.getString("descripcion"),
                        rs.getDouble("salario")
                );
                empleados.add(empleado);
            }
        } catch (SQLException ex) {
           ex.printStackTrace(System.out);
        }
        return empleados;
    }
    
    public int insertar(Empleado empleado){
        int rows = 0;
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt =  conn.prepareStatement(SQL_INSERT)){
            stmt.setString(1, empleado.getNombre());
            stmt.setString(2, empleado.getEmpresa());
            stmt.setString(3, empleado.getDescripcion());
            stmt.setDouble(4, empleado.getSalario());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }
    
    public Empleado encontrarEmpleado(Empleado empleado){
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID)){
            stmt.setInt(1, empleado.getIdEmpleado());
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    empleado.setNombre(rs.getString("nombre"));
                    empleado.setEmpresa(rs.getString("empresa"));
                    empleado.setDescripcion(rs.getString("descripcion"));
                    empleado.setSalario(rs.getDouble("salario"));
                }
            }
        } catch (SQLException ex) {
           ex.printStackTrace(System.out);
        }
        return empleado;
    }
    
    public int actualizar(Empleado empleado){
        int rows = 0;
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt =  conn.prepareStatement(SQL_UPDATE)){
            stmt.setString(1, empleado.getNombre());
            stmt.setString(2, empleado.getEmpresa());
            stmt.setString(3, empleado.getDescripcion());
            stmt.setDouble(4, empleado.getSalario());
            stmt.setInt(5, empleado.getIdEmpleado());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }
    
    public int eliminar(Empleado empleado){
        int rows = 0;
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt =  conn.prepareStatement(SQL_DELETE)){
            
            stmt.setInt(1, empleado.getIdEmpleado());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }
}
