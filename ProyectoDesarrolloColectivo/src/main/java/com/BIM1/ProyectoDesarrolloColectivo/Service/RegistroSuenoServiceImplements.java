package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.RegistroSueno;
import com.BIM1.ProyectoDesarrolloColectivo.Entity.Usuario;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.RegistroSuenoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistroSuenoServiceImplements implements RegistroSuenoService {

    private final RegistroSuenoRepository registroSuenoRepository;

    public RegistroSuenoServiceImplements (RegistroSuenoRepository registroSuenoRepository) {
        this.registroSuenoRepository = registroSuenoRepository;
    }

    @Override
    public List<RegistroSueno> getAllRegistrosSuenos() {
        return registroSuenoRepository.findAll();
    }

    @Override
    public RegistroSueno getRegistrosSuenosById (Integer id) {
        return registroSuenoRepository.findById(id).orElse(null);
    }

    @Override
    public RegistroSueno saveRegistroSueno (RegistroSueno registroSueno) throws RuntimeException {
        return registroSuenoRepository.save(registroSueno);
    }

    @Override
    public void deleteRegistroSueno (Integer id) {
        registroSuenoRepository.deleteById(id);
    }

    @Override
    public RegistroSueno updateRegistroSueno (Integer id, RegistroSueno registroSueno) {

        RegistroSueno registroSuenoExistente = registroSuenoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("El usuario no se ha encontrado con id: " + id));

        registroSuenoExistente.setFecha_sueño(registroSueno.getFecha_sueño());
        registroSuenoExistente.setHoras_dormidas(registroSueno.getHoras_dormidas());
        registroSuenoExistente.setCalidad_sueño(registroSueno.getCalidad_sueño());
        registroSuenoExistente.setFk_id_usuario(registroSueno.getFk_id_usuario());


        return registroSuenoRepository.save(registroSuenoExistente);
    }

}
