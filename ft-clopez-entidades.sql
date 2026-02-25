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

