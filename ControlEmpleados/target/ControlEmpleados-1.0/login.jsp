<!DOCTYPE html>
<html lang="es">

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Control de Empleados</title>
        <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8 font-nanum">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
        <a href="/">
            <img src="${pageContext.request.contextPath}/assets/Logo.png" alt="Your Company"
                class="mx-auto h-44 w-auto">
        </a>
        <h2 class="mt-10 text-center text-3xl font-bold tracking-tight text-gray-900">
            Iniciar Sesión
        </h2>
    </div>
    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm border-4 border-gray-400 rounded-[32px] bg-slate-300">
        <form action="LoginServlet" method="post" class="space-y-4">
            <div>
                <label for="username" class="text-center block text-xl font-bold text-gray-900">
                    Usuario:
                </label>
                <div class="mt-2 flex justify-center">

                    <input type="text" name="username" id="username" required
                        class="block w-60 rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm">
                </div>
            </div>
            <div>
                <label for="password" class="text-center block text-xl font-bold text-gray-900">Contraseña:</label>
                <div class="mt-2 flex justify-center">
                    <input type="password" name="password" id="password" required
                        class="block w-60 rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm">
                </div>
            </div>
            <div class="flex items-center ml-[70px]">
                <input id="link-checkbox" type="checkbox" value=""
                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2">
                <label class="ms-2 text-sm font-medium text-black">Recuérdame</label>
            </div>
            <div class="flex justify-center">
                <button type="submit"
                    class="flex w-36 justify-center rounded-md bg-black px-3 py-1.5 text-sm font-semibold text-white shadow-sm hover:bg-gray-500">Entrar</button>
            </div>
        </form>
        <div class="mb-10">
            <% String error=request.getParameter("error"); if (error !=null && error.equals("true")) { %>
                <p class="mt-4 text-center text-sm text-red-700">Usuario o contraseña incorrectos</p>
                <% } %>
                    <p class="mt-4 text-center text-sm text-black">Aún no tengo cuenta, quiero
                        <a href="register.jsp"
                            class="font-semibold text-black hover:text-gray-500 underline">Registrarme</a>
                    </p>
        </div>
    </div>
</body>

</html>