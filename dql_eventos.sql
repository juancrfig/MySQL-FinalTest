USE sakilacampus;

DELIMITER //

CREATE TABLE IF NOT EXISTS categoriasMasAlquiladas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(25) NOT NULL
);

-- EVENTO 5
-- Actualiza la lista de categorías más alquiladas al final de cada mes.


CREATE EVENT actualizarCategoriasMasAlquiladas
ON SCHEDULE EVERY 1 MONTH
STARTS NOW()
DO
    -- Seleccionamos las 5 categorias mas vendidas
    SELECT c.nombre AS categoria_nombre, COUNT(*) AS ventas
    FROM categoria as c
    JOIN pelicula_categoria AS pc ON pc.id_categoria = c.id_categoria
    JOIN pelicula AS peli ON peli.id_pelicula = pc.id_categoria
    JOIN inventario AS inv ON inv.id_pelicula = peli.id_pelicula
    JOIN alquiler AS al ON al.id_inventario = inv.id_inventario
    WHERE TIMESTAMPDIFF(MONTH, MONTH(al.fecha_alquiler), MONTH(NOW())) < 1
    GROUP BY c.nombre
    ORDER BY ventas DESC
    LIMIT 5;

    INSERT INTO categoriasMasAlquiladas(categoria)
    VALUES(categoria_nombre);



DELIMITER ;