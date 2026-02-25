package com.BIM1.ProyectoDesarrolloColectivo.Entity;

public class EntradaDiario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_entrada_diario")
    private Integer id_entrada_diario;

    @Column(name = "fecha")
    @NotNull
    private LocalDate fecha;

    @Column(name = "que_paso")
    @NotBlank
    private String que_paso;

    @Column(name = "plan_mañana")
    private String plan_mañana;

    @Column(name = "reflexion")
    private String reflexion;

    @Column(name = "fk_id_Usuario")
    @NotNull
    private Integer fk_id_usuario;

    public Integer getId_entrada_diario() {
        return id_entrada_diario;
    }
