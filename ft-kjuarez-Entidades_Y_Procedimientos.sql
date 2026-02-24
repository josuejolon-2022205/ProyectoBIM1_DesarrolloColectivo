drop database if exists DBDesarrolloColectivo_in5cm;
create database DBDesarrolloColectivo_in5cm;
use DBDesarrolloColectivo_in5cm;

create table Usuario (
	idUsuario int primary key not null auto_increment,
	nombreCompleto varchar (150),
	correoUsuario varchar (100) unique not null,
	contraseña varchar (100)
);

create table Objetivos(
  idObjetivos int not null primary key auto_increment,
  descripcionObjetivo varchar(150),
  estadoObjetivo varchar(45),
  fechaObjetivo date,
  FKidUsuario int,
  foreign key (FKidUsuario) references Usuario(idUsuario)        
);

create table FraseMotivadora(
  idFraseMotivadora int not null primary key auto_increment,
  texto varchar(100),
  autor varchar(50)    
);

create table ApoyoEmocional(
    idApoyoEmocional int not null primary key auto_increment,
    titulo varchar(50),
    categoria varchar(50),
    contenido varchar(100),
    nivelAnimo enum("Mal","Bien","Mas o menos")
);

-- Procedimientos almacenados --

-- Objetivos --
delimiter $$
create procedure sp_createObjetivos(
  in pDescripcionObjetivo varchar(150),
  in pEstadoObjetivo varchar(45),
  in pFechaObjetivo date,
  in pFkIdUsuario int
)
begin
  insert into Objetivos(descripcionObjetivo, estadoObjetivo, fechaObjetivo, fkIdUsuario)
  values(pDescripcionObjetivo, pEstadoObjetivo, pFechaObjetivo, pFkIdUsuario);
end $$
delimiter ;

delimiter $$
create procedure sp_updateObjetivos(
  in pIdObjetivos int,
  in pDescripcionObjetivo varchar(150),
  in pEstadoObjetivo varchar(45),
  in pFechaObjetivo date,
  in pFkIdUsuario int
)
begin
  update Objetivos
  set descripcionObjetivo = pDescripcionObjetivo,
      estadoObjetivo = pEstadoObjetivo,
      fechaObjetivo = pFechaObjetivo,
      fkIdUsuario = pFkIdUsuario
  where idObjetivos = pIdObjetivos;
end $$
delimiter ;

delimiter $$
create procedure sp_deleteObjetivos(
  in pIdObjetivos int
)
begin
  delete from Objetivos
  where idObjetivos = pIdObjetivos;
end $$
delimiter ;
 
delimiter $$
create procedure sp_readAllObjetivos()
begin
  select * from Objetivos;
end $$
delimiter ;

delimiter $$
create procedure sp_readByIdObjetivos(
  in pIdObjetivos int
)
begin
  select * from Objetivos
  where idObjetivos = pIdObjetivos;
end $$
delimiter ;

-- Frase Motivadora --
delimiter $$
create procedure sp_createFraseMotivadora(
  in pTexto varchar(100),
  in pAutor varchar(50)
)
begin
  insert into FraseMotivadora(texto, autor)
  values(pTexto, pAutor);
end $$
delimiter ;

delimiter $$
create procedure sp_updateFraseMotivadora(
  in pIdFraseMotivadora int,
  in pTexto varchar(100),
  in pAutor varchar(50)
)
begin
  update FraseMotivadora
  set texto = pTexto,
      autor = pAutor
  where idFraseMotivadora = pIdFraseMotivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_deleteFraseMotivadora(
  in pIdFraseMotivadora int
)
begin
  delete from FraseMotivadora
  where idFraseMotivadora = pIdFraseMotivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_readAllFraseMotivadora()
begin
  select * from FraseMotivadora;
end $$
delimiter ;

delimiter $$
create procedure sp_readByIdFraseMotivadora(
  in pIdFraseMotivadora int
)
begin
  select * from FraseMotivadora
  where idFraseMotivadora = pIdFraseMotivadora;
end $$
delimiter ;
 
 -- Apoyo Emocional --
 delimiter $$
create procedure sp_createApoyoEmocional(
  in pTitulo varchar(50),
  in pCategoria varchar(50),
  in pContenido varchar(100),
  in pNivelAnimo enum('Mal','Bien','Mas o menos')
)
begin
  insert into ApoyoEmocional(titulo, categoria, contenido, nivelAnimo)
  values(pTitulo, pCategoria, pContenido, pNivelAnimo);
end $$
delimiter ;

delimiter $$
create procedure sp_updateApoyoEmocional(
  in pIdApoyoEmocional int,
  in pTitulo varchar(50),
  in pCategoria varchar(50),
  in pContenido varchar(100),
  in pNivelAnimo enum('Mal','Bien','Mas o menos')
)
begin
  update ApoyoEmocional
  set titulo = pTitulo,
      categoria = pCategoria,
      contenido = pContenido,
      nivelAnimo = pNivelAnimo
  where idApoyoEmocional = pIdApoyoEmocional;
end $$
delimiter ;

delimiter $$
create procedure sp_deleteApoyoEmocional(
  in pIdApoyoEmocional int
)
begin
  delete from ApoyoEmocional
  where idApoyoEmocional = pIdApoyoEmocional;
end $$
delimiter ;

delimiter $$
create procedure sp_readAllApoyoEmocional()
begin
  select * from ApoyoEmocional;
end $$
delimiter ;

delimiter $$
create procedure sp_readByIdApoyoEmocional(
  in pIdApoyoEmocional int
)
begin
  select * from ApoyoEmocional
  where idApoyoEmocional = pIdApoyoEmocional;
end $$
delimiter ;
 