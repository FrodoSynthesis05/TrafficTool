<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Menu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            h1 {
                text-align: center;
            }

            h2 {
                text-align: center;
                margin-top: 20px;
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                text-align: center;
            }

            li {
                display: inline-block;
                margin: 10px;
            }

            a {
                display: block;
                padding: 10px 20px;
                background-color: #428bca;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
            }

            a:hover {
                background-color: #3071a9;
            }
        </style>
    </head>
    <body>
        <h1>Menu superusuario</h1>
        <h2>Seleccione una opcion:</h2>
        <ul>
            <li><a href="gestionarUsuarios.jsp">Gestionar Usuarios</a></li>
            <li><a href="gestionarReportes.jsp">Gestionar Reportes</a></li>
        </ul>
    </body>
</html>
