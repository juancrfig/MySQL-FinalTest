USE sakilacampus;


CREATE TABLE IF NOT EXISTS alquileresPorEmpleado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    id_alquiler INT
);

CREATE TABLE IF NOT EXISTS tablaAuditoriaCliente(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    email VARCHAR(50),
    id_direccion SMALLINT UNSIGNED 
);

DELIMITER //

-- TRIGGER 1
-- ActualizarTotalAlquileresEmpleado: Al registrar un alquiler, actualiza el total de alquileres gestionados por el empleado correspondiente

CREATE TRIGGER ActualizarTotalAlquileresEmpleado
AFTER INSERT ON alquiler
FOR EACH ROW
BEGIN
    INSERT INTO alquileresPorEmpleado(id_empleado, id_alquiler)
    VALUES
    (NEW.id_empleado, NEW.id_alquiler);
END//


-- TRIGGER 2
-- AuditarActualizacionCliente: Cada vez que se modifica un cliente, registra el cambio en una tabla de auditoría.

CREATE TRIGGER AuditarActualizacionCliente
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO tablaAuditoriaCliente(nombre, apellidos, email, id_direccion)
    VALUES
    (NEW.nombre, NEW.apellidos, NEW.email, NEW.id_direccion);
END//



DELIMITER ;