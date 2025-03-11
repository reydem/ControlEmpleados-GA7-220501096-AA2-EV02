<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Control de Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="d-flex align-items-center justify-content-center vh-100 bg-light">
        <div class="card shadow p-4" style="width: 350px;">
            <h3 class="text-center">Iniciar Sesión</h3>
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Usuario</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Ingresar</button>
                <%-- Mensaje de error si las credenciales son incorrectas --%>
                    <% String error=request.getParameter("error"); if (error !=null && error.equals("true")) { %>
                        <p class="text-danger mt-3 text-center">Usuario o contraseña incorrectos</p>
                        <% } %>
            </form>
        </div>
    </body>

    </html>