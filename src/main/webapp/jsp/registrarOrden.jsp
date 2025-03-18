<%--
    Document   : registrarOrden
    Created on : Mar 15, 2025
    Author     : bruni (mejorado, sin Proveedor)
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.proveedoresfrutas2.model.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Verificar que exista una sesión activa
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    // Cargar productos desde MongoDB
    List<Producto> productosDisponibles = new ArrayList<>();
    com.mongodb.client.MongoCollection<org.bson.Document> productosCollection = 
        com.mycompany.proveedoresfrutas2.util.MongoDBConnection.getDatabase()
                                                               .getCollection("productos");
    for (org.bson.Document doc : productosCollection.find()) {
        Producto p = new Producto();
        p.setId(doc.getObjectId("_id").toString());
        p.setNombre(doc.getString("nombre"));
        p.setPrecio(doc.getDouble("precio"));
        productosDisponibles.add(p);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Orden de Compra</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <div class="container">
        <h1>Registrar Orden de Compra</h1>

        <!-- Mensajes de retroalimentación (éxito/error) -->
        <c:if test="${not empty mensaje}">
            <p class="mensaje-exito">${mensaje}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="mensaje-error">${error}</p>
        </c:if>

        <!-- Formulario principal -->
        <form action="${pageContext.request.contextPath}/OrdenCompraServlet" method="post">
            <input type="hidden" name="accion" value="registrar">
            
            <!-- Proveedor: se muestra de forma estática -->
            <label>Proveedor:</label>
            <input type="text" value="Proveedor 1" readonly>
            <br><br>

            <!-- Lista de productos disponibles -->
            <label>Productos:</label>
            <div id="productos-container">
                <% if (!productosDisponibles.isEmpty()) { %>
                    <% for (int i = 0; i < productosDisponibles.size(); i++) {
                        Producto p = productosDisponibles.get(i);
                    %>
                    <div class="producto-item">
                        <input type="checkbox" name="productoId" value="<%= p.getId() %>" id="prodChk<%= i %>">
                        <label for="prodChk<%= i %>">
                            <%= p.getNombre() %> - $<%= String.format("%.2f", p.getPrecio()) %>/kg
                        </label>
                        <input type="number" name="cantidad" min="1" placeholder="Cantidad" disabled>
                    </div>
                    <% } %>
                <% } else { %>
                    <p>No hay productos disponibles.</p>
                <% } %>
            </div>
            <br>

            <!-- Tiempo de entrega -->
            <label for="tiempoEntregaDias">Tiempo de Entrega Estimado (días):</label>
            <input type="number" id="tiempoEntregaDias" name="tiempoEntregaDias" min="1" required>
            <br><br>

            <!-- Notas opcionales -->
            <label for="notas">Notas:</label>
            <textarea id="notas" name="notas" rows="3" placeholder="Escribe notas o comentarios (opcional)"></textarea>
            <br><br>

            <!-- Botón para enviar -->
            <input type="submit" value="Registrar Orden">
            <!-- Botón o enlace para volver -->
            <a href="${pageContext.request.contextPath}/OrdenCompraServlet?accion=listar" class="back-button">
                Volver a la lista
            </a>
        </form>
    </div>

    <!-- Script para habilitar/deshabilitar el campo de cantidad según el checkbox -->
    <script>
        const checkboxes = document.querySelectorAll('input[name="productoId"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const cantidadInput = this.parentElement.querySelector('input[name="cantidad"]');
                cantidadInput.disabled = !this.checked;
                if (!this.checked) {
                    cantidadInput.value = '';
                }
            });
        });
    </script>
</body>
</html>
