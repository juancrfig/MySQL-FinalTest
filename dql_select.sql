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
-- Este query tambien dio conjunto vacio. Asumo de aqui en adelante que debo dar
-- literalmente la respuesta que me pide el examen


-- CONSULTA 2
-- Lista las cinco películas más alquiladas durante el último año.

SELECT * FROM alquiler WHERE TIMESTAMPDIFF(YEAR, fecha_alquiler, NOW()) < 1;

-- Los registros en la tabla de alquileres con fecha de ocurrencia 
-- menor a un año nos da como resultado el conjunto vacio.
-- Por lo tanto podemos dar por finalizado el query hasta este punto. 


-- CONSULTA 3
-- Obtén el total de ingresos y la cantidad de alquileres realizados por cada categoría de película.

SELECT c.nombre, 
       COUNT(DISTINCT a.id_alquiler) AS numero_alquileres,
       SUM(pago.total) AS total_ingresos
FROM categoria AS c
JOIN pelicula_categoria AS pc ON pc.id_categoria = c.id_categoria
JOIN pelicula AS p ON p.id_pelicula = pc.id_pelicula
JOIN inventario AS i ON i.id_pelicula = p.id_pelicula
JOIN alquiler AS a ON a.id_inventario = i.id_inventario
JOIN pago ON pago.id_alquiler = a.id_alquiler
GROUP BY c.nombre;



-- CONSULTA 4
-- Calcula el número total de clientes que han realizado alquileres por cada idioma disponible en un mes específico.

SELECT idi.nombre, COUNT(DISTINCT a.id_cliente) AS numero_clientes
FROM idioma AS idi
JOIN pelicula AS p ON p.id_idioma = idi.id_idioma
JOIN inventario AS inv ON inv.id_pelicula = p.id_pelicula
JOIN alquiler AS a ON a.id_inventario = inv.id_inventario
GROUP BY idi.nombre;


-- Consulta 5 
-- Encuentra a los clientes que han alquilado todas las películas de una misma categoría.
-- CONSULTA INCOMPLETA
SELECT c.nombre, c.apellidos, p.id_pelicula
FROM cliente AS c
JOIN alquiler AS a ON a.id_cliente = c.id_cliente
JOIN inventario AS i ON i.id_inventario = a.id_inventario
JOIN pelicula AS p ON p.id_pelicula = i.id_pelicula
JOIN pelicula_categoria AS pc ON pc.id_pelicula = p.id_pelicula
JOIN categoria AS cat ON cat.id_categoria = pc.id_categoria;


-- Consulta 6
-- Lista las tres ciudades con más clientes activos en el último trimestre.

SELECT * FROM pago
JOIN alquiler AS a ON a.id_alquiler = pago.id_alquiler
WHERE TIMESTAMPDIFF(MONTH, a.fecha_alquiler, NOW()) < 3; 

-- No hay registros de alquileres en el ultimo trimestre.
-- Por lo tanto la lista de las ciudad dará vacio también


-- Consulta 7
-- Muestra las cinco categorías con menos alquileres registrados en el último año.

SELECT * FROM alquiler ORDER BY fecha_alquiler DESC LIMIT 1;
-- Esto nos muestra que en los registros el ultimo año es 2019.
-- Por lo tanto vamos a usar este año para realizar la consulta principal

SELECT cat.nombre
FROM categoria AS cat
JOIN pelicula_categoria AS pc ON pc.id_categoria = cat.id_categoria
JOIN pelicula AS p ON p.id_pelicula = pc.id_pelicula
JOIN inventario AS i ON i.id_pelicula = p.id_pelicula
JOIN alquiler AS a ON a.id_inventario = i.id_inventario
WHERE YEAR(a.fecha_alquiler) = '2019'
GROUP BY cat.nombre;

-- RESPUESTA: En el año 2019 la unica categoria que se alquilo fue TRAVEL



