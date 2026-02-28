package com.BIM1.ProyectoDesarrolloColectivo.Validator;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Objetivos;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.CustomException;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.ObjetivosRepository;
import org.springframework.stereotype.Component;

@Component
public class ObjetivosValidator {
    public  final ObjetivosRepository objetivosRepository;

    public ObjetivosValidator(ObjetivosRepository objetivosRepository) {
        this.objetivosRepository = objetivosRepository;
    }

    public void ObjetivosValidaciones(Objetivos objetivos){
        if (objetivos.getDescripcionObjetivo().trim().length() > 150){
            throw new CustomException("texto muy grande,caracteres maximos 150");
        }

        if (objetivos.getEstadoObjetivo().trim().length() > 45){
            throw new CustomException("texto muy grande,caracteres maximos 45");
        }

        if (objetivosRepository.existsByDescripcionObjetivoAndEstadoObjetivoAndFechaObjetivoAndUsuarioAndFraseMotivadora(
                objetivos.getDescripcionObjetivo(),objetivos.getEstadoObjetivo(),objetivos.getFechaObjetivo(),
                objetivos.getUsuario(),objetivos.getFraseMotivadora()
        )){
            throw new CustomException("Ya existe un Objetivo con los mismos datos");
        }

        if (!objetivosRepository.existsByUsuario(objetivos.getUsuario())){
            throw new CustomException("Usuario inexistente");
        }

        if (!objetivosRepository.existsByFraseMotivadora(objetivos.getFraseMotivadora())){
            throw new CustomException("Frase inexistente");
        }
    }

    public void ObjetivosValidacionesId(Integer id){
        if (!objetivosRepository.existsById(id)){
            throw new CustomException("Objetivo no encontrado");
        }
    }
}
