// /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/java/modelo/Empleado.java
package modelo;

/**
 *
 * @author Erik Lemus
 */
public class Empleado {
    private int idEmpleado;
    private String nombre;
    private String empresa;
    private String descripcion;
    private double salario;

    public Empleado() {
    }

    public Empleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public Empleado(String nombre, String empresa, String descripcion, double salario) {
        this.nombre = nombre;
        this.empresa = empresa;
        this.descripcion = descripcion;
        this.salario = salario;
    }

    public Empleado(int idEmpleado, String nombre, String empresa, String descripcion, double salario) {
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.empresa = empresa;
        this.descripcion = descripcion;
        this.salario = salario;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override
    public String toString() {
        return "Empleado{" + 
               "idEmpleado=" + idEmpleado + 
               ", nombre='" + nombre + '\'' +
               ", empresa='" + empresa + '\'' +
               ", descripcion='" + descripcion + '\'' +
               ", salario=" + salario + 
               '}';
    }
}

