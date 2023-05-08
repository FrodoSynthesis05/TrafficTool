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
                out.println("<table>");
                out.println("<tr><th>Report ID</th><th>Causa</th><th>Descripción</th><th>Latitud</th><th>Longitud</th><th>Tipo de Señal</th></tr>");
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
                    out.println("</tr>");
                }
                out.println("</table>");

                // Close database connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            %>

        </div>
    </body>
</html>
