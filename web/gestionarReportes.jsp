<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ver Reportes</title>
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
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Ver Reportes</h1>

            <form method="POST" action="ActualizarSolucionServlet">
                <table>
                    <tr>
                        <th>Report ID</th>
                        <th>Causa</th>
                        <th>Descripción</th>
                        <th>Latitud</th>
                        <th>Longitud</th>
                        <th>Tipo de Señal</th>
                        <th>Solución</th>
                        <th></th>
                    </tr>
                    <%
                        try {
                            // Establish database connection
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/U_TACTICO", "proyecto", "1234");

                            // Create SQL statement
                            String sql = "SELECT * FROM REPORTES";

                            // Execute SQL query
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);

                            // Display report data in a table
                            while (rs.next()) {
                                int reportId = rs.getInt("REPORT_ID");
                                String causa = rs.getString("CAUSA");
                                String descripcion = rs.getString("DESCRIPCION");
                                double latitud = rs.getDouble("LATITUD");
                                double longitud = rs.getDouble("LONGITUD");
                                String tipoSenal = rs.getString("TIPO_SENAL");

                                out.println("<tr>");
                                out.println("<td>" + reportId + "</td>");
                                out.println("<td>" + causa + "</td>");
                                out.println("<td>" + descripcion + "</td>");
                                out.println("<td>" + latitud + "</td>");
                                out.println("<td>" + longitud + "</td>");
                                out.println("<td>" + tipoSenal + "</td>");
                                out.println("<td>");
                                out.println("<select name=\"solucion_" + reportId + "\">");
                                out.println("<option value=\"Señal de Pare\">Señal de Pare</option>");
                                out.println("<option value=\"Señal de Ceda el Paso\">Señal de Ceda el Paso</option>");
                                out.println("<option value=\"Señal de Prohibido el Paso\">Señal de Prohibido el Paso</option>");
                                out.println("<option value=\"Señal de Paso Peatonal\">Señal de Paso Peatonal</option>");
                                out.println("<option value=\"Señal de Zona Escolar\">Señal de Zona Escolar</option>");
                                out.println("<option value=\"Señal de Límite de Velocidad\">Señal de Límite de Velocidad</option>");
                                out.println("<option value=\"Señal de Adelante con Precaución\">Señal de Adelante con Precaución</option>");
                                out.println("<option value=\"Señal de No Adelantar\">Señal de No Adelantar</option>");
                                out.println("<option value=\"Señal de Cruce de Peatones\">Señal de Cruce de Peatones</option>");
                                out.println("<option value=\"Señal de Paso de Vehículos Pesados\">Señal de Paso de Vehículos Pesados</option>");
                                out.println("<option value=\"Señal de Curva Peligrosa\">Señal de Curva Peligrosa</option>");
                                out.println("<option value=\"Señal de Intersección en T\">Señal de Intersección en T</option>");
                                out.println("<option value=\"Señal de Intersección en Y\">Señal de Intersección en Y</option>");
                                out.println("<option value=\"Señal de Paso a Nivel\">Señal de Paso a Nivel</option>");
                                out.println("<option value=\"Señal de Zona de Trabajo\">Señal de Zona de Trabajo</option>");
                                out.println("<option value=\"Señal de Desvío Obligatorio\">Señal de Desvío Obligatorio</option>");
                                out.println("<option value=\"Señal de Zona de Parqueo\">Señal de Zona de Parqueo</option>");
                                out.println("<option value=\"Señal de Reductor de Velocidad\">Señal de Reductor de Velocidad</option>");
                                out.println("<option value=\"Señal de Estacionamiento Prohibido\">Señal de Estacionamiento Prohibido</option>");
                                out.println("<option value=\"Señal de Zona de Control de Velocidad\">Señal de Zona de Control de Velocidad</option>");
                                out.println("</select>");
                                out.println("</td>");
                                out.println("<td><input type=\"submit\" value=\"Actualizar\" formaction=\"successUpdate.jsp\"></td>");
                                out.println("</tr>");
                            }

                            // Close database connection
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
            </form>


        </div>
    </body>
</html>
