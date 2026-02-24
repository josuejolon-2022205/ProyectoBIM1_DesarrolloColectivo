drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario(
    id_usuario int primary key auto_increment,
    nombre_completo varchar(150),
    correo_usuario varchar(100) unique not null,
    contraseña varchar(100)
);

create table Racha_ejercicio(
    id_racha_ejercicio int primary key auto_increment,
    dias_consecutivos int default 0,
    fecha date,
    fk_id_usuario int not null,
    fk_id_frase_motivadora int,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade,
    foreign key(fk_id_frase_motivadora) references Frase_motivadora(id_frase_motivadora) on delete cascade
);

create table Racha_lectura(
    id_racha_lectura int primary key auto_increment,
    dias_consecutivos int default 0,
    fecha date,
    fk_id_usuario int not null,
    fk_id_frase_motivadora int,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade,
    foreign key(fk_id_frase_motivadora) references Frase_motivadora(id_frase_motivadora) on delete cascade
);

-- Procedimientos 
--  RachaEjercicio  --

delimiter $$
create procedure sp_agregar_racha_ejercicio(
    in p_fecha date,
    in p_fk_id_usuario int
)
begin
    insert into Racha_ejercicio (fecha, fk_id_usuario)
    values (p_fecha, p_fk_id_usuario);
end $$
delimiter ;

call sp_agregar_racha_ejercicio('2025-01-01', 1);
call sp_agregar_racha_ejercicio('2025-01-02', 1);
call sp_agregar_racha_ejercicio('2025-01-03', 2);
call sp_agregar_racha_ejercicio('2025-01-04', 3);
call sp_agregar_racha_ejercicio('2025-01-05', 4);
call sp_agregar_racha_ejercicio('2025-01-06', 5);
call sp_agregar_racha_ejercicio('2025-01-07', 6);
call sp_agregar_racha_ejercicio('2025-01-08', 7);
call sp_agregar_racha_ejercicio('2025-01-09', 8);
call sp_agregar_racha_ejercicio('2025-01-10', 9);

-- Racha Lectura --

delimiter $$
create procedure sp_agregar_racha_lectura(
    in p_fecha date,
    in p_fk_id_usuario int
)
begin
    insert into Racha_lectura (fecha, fk_id_usuario)
    values (p_fecha, p_fk_id_usuario);
end $$
delimiter ;

call sp_agregar_racha_lectura('2025-01-01',  1);
call sp_agregar_racha_lectura('2025-01-02',  2);
call sp_agregar_racha_lectura('2025-01-03',  3);
call sp_agregar_racha_lectura('2025-01-04',  4);
call sp_agregar_racha_lectura('2025-01-05',  5);
call sp_agregar_racha_lectura('2025-01-06',  6);
call sp_agregar_racha_lectura('2025-01-07',  7);
call sp_agregar_racha_lectura('2025-01-08',  8);
call sp_agregar_racha_lectura('2025-01-09',  9);
call sp_agregar_racha_lectura('2025-01-10', 10);


-- Triggers

delimiter $$
create trigger trg_validar_racha_ejercicio
before insert on racha_ejercicio
for each row
begin
    declare ultima_fecha    date;
    declare dias_actual     int;

    if new.dias_consecutivos < 0 then
        signal sqlstate '45000' set message_text = 'Los dias consecutivos no pueden ser negativos';
    end if;

    select fecha, dias_consecutivos
    into ultima_fecha, dias_actual
    from racha_ejercicio
    where fk_id_usuario = new.fk_id_usuario
    order by fecha desc
    limit 1;

    if ultima_fecha = new.fecha then
        signal sqlstate '45000' set message_text = 'Ya existe una racha registrada para hoy';
    end if;

    if ultima_fecha = date_sub(new.fecha, interval 1 day) then
        set new.dias_consecutivos = dias_actual + 1;
    else
        set new.dias_consecutivos = 1;
    end if;
end $$
delimiter ;


--  RachaLectura  --

delimiter $$
create trigger trg_validar_racha_lectura
before insert on racha_lectura
for each row
begin
    declare ultima_fecha    date;
    declare dias_actual     int;

    if new.dias_consecutivos < 0 then
        signal sqlstate '45000' set message_text = 'Los dias consecutivos no pueden ser negativos';
    end if;

    select fecha, dias_consecutivos
    into ultima_fecha, dias_actual
    from racha_lectura
    where fk_id_usuario = new.fk_id_usuario
    order by fecha desc
    limit 1;

    if ultima_fecha = new.fecha then
        signal sqlstate '45000' set message_text = 'Ya existe una racha registrada para hoy';
    end if;

    if ultima_fecha = date_sub(new.fecha, interval 1 day) then
        set new.dias_consecutivos = dias_actual + 1;
    else
        set new.dias_consecutivos = 1;
    end if;
end $$
delimiter ;