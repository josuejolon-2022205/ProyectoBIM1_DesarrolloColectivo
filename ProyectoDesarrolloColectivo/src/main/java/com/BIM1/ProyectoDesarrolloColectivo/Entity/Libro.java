package com.BIM1.ProyectoDesarrolloColectivo.Entity;

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


}
