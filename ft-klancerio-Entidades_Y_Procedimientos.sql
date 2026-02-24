drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario(
    id_usuario int primary key auto_increment,
    nombre_completo varchar(150),
    correo_usuario varchar(100) unique not null,
    contraseña varchar(100)
);

create table Registro_sueño(
    id_registro_sueño int primary key auto_increment,
    fecha_sueño date,
    horas_dormidas decimal(4,2),
    calidad_sueño varchar(100),
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

create table Objetivo_meditacion(
    id_objetivo_meditacion int primary key auto_increment,
    tiempo_objetivo varchar(50),
    dias_objetivo int,
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

-- =================== Usuario ================= --
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

-- =========================== registro_sueno ============================ --

-- Listar registro_sueno
delimiter $$
create procedure sp_listarRegistro_sueño()
begin
    select * from Registro_sueño order by id_registro_sueño;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarRegistro_sueño(
    in p_fecha_sueño date,
    in p_horas_dormidas decimal(4,2),
    in p_calidad_sueño varchar(100),
    in p_fk_id_usuario int
)
begin
    insert into Registro_sueño(fecha_sueño,horas_dormidas,calidad_sueño,fk_id_usuario)
    values(p_fecha_sueño,p_horas_dormidas,p_calidad_sueño,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarRegistro_sueño('2025-01-05', 7.00, 'Bien',      1);
call sp_agregarRegistro_sueño('2025-01-06', 5.50, 'Regular',   2);
call sp_agregarRegistro_sueño('2025-01-07', 8.00, 'Excelente', 3);
call sp_agregarRegistro_sueño('2025-01-08', 4.00, 'Mal',       4);
call sp_agregarRegistro_sueño('2025-01-09', 6.50, 'Bien',      5);
call sp_agregarRegistro_sueño('2025-01-10', 9.00, 'Excelente', 6);
call sp_agregarRegistro_sueño('2025-01-11', 3.50, 'Mal',       7);
call sp_agregarRegistro_sueño('2025-01-12', 7.50, 'Bien',      8);
call sp_agregarRegistro_sueño('2025-01-13', 6.00, 'Regular',   9);
call sp_agregarRegistro_sueño('2025-01-14', 8.00, 'Excelente', 10);

-- Editar registro_sueno
delimiter $$
create procedure sp_editarRegistro_sueño(
    in p_id_registro_sueño int,
    in p_fecha_sueño date,
    in p_horas_dormidas decimal(4,2),
    in p_calidad_sueño varchar(100),
    in p_fk_id_usuario int
)
begin
    update Registro_sueño
    set fecha_sueño = p_fecha_sueño, horas_dormidas = p_horas_dormidas, calidad_sueño = p_calidad_sueño, fk_id_usuario = p_fk_id_usuario
    where id_registro_sueño=p_id_registro_sueño;
end $$
delimiter ;    
 
-- ======================== objetivo_meditacion ======================== --

delimiter $$
create procedure sp_listarObjetivo_meditacion()
begin
    select * from Objetivo_meditacion order by id_objetivo_meditacion;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarObjetivo_meditacion(
    in p_tiempo_objetivo varchar(50),
    in p_dias_objetivo int,
    in p_fk_id_usuario int
)
begin
    insert into Objetivo_meditacion(tiempo_objetivo,dias_objetivo,fk_id_usuario)
    values(p_tiempo_objetivo,p_dias_objetivo,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarObjetivo_meditacion('2 semanas', 7,  1);
call sp_agregarObjetivo_meditacion('4 semanas', 3,  2);
call sp_agregarObjetivo_meditacion('6 semanas', 5,  3);
call sp_agregarObjetivo_meditacion('8 semanas', 2,  4);
call sp_agregarObjetivo_meditacion('1 mes',     4,  5);
call sp_agregarObjetivo_meditacion('3 meses',   6,  6);
call sp_agregarObjetivo_meditacion('2 semanas', 7,  7);
call sp_agregarObjetivo_meditacion('4 semanas', 3,  8);
call sp_agregarObjetivo_meditacion('6 semanas', 5,  9);
call sp_agregarObjetivo_meditacion('8 semanas', 2,  10);

delimiter $$
create procedure sp_editarObjetivo_meditacion(
    in p_id_objetivo_meditacion int,
    in p_tiempo_objetivo varchar(50),
    in p_dias_objetivo int,
    in p_fk_id_usuario int
)
begin
    update Objetivo_meditacion set tiempo_objetivo = p_tiempo_objetivo, dias_objetivo = p_dias_objetivo, fk_id_usuario = p_fk_id_usuario
    where id_objetivo_meditacion = p_id_objetivo_meditacion;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarObjetivo_meditacion(
    in p_id_objetivo_meditacion int
)
begin
    delete from Objetivo_meditacion where id_objetivo_meditacion=p_id_objetivo_meditacion;
end $$
delimiter ;