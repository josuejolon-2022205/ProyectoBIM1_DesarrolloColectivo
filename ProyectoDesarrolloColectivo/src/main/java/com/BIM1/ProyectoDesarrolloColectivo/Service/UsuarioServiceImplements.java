package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Usuario;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioServiceImplements implements UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioServiceImplements (UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    @Override
    public Usuario getUsuariosById (Integer id) {
        return usuarioRepository.findById(id).orElse(null);
    }

    @Override
    public Usuario saveUsuario (Usuario usuario) throws RuntimeException {
        return usuarioRepository.save(usuario);
    }

    @Override
    public void deleteUsuario (Integer id) {
        usuarioRepository.deleteById(id);
    }

    @Override
    public Usuario updateUsuario (Integer id, Usuario usuario) {

        Usuario usuarioExistente = usuarioRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("El usuario no se ha encontrado con id: " + id));

        usuarioExistente.setNombre_completo(usuario.getNombre_completo());
        usuarioExistente.setCorreo_usuario(usuario.getCorreo_usuario());
        usuarioExistente.setContraseña(usuario.getContraseña());

        return usuarioRepository.save(usuarioExistente);
    }

}
