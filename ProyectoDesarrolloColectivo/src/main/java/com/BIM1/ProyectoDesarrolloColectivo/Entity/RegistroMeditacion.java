package com.BIM1.ProyectoDesarrolloColectivo.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

@Entity
@Table(name = "RegistroMeditacion")
public class RegistroMeditacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idRegistroMeditacion")
    private Integer id_registro_meditacion;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipoMeditacion")
    @NotNull
    private TipoMeditacion tipo_meditacion;

    @Column(name = "duracionMinutos")
    @NotNull
    private Integer duracion_minutos;

    @Enumerated(EnumType.STRING)
    @Column(name = "nivelDificultad")
    @NotNull
    private NivelDificultad nivel_dificultad;

    @Column(name = "fechaRegistro")
    private LocalDateTime fecha_registro;

    @Column(name = "FKidUsuario")
    @NotNull
    private Integer fk_id_usuario;

    public enum TipoMeditacion {
        Guiada, Respiracion, Mindfulness, BodyScan
    }

    public enum NivelDificultad {
        Principiante, Intermedio, Avanzado
    }

    public Integer getId_registro_meditacion() {
        return id_registro_meditacion;
    }

    public void setId_registro_meditacion(Integer id_registro_meditacion) {
        this.id_registro_meditacion = id_registro_meditacion;
    }

    public TipoMeditacion getTipo_meditacion() {
        return tipo_meditacion;
    }

    public void setTipo_meditacion(TipoMeditacion tipo_meditacion) {
        this.tipo_meditacion = tipo_meditacion;
    }

    public Integer getDuracion_minutos() {
        return duracion_minutos;
    }

    public void setDuracion_minutos(Integer duracion_minutos) {
        this.duracion_minutos = duracion_minutos;
    }

    public NivelDificultad getNivel_dificultad() {
        return nivel_dificultad;
    }

    public void setNivel_dificultad(NivelDificultad nivel_dificultad) {
        this.nivel_dificultad = nivel_dificultad;
    }

    public LocalDateTime getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(LocalDateTime fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public Integer getFk_id_usuario() {
        return fk_id_usuario;
    }

    public void setFk_id_usuario(Integer fk_id_usuario) {
        this.fk_id_usuario = fk_id_usuario;
    }
}