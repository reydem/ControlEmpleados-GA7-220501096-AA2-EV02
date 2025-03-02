// /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/java/web/ServletControlador.java
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
 * @author Erik Lemus
 */
@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch (accion) {
            case "listar" -> this.listarEmpleados(request, response);
            case "editar" -> this.editarEmpleado(request, response);
            case "eliminar" -> this.eliminarEmpleado(request, response);
            default -> this.listarEmpleados(request, response);
        }
    }

    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Empleado> empleados = new EmpleadoDAO().listar();
        System.out.println("empleados: " + empleados);
        
        // Obtenemos la sesión
        HttpSession sesion = request.getSession();
        sesion.setAttribute("empleados", empleados);
        sesion.setAttribute("totalEmpleados", empleados.size());
        sesion.setAttribute("salarioTotal", this.calcularSalarioTotal(empleados));
        
        // Enviamos la respuesta al JSP de empleados
        request.getRequestDispatcher("empleados.jsp").forward(request, response);
    }

    private double calcularSalarioTotal(List<Empleado> empleados) {
        return empleados.stream().mapToDouble(Empleado::getSalario).sum();
    }

    private void editarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Empleado empleado = new EmpleadoDAO().encontrarEmpleado(new Empleado(idEmpleado));
        request.setAttribute("empleado", empleado);
        String jspEditar = "/WEB-INF/paginas/empleado/editarEmpleado.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        new EmpleadoDAO().eliminar(new Empleado(idEmpleado));
        this.listarEmpleados(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = Optional.ofNullable(request.getParameter("accion")).orElse("listar");
        switch (accion) {
            case "insertar" -> this.insertarEmpleado(request, response);
            case "modificar" -> this.modificarEmpleado(request, response);
            default -> this.listarEmpleados(request, response);
        }
    }

    private void insertarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Procesamos los datos del formulario
        String nombre = request.getParameter("nombre");
        String empresa = request.getParameter("empresa");
        String descripcion = request.getParameter("descripcion");
        double salario = Double.parseDouble(request.getParameter("salario"));

        // Creamos un objeto de tipo Empleado con la nueva estructura
        Empleado empleado = new Empleado(nombre, empresa, descripcion, salario);
        
        // Insertamos el nuevo empleado en la base de datos
        new EmpleadoDAO().insertar(empleado);
        
        // Listamos los empleados para reflejar los cambios
        this.listarEmpleados(request, response);
    }

    private void modificarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        String nombre = request.getParameter("nombre");
        String empresa = request.getParameter("empresa");
        String descripcion = request.getParameter("descripcion");
        double salario = Double.parseDouble(request.getParameter("salario"));

        Empleado empleado = new Empleado(idEmpleado, nombre, empresa, descripcion, salario);
        new EmpleadoDAO().actualizar(empleado);
        
        // Redirigimos al caso de listar
        this.listarEmpleados(request, response);
    }
}

