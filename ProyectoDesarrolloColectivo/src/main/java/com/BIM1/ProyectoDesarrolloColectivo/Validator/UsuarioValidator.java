package com.BIM1.ProyectoDesarrolloColectivo.Validator;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Usuario;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.UsuarioRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UsuarioValidator {

    private final UsuarioRepository usuarioRepository;

    public UsuarioValidator(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public void UsuarioValidar(Usuario usuario) {

        List<Usuario> usuarios = usuarioRepository.findAll();
        String correoUsuario = usuario.getCorreo_usuario();

        correoUsuario = correoUsuario.trim().toLowerCase();

        if (!(correoUsuario.endsWith("@gmail.com") || correoUsuario.endsWith("@outlook.com") || correoUsuario.endsWith("@yahoo.com"))) {
            throw new Exception(
                    "El correo debe ser @gmail.com, @outlook.com o @yahoo.com");
        }

        for (Usuario correoUsua : usuarios) {
            if (correoUsuario.equals(correoUsua.getCorreo_usuario())){
                throw new IllegalArgumentException("El correo del usuario ya existe");
            }
        }
    }
}

