package com.BIM1.ProyectoDesarrolloColectivo.Entity;

public class Ejercicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ejercicio")
    private Integer id_ejercicio;

    @Column(name = "nombre_ejercicio")
    @NotBlank
    private String nombre_ejercicio;

    @Column(name = "series_ejercicio")
    @NotNull
    private int series_ejercicio;

    @Column(name = "repeticiones_ejercicio")
    @NotNull
    private int repeticiones_ejercicio;

    @Column(name = "tiempo_ejercicio")
    @NotNull
    private int tiempo_ejercicio;

    @Column(name = "descanso_ejercicio")
    @NotNull
    private int descanso_ejercicio;

    @Column(name = "fk_id_rutina")
    @NotNull
    private Integer fk_id_rutina;


}
