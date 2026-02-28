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
public class RachaEjercicioController {

    private final RachaEjercicioService rachaEjercicioService;

    public RachaEjercicioController(RachaEjercicioService rachaEjercicioService) {
        this.rachaEjercicioService = rachaEjercicioService;
    }

    @GetMapping("/usuario/{idUsuario}")
    public List<RachaEjercicio> getByUsuario(@PathVariable Integer idUsuario) {
        return rachaEjercicioService.getRachasByUsuario(idUsuario);
    }


    @GetMapping("/usuario/{idUsuario}/entre")
    public List<RachaEjercicio> getByUsuarioYRango(@PathVariable Integer idUsuario, @RequestParam String inicio, @RequestParam String fin) {
        LocalDate ini = LocalDate.parse(inicio);
        LocalDate fn = LocalDate.parse(fin);
        return rachaEjercicioService.getRachasByUsuarioAndRango(idUsuario, ini, fn);
    }




    @PostMapping("/agregar")
public ResponseEntity<Object> agregarRacha(@RequestBody RachaEjercicio racha) {
    try { RachaEjercicio nueva = rachaEjercicioService.saveRacha(racha);
        return new ResponseEntity<>(nueva, HttpStatus.CREATED);
    } catch (IllegalArgumentException e) {
        return ResponseEntity.badRequest().body(e.getMessage());
    } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }
}




    @PostMapping("/usuario/{idUsuario}")
    public ResponseEntity<Object> crearRachaPorUsuario( @PathVariable Integer idUsuario, @RequestParam String fecha) {
        try {
            LocalDate fechaParseada = LocalDate.parse(fecha);
            RachaEjercicio nueva = rachaEjercicioService.addRacha(idUsuario, fechaParseada);
            return new ResponseEntity<>(nueva, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
    }





