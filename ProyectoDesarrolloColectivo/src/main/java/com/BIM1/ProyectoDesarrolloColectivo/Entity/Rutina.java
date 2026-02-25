package com.BIM1.ProyectoDesarrolloColectivo.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "Rutina")
public class Rutina {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_rutina")
    private Integer id_rutina;

    @Column(name = "nombre_rutina")
    @NotBlank
    private String nombre_rutina;

    @Column(name = "dias_semana")
    @NotBlank
    private String dias_semana;

    @Column(name = "fk_id_usuario")
    @NotNull
    private Integer fk_id_usuario;


    public Integer getId_rutina() {
        return id_rutina;
    }

    public void setId_rutina(Integer id_rutina) {
        this.id_rutina = id_rutina;
    }

    public String getNombre_rutina() {
        return nombre_rutina;
    }

    public void setNombre_rutina(String nombre_rutina) {
        this.nombre_rutina = nombre_rutina;
    }

    public String getDias_semana() {
        return dias_semana;
    }

    public void setDias_semana(String dias_semana) {
        this.dias_semana = dias_semana;
    }

    public Integer getFk_id_usuario() {
        return fk_id_usuario;
    }

    public void setFk_id_usuario(Integer fk_id_usuario) {
        this.fk_id_usuario = fk_id_usuario;
    }
}
