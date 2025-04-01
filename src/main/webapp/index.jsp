<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Iniciar Sesión - Frutas y Verduras</title>
        <!-- Habilita la vista responsiva en dispositivos móviles -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <!-- Tu hoja de estilos personalizada -->
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container d-flex flex-column justify-content-center align-items-center min-vh-100">
            <!-- Tarjeta de login -->
            <div class="card shadow p-4" style="max-width: 400px; width: 100%;">
                <h1 class="text-center mb-4 text-success">Iniciar Sesión</h1>
                <form action="login" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Usuario:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
                </form>

                <!-- Mensaje de error si las credenciales son incorrectas -->
                <%
                    if (request.getAttribute("error") != null) {
                %>
                    <p class="text-danger text-center mt-3">
                        <%= request.getAttribute("error") %>
                    </p>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Bootstrap JS (opcional, pero útil para componentes dinámicos) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
