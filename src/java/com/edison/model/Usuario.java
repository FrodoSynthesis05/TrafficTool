package com.edison.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.Table;

@Entity
@Table
@NamedQueries({
    @NamedQuery(name = "Usuario.getAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.getByUsername", query = "SELECT u FROM Usuario u WHERE u.nombre = :nombre")
})
public class Usuario implements Serializable {

    @Id
    @Column(name = "cedula", nullable = false, unique = true)
    private int cedula;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "contrasena")
    private String contrasena;

    public Usuario() {
    }

    public Usuario(int cedula, String nombre, String contrasena) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.contrasena = contrasena;
    }

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public static Usuario getUsuarioByUsername(String nombre) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("U_TACTICOPU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Usuario.getByUsername");
        query.setParameter("nombre", nombre);
        Usuario usuario = (Usuario) query.getSingleResult();
        return usuario;
    }

}

