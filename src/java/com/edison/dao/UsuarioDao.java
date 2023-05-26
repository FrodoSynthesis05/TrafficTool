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
    private EntityManager entityManager;

    /**
     * Método implementado para añadir usuarios.
     */
    @Override
    public void addUsuario(Usuario usuario) {
        try {
            Usuario existingUser = getUsuarioByCedula(usuario.getCedula());
            if (existingUser == null) {
                entityManager.persist(usuario);
            } else {
                throw new Exception("El usuario con cédula " + usuario.getCedula() + " ya existe en la base de datos");
            }
        } catch (Exception e) {
            throw new EJBException("Error al agregar usuario: " + e.getMessage(), e);
        }
    }

     /**
     * Método implementado para editar usuarios.
     */
    @Override
    public void editUsuario(Usuario usuario) {
        entityManager.merge(usuario);
    }

     /**
     * Método implementado para eliminar usuarios.
     */
    @Override
    public void deleteUsuario(int cedula) {
        entityManager.remove(getUsuario(cedula));
    }

     /**
     * Método funcional get.
     */
    @Override
    public Usuario getUsuario(int cedula) {
        return entityManager.find(Usuario.class, cedula);
    }

     /**
     * Método implementado para obtener todos los usuarios.
     */
    @Override
    public List<Usuario> getAllUsuarios() {
        return entityManager.createNamedQuery("Usuario.getAll").getResultList();
    }
    
     /**
     * Método implementado para obtener todos los usuarios según su cédula.
     */
    @Override
    public List <Usuario>getUsuarioByCedulaLIST(String cedula) {
        try {
            Query query = entityManager.createNamedQuery("Usuario.getByCedula");
            query.setParameter("cedula", cedula);
            Usuario usuario = (Usuario) query.getSingleResult();
            return query.getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

     /**
     * Método implementado para obtener los usuarios según su nombre de usuario.
     */
    @Override
    public Usuario getUsuarioByUsername(String nombre) {
        try {
            Query query = entityManager.createNamedQuery("Usuario.getByUsername");
            query.setParameter("nombre", nombre);
            Usuario usuario = (Usuario) query.getSingleResult();
            return usuario;
        } catch (NoResultException e) {
            return null;
        }
    }

    /**
     * Método implementado para obtener los usuarios según su cédula.
     */
    @Override
    public Usuario getUsuarioByCedula(int cedula) {
        try {
            Query query = entityManager.createQuery("SELECT u FROM Usuario u WHERE u.cedula = :cedula");
            query.setParameter("cedula", cedula);
            Usuario usuario = (Usuario) query.getSingleResult();
            return usuario;
        } catch (NoResultException e) {
            return null;
        }
    }

}
