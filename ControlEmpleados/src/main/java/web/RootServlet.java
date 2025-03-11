// /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/java/web/RootServlet.java
package web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "RootServlet", urlPatterns = {"/"})
public class RootServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Verifica si el usuario está autenticado
        if (session != null && session.getAttribute("user") != null) {
            // Redirige a ServletControlador si el usuario está autenticado
            response.sendRedirect(request.getContextPath() + "/ServletControlador");
        } else {
            // Si no está autenticado, lo manda al login
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
