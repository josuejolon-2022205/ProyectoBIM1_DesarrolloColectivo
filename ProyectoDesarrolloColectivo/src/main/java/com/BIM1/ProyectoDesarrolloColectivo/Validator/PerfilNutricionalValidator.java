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

        if (perfil.getPeso_kg() <= 0) {
            throw new Exception("El peso debe ser un valor positivo mayor a 0.");
        }
        if (perfil.getPeso_kg() > 500) {
            throw new Exception("El peso ingresado no es válido (máximo 500 kg).");
        }

        if (perfil.getAltura() <= 0.0) {
            throw new Exception("La altura debe ser un valor positivo mayor a 0.");
        }
        if (perfil.getAltura() < 0.50 || perfil.getAltura() > 2.50) {
            throw new Exception("La altura debe estar entre 0.50 y 2.50 metros.");
        }

        if (perfil.getEdad() <= 0) {
            throw new Exception("La edad debe ser un valor positivo mayor a 0.");
        }
        if (perfil.getEdad() < 5 || perfil.getEdad() > 120) {
            throw new Exception("La edad debe estar entre 5 y 120 años.");
        }

        List<String> generosValidos = Arrays.asList("Femenino", "Masculino");
        if (!generosValidos.contains(perfil.getGenero())) {
            throw new Exception("El género debe ser 'Masculino' o 'Femenino'.");
        }

        List<String> nivelesValidos = Arrays.asList("bajo", "medio", "alto");
        if (!nivelesValidos.contains(perfil.getNivel_actividad())) {
            throw new Exception("El nivel de actividad debe ser 'bajo', 'medio' o 'alto'.");
        }

        if (perfil.getObjetivo().trim().length() > 75) {
            throw new Exception("El objetivo no puede superar los 75 caracteres.");
        }

        if (perfil.getFk_id_usuario() <= 0) {
            throw new Exception("El ID del usuario debe ser un número positivo válido.");
        }
    }
}
