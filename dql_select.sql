USE sakilacampus;

-- CONSULTA 1
-- Encontrar el cliente que ha realizado la mayor cantidad de alquileres en los ultimos 6 meses

SELECT id_cliente, nombre, apellidos FROM cliente
WHERE id_cliente IN (
    SELECT id_cliente, COUNT(*) AS numero_alquileres 
    FROM alquiler 
    WHERE TIMESTAMPDIFF(MONTH, DATE(fecha_alquiler), NOW()) < 6 
    GROUP BY id_cliente 
    ORDER BY numero_alquileres DESC LIMIT 1
);


-- CONSULTA 2
-- Lista las cinco películas más alquiladas durante el último año.

