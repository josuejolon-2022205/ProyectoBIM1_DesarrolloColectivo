package com.BIM1.ProyectoDesarrolloColectivo.Controllers;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RachaLectura;
import com.BIM1.ProyectoDesarrolloColectivo.Service.RachaLecturaService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/racha-lectura")
public class RachaLecturaController {

    private final RachaLecturaService rachaLecturaService;

    public RachaLecturaController(RachaLecturaService rachaLecturaService) { this.rachaLecturaService = rachaLecturaService;
    }

    @GetMapping("/usuario/{idUsuario}")
    public List<RachaLectura> getByUsuario(@PathVariable Integer idUsuario) {
        return rachaLecturaService.getRachasByUsuario(idUsuario);
    }

    @GetMapping("/usuario/{idUsuario}/entre")
    public List<RachaLectura> getByUsuarioYRango(
            @PathVariable Integer idUsuario,
            @RequestParam String inicio,
            @RequestParam String fin) {

        LocalDate ini = LocalDate.parse(inicio);  // formato esperado: YYYY-MM-DD
        LocalDate fn  = LocalDate.parse(fin);

        return rachaLecturaService.getRachasByUsuarioAndRango(idUsuario, ini, fn);

    }


    @PostMapping("/agregar")
    public ResponseEntity<Object> agregarRacha(@RequestBody RachaLectura racha) {
        try { RachaLectura nueva = rachaLecturaService.saveRacha(racha);
            return new ResponseEntity<>(nueva, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }



    @PostMapping("/usuario/{idUsuario}")
    public ResponseEntity<Object> crearRachaPorUsuario(
            @PathVariable Integer idUsuario,
            @RequestParam String fecha) { try { LocalDate fechaParseada = LocalDate.parse(fecha);
            RachaLectura nueva = rachaLecturaService.addRacha(idUsuario, fechaParseada);
            return new ResponseEntity<>(nueva, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}
