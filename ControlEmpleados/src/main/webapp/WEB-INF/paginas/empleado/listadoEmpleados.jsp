<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!--Listado Empleados-->
        <section id="empleados">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h4>Listado de Empleados</h4>
                            </div>
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Empresa</th>
                                        <th>Descripción</th>
                                        <th>Salario</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="empleado" items="${empleados}" varStatus="status">
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>${empleado.nombre}</td>
                                            <td>${empleado.empresa}</td>
                                            <td>${empleado.descripcion}</td>
                                            <td>
                                                <fmt:formatNumber value="${empleado.salario}" type="currency" />
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idEmpleado=${empleado.idEmpleado}"
                                                    class="btn btn-secondary btn-sm">
                                                    <i class="bi bi-pencil"></i> Editar
                                                </a>
                                                <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idEmpleado=${empleado.idEmpleado}"
                                                    class="btn btn-danger btn-sm">
                                                    <i class="bi bi-trash"></i> Eliminar
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--Totales-->
                    <div class="col-md-3">
                        <div class="card text-center bg-danger text-white mb-3">
                            <div class="card-body">
                                <h3>Salario Total</h3>
                                <h4 class="display-6">
                                    <fmt:formatNumber value="${salarioTotal}" type="currency" />
                                </h4>
                            </div>
                        </div>

                        <div class="card text-center bg-success text-white mb-3">
                            <div class="card-body">
                                <h3>Total Empleados</h3>
                                <h4 class="display-6">
                                    <i class="bi bi-people"></i> ${totalEmpleados}
                                </h4>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>