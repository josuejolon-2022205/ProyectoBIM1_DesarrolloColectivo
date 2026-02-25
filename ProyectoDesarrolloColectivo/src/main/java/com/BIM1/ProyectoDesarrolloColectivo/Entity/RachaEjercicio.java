package com.BIM1.ProyectoDesarrolloColectivo.Entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Racha_ejercicio")
public class RachaEjercicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_racha_ejercicio")
    private Integer idRachaEjercicio;

    @Column(name = "dias_consecutivos")
    private Integer diasConsecutivos;

    @Column(name = "fecha")
    private LocalDate fecha;

    @Column(name = "fk_id_usuario")
    private Integer fkIdUsuario;

    public Integer getIdRachaEjercicio() {
        return idRachaEjercicio;
    }

    public void setIdRachaEjercicio(Integer idRachaEjercicio) {
        this.idRachaEjercicio = idRachaEjercicio;
    }

    public Integer getDiasConsecutivos() {
        return diasConsecutivos;
    }

    public void setDiasConsecutivos(Integer diasConsecutivos) {
        this.diasConsecutivos = diasConsecutivos;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Integer getFkIdUsuario() {
        return fkIdUsuario;
    }

    public void setFkIdUsuario(Integer fkIdUsuario) {
        this.fkIdUsuario = fkIdUsuario;
    }
}