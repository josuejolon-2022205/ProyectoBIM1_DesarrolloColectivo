package com.BIM1.ProyectoDesarrolloColectivo.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;
import java.util.concurrent.ExecutionException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<?> validarId(Exception e){
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("Error:", "el id no se encontro"));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Object> validAnotaciones(MethodArgumentNotValidException e){
        return ResponseEntity.badRequest().body(Map.of("Error", e.getLocalizedMessage()));
    }
    
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<?> validarJsonYTipoDato(HttpMessageNotReadableException e){
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", "JSON inválido o tipo de dato incorrecto."));
    }

}
