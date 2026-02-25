package com.BIM1.ProyectoDesarrolloColectivo.Entity;

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
    @NotBlank
    private Integer fk_id_usuario;

    

}
