drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario (
	idUsuario int primary key not null auto_increment,
	nombreCompleto varchar (150),
	correoUsuario varchar (100) unique not null,
	contraseña varchar (100)
);

create table RachaEjercicio(
	idRachaEjercicio int primary key not null auto_increment,
    diasConsecutivos int default 0,
    fecha date,
    FKidUsuario int not null,
    FKidFraseMotivadora int,
    foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade,
    foreign key (FKidFraseMotivadora) references FraseMotivadora (idFraseMotivadora) on delete cascade
    
);

create table RachaLectura(
	idRachaLectura int primary key not null auto_increment,
    diasConsecutivos int default 0,
    fecha date,
    FKidUsuario int not null,
    FKidFraseMotivadora int,
    foreign key (FKidUsuario) references Usuario (idUsuario) on delete cascade,
    foreign key (FKidFraseMotivadora) references FraseMotivadora (idFraseMotivadora) on delete cascade

);

-- Procedimientos 
--  RachaEjercicio  --

delimiter $$
create procedure sp_agregarRachaEjercicio(
    in p_fecha date,
    in p_FKidUsuario int
)
begin
    insert into RachaEjercicio(fecha, FKidUsuario)
    values(p_fecha, p_FKidUsuario);
end $$
delimiter ;

-- Racha Lectura --

delimiter $$
create procedure sp_agregarRachaLectura(
	in p_fecha date, 
    in p_FKidusuario int
)
begin
	insert into RachaLectura(fecha, FKidUsuario)
    values(p_fecha, p_FKidUsuario);
end $$
delimiter ;


-- Triggers

delimiter $$

create trigger trg_validarRachaEjercicio
before insert on RachaEjercicio
for each row
begin
    declare ultimaFecha date;
    declare diasActual int;

    if new.diasConsecutivos < 0 then
	signal sqlstate '45000' set message_text = 'Los dias consecutivos no pueden ser negativos';
    end if;

    select fecha, diasConsecutivos into ultimaFecha, diasActual from RachaEjercicio
	where FKidUsuario = new.FKidUsuario order by fecha desc
    limit 1;

    if ultimaFecha = new.fecha then
	signal sqlstate '45000'
	set message_text = 'Ya existe una racha registrada para hoy';
    end if;

    if ultimaFecha = date_sub(new.fecha, interval 1 day) then
	set new.diasConsecutivos = diasActual + 1;
    else
        set new.diasConsecutivos = 1;
    end if;

end $$

delimiter ;


--  RachaLectura  --

delimiter $$

create trigger trg_validarRachaLectura
before insert on RachaLectura
for each row
begin
    declare ultimaFecha date;
    declare diasActual int;

    if new.diasConsecutivos < 0 then
	signal sqlstate '45000'
	set message_text = 'Los dias consecutivos no pueden ser negativos';
    end if;

    select fecha, diasConsecutivos 
    into ultimaFecha, diasActual from RachaLectura
    where FKidUsuario = new.FKidUsuario order by fecha desc limit 1;

    if ultimaFecha = new.fecha then signal sqlstate '45000'
	set message_text = 'Ya existe una racha registrada para hoy';
    end if;

    if ultimaFecha = date_sub(new.fecha, interval 1 day) then
	set new.diasConsecutivos = diasActual + 1;
    else
	set new.diasConsecutivos = 1;
    end if;

end $$

delimiter ;