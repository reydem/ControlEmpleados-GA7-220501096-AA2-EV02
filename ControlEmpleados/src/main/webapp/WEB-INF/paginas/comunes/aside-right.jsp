      <aside class="sticky top-8 hidden w-44 shrink-0 xl:block  border-4 border-gray-400 mt-[70px]">
<!--Totales-->
                    <divs class="col-md-3">
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

                    </divs>
      </aside>