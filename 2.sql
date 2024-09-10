-- OPERACIONES CONDICIONALES

SELECT 
    nombre, 
    salario,
    CASE
        WHEN salario > 50000 THEN 'ALTA'
        WHEN salario BETWEEN 30000 AND 50000 THEN 'MEDIA'
    ELSE 
        'BAJA'
    END AS nivel_salario
FROM tb_empleados;

-- IF-THEN-ELSE

DO $$
BEGIN
    IF salario > 50000 THEN
        RAISE NOTICE 'Salario alto';
    ELSEIF salario > 30000 THEN
        RAISE NOTICE 'Salario medio';
    ELSE
        RAISE NOTICE 'Salario bajo';
    END IF;
END $$;


-- BUCLE LOOP

DO $$
DECLARE
    contador INTEGER := 1;
BEGIN 
    loop
      EXIT WHEN contador > 5;
      RAICE NOTICE 'Contador es %', contador;
      contador := contador + 1;
    end loop
END $$;


-- BUCLE WHILE

DO $$
DECLARE
    contador INTEGER := 1;
begin
    WHILE contador <= 5 LOOP
        RAICE NOTICE 'Contador es %', contador;
        contador := contador + 1;
    end LOOP;
end $$;


-- FUNCIONES

CREATE OR REPLACE FUNCTION nombre_funcion(parametro1 tipo1, parametro2 tipo2)
RETURNS tipo_de_retorno AS $$
BEGIN
    -- Lógica de la función
    RETURN valor;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION suma (a INTEGER, b INTEGER)
RETURNS INTEGER AS $$
begin
    RETURN A+B;
end;
$$ LANGUAGE plgsql;


-- LLAMADA A FUNCION

SELECT suma(5, 3);



-- FUNCION QUE DEVUELVE UNA TABLA:
CREATE OR REPLACE FUNCTION empleados_con_alto_salario(limite_sueldo NUMERIC)
RETURNS TABLE (id INTEGER, nombre VARCHAR, salario NUMERIC) as $$
BEGIN
    RETURN QUERY
    SELECT id, nombre, salario FROM tb_empleados WHERE salario > limite_sueldo;
END;
$$ LANGUAGE plgsql;


SELECT * FROM empleados_con_alto_salario(5000);




-- Funciones con RAISE NOTICE (para depuración)

CREATE OR REPLACE FUNCTION prueba_raise()
RETURNS VOID AS $$
BEGIN
    RAISE NOTICE 'Esta es una prueba de mensaje en PostgreSQL';
END;
$$ LANGUAGE plpgsql;

-- llamada

SELECT prueba_raise();