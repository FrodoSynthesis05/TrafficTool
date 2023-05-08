/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edison.dao;

import com.edison.model.Usuario;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

/**
 * Clase que implementa la interfaz UsuarioDaoLocal y se encarga de interactuar
 * con la base de datos para realizar operaciones CRUD sobre la entidad Usuario.
 */
@Stateless
public class UsuarioDao implements UsuarioDaoLocal {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void addUsuario(Usuario usuario) {
        try {
            Usuario existingUser = getUsuarioByCedula(usuario.getCedula());
            if (existingUser == null) {
                em.persist(usuario);
            } else {
                throw new Exception("El usuario con cédula " + usuario.getCedula() + " ya existe en la base de datos");
            }
        } catch (Exception e) {
            throw new EJBException("Error al agregar usuario: " + e.getMessage(), e);
        }
    }

    @Override
    public void editUsuario(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    public void deleteUsuario(int cedula) {
        em.remove(getUsuario(cedula));
    }

    @Override
    public Usuario getUsuario(int cedula) {
        return em.find(Usuario.class, cedula);
    }

    @Override
    public List<Usuario> getAllUsuarios() {
        return em.createNamedQuery("Usuario.getAll").getResultList();
    }

    @Override
    public Usuario getUsuarioByUsername(String nombre) {
        try {
            Query query = em.createNamedQuery("Usuario.getByUsername");
            query.setParameter("nombre", nombre);
            Usuario usuario = (Usuario) query.getSingleResult();
            return usuario;
        } catch (NoResultException e) {
            return null;
        }
    }
//-----------------------------------------------------------------------------------------------

    @Override
    public Usuario getUsuarioByCedula(int cedula) {
        try {
            Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.cedula = :cedula");
            query.setParameter("cedula", cedula);
            Usuario usuario = (Usuario) query.getSingleResult();
            return usuario;
        } catch (NoResultException e) {
            return null;
        }
    }

}
