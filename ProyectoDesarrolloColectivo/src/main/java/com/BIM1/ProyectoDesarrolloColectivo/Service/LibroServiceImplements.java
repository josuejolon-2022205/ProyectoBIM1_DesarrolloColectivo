package com.BIM1.ProyectoDesarrolloColectivo.Service;

import com.BIM1.ProyectoDesarrolloColectivo.Entity.Libro;
import com.BIM1.ProyectoDesarrolloColectivo.Exceptions.Exception;
import com.BIM1.ProyectoDesarrolloColectivo.Repository.LibroRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibroServiceImplements  implements LibroService {
    private final LibroRepository libroRepository;

    public LibroServiceImplements(LibroRepository libroRepository) {
        this.libroRepository = libroRepository;
    }

    @Override
    public List<Libro> getAListLibro() {
        return libroRepository.findAll();
    }

    @Override
    public Libro getLibroById(Integer id) {
        Libro libro = libroRepository.findById(id).orElse(null);
        if(libro == null){
            throw new IllegalArgumentException();
        }else {
            return libroRepository.findById(id).orElse(null);
        }
    }

    @Override
    public Libro saveLibro(Libro libro) throws RuntimeException {
        return libroRepository.save(libro);
    }

    @Override
    public Libro updateLibro(Integer id, Libro libro) {

        Libro libros = libroRepository.findById(id).orElse(null);
        if(libros != null){
            libros.setTitulo_libro(libro.getTitulo_libro());
            libros.setAutor_libro(libro.getAutor_libro());
            libros.setEstado(libro.getEstado());
            libros.setCantidad_pag(libro.getCantidad_pag());
            libros.setCantidad_leido(libro.getCantidad_leido());

        }else{
            throw new Exception("el id del libro no existe");
        }
        return libroRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteLibro(Integer id) {
        Libro libros = libroRepository.findById(id).orElse(null);
        if(libros != null){
            throw new Exception("el id del libro no existe");
        }
        libroRepository.deleteById(id);
    }
}
