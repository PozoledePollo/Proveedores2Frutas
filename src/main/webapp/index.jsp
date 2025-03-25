<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión - Frutas y Verduras</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
            <h1>Iniciar Sesión Proveedores</h1>
            <form action="login" method="post">
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
