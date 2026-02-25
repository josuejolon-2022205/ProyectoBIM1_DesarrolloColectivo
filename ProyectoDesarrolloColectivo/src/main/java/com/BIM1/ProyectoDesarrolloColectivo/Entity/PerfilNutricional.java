package com.BIM1.ProyectoDesarrolloColectivo.Entity;

public class PerfilNutricional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_perfil_nutricional")
    private Integer id_perfil_nutricional;

    @Column(name = "peso_kg")
    @NotBlank
    private String peso_kg;

    @Column(name = "altura")
    @NotNull
    private Double altura;

    @Column(name = "edad")
    @NotNull
    private int edad;

    @Column(name = "genero")
    @NotBlank
    private String genero;

    @Column(name = "nivel_actividad")
    @NotBlank
    private String nivel_actividad;

    @Column(name = "objetivo")
    @NotBlank
    private String objetivo;

    @Column(name = "fk_id_usuario")
    @NotNull
    private Integer fk_id_usuario;
}
