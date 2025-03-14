<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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



        <div class="px-4 sm:px-6 lg:px-8 border-t-4 border-gray-400 mt-[18px]">
          <div class="sm:flex sm:items-center">
            <div class="sm:flex-auto">
              <h1 class="text-base font-semibold text-gray-900">Comtrol Empleados</h1>
            </div>
            <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
              <button id="btnOpenModal" type="button"
                class="block rounded-md bg-gray-950 px-3 py-2 text-center text-sm font-semibold text-white shadow-xs hover:bg-gray-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                <i class="bi bi-plus-circle"></i> Agregar Empleado</button>
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
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-900">${empleado.nombre}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-900">${empleado.empresa}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-900">${empleado.descripcion}</td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-900">
                          <fmt:formatNumber value="${empleado.salario}" type="currency" />
                        </td>
                        <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">
                          <!-- Botón para editar, se pasa la información a través de atributos data- -->
                          <button type="button"
                            class="editarEmpleado bg-blue-500 hover:bg-blue-700 text-white px-2 py-1 rounded mr-2"
                            data-id="${empleado.idEmpleado}" data-nombre="${empleado.nombre}"
                            data-empresa="${empleado.empresa}" data-descripcion="${empleado.descripcion}"
                            data-salario="${empleado.salario}">
                            <i class="bi bi-pencil"></i> Editar
                          </button>
                          <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idEmpleado=${empleado.idEmpleado}"
                            class="bg-red-500 hover:bg-red-700 text-white px-2 py-1 rounded">
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
          <ul class="listado-empleados border-gray-400 border-t-4 my-0 text-gray-950">
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 11</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 10</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 9</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 8</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 7</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 6</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 5</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 4</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 3</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 2</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
            <li class="empleado mx-auto flex flex-col mt-3 max-w-7xl items-start justify-between px-4 sm:px-6 lg:px-8">
              <button class="btn btn-light text-black font-bold hover:text-gray-300 flex items-center gap-2"><svg
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5"
                  stroke="currentColor" aria-hidden="true" data-slot="icon" class="w-6 h-6 text-black">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0 1 12 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 0 1-.673-.38m0 0A2.18 2.18 0 0 1 3 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 0 1 3.413-.387m7.5 0V5.25A2.25 2.25 0 0 0 13.5 3h-3a2.25 2.25 0 0 0-2.25 2.25v.894m7.5 0a48.667 48.667 0 0 0-7.5 0M12 12.75h.008v.008H12v-.008Z">
                  </path>
                </svg>Oferta de empleo 1</button>
              <p class="text-xs leading-tight mt-2 font-bold">Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
            </li>
          </ul>
        </div>
      </main>


      <!-- Modal (oculto por defecto) -->
      <div id="agregarEmpleadoModal"
        class="fixed inset-0 z-50 hidden overflow-auto bg-black bg-opacity-50 flex items-center justify-center ">
        <div class="bg-white rounded-lg w-full max-w-2xl mx-4 border-4 border-gray-400 rounded-[32px]">
          <!-- Encabezado del Modal -->
          <div class="flex justify-between items-center bg-white text-white p-4 rounded-t-lg">
            <h5 class="text-lg font-semibold text-gray-500" id="agregarEmpleadoLabel">Agregar Empleado</h5>
            <button type="button" class="text-white text-2xl leading-none" id="closeModal">&times;</button>
          </div>
          <!-- Formulario para agregar un nuevo empleado -->
          <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar" method="POST"
            class="p-4">
            <div class="space-y-4">
              <div>
                <label for="nombre" class="block text-gray-700">Nombre</label>
                <input type="text" id="nombre" name="nombre" required
                  class="w-full border border-gray-300 rounded p-2 bg-white text-gray-950" />
              </div>
              <div>
                <label for="empresa" class="block text-gray-700">Empresa</label>
                <input type="text" id="empresa" name="empresa" required
                  class="w-full border border-gray-300 rounded p-2 bg-white text-gray-950" />
              </div>
              <div>
                <label for=" descripcion" class="block text-gray-700">Descripción</label>
                <input type="text" id="descripcion" name="descripcion" required
                  class="w-full border border-gray-300 rounded p-2 bg-white text-gray-950" />
              </div>
              <div>
                <label for=" salario" class="block text-gray-700">Salario</label>
                <input type="number" id="salario" name="salario" required step="any"
                  class="w-full border border-gray-300 rounded p-2 bg-white text-gray-950" />
              </div>
            </div>
            <!-- Pie de página del modal -->
            <div class=" flex justify-end space-x-2 mt-4">
              <button type="button" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded" id="cancelModal">
                Cancelar
              </button>
              <button type="submit" class="bg-gray-950 hover:bg-gray-700 text-white px-4 py-2 rounded">
                Guardar
              </button>
            </div>
          </form>
        </div>
      </div>

      <script>
        // Elementos del modal
        var modal = document.getElementById('agregarEmpleadoModal');
        var btnOpen = document.getElementById('btnOpenModal');
        var btnClose = document.getElementById('closeModal');
        var btnCancel = document.getElementById('cancelModal');

        // Abrir el modal al hacer clic en el botón "Agregar Empleado"
        btnOpen.addEventListener('click', function () {
          modal.classList.remove('hidden');
        });

        // Cerrar el modal al hacer clic en la "X" o en "Cancelar"
        btnClose.addEventListener('click', function () {
          modal.classList.add('hidden');
        });
        btnCancel.addEventListener('click', function () {
          modal.classList.add('hidden');
        });

        // Cerrar el modal si se hace clic fuera del contenido
        window.addEventListener('click', function (event) {
          if (event.target === modal) {
            modal.classList.add('hidden');
          }
        });
      </script>


      <!-- Modal para editar empleado (oculto por defecto) -->
      <div id="editarEmpleadoModal"
        class="fixed inset-0 z-50 hidden overflow-auto bg-black bg-opacity-50 flex items-center justify-center">
        <div class="bg-white rounded-lg w-full max-w-2xl mx-4">
          <!-- Encabezado del Modal -->
          <div class="flex justify-between items-center bg-blue-500 text-white p-4 rounded-t-lg">
            <h5 class="text-lg font-semibold" id="editarEmpleadoLabel">Editar Empleado</h5>
            <button type="button" class="text-white text-2xl leading-none" id="cerrarEditarModal">&times;</button>
          </div>
          <!-- Formulario de edición -->
          <form id="formEditarEmpleado" action="" method="POST" class="p-4">
            <div class="space-y-4">
              <div>
                <label for="editarNombre" class="block text-gray-700">Nombre</label>
                <input type="text" id="editarNombre" name="nombre" required
                  class="w-full border border-gray-300 rounded p-2" />
              </div>
              <div>
                <label for="editarEmpresa" class="block text-gray-700">Empresa</label>
                <input type="text" id="editarEmpresa" name="empresa" required
                  class="w-full border border-gray-300 rounded p-2" />
              </div>
              <div>
                <label for="editarDescripcion" class="block text-gray-700">Descripción</label>
                <input type="text" id="editarDescripcion" name="descripcion" required
                  class="w-full border border-gray-300 rounded p-2" />
              </div>
              <div>
                <label for="editarSalario" class="block text-gray-700">Salario</label>
                <input type="number" id="editarSalario" name="salario" required step="any"
                  class="w-full border border-gray-300 rounded p-2" />
              </div>
            </div>
            <!-- Pie del modal -->
            <div class="flex justify-end space-x-2 mt-4">
              <button type="button" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded"
                id="cancelarEditarModal">
                Cancelar
              </button>
              <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">
                Guardar Cambios
              </button>
            </div>
          </form>
        </div>
      </div>

      <script>
        // Referencias del modal de edición
        var editarModal = document.getElementById('editarEmpleadoModal');
        var cerrarEditarModal = document.getElementById('cerrarEditarModal');
        var cancelarEditarModal = document.getElementById('cancelarEditarModal');
        var formEditarEmpleado = document.getElementById('formEditarEmpleado');

        // Función para abrir el modal y cargar datos
        function abrirEditarModal(button) {
          var idEmpleado = button.getAttribute('data-id');
          var nombre = button.getAttribute('data-nombre');
          var empresa = button.getAttribute('data-empresa');
          var descripcion = button.getAttribute('data-descripcion');
          var salario = button.getAttribute('data-salario');

          // Cargar valores en los campos del modal
          document.getElementById('editarNombre').value = nombre;
          document.getElementById('editarEmpresa').value = empresa;
          document.getElementById('editarDescripcion').value = descripcion;
          document.getElementById('editarSalario').value = salario;

          // Actualizar la acción del formulario con el id del empleado
          formEditarEmpleado.action = "${pageContext.request.contextPath}/ServletControlador?accion=modificar&idEmpleado=" + idEmpleado;

          // Mostrar el modal
          editarModal.classList.remove('hidden');
        }

        // Asignar el evento a todos los botones "Editar"
        var editarButtons = document.querySelectorAll('.editarEmpleado');
        editarButtons.forEach(function (button) {
          button.addEventListener('click', function () {
            abrirEditarModal(this);
          });
        });

        // Cerrar el modal cuando se hace clic en "x" o en "Cancelar"
        cerrarEditarModal.addEventListener('click', function () {
          editarModal.classList.add('hidden');
        });
        cancelarEditarModal.addEventListener('click', function () {
          editarModal.classList.add('hidden');
        });

        // Cerrar el modal si se hace clic fuera del contenido
        window.addEventListener('click', function (event) {
          if (event.target === editarModal) {
            editarModal.classList.add('hidden');
          }
        });
      </script>