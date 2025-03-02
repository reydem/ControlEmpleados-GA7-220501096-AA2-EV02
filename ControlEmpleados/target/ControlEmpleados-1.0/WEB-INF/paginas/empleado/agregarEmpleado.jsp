<div class="modal fade" id="agregarEmpleadoModal" tabindex="-1" aria-labelledby="agregarEmpleadoLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title" id="agregarEmpleadoLabel">Agregar Empleado</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!--Formulario para agregar un nuevo empleado-->
            <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar" method="POST"
                class="was-validated">
                <div class="modal-body">
                    <div class="form-group mb-3">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="empresa">Empresa</label>
                        <input type="text" class="form-control" id="empresa" name="empresa" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="descripcion">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" required />
                    </div>
                    <div class="form-group mb-3">
                        <label for="salario">Salario</label>
                        <input type="number" class="form-control" id="salario" name="salario" required step="any" />
                    </div>
                </div>
                <!--Pie de página de la ventana modal-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>