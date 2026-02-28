package com.BIM1.ProyectoDesarrolloColectivo.Exceptions;

import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<?> validarId(Exception e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("Error: ", "el id no existe"));
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<?> validarFormatoJSONYTipoDato(HttpMessageNotReadableException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("Error: ", "JSON inválido o el tipo de dato es incorrecto"));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<?> handleBodyValidation(MethodArgumentNotValidException e) {
        List<String> mensajes = e.getBindingResult().getFieldErrors().stream().map(err -> err.getDefaultMessage()).toList();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("Errores:", mensajes));
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<?> validarFKS(ConstraintViolationException e) {
        String msg = e.getConstraintViolations().iterator().next().getMessage();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("Error: ", "No existe el id del FK"));
    }

}
