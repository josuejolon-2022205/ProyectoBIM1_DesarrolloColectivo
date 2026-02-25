package com.BIM1.ProyectoDesarrolloColectivo.Controllers;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Rutina;
import com.BIM1.ProyectoDesarrolloColectivo.Service.RutinaService;
import jakarta.validation.Valid;
import org.hibernate.ObjectNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/rutina")
public class RutinaController {
    private final RutinaService rutinaService;

    public RutinaController(RutinaService rutinaService) {
        this.rutinaService = rutinaService;
    }

    @GetMapping
    public List<Rutina> getAListRutina(){
        return rutinaService.getAListRutina();
    }

    @PostMapping
    public ResponseEntity<Object> saveRutina(@Valid @RequestBody Rutina rutina){
        try {
            Rutina rutina1 = rutinaService.saveRutina(rutina);
            return new ResponseEntity<>(rutina1, HttpStatus.CREATED);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> updateRutina(@PathVariable Integer id, @Valid @RequestBody Rutina rutina){
        try {
            Rutina rutina1 = rutinaService.updateRutina(id, rutina);
            return new ResponseEntity<>(rutina1, HttpStatus.OK);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteRutina(@PathVariable Integer id){
        try {
            rutinaService.deleteRutina(id);
            return ResponseEntity.noContent().build();
        }catch (ObjectNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());

        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getRutinaById(@PathVariable Integer id){
        try {
            Rutina rutina = rutinaService.getRutinaById(id);
            return ResponseEntity.ok(rutina);
        }catch (ObjectNotFoundException e){
            return  ResponseEntity.notFound().build();

        }
    }

}
