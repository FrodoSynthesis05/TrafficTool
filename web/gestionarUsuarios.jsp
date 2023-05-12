<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.edison.model.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestionar Usuarios</title>
        <style>
            /* CSS styles for the table and form */
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            form {
                margin-bottom: 20px;
            }

            input[type="text"] {
                padding: 5px;
                width: 200px;
            }

            input[type="submit"] {
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <h1>Gestionar Usuarios</h1>


        <h2>Agregar/Editar Usuario</h2>
        <form method="POST" action="UsuarioServlet">
            <input type="hidden" name="action" value="Add">

            <label for="cedula">Cédula:</label>
            <input type="text" id="cedula" name="cedula">
            <br>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre">
            <br>

            <label for="contrasena">Contraseña:</label>
            <input type="text" id="contrasena" name="contrasena">
            <br>

            <input type="submit" value="Agregar">
        </form>

        <h2>Eliminar Usuario</h2>
        <form method="POST" action="UsuarioServlet">
            <input type="hidden" name="action" value="Delete">

            <label for="cedulaEliminar">Cédula:</label>
            <input type="text" id="cedulaEliminar" name="cedula">
            <br>

            <input type="submit" value="Delete">
        </form>


        <h2>Buscar Usuario</h2>
        <form method="POST" action="UsuarioServlet">
            <input type="hidden" name="action" value="Search">
            <label for="cedulaBuscar">Cédula:</label>
            <input type="text" id="cedulaBuscar" name="cedulaBuscar">
            <br>
            <input type="submit" value="Buscar">
        </form>


<%-- Display User Table --%>
<h2>Lista de Usuarios</h2>
<table>
    <tr>
        <th>Cédula</th>
        <th>Nombre</th>
        <th>Contraseña</th>
    </tr>
    <c:forEach var="usuario" items="${usuarios}">
        <tr>
            <td>${usuario.cedula}</td>
            <td>${usuario.nombre}</td>
            <td>${usuario.contrasena}</td>
        </tr>
    </c:forEach>
</table>


    </body>
</html>
