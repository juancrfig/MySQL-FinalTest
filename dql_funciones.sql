DELIMITER //

-- FUNCION 1
-- Calcula los ingresos generados por un cliente en un año específico
-- ERROR DE SINTAXIS SIN RESOLVER

CREATE FUNCTION TotalIngresosCliente(
    cliente_id INT,
    anyo INT
) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
        SELECT SUM(pago.total) AS ganancias
        FROM pago
        JOIN alquiler AS a ON pago.id_alquiler = a.id_alquiler
        JOIN cliente AS c ON a.id_cliente = c.id_cliente
        WHERE YEAR(fecha_alquiler) = anyo
        GROUP BY c.id_cliente
        HAVING c.id_cliente = cliente_id
        LIMIT 1;
    RETURN ganancias;
END//


-- FUNCION 2
-- 


DELIMITER ;