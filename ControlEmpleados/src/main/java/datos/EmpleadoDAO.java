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
    //CRUD - Create - Read - Update - Delete 
    private static final String SQL_SELECT = 
            "SELECT id_empleado, nombre, apellido, email, telefono, saldo FROM empleados";
    private static final String SQL_INSERT = 
            "INSERT INTO empleados(nombre, apellido, email, telefono, saldo) VALUES(?, ?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = 
            "SELECT id_empleado, nombre, apellido, email, telefono, saldo FROM empleados WHERE id_empleado = ?";
    private static final String SQL_UPDATE = 
            "UPDATE empleados SET nombre=?, apellido=?, email=?, telefono=?, saldo=? WHERE id_empleado=?";
    private static final String SQL_DELETE = 
            "DELETE FROM empleados WHERE id_empleado = ?";
    
    public List<Empleado> listar(){
        List<Empleado> empleados = new ArrayList<>();
        try(Connection conn = Conexion.getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT);
                ResultSet rs = stmt.executeQuery()){
            // Iteramos los empleados de bd
            while(rs.next()){
                Empleado empleado = new Empleado(
                        rs.getInt("id_empleado"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("email"),
                        rs.getString("telefono"),
                        rs.getDouble("saldo")
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
            stmt.setString(2, empleado.getApellido());
            stmt.setString(3, empleado.getEmail());
            stmt.setString(4, empleado.getTelefono());
            stmt.setDouble(5, empleado.getSaldo());
            
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
                    empleado.setApellido(rs.getString("apellido"));
                    empleado.setEmail(rs.getString("email"));
                    empleado.setTelefono(rs.getString("telefono"));
                    empleado.setSaldo(rs.getDouble("saldo"));
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
            stmt.setString(2, empleado.getApellido());
            stmt.setString(3, empleado.getEmail());
            stmt.setString(4, empleado.getTelefono());
            stmt.setDouble(5, empleado.getSaldo());
            stmt.setInt(6, empleado.getIdEmpleado());
            
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
