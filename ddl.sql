-- Following good practices for database creation statements
DROP DATABASE IF EXISTS sakilacampus;
CREATE DATABASE sakilacampus CHARACTER SET utf8mb4;
USE sakilacampus;


-- CREATION OF TABLES


-- Create table "actor"

CREATE TABLE actor (
    id_actor SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL CHECK(TRIM(nombre) != ''),
    apellidos VARCHAR(45) NOT NULL CHECK(TRIM(apellidos) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);

-- Create table "idioma"

CREATE TABLE idioma (
    id_idioma TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);

-- Create table "pais"

CREATE TABLE pais (
    id_pais SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);

-- Create table "ciudad"

CREATE TABLE ciudad (
    id_ciudad SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    id_pais SMALLINT UNSIGNED NOT NULL,

    FOREIGN KEY(id_pais) REFERENCES pais(id_pais)
);

-- Create table direccion

CREATE TABLE direccion (
    id_direccion SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(50) NOT NULL CHECK(TRIM(direccion) != ''),
    direccion2 VARCHAR(50) NOT NULL CHECK(TRIM(direccion2) != ''),
    distrito VARCHAR(20) NOT NULL CHECK(TRIM(distrito) != ''),
    id_ciudad SMALLINT UNSIGNED NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL CHECK(TRIM(codigo_postal) != ''),
    telefono VARCHAR(20) NOT NULL CHECK(TRIM(telefono) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_ciudad) REFERENCES ciudad(id_ciudad)
);

-- Create table "empleado"

CREATE TABLE empleado (
    id_empleado TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL CHECK(TRIM(nombre) != ''),
    apellidos VARCHAR(45) NOT NULL CHECK(TRIM(apellidos) != ''),
    id_direccion SMALLINT UNSIGNED NOT NULL,
    imagen BLOB,
    email VARCHAR(50) NOT NULL CHECK(TRIM(email) != ''),
    id_almacen TINYINT UNSIGNED NOT NULL,
    activo TINYINT(1),
    username VARCHAR(16) NOT NULL CHECK(TRIM(username) != ''),
    password VARCHAR(40) NOT NULL CHECK(TRIM(password) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_direccion) REFERENCES direccion(id_direccion)
);

-- Create table "film_text"

CREATE TABLE film_text (
    film_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL CHECK(TRIM(title) != ''),
    description TEXT NOT NULL
);

-- Create table categoria

CREATE TABLE categoria (
    id_categoria TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);

-- Create table "almacen"

CREATE TABLE almacen (
    id_almacen TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_empleado_jefe TINYINT UNSIGNED NOT NULL,
    id_direccion SMALLINT UNSIGNED NOT NULL,
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_empleado_jefe) REFERENCES empleado(id_empleado),
    FOREIGN KEY(id_direccion) REFERENCES direccion(id_direccion)
);

-- Create table "cliente"

CREATE TABLE cliente (
    id_cliente SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_almacen TINYINT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL CHECK(TRIM(nombre) != ''),
    apellidos VARCHAR(45) NOT NULL CHECK(TRIM(apellidos) != ''),
    email VARCHAR(50) NOT NULL CHECK(TRIM(email) != ''),
    id_direccion SMALLINT UNSIGNED NOT NULL,
    activo TINYINT(1) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_almacen) REFERENCES almacen(id_almacen),
    FOREIGN KEY(id_direccion) REFERENCES direccion(id_direccion)
);

-- Create table "pelicula"

CREATE TABLE pelicula (
    id_pelicula SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL CHECK(TRIM(titulo) != ''),
    description TEXT NOT NULL,
    anyo_lanzamiento YEAR NOT NULL,
    id_idioma TINYINT UNSIGNED NOT NULL,
    id_idioma_original TINYINT UNSIGNED NOT NULL,
    duracion_alquiler TINYINT UNSIGNED NOT NULL,
    rental_rate DECIMAL(4,2),
    duracion SMALLINT UNSIGNED NOT NULL,
    replacement_cost DECIMAL(5,2) NOT NULL,
    clasificacion ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') NOT NULL,
    caracteristicas_especiales SET('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes'),
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_idioma) REFERENCES idioma(id_idioma),
    FOREIGN KEY(id_idioma_original) REFERENCES idioma(id_idioma)
);

-- Create table "pelicula_actor"

CREATE TABLE pelicula_actor (
    id_actor SMALLINT UNSIGNED NOT NULL,
    id_pelicula SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_actor, id_pelicula),
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_actor) REFERENCES actor(id_actor),
    FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula)
);

-- Create table "pelicula_categoria" 

CREATE TABLE pelicula_categoria (
    id_pelicula SMALLINT UNSIGNED NOT NULL,
    id_categoria TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_pelicula, id_categoria),
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria)
);

-- Create table "inventario"

CREATE TABLE inventario (
    id_inventario MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pelicula SMALLINT UNSIGNED NOT NULL,
    id_almacen TINYINT UNSIGNED NOT NULL,
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula),
    FOREIGN KEY(id_almacen) REFERENCES almacen(id_almacen)
);

-- Create table "alquiler"

CREATE TABLE alquiler (
    id_alquiler INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha_alquiler DATETIME NOT NULL,
    id_inventario MEDIUMINT UNSIGNED NOT NULL,
    id_cliente SMALLINT UNSIGNED NOT NULL,
    fecha_devolucion DATETIME NOT NULL,
    id_empleado TINYINT UNSIGNED NOT NULL,
    ultima_actualizacion TIMESTAMP NOT NULL,

    FOREIGN KEY(id_inventario) REFERENCES inventario(id_inventario),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

--