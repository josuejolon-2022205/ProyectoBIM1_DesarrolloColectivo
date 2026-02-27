package com.BIM1.ProyectoDesarrolloColectivo.Validator;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Rutina;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.RutinaRepository;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class RutinaValidator {
    private final RutinaRepository rutinaRepository;

    public RutinaValidator(RutinaRepository rutinaRepository) {
        this.rutinaRepository = rutinaRepository;
    }

    public void validarRutina(Rutina rutina){
        if(rutina.getNombre_rutina().trim().length() > 50){
            throw new Exception("el nombre de la rutina no puede pasar de los 50 caracteres");
        }

        if(rutina.getDias_semana().trim().length() > 100){
            throw new Exception("el campo no puede tener mas de 100 letras");
        }

        if(rutina.getFk_id_usuario() <= 0){
            throw new Exception("el id del usuario no puede ser menor o igual a 0");

        }
        List<String> diasValidos = Arrays.asList("lunes", "martes", "miércoles", "jueves", "sábado", "sabado", "sabados", "sábados", "domingo", "todos los días", "todos los dias");
        String[] diasIngresados = rutina.getDias_semana().split(",");

        for(String dia : diasIngresados){
            String diaVacio = dia.trim().toLowerCase();

            if(!diasValidos.contains(diaVacio)){
                throw new Exception("el dia no es valido, por favor use lunes, martes, miércoles, jueves, viernes, sábado, domingo o Todos los dias");
            }
        }
    }
}
