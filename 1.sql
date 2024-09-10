CREATE DATABASE db_testing;

/*

Tipos de datos numéricos:

INTEGER: Números enteros.
SERIAL: Enteros auto-incrementales (útil para llaves primarias).
BIGINT: Enteros grandes.
DECIMAL(precision, scale): Números decimales con precisión exacta.
NUMERIC: Similar a DECIMAL.
REAL: Números en coma flotante.

Tipos de datos de texto:

VARCHAR(n): Cadena de caracteres de longitud variable (máx. n).
TEXT: Texto de longitud ilimitada.
CHAR(n): Cadena de longitud fija.
Tipos de datos de fecha y hora:

DATE: Fecha (sin hora).
TIME: Hora (sin fecha).
TIMESTAMP: Fecha y hora.
INTERVAL: Periodos de tiempo (p.ej., INTERVAL '1 day').
Tipos de datos booleanos:

BOOLEAN: Verdadero o falso (TRUE, FALSE).
Otros tipos útiles:

JSON/JSONB: Para almacenar datos en formato JSON.
UUID: Identificadores únicos.
ARRAY: Arreglos de datos.

*/

-- CREACION DE TABLAS

CREATE TABLE nombre_tabla (
    columna1 tipo_dato [CONSTRAINTS],
    columna2 tipo_dato [CONSTRAINTS],
    ...
);


-- EJEMPLO

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INTEGER,
    salario DECIMAL(10, 2),
    fecha_ingreso DATE
);


-- 3. Consultas Básicas

SELECT columnas FROM nombre_tabla WHERE condicion;

-- EJEMPLO

select nombre from empleados where salario >= 3000;

-- Insercion

INSERT INTO empleados (nombre, edad, salario, fecha_ingreso) 
VALUES ('Juan', 22, 4500, '2024-09-09');

-- Modificar datos

UPDATE nombre_tabla SET columna1 = valor1 WHERE condición;


-- Ejemplo

UPDATE empleados SET salario = 3000 WHERE salario < 3000;
UPDATE empleados SET salario = 5000 WHERE id = 1;

-- ELIMINAR DATOS

DELETE FROM nombre_tabla WHERE condicion;

-- Ejemplo

DELETE FROM empleados WHERE salario <= 1500;



-- CONSULTAS MAS AVANZADAS

-- JOIN

SELECT columna1 FROM tabla1
JOIN tabla2 ON tabla1.columna_comun = tabla2.columna_comun;

-- EJEMPLO

SELECT empleado_nombre FROM tb_empleados
JOIN tb_departamento ON tb_empleados.departamento_id = tb_departamento.id;



-- AGRUPACION Y AGREGACION

SELECT columna, count(*), AVG(columna)
FROM nombre_tabla
GROUP BY columna;

-- EJEMPLO

SELECT departamento_id, AVG(salario)
FROM tb_empleados
GROUP BY departamento_id;


-- INDICE
CREATE INDEX nombre_indice ON nombre_tabla(columna);

-- EJEMPLO 
CREATE INDEX idx_nombre ON tb_empleados(nombre);



-- TRANSACCIONES 
BEGIN;
UPDATE tb_empleados SET salario = salario * 1.10 WHERE departamento_id = 3;
DELETE FROM empleados WHERE edad >= 65;
COMMIT;
-- o
ROLLBACK;