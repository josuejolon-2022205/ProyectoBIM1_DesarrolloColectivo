package com.BIM1.ProyectoDesarrolloColectivo.Validator;


import com.BIM1.ProyectoDesarrolloColectivo.Entity.Ejercicio;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.EjercicioRepository;
import org.springframework.stereotype.Component;

@Component
public class EjercicioValidator {
    private final EjercicioRepository ejercicioRepository;

    public EjercicioValidator(EjercicioRepository ejercicioRepository) {
        this.ejercicioRepository = ejercicioRepository;
    }

    public void EjercicioValidaciones(Ejercicio ejercicio){

        if(ejercicio.getSeries_ejercicio() <= 0 ){
            throw new Exception("las series no pueden ser 0 o menores a 0");
        }

        if(ejercicio.getSeries_ejercicio() > 22){
            throw new Exception("las series del ejercicio no pueden ser mayores de 22");
        }

        if(ejercicio.getNombre_ejercicio().trim().length() > 60){
            throw new Exception("el nombre del ejercicio no puede pasar de los 60 letras");
        }

        if(ejercicio.getRepeticiones_ejercicio() < 0){
            throw new Exception("las repeticiones no pueden ser negativas");
        }
        if(ejercicio.getRepeticiones_ejercicio() > 50){
            throw new Exception("las repeticiones no pueden ser mayores a 50");
        }

        if(ejercicio.getTiempo_ejercicio() < 0){
            throw new Exception("el tiempo del descanso no puede ser negativo");
        }

        if(ejercicio.getTiempo_ejercicio() > 600){
            throw new Exception("el tiempo del ejercicio no puede superar los 600 segundos");
        }

        if(ejercicio.getDescanso_ejercicio() < 0){
            throw new Exception("el tiempo del descanso no puede ser negativo");
        }

        if(ejercicio.getDescanso_ejercicio() > 600){
            throw new Exception("el tiempo del descanso no puede pasar de los 600 segundos");
        }

        if(ejercicio.getFk_id_rutina() <= 0){
            throw new Exception("el id de la rutina no puede ser negativo");
        }
    }

}
