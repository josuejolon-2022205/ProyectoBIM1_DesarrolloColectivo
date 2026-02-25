package com.BIM1.ProyectoDesarrolloColectivo.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "ObjetivosMeditacion")
public class ObjetivoMeditacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_objetivo_meditacion")
    private Integer id_objetivo_meditacion;

    @NotBlank(message = "El tiempo objetivo no puede estar vacío")
    @Column(name = "tiempo_objetivo")
    private String tiempo_objetivo;

    @NotBlank(message = "Los días objetivo no pueden estar vacíos")
    @Column(name = "dias_objetivo")
    private String dias_objetivo;

    @NotBlank(message = "El fk_id_usuario no puede estar vacío")
    @Column(name = "fk_id_usuario")
    private Integer fk_id_usuario;

    public ObjetivoMeditacion() {

    }

    public Integer getId_objetivo_meditacion() {
        return id_objetivo_meditacion;
    }

    public void setId_objetivo_meditacion(Integer id_objetivo_meditacion) {
        this.id_objetivo_meditacion = id_objetivo_meditacion;
    }

    public String getTiempo_objetivo() {
        return tiempo_objetivo;
    }

    public void setTiempo_objetivo(String tiempo_objetivo) {
        this.tiempo_objetivo = tiempo_objetivo;
    }

    public String getDias_objetivo() {
        return dias_objetivo;
    }

    public void setDias_objetivo(String dias_objetivo) {
        this.dias_objetivo = dias_objetivo;
    }

    public Integer getFk_id_usuario() {
        return fk_id_usuario;
    }

    public void setFk_id_usuario(Integer fk_id_usuario) {
        this.fk_id_usuario = fk_id_usuario;
    }
}