package com.BIM1.ProyectoDesarrolloColectivo.Repository;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    boolean existsByNombre_CompletoAndCorreo_UsuarioAndContraseña(
            String nombre_completo,
            String correo_usuario,
            String contraseña
    );
}

