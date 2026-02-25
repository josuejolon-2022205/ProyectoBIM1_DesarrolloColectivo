package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.FraseMotivadora;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.FraseMotivadoraRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FraseMotivadoraServiceImplements implements FraseMotivadoraService{
    private final FraseMotivadoraRepository fraseMotivadoraRepository;

    public FraseMotivadoraServiceImplements(FraseMotivadoraRepository fraseMotivadoraRepository) {
        this.fraseMotivadoraRepository = fraseMotivadoraRepository;
    }

    @Override
    public List<FraseMotivadora> getAllFraseMotivadora() {
        return fraseMotivadoraRepository.findAll();
    }

    @Override
    public FraseMotivadora getById(Integer id) {
        return fraseMotivadoraRepository.findById(id).orElse(null);
    }

    @Override
    public FraseMotivadora saveFraseMotivadora(FraseMotivadora fraseMotivadora) throws RuntimeException {
        return fraseMotivadoraRepository.save(fraseMotivadora);
    }

    @Override
    public FraseMotivadora updateFraseMotivadora(Integer id, FraseMotivadora fraseMotivadora) {
        return fraseMotivadoraRepository.save(fraseMotivadora);
    }

    @Override
    public void deleteFraseMotivadora(Integer id) {
        fraseMotivadoraRepository.deleteById(id);
    }
}
