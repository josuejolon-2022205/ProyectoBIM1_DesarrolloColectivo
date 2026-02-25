package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RachaEjercicio;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.RachaEjercicioRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RachaEjercicioServiceImplements implements RachaEjercicioService {

    private final RachaEjercicioRepository repository;

    public RachaEjercicioServiceImplements(RachaEjercicioRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<RachaEjercicio> getRachasByUsuario(Integer idUsuario) {
        return repository.findAll()
                .stream()
                .filter(r -> r.getFkIdUsuario() != null && r.getFkIdUsuario().equals(idUsuario))
                .sorted((a, b) -> b.getFecha().compareTo(a.getFecha()))
                .collect(Collectors.toList());
    }

    @Override
    public List<RachaEjercicio> getRachasByUsuarioAndRango(Integer idUsuario, LocalDate inicio, LocalDate fin) {
        return repository.findAll()
                .stream()
                .filter(r -> r.getFkIdUsuario() != null && r.getFkIdUsuario().equals(idUsuario))
                .filter(r -> r.getFecha() != null && !r.getFecha().isBefore(inicio) && !r.getFecha().isAfter(fin))
                .sorted((a, b) -> b.getFecha().compareTo(a.getFecha()))
                .collect(Collectors.toList());
    }

    @Override
    public RachaEjercicio saveRacha(RachaEjercicio racha) throws RuntimeException {
        return repository.save(racha);
    }

    @Override
    public RachaEjercicio addRacha(Integer idUsuario, LocalDate fecha) throws RuntimeException {
        RachaEjercicio r = new RachaEjercicio();
        r.setFkIdUsuario(idUsuario);
        r.setFecha(fecha);
        return repository.save(r);
    }
}