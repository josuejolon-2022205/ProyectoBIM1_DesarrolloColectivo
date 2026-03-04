drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario(
    id_usuario int primary key auto_increment,
    nombre_completo varchar(150),
    correo_usuario varchar(100) unique not null,
    contraseña varchar(100)
);

create table Perfil_nutricional(
    id_perfil_nutricional int primary key auto_increment,
    peso_kg int,
    altura decimal(4,2),
    edad int,
    genero enum('Femenino','Masculino'),
    nivel_actividad enum('bajo','medio','alto'),
    objetivo varchar(75),
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

create table Libro(
    id_libro int primary key auto_increment,
    titulo_libro varchar(100),
    autor_libro varchar(100),
    estado enum('pendiente','leyendo','terminado'),
    cantidad_pag int,
    cantidad_leido int,
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

create table Rutina(
    id_rutina int primary key auto_increment,
    nombre_rutina varchar(50),
    dias_semana varchar(100),
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

create table Ejercicio(
    id_ejercicio int primary key auto_increment,
    nombre_ejercicio varchar(60),
    series_ejercicio int,
    repeticiones_ejercicio int,
    tiempo_ejercicio int,
    descanso_ejercicio int,
    fk_id_rutina int not null,
    foreign key(fk_id_rutina) references Rutina(id_rutina) on delete cascade
);

-- =================== usuario ================= --
delimiter $$
create procedure sp_listarUsuario()
begin
    select * from Usuario order by id_usuario;
end $$
delimiter ;

-- Agregar usuario --
delimiter $$
create procedure sp_agregarUsuario(
    in p_nombre_completo varchar(150),
    in p_correo_usuario varchar(100),
    in p_contraseña varchar(100)
)
begin
    insert into Usuario(nombre_completo,correo_usuario,contraseña)
    values(p_nombre_completo,p_correo_usuario,p_contraseña);
end $$
delimiter ;

call sp_agregarUsuario('Kevin Ramirez',   'kevin@gmail.com',   '123');
call sp_agregarUsuario('Luis Pérez',      'luis@gmail.com',    '545');
call sp_agregarUsuario('Enrique Torres',  'enrique@gmail.com', '526');
call sp_agregarUsuario('María López',     'maria@gmail.com',   'abc');
call sp_agregarUsuario('Andrea Fuentes',  'andrea@gmail.com',  'pass1');
call sp_agregarUsuario('Carlos Méndez',   'carlos@gmail.com',  'pass2');
call sp_agregarUsuario('Sofía Castillo',  'sofia@gmail.com',   'pass3');
call sp_agregarUsuario('Diego Herrera',   'diego@gmail.com',   'pass4');
call sp_agregarUsuario('Valeria Ruiz',    'valeria@gmail.com', 'pass5');
call sp_agregarUsuario('Javier Morales',  'javier@gmail.com',  'pass6');

-- Editar usuario --
delimiter $$
create procedure sp_editarUsuario(
    in p_id_usuario int,
    in p_nombre_completo varchar(150),
    in p_correo_usuario varchar(100),
    in p_contraseña varchar(100)
)
begin
    update Usuario
    set nombre_completo = p_nombre_completo, correo_usuario = p_correo_usuario, contraseña = p_contraseña
    where id_usuario=p_id_usuario;
end $$
delimiter ;

-- Eliminar usuario --
delimiter $$
create procedure sp_eliminarUsuario(
    in p_id_usuario int
)
begin
    delete from Usuario where id_usuario=p_id_usuario;
end $$
delimiter ;


-- ================= perfil_nutricional =============== --
delimiter $$
create procedure sp_agregarPerfil_nutricional(
    in p_peso_kg int,
    in p_altura decimal(4,2),
    in p_edad int,
    in p_genero varchar(20),
    in p_nivel_actividad varchar(20),
    in p_objetivo varchar(75),
    in p_fk_id_usuario int
)
begin
    insert into Perfil_nutricional(peso_kg,altura,edad,genero,nivel_actividad,objetivo,fk_id_usuario)
    values(p_peso_kg,p_altura,p_edad,p_genero,p_nivel_actividad,p_objetivo,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarPerfil_nutricional(70, 1.75, 25, 'Masculino', 'medio', 'Mantener peso',  1);
call sp_agregarPerfil_nutricional(55, 1.60, 22, 'Femenino',  'alto',  'Bajar de peso',  2);
call sp_agregarPerfil_nutricional(80, 1.80, 30, 'Masculino', 'bajo',  'Ganar músculo',  3);
call sp_agregarPerfil_nutricional(62, 1.65, 28, 'Femenino',  'medio', 'Mantener peso',  4);
call sp_agregarPerfil_nutricional(90, 1.85, 35, 'Masculino', 'alto',  'Bajar de peso',  5);
call sp_agregarPerfil_nutricional(48, 1.55, 20, 'Femenino',  'bajo',  'Subir de peso',  6);
call sp_agregarPerfil_nutricional(75, 1.78, 27, 'Masculino', 'medio', 'Ganar músculo',  7);
call sp_agregarPerfil_nutricional(58, 1.62, 24, 'Femenino',  'alto',  'Mantener peso',  8);
call sp_agregarPerfil_nutricional(85, 1.82, 32, 'Masculino', 'bajo',  'Bajar de peso',  9);
call sp_agregarPerfil_nutricional(60, 1.68, 26, 'Femenino',  'medio', 'Ganar músculo',  10);

delimiter $$
create procedure sp_editarPerfil_nutricional(
    in p_id_perfil_nutricional int,
    in p_peso_kg int,
    in p_altura decimal(4,2),
    in p_edad int,
    in p_genero varchar(20),
    in p_nivel_actividad varchar(20),
    in p_objetivo varchar(75),
    in p_fk_id_usuario int
)
begin
    update Perfil_nutricional
    set peso_kg=p_peso_kg, altura=p_altura, edad=p_edad, genero=p_genero, nivel_actividad=p_nivel_actividad, objetivo=p_objetivo, fk_id_usuario=p_fk_id_usuario
    where id_perfil_nutricional=p_id_perfil_nutricional;
end $$
delimiter ;

delimiter $$
create procedure sp_listarPerfil_nutricional()
begin
    select * from Perfil_nutricional order by id_perfil_nutricional;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarPerfil_nutricional(
    in p_id_perfil_nutricional int
)
begin
    delete from Perfil_nutricional where id_perfil_nutricional=p_id_perfil_nutricional;
end $$
delimiter ;


-- ================= libro ================ --
delimiter $$
create procedure sp_listarLibro()
begin
    select * from Libro order by id_libro;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarLibro(
    in p_titulo_libro varchar(100),
    in p_autor_libro varchar(100),
    in p_estado varchar(20),
    in p_cantidad_pag int,
    in p_cantidad_leido int,
    in p_fk_id_usuario int
)
begin
    insert into Libro(titulo_libro,autor_libro,estado,cantidad_pag,cantidad_leido,fk_id_usuario)
    values(p_titulo_libro,p_autor_libro,p_estado,p_cantidad_pag,p_cantidad_leido,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarLibro('Hábitos Atómicos',              'James Clear',   'leyendo',   320, 150, 1);
call sp_agregarLibro('El Poder del Ahora',             'Eckhart Tolle', 'terminado', 280, 280, 2);
call sp_agregarLibro('Mindset',                        'Carol Dweck',   'pendiente', 300,   0, 3);
call sp_agregarLibro('El Monje que vendió su Ferrari', 'Robin Sharma',  'leyendo',   250, 100, 4);
call sp_agregarLibro('Los 7 Hábitos',                  'Stephen Covey', 'terminado', 400, 400, 5);
call sp_agregarLibro('Ikigai',                         'Héctor García', 'pendiente', 200,   0, 6);
call sp_agregarLibro('El Alquimista',                  'Paulo Coelho',  'terminado', 190, 190, 7);
call sp_agregarLibro('Fluir',                          'Mihaly C.',     'leyendo',   340, 200, 8);
call sp_agregarLibro('Deep Work',                      'Cal Newport',   'pendiente', 310,   0, 9);
call sp_agregarLibro('La Magia del Orden',             'Marie Kondo',   'leyendo',   226,  80, 10);

delimiter $$
create procedure sp_editarLibro(
    in p_id_libro int,
    in p_titulo_libro varchar(100),
    in p_autor_libro varchar(100),
    in p_estado varchar(20),
    in p_cantidad_pag int,
    in p_cantidad_leido int,
    in p_fk_id_usuario int
)
begin
    update Libro
    set titulo_libro=p_titulo_libro, autor_libro=p_autor_libro, estado=p_estado, cantidad_pag=p_cantidad_pag, cantidad_leido=p_cantidad_leido, fk_id_usuario=p_fk_id_usuario
    where id_libro=p_id_libro;
    
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarLibro(
    in p_id_libro int
)
begin
    delete from Libro where id_libro=p_id_libro;
end $$
delimiter ;

-- ==================== rutina ================== --
delimiter $$
create procedure sp_listarRutina()
begin
    select * from Rutina order by id_rutina;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarRutina(
    in p_nombre_rutina varchar(50),
    in p_dias_semana varchar(100),
    in p_fk_id_usuario int
)
begin
    insert into Rutina(nombre_rutina,dias_semana,fk_id_usuario)
    values(p_nombre_rutina,p_dias_semana,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarRutina('Rutina de Fuerza',    'Lunes,Miércoles,Viernes', 1);
call sp_agregarRutina('Cardio Matutino',     'Martes,Jueves',           2);
call sp_agregarRutina('Yoga y Flexibilidad', 'Lunes,Miércoles',         3);
call sp_agregarRutina('Full Body',           'Lunes,Jueves',            4);
call sp_agregarRutina('Rutina de Espalda',   'Martes,Viernes',          5);
call sp_agregarRutina('Pierna y Glúteo',     'Lunes,Miércoles,Sábado',  6);
call sp_agregarRutina('Core y Abdomen',      'Todos los días',          7);
call sp_agregarRutina('HIIT Intensivo',      'Martes,Jueves,Sábado',    8);
call sp_agregarRutina('Rutina de Pecho',     'Lunes,Viernes',           9);
call sp_agregarRutina('Movilidad y Postura', 'Miércoles,Sábado',        10);

delimiter $$
create procedure sp_editarRutina(
    in p_id_rutina int,
    in p_nombre_rutina varchar(50),
    in p_dias_semana varchar(100),
    in p_fk_id_usuario int
)
begin
    update Rutina
    set nombre_rutina=p_nombre_rutina, dias_semana=p_dias_semana, fk_id_usuario=p_fk_id_usuario
    where id_rutina=p_id_rutina;
    
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarRutina(
    in p_id_rutina int
)
begin
    delete from Rutina where id_rutina=p_id_rutina;
end $$
delimiter ;


-- ==================== ejercicio ================== --
delimiter $$
create procedure sp_listarEjercicio()
begin
    select * from Ejercicio order by id_ejercicio;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarEjercicio(
    in p_nombre_ejercicio varchar(60),
    in p_series_ejercicio int,
    in p_repeticiones_ejercicio int,
    in p_tiempo_ejercicio int,
    in p_descanso_ejercicio int,
    in p_fk_id_rutina int
)
begin
    insert into Ejercicio(nombre_ejercicio,series_ejercicio,repeticiones_ejercicio,tiempo_ejercicio,descanso_ejercicio,fk_id_rutina)
    values(p_nombre_ejercicio,p_series_ejercicio,p_repeticiones_ejercicio,p_tiempo_ejercicio,p_descanso_ejercicio,p_fk_id_rutina);
end $$
delimiter ;


call sp_agregarEjercicio('Sentadillas',       4, 12, 0,  60, 1);
call sp_agregarEjercicio('Press de Banca',    4, 10, 0,  90, 1);
call sp_agregarEjercicio('Correr',            1,  1, 30,  0, 2);
call sp_agregarEjercicio('Bicicleta',         1,  1, 20,  0, 2);
call sp_agregarEjercicio('Postura del Árbol', 3,  1, 60, 30, 3);
call sp_agregarEjercicio('Peso Muerto',       4, 10, 0,  90, 4);
call sp_agregarEjercicio('Remo con Barra',    4, 12, 0,  60, 5);
call sp_agregarEjercicio('Prensa de Pierna',  4, 15, 0,  60, 6);
call sp_agregarEjercicio('Plancha',           3,  1, 60, 30, 7);
call sp_agregarEjercicio('Burpees',           4, 15, 0,  45, 8);

delimiter $$
create procedure sp_editarEjercicio(
    in p_id_ejercicio int,
    in p_nombre_ejercicio varchar(60),
    in p_series_ejercicio int,
    in p_repeticiones_ejercicio int,
    in p_tiempo_ejercicio int,
    in p_descanso_ejercicio int,
    in p_fk_id_rutina int
)
begin
    update Ejercicio
    set nombre_ejercicio=p_nombre_ejercicio,
        series_ejercicio=p_series_ejercicio,
        repeticiones_ejercicio=p_repeticiones_ejercicio,
        tiempo_ejercicio=p_tiempo_ejercicio,
        descanso_ejercicio=p_descanso_ejercicio,
        fk_id_rutina=p_fk_id_rutina
    where id_ejercicio=p_id_ejercicio;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarEjercicio(
    in p_id_ejercicio int
)
begin
    delete from Ejercicio where id_ejercicio=p_id_ejercicio;
end $$
delimiter ;
