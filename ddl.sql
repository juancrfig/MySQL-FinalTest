-- Following good practices for database creation statements
DROP DATABASE IF EXISTS sakilacampus;
CREATE DATABASE sakilacampus CHARACTER SET utf8mb4;
USE sakilacampus;


-- CREATION OF TABLES


-- Create table "actor"

CREATE TABLE actor (
    id_actor SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    ultima_actualizacion TIMESTAMP 
);

-- Create table "idioma"

CREATE TABLE idioma (
    id_idioma TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20),
    ultima_actualizacion TIMESTAMP 
);

-- Create table "pais"

CREATE TABLE pais (
    id_pais SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    ultima_actualizacion TIMESTAMP 
);

-- Create table "ciudad"

CREATE TABLE ciudad (
    id_ciudad SMALLINT UNSIGNED  PRIMARY KEY,
    nombre VARCHAR(50),
    id_pais SMALLINT UNSIGNED ,
    ultima_actualizacion TIMESTAMP
);

-- Create table direccion

CREATE TABLE direccion (
    id_direccion SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(50),
    direccion2 VARCHAR(50),
    distrito VARCHAR(20),
    id_ciudad SMALLINT UNSIGNED ,
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    ultima_actualizacion TIMESTAMP
);

-- Create table "empleado"

CREATE TABLE empleado (
    id_empleado TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    id_direccion SMALLINT UNSIGNED ,
    imagen BLOB,
    email VARCHAR(50),
    id_almacen TINYINT UNSIGNED ,
    activo TINYINT(1),
    username VARCHAR(16),
    password VARCHAR(40),
    ultima_actualizacion TIMESTAMP
);

-- Create table "film_text"

CREATE TABLE film_text (
    film_id SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    description TEXT 
);

-- Create table categoria

CREATE TABLE categoria (
    id_categoria TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    ultima_actualizacion TIMESTAMP 
);

-- Create table "almacen"

CREATE TABLE almacen (
    id_almacen TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    id_empleado_jefe TINYINT UNSIGNED ,
    id_direccion SMALLINT UNSIGNED ,
    ultima_actualizacion TIMESTAMP
);

-- Create table "cliente"

CREATE TABLE cliente (
    id_cliente SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    id_almacen TINYINT UNSIGNED ,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    email VARCHAR(50),
    id_direccion SMALLINT UNSIGNED ,
    activo TINYINT(1) ,
    fecha_creacion DATETIME ,
    ultima_actualizacion TIMESTAMP
);

-- Create table "pelicula"

CREATE TABLE pelicula (
    id_pelicula SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    description TEXT ,
    anyo_lanzamiento YEAR ,
    id_idioma TINYINT UNSIGNED ,
    id_idioma_original TINYINT UNSIGNED ,
    duracion_alquiler TINYINT UNSIGNED ,
    rental_rate DECIMAL(4,2),
    duracion SMALLINT UNSIGNED ,
    replacement_cost DECIMAL(5,2) ,
    clasificacion ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') ,
    caracteristicas_especiales SET('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes'),
    ultima_actualizacion TIMESTAMP
);

-- Create table "pelicula_actor"

CREATE TABLE pelicula_actor (
    id_actor SMALLINT UNSIGNED ,
    id_pelicula SMALLINT UNSIGNED ,
    PRIMARY KEY(id_actor, id_pelicula),
    ultima_actualizacion TIMESTAMP
);

-- Create table "pelicula_categoria" 

CREATE TABLE pelicula_categoria (
    id_pelicula SMALLINT UNSIGNED ,
    id_categoria TINYINT UNSIGNED ,
    PRIMARY KEY(id_pelicula, id_categoria),
    ultima_actualizacion TIMESTAMP
);

-- Create table "inventario"

CREATE TABLE inventario (
    id_inventario MEDIUMINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    id_pelicula SMALLINT UNSIGNED ,
    id_almacen TINYINT UNSIGNED ,
    ultima_actualizacion TIMESTAMP
);

-- Create table "alquiler"

CREATE TABLE alquiler (
    id_alquiler INT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    fecha_alquiler DATETIME ,
    id_inventario MEDIUMINT UNSIGNED ,
    id_cliente SMALLINT UNSIGNED ,
    fecha_devolucion DATETIME ,
    id_empleado TINYINT UNSIGNED ,
    ultima_actualizacion TIMESTAMP
);

-- Create table "pago"

CREATE TABLE pago (
    id_pago SMALLINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    id_cliente SMALLINT UNSIGNED ,
    id_empleado TINYINT UNSIGNED ,
    id_alquiler INT UNSIGNED ,
    total DECIMAL(5,2) ,
    fecha_pago DATETIME ,
    ultima_actualizacion TIMESTAMP
);