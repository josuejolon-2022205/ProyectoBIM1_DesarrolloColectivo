drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario (
	idUsuario int primary key not null auto_increment,
	nombreCompleto varchar (150),
	correoUsuario varchar (100) unique not null,
	contraseña varchar (100)
);

create table RegistroSueño (
	idRegistroSueño int primary key not null auto_increment,
	fechaSueño date,
	horasDormidas decimal (4,2),
	calidadSueño varchar (100),
	FKidUsuario int not null,
	foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade
);

create table ObjetivoMeditacion (
	idObjetivoMeditacion int primary key not null auto_increment,
	tiempoObjetivo varchar (50),
	diasObjetivo int,
	FKidUsuario int not null,
	foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade
);

-- =================== Usuario ================= --
delimiter $$
create procedure sp_ListarUsuarios ()
begin
	select * from Usuario order by idUsuario;
end $$
delimiter ;
 
-- Agregar Usuario --
delimiter $$
create procedure sp_AgregarUsuario (
	in p_nombreCompleto varchar (150),
	in p_correoUsuario varchar (100),
	in p_contraseña varchar (45)
)
begin
	insert into Usuario (nombreCompleto, correoUsuario, contraseña) values (p_nombreCompleto, p_correoUsuario, p_contraseña);
end $$
delimiter ;
 
-- Editar Usuario -- 

delimiter $$
create procedure sp_EditarUsuario (
	in p_idUsuario int,
	in p_nombreCompleto varchar (150),
	in p_correoUsuario varchar (100),
	in p_contraseña varchar (45)
)
begin
	update Usuario 
	set nombreCompleto = p_nombreCompleto, correoUsuario = p_correoUsuario, contraseña = p_contraseña
	where idUsuario = p_idUsuario;
end $$
delimiter ;

-- Eliminar Usuario --

delimiter $$
create procedure sp_EliminarUsuario (
	in p_idUsuario int
)
begin
	delete from Usuario where idUsuario = p_idUsuario;
end $$
delimiter ;    

-- =========================== RegistroSueños ============================ -- 

-- Listar RegistroSueños
delimiter $$
create procedure sp_ListarRegistrosSueño ()
begin
	select * from RegistroSueño order by idRegistroSueño;
end $$
delimiter ;

delimiter $$
create procedure sp_AgregarRegistroSueño (
	in p_fechaSueño date,
	in p_horasDormidas decimal (4,2),
	in p_calidadSueño varchar (100),
	in p_FKidUsuario int
)
begin
	insert into RegistroSueño (fechaSueño, horasDormidas, calidadSueño, FKidUsuario) values (p_fechaSueño, p_horasDormidas, p_calidadSueño, p_FKidUsuario);
end $$
delimiter ;

-- Editar RegistroSueño

delimiter $$
create procedure sp_EditarRegistroSueño(
	in p_idRegistroSueño int,
	in p_fechaSueño date,
	in p_horasDormidas decimal (4,2),
	in p_calidadSueño varchar (100),
	in p_FKidUsuario int
)
begin
	update RegistroSueño set fechaSueño = p_fechaSueño, horasDormidas = p_horasDormidas, calidadSueño = p_calidadSueño, FKidUsuario = p_FKidUsuario
	where idRegistroSueño = p_idRegistroSueño;
end $$
delimiter ;    
 
-- ======================== Objetivo Meditacion ======================== --
-- Listar
delimiter $$
create procedure sp_ListarObjetivoMeditacion ()
begin
	select * from ObjetivoMeditacion order by idObjetivoMeditacion;
end $$
delimiter ;
 
-- Agregar --
 
delimiter $$
create procedure sp_AgregarObjetivoMeditacion (
	in p_tiempoObjetivo varchar (50),
	in p_diasObjetivo int,
	in p_FKidUsuario int
)
begin
	insert into ObjetivoMeditacion (tiempoObjetivo, diasObjetivo, FKidUsuario) values (p_tiempoObjetivo, p_diasObjetivo, p_FKidUsuario);
end $$
delimiter ;
 
delimiter $$
create procedure sp_EditarObjetivoMeditacion (
	in p_idObjetivoMeditacion int,
	in p_tiempoObjetivo varchar (50),
	in p_diasObjetivo int,
	in p_FKidUsuario int
)
begin
	update ObjetivoMeditacion set
			tiempoObjetivo = p_tiempoObjetivo,
			diasObjetivo = p_diasObjetivo,
            FKidUsuario = p_FKidUsuario
			where idObjetivoMeditacion = p_idObjetivoMeditacion;
		end $$
delimiter ;
 
delimiter $$
create procedure sp_EliminarObjetivoMeditacion (
	in p_idObjetivoMeditacion int
)
begin
	delete from ObjetivoMeditacion where idObjetivoMeditacion = p_idObjetivoMeditacion;
end $$
delimiter ;