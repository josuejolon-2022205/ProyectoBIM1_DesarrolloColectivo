drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario(
    id_usuario int primary key auto_increment,
    nombre_completo varchar(150),
    correo_usuario varchar(100) unique not null,
    contraseña varchar(100)
);


create table Frase_motivadora(
    id_frase_motivadora int primary key auto_increment,
    texto text,
    autor varchar(50)
);

create table Objetivos(
    id_objetivos int primary key auto_increment,
    descripcion_objetivo varchar(150),
    estado_objetivo varchar(45),
    fecha_objetivo date,
    fk_id_usuario int not null,
    fk_id_frase_motivadora int,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade,
    foreign key(fk_id_frase_motivadora) references Frase_motivadora(id_frase_motivadora) on delete cascade
);

create table Apoyo_emocional(
    id_apoyo_emocional int primary key auto_increment,
    titulo varchar(50),
    categoria varchar(50),
    contenido text,
    nivel_animo enum('Mal','Bien','Mas o menos'),
    fk_id_usuario int not null,
    foreign key(fk_id_usuario) references Usuario(id_usuario) on delete cascade
);

-- ======================================================= PROCEDIMIENTOS ALMACENADOS ======================================================= --

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



-- =============== frase_motivadora ============= --

delimiter $$
create procedure sp_listarFrase_motivadora()
begin
    select * from Frase_motivadora order by id_frase_motivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarFrase_motivadora(
    in p_texto text,
    in p_autor varchar(50)
)
begin
    insert into Frase_motivadora(texto,autor)
    values(p_texto,p_autor);
end $$
delimiter ;

call sp_agregarFrase_motivadora('El éxito es la suma de pequeños esfuerzos repetidos día tras día.',       'Robert Collier');
call sp_agregarFrase_motivadora('No cuentes los días, haz que los días cuenten.',                          'Muhammad Ali');
call sp_agregarFrase_motivadora('La disciplina es el puente entre metas y logros.',                        'Jim Rohn');
call sp_agregarFrase_motivadora('Cree en ti mismo y todo será posible.',                                   'Anónimo');
call sp_agregarFrase_motivadora('El único modo de hacer un gran trabajo es amar lo que haces.',            'Steve Jobs');
call sp_agregarFrase_motivadora('Cada día es una nueva oportunidad para mejorar.',                         'Anónimo');
call sp_agregarFrase_motivadora('Tu único límite eres tú mismo.',                                          'Anónimo');
call sp_agregarFrase_motivadora('El camino de mil millas comienza con un solo paso.',                      'Lao Tzu');
call sp_agregarFrase_motivadora('Haz de cada día tu obra maestra.',                                        'John Wooden');
call sp_agregarFrase_motivadora('No te detengas cuando estés cansado, detente cuando hayas terminado.',    'David Goggins');

delimiter $$
create procedure sp_editarFrase_motivadora(
    in p_id_frase_motivadora int,
    in p_texto text,
    in p_autor varchar(50)
)
begin
    update Frase_motivadora
    set texto=p_texto,
        autor=p_autor
    where id_frase_motivadora=p_id_frase_motivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarFrase_motivadora(
    in p_id_frase_motivadora int
)
begin
    delete from Frase_motivadora where id_frase_motivadora=p_id_frase_motivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_listar_frase_motivadora()
begin
    select * from Frase_motivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_read_by_id_frase_motivadora(
    in p_id_frase_motivadora int
)
begin
    select * from Frase_motivadora where id_frase_motivadora = p_id_frase_motivadora;
end $$
delimiter ;

