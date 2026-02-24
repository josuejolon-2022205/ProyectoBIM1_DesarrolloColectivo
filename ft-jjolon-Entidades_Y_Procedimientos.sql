drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario (
	idUsuario int primary key not null auto_increment,
	nombreCompleto varchar (150),
	correoUsuario varchar (100) unique not null,
	contraseña varchar (100)
);

create table PerfilNutricional(
	idPerfilNutricional int primary key not null auto_increment,
    pesoKg int,
    altura decimal(4,2),
    edad int,
    genero enum('Femenino', 'Masculino'),
    nivelActividad enum('bajo', 'medio', 'alto'),
    objetivo varchar(75),
    FKidUsuario int not null,
    foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade
	
);

create table Libro(
	idlibro int primary key not null auto_increment,
    tituloLibro varchar(100),
    autorLibro varchar(100),
    estado enum('pendiente', 'leyendo', 'terminado'),
    cantidadPag int,
    cantidadLeido int,
    FKidUsuario int not null,
    foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade

);

create table Rutina(
	idRutina int primary key not null auto_increment,
    nombreRutina varchar(50),
    diasSemana varchar(30),
    FKidUsuario int not null,
    foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade

);

create table Ejercicio(
	idEjercicio int primary key not null auto_increment,
	nombreEjercicio varchar(50),
    seriesEjercicio int,
    repeticionesEjercicio int,
    tiempoEjercicio int,
    descansoEjercicio int,
    FKidRutina int not null,
    foreign key (FKidRutina) references Rutina (idRutina) on delete cascade

);

-- ================= PerfilNutricional =============== --
delimiter $$
create procedure sp_agregarPerfilNutricional(
    in p_pesokg int,
    in p_altura decimal(4,2),
    in p_edad int,
    in p_genero enum('Femenino','Masculino'),
    in p_nivelActividad enum('bajo', 'medio', 'alto'),
    in p_objetivo varchar(75),
    in p_FKidUsuario int

)
begin
	insert into PerfilNutricional(pesokg, altura, edad, genero, nivelActividad, objetivo, FKidUsuario)values
    (p_pesokg, p_altura, p_edad, p_genero, p_nivelActividad, p_objetivo, p_FKidUsuario);
    select last_insert_id() as idPerfilNutricional;

end $$
delimiter ;

delimiter $$
create procedure sp_ActualizarPerfilNutricional(
	in p_idPerfilNutricional int,
    in p_pesokg int,
    in p_altura decimal(4,2),
    in p_edad int,
    in p_genero enum('Femenino','Masculino'),
    in p_nivelActividad enum('bajo', 'medio', 'alto'),
    in p_objetivo varchar(75),
    in p_FKidUsuario int

)
begin
	update PerfilNutricional set pesokg = p_pesokg, altura = p_altura, edad = p_edad, genero = p_genero, 
    nivelActividad = p_nivelActividad, objetivo = p_objetivo, FKidUsuario = p_FKidUsuario
    where idPerfilNutricional = p_idPerfilNutricional;
end $$
delimiter ; 

delimiter $$
create procedure sp_listarPerfilNutricionl(
)
begin 
	select * from PerfilNutricional order by idPerfilNutricional;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarPerfilNutricional(
	in p_idPerfilNutricional int
)
begin
	delete from PerfilNutricional where idPerfilNutricional = p_idPerfilNutricional;
end $$
delimiter ;

-- ================= LIBRO ================ --

delimiter $$
create procedure sp_agregarLibro(
	in p_tituloLibro varchar(100),
    in p_autorLibro varchar(100), 
    in p_estado enum('pendiente', 'leyendo', 'terminado'),
    in p_cantidadPag int,
    in p_cantidadLeido int,
    in p_FKidUsuario int

)
begin
	insert into Libro(tituloLibro, autorLibro, estado, cantidadPag, cantidadLeido, FKidUsuario)
    values(p_tituloLibro, p_autorLibro, p_estado, p_cantidadPag, p_cantidadLeido, p_FKidUsuario);
    select last_insert_id() as idLibro;
	
end $$
delimiter ;

