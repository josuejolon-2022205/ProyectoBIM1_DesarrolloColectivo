package com.BIM1.ProyectoDesarrolloColectivo.Controllers;


import com.BIM1.ProyectoDesarrolloColectivo.Entity.Ejercicio;
import com.BIM1.ProyectoDesarrolloColectivo.Service.EjercicioService;
import jakarta.validation.Valid;
import org.hibernate.ObjectNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ejercicios")
public class EjercicioController {
    private final EjercicioService ejercicioService;

    public EjercicioController(EjercicioService ejercicioService) {
        this.ejercicioService = ejercicioService;
    }

    @GetMapping
    public List<Ejercicio> getAlistEjercicio(){
        return ejercicioService.getAListEjercicio();
    }

    @PostMapping
    public ResponseEntity<Object> createEjercicio(@Valid @RequestBody Ejercicio ejercicio){
        try {
            Ejercicio ejercicio1 = ejercicioService.saveEjercicio(ejercicio);
            return new ResponseEntity<>(ejercicio1, HttpStatus.CREATED);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> updateEjercicio(@PathVariable Integer id, @Valid @RequestBody Ejercicio ejercicio) {
        try {
            Ejercicio ejercicio1 = ejercicioService.updateEjercicio(id, ejercicio);
            return new ResponseEntity<>(ejercicio1, HttpStatus.OK);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());

        }

    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteEjercicio(@PathVariable Integer id){
        try {
            ejercicioService.deleteEjercicio(id);
            return ResponseEntity.noContent().build();
        }catch (ObjectNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());

        }

    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getEjercicioById(@PathVariable Integer id){
        try{
            Ejercicio ejercicio = ejercicioService.getEjercicioById(id);
            return ResponseEntity.ok(ejercicio);
        }catch (ObjectNotFoundException e){
            return ResponseEntity.notFound().build();
        }
    }
}
