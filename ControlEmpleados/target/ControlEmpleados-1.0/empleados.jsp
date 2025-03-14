<!-- /webapps/infoEmpleo-GA7-220501096-AA2-EV02/ControlEmpleados/src/main/webapp/empleados.jsp -->
<!doctype html>
<html data-bs-theme="dark">

<head>
  <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Control de Empleados</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Tailwind CSS (CDN) -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Personalizaci�n opcional de Tailwind -->
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              customRed: '#7f1d1d'
            }
          }
        }
      }
    </script>
</head>

<body>
  <div class="main-layout flex min-h-full flex-col p-20 bg-slate-300 font-nanum">
    <div
      class="mx-auto flex w-full max-w-7xl items-start px-0 py-0 sm:px-6 lg:px-8 border-4 border-gray-400 rounded-[32px] bg-white">
      <!--aside-left-->
      <jsp:include page="/WEB-INF/paginas/comunes/aside-left.jsp" />
      <!--main-->
      <jsp:include page="/WEB-INF/paginas/comunes/main.jsp" />
      <!--Modal agregar un empleado-->
      <jsp:include page="/WEB-INF/paginas/empleado/agregarEmpleado.jsp" />
      <!--aside-right-->
      <jsp:include page="/WEB-INF/paginas/comunes/aside-right.jsp" />
    </div>
  </div>
  <%-- <!--Cabecero-->
    <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp" />

    <!--Botones de Navegaci?n-->
    <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacion.jsp" />

    <!--Listado de Empleados-->
    <jsp:include page="/WEB-INF/paginas/empleado/listadoEmpleados.jsp" />



    <!--Pie p?gina-->
    <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script> --%>
</body>

</html>