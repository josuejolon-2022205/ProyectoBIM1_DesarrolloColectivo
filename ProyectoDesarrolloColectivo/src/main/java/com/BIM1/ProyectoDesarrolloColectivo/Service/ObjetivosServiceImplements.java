package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Objetivos;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.ObjetivosRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObjetivosServiceImplements implements ObjetivosService{
    public final ObjetivosRepository objetivosRepository;

    public ObjetivosServiceImplements(ObjetivosRepository objetivosRepository) {
        this.objetivosRepository = objetivosRepository;
    }

    @Override
    public List<Objetivos> getAllObjetivos() {
        return objetivosRepository.findAll() ;
    }

    @Override
    public Objetivos getById(Integer id) {
        return objetivosRepository.findById(id).orElse(null);
    }

    @Override
    public Objetivos saveObjetivos(Objetivos objetivos) throws RuntimeException {
        return objetivosRepository.save(objetivos);
    }

    @Override
    public Objetivos updateObjetivos(Integer id, Objetivos objetivos) {
        return objetivosRepository.save(objetivos);
    }

    @Override
    public void deleteObjetivos(Integer id) {
        objetivosRepository.deleteById(id);
    }
}
