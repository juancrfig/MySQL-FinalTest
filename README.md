# Sistema de Alquiler de Películas - Examen de Base de Datos

## Descripción del Proyecto

Este repositorio contiene la solución al examen de base de datos "Sistema de Alquiler de Películas". La base de datos está diseñada para gestionar un sistema de alquiler de películas, incluyendo información sobre clientes, películas, alquileres, empleados, categorías e idiomas. El propósito del proyecto es demostrar el uso avanzado de SQL para resolver problemas prácticos mediante consultas, funciones, triggers y eventos.

El examen implementa:
- Consultas SQL para análisis de datos (e.g., clientes más activos, películas más alquiladas, ingresos por categoría).
- Funciones SQL para cálculos personalizados (e.g., ingresos por cliente, descuentos).
- Triggers para automatización y auditoría (e.g., actualización de totales, registro de cambios).
- Eventos programados para tareas recurrentes (e.g., informes mensuales, limpieza de auditorías).

## Requisitos del Sistema

Para ejecutar los scripts SQL de este proyecto, necesitas:
- **MySQL**: Versión 8.0 o superior.
- **Cliente MySQL**: MySQL Workbench (recomendado) o la línea de comandos de MySQL.

## Instalación y Configuración

Sigue estos pasos para configurar y ejecutar el proyecto:

1. **Crear la base de datos**:
   - Abre tu cliente MySQL.
   - Ejecuta:
     ```sql
     CREATE DATABASE movie_rental_system;
     USE movie_rental_system;
     ```

2. **Generar la estructura de la base de datos**:
   - Abre el archivo `ddl.sql` en el directorio raíz.
   - Ejecuta el script completo para crear las tablas y relaciones.

3. **Cargar los datos iniciales**:
   - Abre el archivo `dml.sql`.
   - Ejecuta el script para insertar los datos iniciales.

4. **Ejecutar consultas, funciones, triggers y eventos**:
   - **Consultas**: Abre `dql_select.sql` y ejecuta las consultas según necesites.
   - **Funciones**: Abre `dql_funciones.sql` y ejecuta el script para definir las funciones.
   - **Triggers**: Abre `dql_triggers.sql` y ejecuta el script para crear los triggers.
   - **Eventos**: Abre `dql_eventos.sql` y ejecuta el script para programar los eventos.

**Nota**: Los archivos SQL incluyen comentarios detallados que explican cada sección para facilitar su uso y comprensión.

## Archivos SQL

El repositorio está estructurado con los siguientes archivos:

- **`ddl.sql`**: Define la estructura de la base de datos (tablas y relaciones).
- **`dml.sql`**: Contiene las inserciones de datos iniciales.
- **`dql_select.sql`**: Incluye las 20 consultas SQL solicitadas para análisis de datos.
- **`dql_funciones.sql`**: Define 5 funciones SQL personalizadas.
- **`dql_triggers.sql`**: Implementa 5 triggers para automatización y auditoría.
- **`dql_eventos.sql`**: Programa 5 eventos para tareas periódicas.

Además:
- **`Diagrama.jpg`**: Diagrama del modelo de datos que muestra las relaciones entre las tablas.

## Notas Adicionales

- Ejecuta los scripts en el orden: `ddl.sql` → `dml.sql` → resto de archivos, para evitar errores de dependencias.
- Los scripts están optimizados para MySQL; ajustes podrían ser necesarios para otros sistemas.
- Revisa los comentarios en cada archivo para entender su propósito y funcionamiento.
