/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edison.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ActualizarSolucionServlet")
public class ActualizarSolucionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the form data
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("solucion_")) {
                int reportId = Integer.parseInt(paramName.substring("solucion_".length()));
                String solucion = request.getParameter(paramName);

                // Update the database with the selected solution for the given report ID
                updateSolucion(reportId, solucion);
            }
        }

        // Redirect the user to a success page
        response.sendRedirect("gestionarReportes.jsp");
    }

    private void updateSolucion(int reportId, String solucion) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/U_TACTICO", "proyecto", "1234");

            // Create SQL statement
            String sql = "UPDATE REPORTES SET SOLUCION = ? WHERE REPORT_ID = ?";

            // Prepare the statement
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, solucion);
            stmt.setInt(2, reportId);

            // Execute the update
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close statement and connection
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
