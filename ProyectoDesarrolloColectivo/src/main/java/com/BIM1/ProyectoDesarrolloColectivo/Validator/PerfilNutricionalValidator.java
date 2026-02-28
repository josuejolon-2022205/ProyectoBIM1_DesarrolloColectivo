package com.BIM1.ProyectoDesarrolloColectivo.Validator;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.PerfilNutricional;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.PerfilNutricionalRepository;

import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import java.util.Arrays;
import java.util.List;

public class PerfilNutricionalValidator {

    private final PerfilNutricionalRepository perfilNutricionalRepository;

    public PerfilNutricionalValidator(PerfilNutricionalRepository perfilNutricionalRepository) {
        this.perfilNutricionalRepository = perfilNutricionalRepository;
    }

    public void PerfilNutricionalValidaciones(PerfilNutricional perfil) {

        List<String> generosValidos = Arrays.asList("Femenino", "Masculino");
        if (!generosValidos.contains(perfil.getGenero())) {
            throw new Exception("El género debe ser 'Masculino' o 'Femenino'.");
        }

        List<String> nivelesValidos = Arrays.asList("bajo", "medio", "alto");
        if (!nivelesValidos.contains(perfil.getNivel_actividad())) {
            throw new Exception("El nivel de actividad debe ser 'bajo', 'medio' o 'alto'.");
        }

    }
}
