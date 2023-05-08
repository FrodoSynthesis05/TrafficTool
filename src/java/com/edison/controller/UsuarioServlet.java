package com.edison.controller;

import com.edison.model.Usuario;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.edison.dao.UsuarioDaoLocal;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @EJB
    private UsuarioDaoLocal UsuarioDao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        //--------------------------------------------------------
        String cedulaStr = request.getParameter("cedula");
        int cedula = 0;
        if (cedulaStr != null && !cedulaStr.equals("")) {
            cedula = Integer.parseInt(cedulaStr);
        }
        //--------------------------------------------------------
        String nombreStr = request.getParameter("nombre");
        //--------------------------------------------------------
        String contrasenaStr = request.getParameter("contrasena");
        //--------------------------------------------------------

        //--------------------------------------------------------
        //--------------------------------------------------------
        Usuario usu = new Usuario(cedula, nombreStr, contrasenaStr);

        String mensaje = null; // Creamos la variable mensaje
        boolean mostrarTabla = false; // Creamos la variable mostrarTabla

        if ("Add".equalsIgnoreCase(action)) {
            // Validamos si el usuario ya existe en la base de datos
            if (UsuarioDao.getUsuarioByCedula(cedula) != null) {
                mensaje = "Usuario ya registrado"; // Asignamos el mensaje a la variable
            } else {
                UsuarioDao.addUsuario(usu);
                mostrarTabla = true; // Cambiamos mostrarTabla a true para que se muestre la tabla
            }
        } else if ("Edit".equalsIgnoreCase(action)) {
            UsuarioDao.editUsuario(usu);
            mostrarTabla = true; // Cambiamos mostrarTabla a true para que se muestre la tabla
        } else if ("Delete".equalsIgnoreCase(action)) {
            UsuarioDao.deleteUsuario(cedula);
            mostrarTabla = true; // Cambiamos mostrarTabla a true para que se muestre la tabla
        } else if ("Search".equalsIgnoreCase(action)) {
            usu = UsuarioDao.getUsuario(cedula);
            mostrarTabla = true; // Cambiamos mostrarTabla a true para que se muestre la tabla
        }
        //--------------------------------------------------------
        request.setAttribute("usu", usu);
        request.setAttribute("usuario", usu); // Establecemos usuario con el objeto usu creado para asegurar que no se muestre el usuario duplicado
        request.setAttribute("mensaje", mensaje); // Agregamos el mensaje como atributo
        request.setAttribute("mostrarTabla", mostrarTabla); // Agregamos mostrarTabla como atributo
        request.getRequestDispatcher("Usuarioinfo.jsp").forward(request, response);
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
