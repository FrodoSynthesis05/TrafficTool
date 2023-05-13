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
                        <th>Tipo de Senal</th>
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
                                out.println("<option value=\"Senal de Pare\">Seleccione un valor</option>");
                                out.println("<option value=\"Senal de Pare\">Senal de Pare</option>");
                                out.println("<option value=\"Senal de Ceda el Paso\">Senal de Ceda el Paso</option>");
                                out.println("<option value=\"Senal de Prohibido el Paso\">Senal de Prohibido el Paso</option>");
                                out.println("<option value=\"Senal de Paso Peatonal\">Senal de Paso Peatonal</option>");
                                out.println("<option value=\"Senal de Zona Escolar\">Senal de Zona Escolar</option>");
                                out.println("<option value=\"Senal de Límite de Velocidad\">Senal de Limite de Velocidad</option>");
                                out.println("<option value=\"Senal de Adelante con Precaución\">Senal de Adelante con Precaucion</option>");
                                out.println("<option value=\"Senal de No Adelantar\">Senal de No Adelantar</option>");
                                out.println("<option value=\"Senal de Cruce de Peatones\">Senal de Cruce de Peatones</option>");
                                out.println("<option value=\"Senal de Paso de Vehículos Pesados\">Senal de Paso de Vehiculos Pesados</option>");
                                out.println("<option value=\"Senal de Curva Peligrosa\">Senal de Curva Peligrosa</option>");
                                out.println("<option value=\"Senal de Intersección en T\">Senal de Interseccion en T</option>");
                                out.println("<option value=\"Senal de Intersección en Y\">Senal de Interseccion en Y</option>");
                                out.println("<option value=\"Senal de Paso a Nivel\">Senal de Paso a Nivel</option>");
                                out.println("<option value=\"Senal de Zona de Trabajo\">Senal de Zona de Trabajo</option>");
                                out.println("<option value=\"Senal de Desvío Obligatorio\">Senal de Desvio Obligatorio</option>");
                                out.println("<option value=\"Senal de Zona de Parqueo\">Senal de Zona de Parqueo</option>");
                                out.println("<option value=\"Senal de Reductor de Velocidad\">Senal de Reductor de Velocidad</option>");
                                out.println("<option value=\"Senal de Estacionamiento Prohibido\">Senal de Estacionamiento Prohibido</option>");
                                out.println("<option value=\"Senal de Zona de Control de Velocidad\">Senal de Zona de Control de Velocidad</option>");
                                out.println("</select>");
                                out.println("</td>");
                                out.println("<td><input type=\"submit\" name=\"update_" + reportId + "\" value=\"Actualizar\"></td>");
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
