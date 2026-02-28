package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RachaLectura;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.RachaLecturaRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RachaLecturaServiceImplements implements RachaLecturaService {

    private final RachaLecturaRepository repository;

    public RachaLecturaServiceImplements(RachaLecturaRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<RachaLectura> getRachasByUsuario(Integer idUsuario) {
        return repository.findAll()
                .stream()
                .filter(r -> r.getFkIdUsuario() != null && r.getFkIdUsuario().equals(idUsuario))
                .sorted((a, b) -> b.getFecha().compareTo(a.getFecha()))
                .collect(Collectors.toList());
    }

    @Override
    public List<RachaLectura> getRachasByUsuarioAndRango(Integer idUsuario, LocalDate inicio, LocalDate fin) {
        return repository.findAll()
                .stream()
                .filter(r -> r.getFkIdUsuario() != null && r.getFkIdUsuario().equals(idUsuario))
                .filter(r -> r.getFecha() != null && !r.getFecha().isBefore(inicio) && !r.getFecha().isAfter(fin))
                .sorted((a, b) -> b.getFecha().compareTo(a.getFecha()))
                .collect(Collectors.toList());
    }

    @Override
    public RachaLectura saveRacha(RachaLectura racha) throws RuntimeException {
        RachaLectura saved = repository.save(racha);
        return repository.findById(saved.getIdRachaLectura()).orElse(saved);

    }

    @Override
    public RachaLectura addRacha(Integer idUsuario, LocalDate fecha) throws RuntimeException {
        RachaLectura r = new RachaLectura();
        r.setFkIdUsuario(idUsuario);
        r.setFecha(fecha);

        RachaLectura saved = repository.save(r);
        return repository.findById(saved.getIdRachaLectura()).orElse(saved);

    }
}