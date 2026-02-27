package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.ApoyoEmocional;
import com.BIM1.ProyectoDesarrolloColectivo.Entity.FraseMotivadora;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.ApoyoEmocionalRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApoyoEmocionalServiceImplements implements ApoyoEmocionalService{
    private final ApoyoEmocionalRepository apoyoEmocionalRepository;

    public ApoyoEmocionalServiceImplements(ApoyoEmocionalRepository apoyoEmocionalRepository) {
        this.apoyoEmocionalRepository = apoyoEmocionalRepository;
    }

    @Override
    public List<ApoyoEmocional> getAllFraseMotivadora() {
        return apoyoEmocionalRepository.findAll();
    }

    @Override
    public ApoyoEmocional getById(Integer id) {
        return apoyoEmocionalRepository.findById(id).orElse(null);
    }

    @Override
    public ApoyoEmocional saveFraseMotivadora(ApoyoEmocional apoyoEmocional) throws RuntimeException {
        return apoyoEmocionalRepository.save(apoyoEmocional);
    }

    @Override
    public ApoyoEmocional updateFraseMotivadora(Integer id, ApoyoEmocional apoyoEmocional) {
        return apoyoEmocionalRepository.save(apoyoEmocional);
    }

    @Override
    public void deleteFraseMotivadora(Integer id) {
        apoyoEmocionalRepository.deleteById(id);
    }
}
