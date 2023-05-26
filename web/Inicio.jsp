<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Menú de inicio</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            .container {
                max-width: 960px;
                margin: 0 auto;
                padding: 40px;
            }

            h1 {
                text-align: center;
                margin-bottom: 40px;
            }

            .option {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 200px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                margin-bottom: 40px;
                cursor: pointer;
            }

            .option:hover {
                background-color: #f5f5f5;
            }

            .option-image {
                width: 50%;
                height: 100%;
                background-size: cover;
                background-position: center;
                border-radius: 5px 0 0 5px;
            }

            .option-text {
                width: 50%;
                height: 100%;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                text-align: center;
            }

            .option-text h2 {
                margin: 0;
                margin-bottom: 20px;
                font-size: 24px;
            }

            .option-text p {
                margin: 0;
                font-size: 16px;
                color: #666;
            }
        </style>
        <script>
            function validateCredentials() {
                var username = prompt("Enter administrator username:");
                var password = prompt("Enter administrator password:");

                // You can replace 'admin' and 'password' with your actual credentials
                if (username === 'admin' && password === 'root') {
                    window.location.href = 'gestionar.jsp';
                } else {
                    alert('Invalid credentials. Please try again.');
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Menú de inicio</h1>

            <div class="option" onclick="location.href = 'crearReporte.jsp';">
                <div class="option-image" style="background-image: url('imagenes/accidente.jpg');"></div>
                <div class="option-text">
                    <h2>Crear reporte de accidente</h2>
                    <p>Crea un nuevo reporte de accidente.</p>
                </div>
            </div>



            <div class="option" onclick="location.href = 'verReporte.jsp';">
                <div class="option-image" style="background-image: url('imagenes/reporte.png');"></div>
                <div class="option-text">
                    <h2>Ver reportes creados</h2>
                    <p>Visualiza los reportes creados anteriormente.</p>
                </div>
            </div>

            <div class="option" onclick="validateCredentials();">
                <div class="option-image" style="background-image: url('imagenes/usuarios.png');"></div>
                <div class="option-text">
                    <h2>Gestionar usuarios y reportes</h2>
                    <p>Agrega, modifica o elimina usuarios y gestiona reportes.</p>
                </div>

            </div>
        </div>
    </body>
</html>

