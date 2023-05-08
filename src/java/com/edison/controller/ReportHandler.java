package com.edison.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportHandler {

    private static final String DB_URL = "jdbc:derby://localhost:1527/U_TACTICO";
    private static final String DB_USERNAME = "proyecto";
    private static final String DB_PASSWORD = "1234";
    private static int reportId;

    public static void main(String[] args) {
        // Example usage: call the saveReport method with the form data
        //saveReport("falta de infraestructura", "Accidente en la calle principal", 37.7749, -122.4194, "Pare");
    }

    public static void saveReport(String causa, String descripcion, double latitud, double longitud, String tipoSeñal) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Generate a unique report ID
            int reportId = generateReportId(conn);
            ReportHandler.reportId = reportId;
            // Prepare the SQL statement to insert the report into the table
            String sql = "INSERT INTO REPORTES (CAUSA, REPORT_ID, DESCRIPCION, LATITUD, LONGITUD, TIPO_SENAL) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, causa);
            stmt.setInt(2, reportId);
            stmt.setString(3, descripcion);
            stmt.setDouble(4, latitud);
            stmt.setDouble(5, longitud);
            stmt.setString(6, tipoSeñal);

            // Execute the SQL statement
            stmt.executeUpdate();

            System.out.println("Report saved successfully with ID: " + reportId);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private static int generateReportId(Connection conn) throws SQLException {
        // Retrieve the highest existing report ID from the table
        String sql = "SELECT MAX(REPORT_ID) AS MAX_ID FROM REPORTES";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        int maxId = 0;
        if (rs.next()) {
            maxId = rs.getInt("MAX_ID");
        }
        rs.close();
        stmt.close();

        // Increment the highest ID by 1 to generate a new ID
        return maxId + 1;
    }

    public int getReportId() {
        System.out.println(reportId);
        return reportId;
        
    }
}
