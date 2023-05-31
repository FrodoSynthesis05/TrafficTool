
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREAR USUARIO</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            h1 {
                text-align: center;
                margin-top: 50px;
            }

            form {
                margin: 50px auto;
                width: 500px;
                background-color: white;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
            }

            table {
                margin: 0 auto;
            }

            td {
                padding: 10px;
            }

            input[type="text"] {
                width: 100%;
                padding: 8px 16px;
                margin: 4px 0;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 8px 16px;
                margin: 4px 2px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            table.border {
                border-collapse: collapse;
                width: 100%;
                margin: 50px auto;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>CREAR USUARIO</h1>
        <c:if test="${not empty mensaje}">
            <p style="font-size: 24px; text-align: center;">${mensaje}</p>
        </c:if>

     <form action="Inicio.jsp" method="POST">
    <table>
        <tr>
            <td>CEDULA</td>
            <td><input type="text" name="cedula" value="${usu.cedula}" required/></td>
        </tr>
        <tr>
            <td>NOMBRE</td>
            <td><input type="text" name="nombre" value="${usu.nombre}" required/></td>
        </tr>
        <tr>
            <td>CONTRASEÑA</td>
            <td><input type="password" name="contrasena" value="${usu.contrasena}" required/></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center; margin-top: 20px;">
                <input type="submit" name="action" value="Add" />
            </td>
        </tr>
    </table>
</form>

        <c:if test="${not empty usuario and empty mensaje and mostrarTabla}">
            <table border="1">
                <tr>
                    <th>CEDULA</th>
                    <th>NOMBRE</th>
                    <th>CONTRASEÑA</th>
                </tr>
                <tr>
                    <td>${usuario.cedula}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.contrasena}</td>
                </tr>
            </table>
        </c:if>

        <c:if test="${empty usuario and not empty mensaje}">
            <p>${mensaje}</p>
        </c:if>

        <br>
        <div style="text-align: center; margin-top: 20px;">
            <a href="./Login.jsp" style="color: #007bff; text-decoration: none;">INICIAR SESION</a>
        </div>
    </body>
</html>
