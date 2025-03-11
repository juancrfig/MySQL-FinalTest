-- Following good practices for database creation statements
DROP DATABASE IF EXISTS sakilacampus;
CREATE DATABASE sakilacampus CHARACTER SET utf8mb4;
USE sakilacampus;


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

