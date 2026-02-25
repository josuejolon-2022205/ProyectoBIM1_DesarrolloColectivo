package com.BIM1.ProyectoDesarrolloColectivo.Controllers;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RachaEjercicio;
import com.BIM1.ProyectoDesarrolloColectivo.Service.RachaEjercicioService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/racha-ejercicio")
@CrossOrigin("*")
public class RachaEjercicioController {

    private final RachaEjercicioService rachaEjercicioService;

    public RachaEjercicioController(RachaEjercicioService rachaEjercicioService) {
        this.rachaEjercicioService = rachaEjercicioService;
    }


    @GetMapping("/usuario/{idUsuario}")
    public ResponseEntity<Object> getRachasByUsuario(@PathVariable Integer idUsuario) {
        try {
            List<RachaEjercicio> lista = rachaEjercicioService.getRachasByUsuario(idUsuario);
            return ResponseEntity.ok(lista);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al obtener rachas del usuario: " + e.getMessage());
        }
    }


    @GetMapping("/usuario/{idUsuario}/rango")
    public ResponseEntity<Object> getRachasByRango(
            @PathVariable Integer idUsuario,
            @RequestParam LocalDate inicio,
            @RequestParam LocalDate fin) {

        try {
            List<RachaEjercicio> lista = rachaEjercicioService.getRachasByUsuarioAndRango(idUsuario, inicio, fin);
            return ResponseEntity.ok(lista);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al obtener rachas por rango: " + e.getMessage());
        }
    }


@PostMapping("/agregar")
public ResponseEntity<Object> agregarRacha(@RequestBody RachaEjercicio racha) {
    try {
        RachaEjercicio nueva = rachaEjercicioService.saveRacha(racha);
        return new ResponseEntity<>(nueva, HttpStatus.CREATED);
    } catch (IllegalArgumentException e) {
        return ResponseEntity.badRequest().body(e.getMessage());
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body("Error al crear la racha: " + e.getMessage());
    }
}


@PostMapping("/usuario/{idUsuario}/fecha/{fecha}")
public ResponseEntity<Object> crearRachaPorUsuario(
        @PathVariable Integer idUsuario,
        @PathVariable LocalDate fecha) {

    try {
        RachaEjercicio nueva = rachaEjercicioService.addRacha(idUsuario, fecha);
        return new ResponseEntity<>(nueva, HttpStatus.CREATED);
    } catch (IllegalArgumentException e) {
        return ResponseEntity.badRequest().body(e.getMessage());
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body("Error al crear la racha por usuario y fecha: " + e.getMessage());
    }
}

}




