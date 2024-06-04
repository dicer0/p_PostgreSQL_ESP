--CONSULTAS SQL:
/*1.	Realiza una consulta SQL que obtenga siempre el primer registro o fila de cualquier tabla, sin utilizar para ello su 
columna id. Para ello todos los siguientes códigos son equivalentes. Para la ejecución del código SQL en pgAdmin se debe 
seleccionar la opción de: Tools → Query Tool.*/
/*- FETCH: Este comando se puede usar de diversas maneras para controlar y limitar el número de filas devueltas por una 
consulta. Las variaciones de FETCH se centran principalmente en las palabras clave que lo acompañan, como FIRST, NEXT, 
ROWS, PERCENT y WITH TIES.
  - FETCH FIRST n ROWS ONLY: Recupera las primeras n filas.
  - FETCH NEXT  n ROWS ONLY: Recupera las siguientes n filas, aunque es equivalente a FETCH FIRST si no se usa en junto 
    al comando OFFSET.
      - OFFSET x ROWS FETCH NEXT n ROWS ONLY: Recupera n filas después de saltar x filas inicialmente.
  - FETCH FIRST numero_porcentaje PERCENT ROWS ONLY: Recupera el primer porcentaje especificado de filas de toda la tabla.
  - FETCH FIRST n ROWS WITH TIES: Recupera n filas de la tabla, pero si es que filas adicionales tienen su mismo valor, 
    también se incluyan de forma automática, no estando limtado entonces a traer n filas forzosamente.*/
SELECT 	*
FROM	  ejercicios.alumnos
FETCH FIRST 1 ROWS ONLY;
/*- LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
utilizar después del comando ORDER BY, se puede usar cuando sea.*/
SELECT 	*
FROM	  ejercicios.alumnos
LIMIT   1;
/*- ROW_NUMBER(): Comando que asigna un número único y secuencial a cada fila dentro de una consulta, comenzando desde 1 y 
siempre estando acompañado de la función OVER(). Esta función es llamada de tipo Window Function o Función de Ventana.
  - OVER(): Comando que define el conjunto de filas sobre las cuales opera el comando ROW_NUMBER(). Si la función no 
    recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar ni ordenar los datos.
  - WHERE: Comando para indicar exactamente a cuáles filas de la tabla nos estamos refiriendo, filtrando así la consulta a 
    través de cierta condición matemática (=, >, <, etc.), ya que la extracción se puede realizar de una o varias filas, para 
    ello se utiliza el comando WHERE acompañado del valor de algún atributo.*/
SELECT 	*
FROM	(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM	ejercicios.alumnos
) AS query_alumnos_anidado
WHERE row_id = 1;



/*2.	Realiza una consulta SQL que obtenga el registro o fila del atributo colegiatura perteneciente a la tabla alumnos que 
tenga el segundo valor más alto. Para ello todos los siguientes códigos son equivalentes. Para la ejecución del código SQL en 
pgAdmin se debe seleccionar la opción de: Tools → Query Tool.*/
