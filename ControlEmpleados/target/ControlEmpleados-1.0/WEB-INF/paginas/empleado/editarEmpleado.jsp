<!doctype html>
<html data-bs-theme="dark">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editar Empleado</title>
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!--Bootstrap Iconos-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>
    <!--Cabecero-->
    <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp" />

    <!--Formulario de edición de un empleado-->
    <form
        action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idEmpleado=${empleado.idEmpleado}"
        method="POST" class="was-validated">

        <!--Botones de navegación de edición-->
        <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionEdicion.jsp" />

        <div class="container my-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>Editar Empleado</h4>
                </div>
                <div class="card-body">

                    <div class="form-group mb-3">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required
                            value="${empleado.nombre}" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="empresa">Empresa</label>
                        <input type="text" class="form-control" id="empresa" name="empresa" required
                            value="${empleado.empresa}" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="descripcion">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" required
                            value="${empleado.descripcion}" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="salario">Salario</label>
                        <input type="number" class="form-control" id="salario" name="salario" required step="any"
                            value="${empleado.salario}" />
                    </div>
                    <button type="submit" class="btn btn-success">Guardar Cambios</button>

                </div>
            </div>
        </div>

    </form>

    <!--Pie de página-->
    <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>