delimiter $$
create procedure sp_editarLibro(
	in p_idLibro int,
    in p_tituloLibro varchar(100),
    in p_autorLibro varchar(100), 
    in p_estado enum('pendiente', 'leyendo', 'terminado'),
    in p_cantidadPag int,
    in p_cantidadLeido int,
    in p_FKidUsuario int

)
begin
	update Libro set tituloLibro = p_tituloLibro, autorLibro = p_autorLibro, estado = p_estado, cantidadPag = p_cantidadPag,
    cantidadLeido = p_cantidadLeido, FKidUsuario = p_FKidUsuario where idLibro = p_idLibro;
    select last_insert_id() as idLibro;
end $$
delimiter ;

delimiter $$
create procedure sp_mostrarLibro(
)
begin
	select * from Libro order by idLibro;
end $$
delimiter ;

delimiter $$
create procedure sp_EliminarLibro(
	in p_idLibro int
)
begin
	delete from Libro where idLibro = p_idLibro;
    
end $$
delimiter ;

-- ==================== Rutina ================== --

delimiter $$
create procedure sp_agregarRutina(
	in p_nombreRutina varchar(50),
    in p_diasSemana varchar(20),
    in p_FKidUsuario int

)
begin 
	insert into Rutina(nombreRutina, diasSemana, FKidUsuario)values
    (p_nombreRutina, p_diasSemana, p_FKidUsuario);
    select last_insert_id() as idRutina;
end $$
delimiter ;

delimiter $$
create procedure sp_actualizarRutina(
	in p_idRutina int,
    in p_nombreRutina varchar(50),
    in p_diasSemana varchar(20),
    in p_FKidUsuario int

)
begin 
	update Rutina set nombreRutina = p_nombreRutina, diasSemana = p_diasSemana, FKidUsuario = p_FKidUsuario 
    where idRutina = p_idRutina;
    select last_insert_id() as idLibro;
end $$
delimiter ;

delimiter $$
create procedure sp_mostrarRutinas(
)
begin
	select * from Rutina order by idRutina;
end $$
delimiter ; 

delimiter $$
create procedure sp_eliminarRutina(
	in p_idRutina int
)
begin
	delete from Rutina where idRutina = p_idRutina;
    
end $$
delimiter ; 

-- ==================== Ejercicio ================== --

delimiter $$
create procedure sp_agregarEjercicio(
	in p_nombreEjercicio varchar(60),
    in p_seriesEjercicio int,
    in p_repeticionesEjercicio int,
    in p_tiempoEjercicio int,
    in p_descansoEjercicio int,
    in p_FKidRutina int

)
begin 
	insert into Ejercicio(nombreEjercicio, seriesEjercicio, repeticionesEjercicio, tiempoEjercicio, descansoEjercicio, FKidRutina)
    values(p_nombreEjercicio, p_seriesEjercicio, p_repeticionesEjercicio, p_tiempoEjercicio, p_descansoEjercicio, p_FKidRutina);
    select last_insert_id() as idEjercicio;

end $$
delimiter ;

delimiter $$
create procedure sp_actualizarEjercicio(
	in p_idEjercicio int,
    in p_nombreEjercicio varchar(60),
    in p_seriesEjercicio int,
    in p_repeticionesEjercicio int,
    in p_tiempoEjercicio int,
    in p_descansoEjercicio int,
    in p_FKidRutina int
)
begin
	update Ejercicio set nombreEjercicio = p_nombreEjercicio, seriesEjercicio = p_seriesEjercicio, repeticionesEjercicio = p_repeticionesEjercicio,
    tiempoEjercicio = p_tiempoEjercicio, descansoEjercicio = p_descansoEjercicio, FKidRutina = p_FKidRutina where idEjercicio = p_idEjercicio;
end $$
delimiter ;

delimiter $$
create procedure sp_mostrarEjercicios(
)
begin
	select * from Ejercicio order by FKidRutina;
end $$
delimiter ; 

delimiter $$
create procedure sp_eliminarEjercicios(
	in p_idEjercicio int
)
begin
	delete from Ejercicio where idEjercicio = p_idEjercicio;
end $$
delimiter ;