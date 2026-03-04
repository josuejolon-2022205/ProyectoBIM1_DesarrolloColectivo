drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario(
    id_usuario int primary key auto_increment,
    nombre_completo varchar(150),
    correo_usuario varchar(100) unique not null,
    contraseña varchar(100)
);
create table Entrada_diario(
    id_entrada_diario int primary key auto_increment,
    fecha date,
    que_paso text,
    plan_mañana text,
    reflexion text,
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

create table Registro_meditacion(
    id_registro_meditacion int primary key auto_increment,
    tipo_meditacion enum('Guiada','Respiracion','Mindfulness','BodyScan'),
    duracion_minutos int,
    nivel_dificultad enum('Principiante','Intermedio','Avanzado'),
    fecha_registro datetime default current_timestamp,
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

-- ========================= entrada_diario ===================== --
delimiter $$
create procedure sp_listarEntrada_diario()
begin
    select * from Entrada_diario order by id_entrada_diario;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarEntrada_diario(
    in p_fecha date,
    in p_que_paso text,
    in p_plan_mañana text,
    in p_reflexion text,
    in p_fk_id_usuario int
)
begin
    insert into Entrada_diario(fecha,que_paso,plan_mañana,reflexion,fk_id_usuario)
    values(p_fecha,p_que_paso,p_plan_mañana,p_reflexion,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarEntrada_diario('2025-01-01', 'Empecé el año con energía y optimismo.',          'Meditar 10 minutos al despertar.',     'Pequeños pasos hacen grandes cambios.',  1);
call sp_agregarEntrada_diario('2025-01-02', 'Tuve una reunión difícil en el trabajo.',         'Preparar mejor mis presentaciones.',   'Aprender de los errores es crecer.',     2);
call sp_agregarEntrada_diario('2025-01-03', 'Salí a correr por primera vez en meses.',         'Repetir el ejercicio mañana.',         'El cuerpo agradece el movimiento.',      3);
call sp_agregarEntrada_diario('2025-01-04', 'Pasé tiempo de calidad con mi familia.',          'Llamar a un amigo que extraño.',       'Las relaciones son lo más valioso.',     4);
call sp_agregarEntrada_diario('2025-01-05', 'Leí 30 páginas de Hábitos Atómicos.',             'Continuar leyendo cada noche.',        'Leer transforma la mente.',              5);
call sp_agregarEntrada_diario('2025-01-06', 'Me costó concentrarme por el cansancio.',         'Dormir más temprano esta noche.',      'El descanso también es productividad.',  6);
call sp_agregarEntrada_diario('2025-01-07', 'Completé todos mis objetivos del día.',           'Mantener esta constancia.',            'La disciplina supera al talento.',       7);
call sp_agregarEntrada_diario('2025-01-08', 'Cociné saludable por primera vez en la semana.', 'Planear el menú de la semana.',        'Cuidar la alimentación es amor propio.', 8);
call sp_agregarEntrada_diario('2025-01-09', 'Sentí ansiedad por las responsabilidades.',      'Practicar respiración consciente.',    'Aceptar las emociones sin juicio.',      9);
call sp_agregarEntrada_diario('2025-01-10', 'Ayudé a un compañero en un proyecto.',           'Seguir siendo generoso con mi tiempo.','El servicio a otros da sentido.',        10);

delimiter $$
create procedure sp_editarEntrada_diario(
    in p_id_entrada_diario int,
    in p_fecha date,
    in p_que_paso text,
    in p_plan_mañana text,
    in p_reflexion text,
    in p_fk_id_usuario int
)
begin
    update Entrada_diario
    set fecha = p_fecha, que_paso = p_que_paso, plan_mañana = p_plan_mañana, reflexion = p_reflexion
    where id_entrada_diario = p_id_entrada_diario;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarEntrada_diario(
    in p_id_entrada_diario int
)
begin
    delete from Entrada_diario where id_entrada_diario=p_id_entrada_diario;
end $$
delimiter ;

delimiter $$
create procedure sp_buscar_entrada_diario(
    in p_id_entrada_diario int
)
begin
    select * from entrada_diario where id_entrada_diario = p_id_entrada_diario;
end $$
delimiter ;


-- ==================== registro_meditacion =================== --
delimiter $$
create procedure sp_listarRegistro_meditacion()
begin
    select * from Registro_meditacion order by id_registro_meditacion;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarRegistro_meditacion(
    in p_tipo_meditacion varchar(20),
    in p_duracion_minutos int,
    in p_nivel_dificultad varchar(20),
    in p_fk_id_usuario int
)
begin
    insert into Registro_meditacion(tipo_meditacion,duracion_minutos,nivel_dificultad,fk_id_usuario)
    values(p_tipo_meditacion,p_duracion_minutos,p_nivel_dificultad,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarRegistro_meditacion('Guiada',      15, 'Principiante', 1);
call sp_agregarRegistro_meditacion('Respiracion', 10, 'Principiante', 2);
call sp_agregarRegistro_meditacion('Mindfulness', 20, 'Intermedio',   3);
call sp_agregarRegistro_meditacion('BodyScan',    30, 'Avanzado',     4);
call sp_agregarRegistro_meditacion('Guiada',      25, 'Intermedio',   5);
call sp_agregarRegistro_meditacion('Respiracion', 15, 'Principiante', 6);
call sp_agregarRegistro_meditacion('Mindfulness', 10, 'Principiante', 7);
call sp_agregarRegistro_meditacion('BodyScan',    20, 'Intermedio',   8);
call sp_agregarRegistro_meditacion('Guiada',      30, 'Avanzado',     9);
call sp_agregarRegistro_meditacion('Respiracion', 10, 'Principiante', 10);

delimiter $$
create procedure sp_editarRegistro_meditacion(
    in p_id_registro_meditacion int,
    in p_tipo_meditacion varchar(20),
    in p_duracion_minutos int,
    in p_nivel_dificultad varchar(20),
    in p_fk_id_usuario int
)
begin
    update Registro_meditacion
    set tipo_meditacion = p_tipo_meditacion, duracion_minutos = p_duracion_minutos, nivel_dificultad = p_nivel_dificultad, fk_id_usuario = p_fk_id_usuario
    where id_registro_meditacion = p_id_registro_meditacion;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarRegistro_meditacion(
    in p_id_registro_meditacion int
)
begin
    delete from Registro_meditacion where id_registro_meditacion=p_id_registro_meditacion;
end $$
delimiter ;

delimiter $$
create function fn_promedio_sueño(p_id_usuario int)
returns decimal(4,2)
deterministic
begin
    declare promedio decimal(4,2);

    select avg(horas_dormidas)
    into promedio
    from Registro_sueño
    where fk_id_usuario=p_id_usuario;

    return ifnull(promedio,0);
end $$
delimiter ;

delimiter $$
create trigger trg_validar_estado_objetivo_update
before update on objetivos
for each row
begin
    declare promedio_horas decimal(4,2);

    set promedio_horas = fn_promedio_sueno(new.fk_id_usuario);

    if new.fecha_objetivo < curdate() then
        set new.estado_objetivo = 'vencido';
    elseif promedio_horas >= 8 then
        set new.estado_objetivo = 'cumplido';
    else
        set new.estado_objetivo = 'pendiente';
    end if;
end $$
delimiter ;






