-- Following good practices for database creation statements
DROP DATABASE IF EXISTS sakilacampus;
CREATE DATABASE sakila CHARACTER SET utf8mb4;
USE sakilacampus;


-- Create table "pago"

CREATE TABLE (
    id_pago SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente SMALLINT UNSIGNED NOT NULL,
    id_empleado TINYINT UNSIGNED NOT NULL,
    id_alquiler INT UNSIGNED NOT NULL,
    total DECIMAL(5,2) NOT NULL,
    fecha_pago DATETIME NOT NULL,
    ultima_actualizacion TIMESTAMP NOT NULL
    FOREIGN KEY()
);


-- Create table "idioma"

CREATE TABLE (
    id_idioma TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);



-- Create table direccion

CREATE TABLE direccion (
    id_direccion SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
);

-- Create table "ciudad"

CREATE TABLE ciudad (
    id_ciudad SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    id_pais SMALLINT UNSIGNED NOT NULL
);

-- Create table "pais"

CREATE TABLE pais (
    id_pais SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);