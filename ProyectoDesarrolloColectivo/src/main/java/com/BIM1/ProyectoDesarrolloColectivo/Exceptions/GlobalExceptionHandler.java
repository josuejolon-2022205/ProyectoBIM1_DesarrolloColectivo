package com.BIM1.ProyectoDesarrolloColectivo.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

}
