<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Report</title>
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

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                display: block;
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-input {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .form-select {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .form-submit {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create Report</h1>

            <form action="submitReport.jsp" method="post">
                <div class="form-group">
                    <label class="form-label">Causa:</label>
                    <select class="form-select" name="causa">
                        <option value="bache">Bache</option>
                        <option value="falta de infraestructura">Falta de infraestructura</option>
                        <option value="deterioro">Deterioro</option>
                        <option value="error humano">Error humano</option>
                        <option value="señalizacion">Señalización</option>
                        <option value="clima">Clima</option>
                        <option value="falla mecanica">Falla mecánica</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Descripción:</label>
                    <textarea class="form-input" name="descripcion" rows="4"></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">Latitud:</label>
                    <input class="form-input" type="text" name="latitud">
                </div>

                <div class="form-group">
                    <label class="form-label">Longitud:</label>
                    <input class="form-input" type="text" name="longitud">
                </div>

                <div class="form-group">
                    <label class="form-label">Había algún tipo de señalización?</label>
                    <input class="form-input" type="text" name="tipoSenal">
                </div>

                <div class="

                     form-group">
                    <input type="submit" value="Submit" class="form-submit">
                </div>
            </form>
        </div>

    </body>

</html>