-- ============= objetivos ================== --
delimiter $$
create procedure sp_agregarObjetivos(
    in p_descripcion_objetivo varchar(150),
    in p_estado_objetivo varchar(45),
    in p_fecha_objetivo date,
    in p_fk_id_usuario int
)
begin
    insert into Objetivos(descripcion_objetivo,estado_objetivo,fecha_objetivo,fk_id_usuario)
    values(p_descripcion_objetivo,p_estado_objetivo,p_fecha_objetivo,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarObjetivos('Meditar 10 minutos diarios',     'En progreso', '2025-03-01',  1);
call sp_agregarObjetivos('Leer 2 libros al mes',           'Pendiente',   '2025-04-01',  2);
call sp_agregarObjetivos('Correr 5km sin parar',           'Completado',  '2025-02-15',  3);
call sp_agregarObjetivos('Dormir 8 horas cada noche',      'En progreso', '2025-05-01',  4);
call sp_agregarObjetivos('Reducir el consumo de azúcar',   'Pendiente',   '2025-06-01',  5);
call sp_agregarObjetivos('Escribir en el diario cada día', 'En progreso', '2025-03-15',  6);
call sp_agregarObjetivos('Hacer ejercicio 4 días/semana',  'Completado',  '2025-01-31',  7);
call sp_agregarObjetivos('Aprender a cocinar saludable',   'Pendiente',   '2025-07-01',  8);
call sp_agregarObjetivos('Reducir el estrés laboral',      'En progreso', '2025-04-30',  9);
call sp_agregarObjetivos('Tomar agua suficiente al día',   'Completado',  '2025-02-01',  10);

delimiter $$
create procedure sp_actualizarObjetivos(
    in p_id_objetivos int,
    in p_descripcion_objetivo varchar(150),
    in p_estado_objetivo varchar(45),
    in p_fecha_objetivo date,
    in p_fk_id_usuario int
)
begin
    update Objetivos
    set descripcion_objetivo = p_descripcion_objetivo, estado_objetivo = p_estado_objetivo, fecha_objetivo = p_fecha_objetivo, fk_id_usuario = p_fk_id_usuario
    where id_objetivos=p_id_objetivos;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarObjetivos(
    in p_id_objetivos int
)
begin
    delete from Objetivos where id_objetivos=p_id_objetivos;
end $$
delimiter ;

delimiter $$
create procedure sp_listar_objetivos()
begin
    select * from objetivos;
end $$
delimiter ;

delimiter $$
create procedure sp_read_by_id_objetivos(
    in p_id_objetivos int
)
begin
    select * from objetivos where id_objetivos = p_id_objetivos;
end $$
delimiter ;

-- ==================== apoyo_emocional ================== --
delimiter $$
create procedure sp_listarApoyo_emocional()
begin
    select * from Apoyo_emocional order by id_apoyo_emocional;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarApoyo_emocional(
    in p_titulo varchar(50),
    in p_categoria varchar(50),
    in p_contenido text,
    in p_nivel_animo varchar(20),
    in p_fk_id_usuario int
)
begin
    insert into Apoyo_emocional(titulo,categoria,contenido,nivel_animo,fk_id_usuario)
    values(p_titulo,p_categoria,p_contenido,p_nivel_animo,p_fk_id_usuario);
end $$
delimiter ;

call sp_agregarApoyo_emocional('Respiración 4-7-8',       'Ansiedad',   'Inhala 4s, retén 7s, exhala 8s. Repite 3 veces.',  'Mal',          1);
call sp_agregarApoyo_emocional('Gratitud diaria',          'Bienestar',  'Escribe 3 cosas por las que estás agradecido.',    'Bien',         2);
call sp_agregarApoyo_emocional('Caminata consciente',      'Estrés',     'Camina 10 minutos prestando atención a tus pasos.','Mas o menos',  3);
call sp_agregarApoyo_emocional('Journaling emocional',     'Tristeza',   'Escribe cómo te sientes sin juzgarte.',            'Mal',          4);
call sp_agregarApoyo_emocional('Música relajante',         'Ansiedad',   'Escucha sonidos naturales durante 15 minutos.',    'Mas o menos',  5);
call sp_agregarApoyo_emocional('Técnica 5-4-3-2-1',        'Estrés',     'Nombra 5 cosas que ves, 4 que tocas, 3 oyes...',  'Mal',          6);
call sp_agregarApoyo_emocional('Afirmaciones positivas',   'Autoestima', 'Repite: Soy capaz, soy valioso, lo lograré.',      'Bien',         7);
call sp_agregarApoyo_emocional('Descanso digital',         'Bienestar',  'Apaga pantallas 1 hora antes de dormir.',          'Mas o menos',  8);
call sp_agregarApoyo_emocional('Meditación guiada 10 min', 'Ansiedad',   'Sigue una sesión guiada en YouTube o Spotify.',    'Mal',          9);
call sp_agregarApoyo_emocional('Conexión social',          'Tristeza',   'Llama o visita a alguien que te importe.',         'Bien',         10);

delimiter $$
create procedure sp_editarApoyo_emocional(
    in p_id_apoyo_emocional int,
    in p_titulo varchar(50),
    in p_categoria varchar(50),
    in p_contenido text,
    in p_nivel_animo varchar(20),
    in p_fk_id_usuario int
)
begin
    update Apoyo_emocional
    set titulo = p_titulo, categoria = p_categoria, contenido = p_contenido, nivel_animo = p_nivel_animo
    where id_apoyo_emocional=p_id_apoyo_emocional;
    
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarApoyo_emocional(
    in p_id_apoyo_emocional int
)
begin
    delete from Apoyo_emocional where id_apoyo_emocional=p_id_apoyo_emocional;
end $$
delimiter ;

delimiter $$
create procedure sp_read_all_apoyo_emocional()
begin
    select * from apoyo_emocional;
end $$
delimiter ;

delimiter $$
create procedure sp_read_by_id_apoyo_emocional(
    in p_id_apoyo_emocional int
)
begin
    select * from apoyo_emocional where id_apoyo_emocional = p_id_apoyo_emocional;
end $$
delimiter ;