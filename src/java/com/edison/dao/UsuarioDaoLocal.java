/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edison.dao;

import com.edison.model.Usuario;
import java.util.List;
import javax.ejb.Local;

/**
 * Interfaz que define los métodos para realizar operaciones CRUD sobre la entidad Usuario.
 */
@Local
public interface UsuarioDaoLocal {

    void addUsuario(Usuario usuario);

    void editUsuario(Usuario usuario);

    void deleteUsuario(int cedula);

    Usuario getUsuario(int cedula);
    
    Usuario getUsuarioByUsername(String nombre);
    
    Usuario getUsuarioByCedula(int cedula);

    List<Usuario> getAllUsuarios();
    
 
}