-- CONSULTA 8
-- Calcula el promedio de días que un cliente tarda en devolver las películas alquiladas
SELECT AVG(TIMESTAMPDIFF(DAY, fecha_alquiler, fecha_devolucion)) AS dias_diferencia FROM alquiler;



-- Consulta 9
-- Encuentra los cinco empleados que gestionaron más alquileres en la categoría de Acción.

SELECT e.nombre, COUNT(*) AS numero_alquileres_gestionados
FROM pago AS p
JOIN alquiler AS a ON a.id_alquiler = p.id_alquiler
JOIN inventario AS i ON i.id_inventario = a.id_inventario
JOIN pelicula AS peli ON peli.id_pelicula = i.id_pelicula
JOIN pelicula_categoria AS pc ON pc.id_pelicula = peli.id_pelicula
JOIN categoria AS c ON c.id_categoria = pc.id_categoria
JOIN empleado AS e ON e.id_empleado = p.id_empleado
WHERE c.nombre = 'Action'
GROUP BY p.id_empleado;


-- Consulta 10
-- Genera un informe de los clientes con alquileres más recurrentes.



-- Consulta 11
-- Calcula el costo promedio de alquiler por idioma de las películas.

SELECT idi.nombre, AVG(p.total) AS costo_promedio 
FROM pelicula AS peli
JOIN idioma AS idi ON idi.id_idioma = peli.id_idioma
JOIN inventario AS inv ON inv.id_pelicula = peli.id_pelicula
JOIN alquiler AS a ON a.id_inventario = inv.id_inventario
JOIN pago AS p ON p.id_alquiler = a.id_alquiler
GROUP BY idi.nombre;

-- La consulta retorna solo un resultado porque en la base de datos solo hay registros
-- para el idioma ingles



-- Consulta 12
-- Lista las cinco películas con mayor duración alquiladas en el último año.

SELECT * FROM alquiler ORDER BY fecha_alquiler DESC LIMIT 1;
-- Esto nos muestra que en los registros el ultimo año es 2019.
-- Por lo tanto vamos a usar este año para realizar la consulta principal

SELECT peli.titulo
FROM pelicula AS peli
JOIN inventario AS inv ON inv.id_pelicula = peli.id_pelicula
JOIN alquiler AS a ON a.id_inventario = inv.id_inventario
WHERE YEAR(a.fecha_alquiler) = '2019'
ORDER BY peli.duracion DESC
LIMIT 5;

-- Nuevamente el resultado solo es una pelicula


-- CONSULTA 14
-- Encuentra la cantidad total de días alquilados por cada cliente en el último mes.

SELECT * FROM alquiler ORDER BY fecha_alquiler DESC LIMIT 1;
-- Esta consulta nos muestra que el ultimo mes de registros es Enero del año 2019
-- Usaremos esto para la consulta principal


-- CONSULTA 17
-- Encuentra el cliente que ha realizado el alquiler más caro en el último año.

SELECT * FROM alquiler ORDER BY fecha_alquiler DESC LIMIT 1;
-- Esta consulta nos muestra que el ultimo año es 2019
-- Usaremos esto para la consulta principal

SELECT c.nombre, c.apellidos 
FROM cliente AS c
JOIN alquiler AS a ON a.id_cliente = c.id_cliente
JOIN pago AS p ON p.id_cliente = c.id_cliente
WHERE YEAR(a.fecha_alquiler) = '2019'
ORDER BY p.total DESC
LIMIT 1;



-- CONSULTA 20
-- Lista los clientes que no han realizado ningún alquiler en el último año.

SELECT * FROM alquiler ORDER BY fecha_alquiler DESC LIMIT 1;
-- Esta consulta nos muestra que el ultimo año es 2019
-- Usaremos esto para la consulta principal

SELECT c.nombre, c.apellidos 
FROM cliente AS c
WHERE c.id_cliente NOT IN (
    SELECT id_cliente 
    FROM alquiler
    WHERE YEAR(fecha_alquiler) = '2019'
);