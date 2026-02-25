package com.BIM1.ProyectoDesarrolloColectivo.Controllers;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RachaLectura;
import com.BIM1.ProyectoDesarrolloColectivo.Service.RachaLecturaService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/racha-lectura")
@CrossOrigin("*")
public class RachaLecturaController {

    private final RachaLecturaService rachaLecturaService;

    public RachaLecturaController(RachaLecturaService rachaLecturaService) {
        this.rachaLecturaService = rachaLecturaService;
    }


    @GetMapping("/usuario/{idUsuario}")
    public ResponseEntity<Object> getRachasByUsuario(@PathVariable Integer idUsuario) {
        try {
            List<RachaLectura> lista = rachaLecturaService.getRachasByUsuario(idUsuario);
            return ResponseEntity.ok(lista);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al obtener rachas de lectura del usuario: " + e.getMessage());
        }
    }


    @GetMapping("/usuario/{idUsuario}/rango")
    public ResponseEntity<Object> getRachasByRango(
            @PathVariable Integer idUsuario,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inicio,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fin) {

        try {
            List<RachaLectura> lista = rachaLecturaService
                    .getRachasByUsuarioAndRango(idUsuario, inicio, fin);
            return ResponseEntity.ok(lista);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al obtener rachas de lectura por rango: " + e.getMessage());
        }
    }

    @PostMapping("/agregar")
    public ResponseEntity<Object> agregarRacha(@RequestBody RachaLectura racha) {
        try {
            RachaLectura nueva = rachaLecturaService.saveRacha(racha);
            return new ResponseEntity<>(nueva, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al crear la racha de lectura: " + e.getMessage());
        }
    }

    
    @PostMapping("/usuario/{idUsuario}/fecha/{fecha}")
    public ResponseEntity<Object> crearRachaPorUsuario(
            @PathVariable Integer idUsuario,
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fecha) {

        try {
            RachaLectura nueva = rachaLecturaService.addRacha(idUsuario, fecha);
            return new ResponseEntity<>(nueva, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al crear la racha de lectura por usuario y fecha: " + e.getMessage());
        }
    }

}