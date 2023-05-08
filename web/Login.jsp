<%-- 
    Document   : Login
    Created on : 17/04/2023, 01:59:36 PM
    Author     : EDISON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
                color: #333;
                padding: 0;
                margin: 0;
            }
            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }
            h1 {
                text-align: center;
                margin-top: 0;
            }
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: none;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            input[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                margin-top: 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #0069d9;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #007bff;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .alert {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
                border-radius: 5px;
                text-align: center;
                font-size: 16px;
                font-family: Arial, sans-serif;
                margin-top: 20px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Iniciar sesión</h1>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form action="./LoginServlet" method="POST">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Introduce tu nombre" required>

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" placeholder="Introduce tu contraseña" required>

                <input type="submit" value="Iniciar sesión">
                
                <div style="text-align: center; margin-top: 20px;">
                    <a href="./Usuarioinfo.jsp" style="color: #007bff; text-decoration: none;">¿No tienes una cuenta? Regístrate aquí.</a>
                </div>

                <a href="http://localhost:8080/U_TACTICO/OlvidarContrase%C3%B1ainfo.jsp">¿Olvidaste tu contraseña?</a>
            </form>
        </div>
    </body>
</html>
