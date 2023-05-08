<%-- 
    Document   : OlvidarContraseñainfo
    Created on : 18/04/2023, 12:03:26 PM
    Author     : EDISON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                flex-direction: column;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
                border: 2px solid black;
                padding: 20px;
                border-radius: 10px;
            }
            label {
                font-size: 1.2rem;
                font-weight: bold;
                margin-top: 10px;
            }
            input[type="text"], input[type="password"] {
                margin-bottom: 20px;
                padding: 10px;
                border-radius: 5px;
                border: none;
            }
            input[type="submit"] {
                padding: 10px 30px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 10px;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            }
            input[type="submit"][name="crear"] {
                background-color: #2196F3;
                margin-bottom: 20px;
            }
            input[type="submit"][name="crear"]:hover {
                background-color: #0b7dda;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Recuperar contraseña</h1>
            <%-- ------------------------------------------------------------------------------------------------------------- --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <%-- ------------------------------------------------------------------------------------------------------------- --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form action="./OlvidarContraseñaServlet" method="POST">
                <label for="cedula">Cédula de ciudadanía:</label>
                <input type="text" id="cedula" name="cedula"   placeholder="Introduce tu cédula" required>

                <label for="nombre">Nombre nuevo:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Introduce tu nombre" required>

                <label for="password">Contraseña nueva:</label>
                <input type="password" id="password" name="password"  placeholder="Introduce tu contraseña" required>

                <input type="submit" name="action" value="Guardar cambios">
                
                <div style="text-align: center; margin-top: 20px;">
                    <a href="./Login.jsp" style="color: #007bff; text-decoration: none;">INICIAR SESION</a>
                </div>

                <div style="text-align: center; margin-top: 20px;">
                    <a href="./Usuarioinfo.jsp" style="color: #007bff; text-decoration: none;">¿No tienes una cuenta? Regístrate aquí.</a>
                </div>
            </form>
        </div>
    </body>
</html>


