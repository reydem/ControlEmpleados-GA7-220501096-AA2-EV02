<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <main class="flex-1 border-l-4 border-gray-400 bg-white">

    <div>
      <div class="ml-4 mt-3 grid grid-cols-1">
        <input type="email" name="email" id="email"
          class="col-start-1 row-start-1 block w-[550px] rounded-md bg-white py-1 pr-3 pl-10 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:pl-9 sm:text-sm/6 border-2 border-gray-400"
          placeholder="">

        <svg class="pointer-events-none col-start-1 row-start-1 ml-3 size-5 self-center text-gray-400"
          viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" data-slot="icon">
          <path fill-rule="evenodd"
            d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z"
            clip-rule="evenodd" />
        </svg>
      </div>

      <div>
        <div class="absolute top-[101px] right-[611px] bg-white text-black font-bold">Comunidad</div>
        <div class="absolute top-[101px] right-[389px] bg-white text-black font-bold">Soporte</div>
      </div>
    </div>


    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div class="px-4 sm:px-6 lg:px-8 border-t-4 border-gray-400 mt-[18px]">
          <div class="sm:flex sm:items-center">
            <div class="sm:flex-auto">
              <h1 class="text-base font-semibold text-gray-900">Comtrol Empleados</h1>
            </div>
            <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
              <button type="button"
                class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Add
                user</button>
            </div>
          </div>
          <div class="mt-8 flow-root">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                <table class="min-w-full divide-y divide-gray-300">
                  <thead>
                    <tr>
                      <th scope="col" class="py-3.5 pr-3 pl-4 text-left text-sm font-semibold text-gray-900 sm:pl-3">#
                      </th>
                      <th scope="col" class="py-3.5 pr-3 pl-4 text-left text-sm font-semibold text-gray-900 sm:pl-3">
                        Nombre</th>
                      <th scope="col" class="py-3.5 pr-3 pl-4 text-left text-sm font-semibold text-gray-900 sm:pl-3">
                        Empresa</th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Descripción</th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Salario</th>
                      <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Acciones</th>
                      <th scope="col" class="relative py-3.5 pr-4 pl-3 sm:pr-3">
                        <span class="sr-only">Edit</span>
                      </th>
                    </tr>
                  </thead>
                  <tbody class="bg-white">
                    <c:forEach var="empleado" items="${empleados}" varStatus="status">
                      <tr class="even:bg-gray-50">
                        <td class="py-4 pr-3 pl-4 text-sm font-medium whitespace-nowrap text-gray-900 sm:pl-3">
                          ${status.count}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">${empleado.nombre}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">${empleado.empresa}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">${empleado.descripcion}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">
                          <fmt:formatNumber value="${empleado.salario}" type="currency" />
                        </td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500"><a
                            href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idEmpleado=${empleado.idEmpleado}"
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
                    <!-- More people... -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
  </main>