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
    direccion VARCHAR(50) NOT NULL CHECK(TRIM(direccion) != ''),
    direccion2 VARCHAR(50) NOT NULL CHECK(TRIM(direccion2) != ''),
    distrito VARCHAR(20) NOT NULL CHECK(TRIM(distrito) != ''),
    id_ciudad SMALLINT UNSIGNED NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL CHECK(TRIM(codigo_postal) != ''),
    telefono VARCHAR(20) NOT NULL CHECK(TRIM(telefono) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL,
    FOREIGN KEY(id_ciudad) REFERENCES ciudad(id_ciudad)
);

-- Create table "ciudad"

CREATE TABLE ciudad (
    id_ciudad SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    id_pais SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY(id_pais) REFERENCES pais(id_pais)
);

-- Create table "pais"

CREATE TABLE pais (
    id_pais SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL CHECK(TRIM(nombre) != ''),
    ultima_actualizacion TIMESTAMP NOT NULL
);