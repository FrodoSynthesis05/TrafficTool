package com.edison.controller;

import com.edison.model.Usuario;
import com.edison.dao.UsuarioDaoLocal;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @EJB
    private UsuarioDaoLocal usuarioDao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        String cedulaStr = request.getParameter("cedula");
        int cedula = 0;
        if (cedulaStr != null && !cedulaStr.isEmpty()) {
            cedula = Integer.parseInt(cedulaStr);
        }

        String nombre = request.getParameter("nombre");
        String contrasena = request.getParameter("contrasena");

        Usuario usuario = new Usuario(cedula, nombre, contrasena);

        String mensaje = null;
        boolean mostrarTabla = false;

        if ("Add".equalsIgnoreCase(action)) {
            if (usuarioDao.getUsuarioByCedula(cedula) != null) {
                mensaje = "Usuario ya registrado";
            } else {
                usuarioDao.addUsuario(usuario);
                mostrarTabla = true;
            }
        } else if ("Edit".equalsIgnoreCase(action)) {
            usuarioDao.editUsuario(usuario);
            mostrarTabla = true;
        } else if ("Delete".equalsIgnoreCase(action)) {
            usuarioDao.deleteUsuario(cedula);
            mostrarTabla = true;
            response.sendRedirect("Inicio.jsp");
            return;
        } else if ("Search".equalsIgnoreCase(action)) {
            usuario = usuarioDao.getUsuario(cedula);
            mostrarTabla = true;
        }

        List<Usuario> usuarios = usuarioDao.getAllUsuarios();

        request.setAttribute("usuarios", usuarios);
        request.setAttribute("usuario", usuario);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("mostrarTabla", mostrarTabla);

        request.getRequestDispatcher("gestionarUsuarios.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
