/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edison.controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.edison.dao.UsuarioDaoLocal;
import com.edison.model.Usuario;

@WebServlet(name = "OlvidarContraseñaServlet", urlPatterns = {"/OlvidarContraseñaServlet"})
public class OlvidarContraseñaServlet extends HttpServlet {

    @EJB
    private UsuarioDaoLocal UsuarioDao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //--------------------------------------------------------
        String cedulaStr = request.getParameter("cedula");      

        //--------------------------------------------------------
        String nombreStr = request.getParameter("nombre");

        //--------------------------------------------------------
        String contrasenaStr = request.getParameter("password");

        //--------------------------------------------------------
        if(cedulaStr != null && !cedulaStr.isEmpty()){
            Usuario usuario = UsuarioDao.getUsuarioByCedula(Integer.parseInt(cedulaStr));

            if(usuario != null){
                // Actualizar nombre y contraseña segun el usuario con la cedula registrada
                usuario.setNombre(nombreStr);
                usuario.setContrasena(contrasenaStr);
                UsuarioDao.editUsuario(usuario);

                // Redireccionar al login para iniciar session.
                response.sendRedirect("Login.jsp");
            }else{
                // Si la cedula no existe, es decir que el usuario no existe, le dice al usuario que se registre si asi lo desea.
                request.setAttribute("error", "Usuario no existe");
                request.getRequestDispatcher("OlvidarContraseñainfo.jsp").forward(request, response);
            }
        }else{
            // Si la cedula está vacía, mostrar un mensaje de error y volver a mostrar la página de login
            request.setAttribute("error", "Debe ingresar una cedula");
            request.getRequestDispatcher("OlvidarContraseñainfo.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
