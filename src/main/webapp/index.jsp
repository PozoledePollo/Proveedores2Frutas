<%-- 
    Document   : index
    Created on : 16 mar 2025, 17:39:56
    Author     : bruni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión - Gestión de Proveedores</title>
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <div class="container">
            <h1>Iniciar Sesión</h1>
            <form action="LoginServlet" method="post">
                <label for="username">Usuario:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <input type="submit" value="Iniciar Sesión">
            </form>
            <% if (request.getAttribute("error") != null) { %>
                <p class="mensaje-error"><%= request.getAttribute("error") %></p>
            <% } %>
        </div>
    </body>
</html>
