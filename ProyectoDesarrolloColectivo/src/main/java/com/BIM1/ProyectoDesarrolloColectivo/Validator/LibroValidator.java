package com.BIM1.ProyectoDesarrolloColectivo.Validator;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Libro;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.LibroRepository;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class LibroValidator {
    private final LibroRepository libroRepository;

    public LibroValidator(LibroRepository libroRepository) {
        this.libroRepository = libroRepository;
    }

    public void libroValidaciones(Libro libro){

        if(libro.getTitulo_libro().trim().length() > 100){
            throw new Exception("El titulo del libro no puede pasar las 100 letras");
        }

        if(libro.getAutor_libro().trim().length() > 100){
            throw new Exception("el autor del libro no puede pasar a las 100 letras");
        }

        if(libro.getCantidad_pag() <= 0){
            throw new Exception("las cantidad de paginas del libro debe ser mayor a 0");
        }

        if(libro.getCantidad_pag() > 4000){
            throw new Exception("la cantidad de las paginas no pueden ser mayores a 4000");
        }

        if(libro.getCantidad_leido() < 0){
            throw new Exception("la cantidad de paginas leidas no pueden ser negativas");
        }

        if(libro.getCantidad_leido() > libro.getCantidad_pag()){
            throw new Exception("la cantidad leido no puede ser mayor a las cantidades de paginas que tiene el libro");
        }

        if(libro.getFk_id_usuario() <= 0){
            throw new Exception("el id del usuario no puede ser negativo");
        }

        if(libro.getEstado().equals("terminado") && libro.getCantidad_leido() != libro.getCantidad_pag()){
            throw new Exception("las paginas leidas deben ser iguales al total del paginas del libro");
        }

        if(libro.getEstado().equals("pendiente") && libro.getCantidad_leido() > 0){
            throw new Exception("las paginas leidas deben de ser 0 por el estado en el que se encuentra");
        }

        List<String> validarEstados = Arrays.asList("pendiente", "leyendo", "terminado");
        if(!validarEstados.contains(libro.getEstado())){
            throw new Exception("el estado solo puede ser: pendiente, leyendo o terminado ");
        }
    }
}
