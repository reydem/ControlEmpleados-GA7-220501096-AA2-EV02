package web;

import datos.EmpleadoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import modelo.Empleado;

/**
 *
 * @author ubaldo
 */
@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

     /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch(accion){
            case "listar" -> this.listarEmpleados(request, response);
            case "editar" -> this.editarEmpleado(request, response);
            case "eliminar" -> this.eliminarEmpleado(request, response);
            default -> this.listarEmpleados(request, response);
        }
    }
    
    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        List<Empleado> empleados = new EmpleadoDAO().listar();
        System.out.println("empleados:" + empleados);
        // Obtenemos la sesion
        HttpSession sesion = request.getSession();
        sesion.setAttribute("empleados", empleados);
        sesion.setAttribute("totalEmpleados", empleados.size());
        sesion.setAttribute("saldoTotal", this.calcularSaldoTotal(empleados));
        // Enviamos la respuesta al jsp de empleados
        request.getRequestDispatcher("empleados.jsp").forward(request, response);
    }
    
    private double calcularSaldoTotal(List<Empleado> empleados){
//        double saldoTotal = 0.0;
//        for(Empleado empleado: empleados){
//            saldoTotal += empleado.getSaldo();
//        }
//        return saldoTotal;
        
        return empleados.stream().mapToDouble(Empleado::getSaldo).sum();
    }
    
    private void editarEmpleado(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Empleado empleado = new EmpleadoDAO().encontrarEmpleado(new Empleado(idEmpleado));
        request.setAttribute("empleado", empleado);
        String jspEditar = "/WEB-INF/paginas/empleado/editarEmpleado.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }
    
    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        new EmpleadoDAO().eliminar(new Empleado(idEmpleado));
        // Listamos los empleados
        this.listarEmpleados(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch(accion){
            case "insertar" -> this.insertarEmpleado(request, response);
            case "modificar" -> this.modificarEmpleado(request, response);
            default -> this.listarEmpleados(request, response);
        }
    }
    
    private void insertarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Procesamos los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        
        // Creamos un objeto de tipo empleado
        Empleado empleado = new Empleado(nombre, apellido, email, telefono, saldo);
        new EmpleadoDAO().insertar(empleado);
        // Listamos los empleados
        this.listarEmpleados(request, response);
    }


    private void modificarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        
        Empleado empleado = new Empleado(idEmpleado, nombre, apellido, email, telefono, saldo);
        new EmpleadoDAO().actualizar(empleado);
        // Redirigimos al caso de listar
        this.listarEmpleados(request, response);
    }
    
    
}
