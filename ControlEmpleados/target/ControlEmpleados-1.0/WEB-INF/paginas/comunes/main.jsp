<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<main class="flex-1 border-l-4 border-gray-400 bg-white"><span data-slot="control"
          class="relative isolate block [&amp;_input]:has-[[data-slot=icon]:first-child]:pl-10 [&amp;_input]:has-[[data-slot=icon]:last-child]:pr-10 sm:[&amp;_input]:has-[[data-slot=icon]:first-child]:pl-8 sm:[&amp;_input]:has-[[data-slot=icon]:last-child]:pr-8 [&amp;>[data-slot=icon]]:pointer-events-none [&amp;>[data-slot=icon]]:absolute [&amp;>[data-slot=icon]]:top-3 [&amp;>[data-slot=icon]]:z-10 [&amp;>[data-slot=icon]]:size-5 sm:[&amp;>[data-slot=icon]]:top-2.5 sm:[&amp;>[data-slot=icon]]:size-4 [&amp;>[data-slot=icon]:first-child]:left-3 sm:[&amp;>[data-slot=icon]:first-child]:left-2.5 [&amp;>[data-slot=icon]:last-child]:right-3 sm:[&amp;>[data-slot=icon]:last-child]:right-2.5 [&amp;>[data-slot=icon]]:text-zinc-500 dark:[&amp;>[data-slot=icon]]:text-zinc-400"><svg
            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true"
            data-slot="icon" class="ml-5 ">
            <path fill-rule="evenodd"
              d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
              clip-rule="evenodd"></path>
          </svg><span data-slot="control"
            class="border-2 border-gray-400 rounded-lg my-5 mx-5 w-auto max-w-[500px] sm:leading-[0.75rem] relative block w-full before:absolute before:inset-px before:rounded-[calc(theme(borderRadius.lg)-1px)] before:bg-white before:shadow dark:before:hidden after:pointer-events-none after:absolute after:inset-0 after:rounded-lg after:ring-inset after:ring-transparent sm:after:focus-within:ring-2 sm:after:focus-within:ring-blue-500 has-[[data-disabled]]:opacity-50 before:has-[[data-disabled]]:bg-zinc-950/5 before:has-[[data-disabled]]:shadow-none before:has-[[data-invalid]]:shadow-red-500/10"><input
              name="search" aria-label="Search"
              class="relative block w-full appearance-none rounded-lg px-[calc(theme(spacing[3.5])-1px)] py-[calc(theme(spacing[2.5])-1px)] sm:px-[calc(theme(spacing[3])-1px)] sm:py-[calc(theme(spacing[1.5])-1px)] text-base/6 text-zinc-950 placeholder:text-zinc-500 sm:text-sm/6 dark:text-white border border-zinc-950/10 data-[hover]:border-zinc-950/20 dark:border-white/10 dark:data-[hover]:border-white/20 bg-transparent dark:bg-white/5 focus:outline-none data-[invalid]:border-red-500 data-[invalid]:data-[hover]:border-red-500 data-[invalid]:dark:border-red-500 data-[invalid]:data-[hover]:dark:border-red-500 data-[disabled]:border-zinc-950/20 dark:data-[hover]:data-[disabled]:border-white/15 data-[disabled]:dark:border-white/15 data-[disabled]:dark:bg-white/[2.5%] dark:[color-scheme:dark]"
              id="headlessui-input-:r3:" data-headlessui-state=""></span>
          <div class="absolute top-[5px] right-[100px] bg-white text-black font-bold">Comunidad</div>
          <div class="absolute top-[5px] right-[-120px] bg-white text-black font-bold">Soporte</div>
        </span>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       
<div class="px-4 sm:px-6 lg:px-8">
  <div class="sm:flex sm:items-center">
    <div class="sm:flex-auto">
      <h1 class="text-base font-semibold text-gray-900">Users</h1>
      <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
    </div>
    <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
      <button type="button" class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Add user</button>
    </div>
  </div>
  <div class="mt-8 flow-root">
    <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
        <table class="min-w-full divide-y divide-gray-300">
          <thead>
            <tr>
              <th scope="col" class="py-3.5 pr-3 pl-4 text-left text-sm font-semibold text-gray-900 sm:pl-3">Name</th>
              <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Title</th>
              <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Email</th>
              <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Role</th>
              <th scope="col" class="relative py-3.5 pr-4 pl-3 sm:pr-3">
                <span class="sr-only">Edit</span>
              </th>
            </tr>
          </thead>
          <tbody class="bg-white">
            <tr class="even:bg-gray-50">
              <td class="py-4 pr-3 pl-4 text-sm font-medium whitespace-nowrap text-gray-900 sm:pl-3">Lindsay Walton</td>
              <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">Front-end Developer</td>
              <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">lindsay.walton@example.com</td>
              <td class="px-3 py-4 text-sm whitespace-nowrap text-gray-500">Member</td>
              <td class="relative py-4 pr-4 pl-3 text-right text-sm font-medium whitespace-nowrap sm:pr-3">
                <a href="#" class="text-indigo-600 hover:text-indigo-900">Edit<span class="sr-only">, Lindsay Walton</span></a>
              </td>
            </tr>
            <!-- More people... -->
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
     <!--Listado Empleados-->
        <section id="empleados">
        
            <div class="">
                <div class="">
                    <div class="col-md-12">
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
                    

                </div>
            </div>
        </section> 


      </main>


 
      