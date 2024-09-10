CREATE TABLE tb_empleados(
    id      SERIAL  PRIMARY KEY,
    nombre          VARCHAR(30),
    edad            INTEGER,
    salario         DECIMAL(10, 2),
    fecha_ingreso   DATE,
    departamento_id INTEGER
);

CREATE TABLE tb_departamentos(
    id    SERIAL    PRIMARY KEY,
    nombre          VARCHAR(30),
    localidad       VARCHAR(30),
    provincia       VARCHAR(30),
    codigo_postal   INTEGER
);


INSERT INTO tb_empleados (nombre, edad, salario, fecha_ingreso, departamento_id)
VALUES ('Juan Cruz Zerillo', 23, 45000, '2024-09-09', 1);

INSERT INTO tb_empleados (nombre, edad, salario, fecha_ingreso, departamento_id)
VALUES ('Tomas Hernandez', 20, 34000, '2024-06-04', 1);

SELECT * FROM tb_empleados WHERE departamento_id = 1;

UPDATE tb_empleados SET salario = salario * 1.50 WHERE departamento_id = 1;

SELECT * FROM tb_empleados
JOIN tb_departamento ON tb_empleados.departamento_id = tb_departamentos.id;

