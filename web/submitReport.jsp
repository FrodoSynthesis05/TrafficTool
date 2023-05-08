<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.edison.controller.ReportHandler" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Submit Report</title>
    </head>
    <body>
        <% 
            // Retrieve form data
            String causa = request.getParameter("causa");
            String descripcion = request.getParameter("descripcion");
            double latitud = Double.parseDouble(request.getParameter("latitud"));
            double longitud = Double.parseDouble(request.getParameter("longitud"));
            String tipoSeñal = request.getParameter("tipoSeñal");
            
            // Create an instance of the ReportHandler class
            ReportHandler reportHandler = new ReportHandler();
            
            // Save the report to the database
            reportHandler.saveReport(causa, descripcion, latitud, longitud, tipoSeñal);
        %>
        <h1>Report Submitted Successfully</h1>
        <!-- Display a success message or redirect to a success page -->
    </body>
</html>
