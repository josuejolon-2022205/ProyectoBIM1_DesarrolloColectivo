package com.BIM1.ProyectoDesarrolloColectivo.Entity;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "Libro")
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_libro")
    private Integer id_libro;

    @Column(name = "titulo_libro")
    @NotBlank
    private String titulo_libro;

    @Column(name = "autor_libro")
    @NotBlank
    private String autor_libro;

    @Column(name = "estado")
    @NotBlank
    private String estado;

    @Column(name = "cantidad_pag")
    @NotNull
    private int cantidad_pag;

    @Column(name = "cantidad_leido")
    @NotNull
    private int cantidad_leido;

    @Column(name = "fk_id_usuario")
    @NotNull
    private int fk_id_usuario;

    public Integer getId_libro() {
        return id_libro;
    }

    public void setId_libro(Integer id_libro) {
        this.id_libro = id_libro;
    }

    public String getTitulo_libro() {
        return titulo_libro;
    }

    public void setTitulo_libro(String titulo_libro) {
        this.titulo_libro = titulo_libro;
    }

    public String getAutor_libro() {
        return autor_libro;
    }

    public void setAutor_libro(String autor_libro) {
        this.autor_libro = autor_libro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCantidad_pag() {
        return cantidad_pag;
    }

    public void setCantidad_pag(int cantidad_pag) {
        this.cantidad_pag = cantidad_pag;
    }

    public int getCantidad_leido() {
        return cantidad_leido;
    }

    public void setCantidad_leido(int cantidad_leido) {
        this.cantidad_leido = cantidad_leido;
    }

    public int getFk_id_usuario() {
        return fk_id_usuario;
    }

    public void setFk_id_usuario(int fk_id_usuario) {
        this.fk_id_usuario = fk_id_usuario;
    }
}
