--CONSULTAS AVANZADAS SQL:
/*1.	Realiza una consulta SQL que obtenga siempre el primer registro o fila de cualquier tabla, sin utilizar para ello su 
columna id. Para ello todos los siguientes códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción de: 
Tools → Query Tool.*/
/*- FETCH: Este comando se puede usar de diversas maneras para controlar y limitar el número de filas devueltas por una 
    consulta. Las variaciones de FETCH se centran principalmente en las palabras clave que lo acompañan, como FIRST, NEXT, 
    PERCENT, ROWS ONLY y WITH TIES.
      - FETCH FIRST n ROWS ONLY: Recupera las primeras n filas.
      - FETCH NEXT  n ROWS ONLY: Recupera las siguientes n filas, aunque es equivalente a FETCH FIRST si no se usa junto 
        al comando OFFSET.
          - OFFSET x ROWS FETCH NEXT n ROWS ONLY: Recupera n filas después de saltar x registros inicialmente.
      - FETCH FIRST numero_porcentaje PERCENT ROWS ONLY: Recupera el primer porcentaje especificado de filas pertenecientes 
        a las totales de una tabla.
      - FETCH FIRST n ROWS WITH TIES: Recupera n filas de la tabla, pero si existen registros adicionales que tengan su mismo 
        valor, también se incluyen de forma automática, no estando limtado entonces a traer n filas forzosamente.*/
SELECT 	*
FROM	  ejercicios.alumnos
FETCH FIRST 1 ROWS ONLY;
/*- LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.*/
SELECT 	*
FROM	  ejercicios.alumnos
LIMIT   1;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar, si se quiere mostrar todas, se utiliza 
    un asterisco *.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT 	*
FROM	(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM	ejercicios.alumnos
) AS query_alumnos_anidado
WHERE row_id = 1;





/*2.	Realiza una consulta SQL que obtenga el registro o fila del atributo colegiatura perteneciente a la tabla alumnos que 
tenga el segundo valor más alto. Para ello todos los siguientes códigos son equivalentes. Para ello todos los siguientes 
códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
En esta ocasión, en la subconsulta tanto a1 como a2 representan las filas de la tabla ejercicios.alumnos, pero en el nested 
query, el método COUNT() se utiliza para contar cuántos valores de colegiatura en a2 son mayores o iguales al valor de 
colegiatura de la fila actual a1. Esto se hace para cada fila en a1, lo que nos permite realizar comparaciones entre cada 
fila de la tabla original y todas las demás filas, por lo que si 2 valores de a2 son mayores o iguales a a1, esto significa 
que esa es la 2da colegiatura mayor.*/
SELECT 	DISTINCT colegiatura
FROM 	  ejercicios.alumnos AS a1
WHERE (
	SELECT 	COUNT(DISTINCT colegiatura)
	FROM 	  ejercicios.alumnos AS a2
	WHERE 	a1.colegiatura <= a2.colegiatura
) = 2;
/*- ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.*/
SELECT 	DISTINCT colegiatura
FROM 	  ejercicios.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método INNER JOIN, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - ON: Este comando se utiliza en una instrucción JOIN para especificar la condición de unión entre las tablas que se están 
    combinando, describiendo así cómo las filas de una tabla se relacionan con las filas de otra tabla en función de los 
    valores de una o más columnas comunes.
En esta ocasión, en la subconsulta se ejecuta el mismo código pasado, donde se obtiene el segundo valor más alto de la 
colegiatura de la tabla alumnos, pero como se aplica al comando INNER JOIN, se utiliza ese valor para encontrar todos los 
datos de los alumnos que tengan esa colegiatura, obteniendo así más información en vez de obtener solamente el valor de la 
segunda colegiatura más alta.*/
SELECT 	*
FROM	  ejercicios.alumnos AS datos_alumnos
INNER JOIN (
	SELECT 	DISTINCT colegiatura
	FROM		ejercicios.alumnos
	ORDER BY	colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
En esta ocasión, en la subconsulta se obtiene el valor de la segunda colegiatura más grande de la tabla alumnos, pero como 
esta se aplica al comando WHERE, después se analiza el valor de la columna colegiatura perteneciente a cada fila y si este es 
igual al valor obtenido por el query anidado, se filtra de esa manera, obteniendo así más información en vez de obtener 
solamente el valor de la segunda colegiatura más alta.*/
SELECT 	*
FROM	  ejercicios.alumnos AS datos_alumnos
WHERE   colegiatura = (
	SELECT 	DISTINCT colegiatura
	FROM		  ejercicios.alumnos
	ORDER BY	colegiatura DESC
	LIMIT 1 OFFSET 1
);





/*3.	Realiza una consulta SQL que retorne solo la última mitad de las filas pertenecientes a la tabla alumnos. Para ello en 
pgAdmin se selecciona la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método OFFSET, se ejecutará 1 vez e indicará cuántas filas se debe saltar la consulta para 
obtener solo la segunda mitad de las filas pertenecientes a la tabla alumnos.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  -	OFFSET: Este comando se suele utilizar en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que 
    saltar o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM    ejercicios.alumnos
OFFSET (
  SELECT  COUNT(*)/2
  FROM    ejercicios.alumnos
);





/*4.	Realiza una consulta SQL que filtre las filas de información de la tabla alumnos obtenidas a través de varios valores 
estáticos incluidos en un array. Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
      - IN: Si se quiere agregar un filtro en forma de Array estático, se utiliza la instrucción IN seguida de sus valores 
        entre paréntesis (valorArray_1, …, valorArray_n) y con eso se podrán indicar varios valores de filtro específicos.
        Si se quiere obtener sus valores opuestos, se usa la instrucción NOT IN.
          WHERE	Nombre_Atributo_o_Columna IN (arrayValor_1, ..., arrayValor_n)
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT  *
FROM (
  SELECT  ROW_NUMBER() OVER() AS row_id, *
  FROM    ejercicios.alumnos
) AS query_anidado_alumnos
WHERE row_id IN (1, 5, 10, 12, 15);
/*De igual forma, los valores del Array se pueden obtener a través de una subconsulta, realizando la misma operación:*/
SELECT  *
FROM    ejercicios.alumnos
WHERE   id IN (
  SELECT  id, tutor_id
  FROM    ejercicios.alumnos
  WHERE   tutor_id = 30
);





/*5.	Realiza una consulta SQL que utilice los comandos EXTRACT y DATE_PART() para extraer partes de una columna perteneciente 
a la tabla alumnos que contenga datos tipo fecha (date), hora (timestamp) o intervalo (interval). Para ello en pgAdmin se 
selecciona la opción de: Tools → Query Tool.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - EXTRACT: Este comando se utiliza para extraer ciertas partes de una columna tipo fecha, hora (timestamp) o intervalo; como 
    su año, mes, día, hora, minuto, segundo, etc. a través de la siguiente sintaxis, donde: 
      - field: Es el componente específico que se quiere extraer, que puede adoptar los valores: YEAR, MONTH, DAY, HOUR, 
        MINUTE, SECOND, QUARTER, DOW (Day Of Week o día de la semana), DOY (Day Of Year o día del año), etc.
      - source: Indica la columna de tipo date, timestamp o interval del que se quiere extraer un componente.
          EXTRACT(field     FROM    source)
  - DATE_PART(): Este comando se utiliza para extraer ciertas partes de una columna tipo fecha, hora (timestamp) o intervalo; 
    como su año, mes, día, hora, minuto, segundo, etc. a través de la siguiente sintaxis que es muy parecida a la de EXTRACT: 
      - field: Es un string que especifica el componente de la fecha u hora que se desea extraer, el cual puede adoptar los 
        valores de: year, month, day, hour, minute, second, quarter, dow (día de la semana), doy (día del año), etc.
      - source: Indica la columna de tipo date, timestamp o interval del que se quiere extraer un componente.
          DATE_PART(field,          source)
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
Se pueden extraer varios componentes de las columnas con datos tipo fecha (date), hora (timestamp) o intervalo (interval) si 
se utilizan varias veces los comandos EXTRACT y DATE_PART() y se separan por comas.*/
--Obtención de componentes de fecha u hora con el comando EXTRACT(field     FROM    source):
SELECT  EXTRACT (YEAR FROM fecha_incorporacion) AS anio_incorporacion,
		    EXTRACT (HOUR FROM fecha_incorporacion) AS hora_incorporacion,
		    EXTRACT (MINUTE FROM fecha_incorporacion) AS minuto_incorporacion
FROM	  ejercicios.alumnos;
--Obtención de componentes de fecha u hora con el comando DATE_PART(field,  source):
SELECT  DATE_PART ('year', fecha_incorporacion) AS anio_incorporacion,
		    DATE_PART ('month', fecha_incorporacion) AS mes_incorporacion,
		    DATE_PART ('day', fecha_incorporacion) AS dia_incorporacion
FROM	  ejercicios.alumnos;
/*Filtrado de filas por medio de una subconsulta que utiliza los comandos EXTRACT o DATE_PART():
Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.*/
--Filtrado de filas a través de componentes de fecha u hora con el comando EXTRACT(field     FROM    source):
SELECT  *
FROM	  ejercicios.alumnos
WHERE   (
  EXTRACT (YEAR FROM fecha_incorporacion)
) = 2019;
--Filtrado doble de filas a través de componentes de fecha u hora con el comando DATE_PART(field,  source):
SELECT  *
FROM	  ejercicios.alumnos
WHERE (
  DATE_PART ('year', fecha_incorporacion)
) = 2019
AND (
	DATE_PART ('month', fecha_incorporacion)
) = 05;
--Filtrado de filas a través de componentes de fecha u hora subconsultas:
SELECT  *
FROM (
  SELECT  *, 
          DATE_PART ('year', fecha_incorporacion) AS anio_incorporacion,
          DATE_PART ('month', fecha_incorporacion) AS mes_incorporacion
  FROM	  ejercicios.alumnos
) AS  query_alumnos_conAnio_anidado
WHERE anio_incorporacion = 2019;





/*6.	Realiza una consulta SQL que encuentre las filas duplicadas (que se repitan) en la tabla alumnos que tenga el segundo 
valor más alto. Para ello primero tendremos que insertar un nuevo dato para forzar que exista un registro duplicado. Los 
siguientes códigos son equivalentes y luego en pgAdmin se ejecutará la consulta del ejercicio al seleccionar la opción de: 
Tools → Query Tool.*/
INSERT INTO ejercicios.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
VALUES (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);
/*Cast: Se refiere a la transformación de un tipo de dato en otro distinto.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - Cast(::): Un Cast se refiere a la transformación de un tipo de dato en otro distinto y su sintaxis es alguna de las 
    siguientes: 
        tabla.columna::nuevo_tipo_de_dato
        (tabla.columna_1,…, tabla.columna_n)::nuevo_tipo_de_dato
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - GROUP BY: Esta sentencia agrupa las filas resultantes de una consulta según uno o más atributos especificados. Se utiliza 
    junto los métodos COUNT(), SUM(), AVG(), MIN(), MAX(), etc. para calcular ciertos valores numéricos asociados a cada 
    agrupación, mostrando así en la tabla del resultado, mínimo dos columnas, en la primera se indica el valor de la columna o 
    columnas indicadas en el comando GROUP BY y en la segunda se coloca el resultado del cálculo realizado para cada valor de 
    la primera columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
      - HAVING: Cuando se utilice el comando GROUP BY, no se podrá usar la instrucción WHERE, se tendrá que reemplazar por el 
        comando HAVING, que realiza la misma acción con la misma sintaxis.
Si se quiere encontrar duplicados en las filas de una tabla, se debe evitar incluir en los campos de análisis la columna id, 
ya que esta siempre será diferente, por lo que conviene transformar a través de un Cast todos los valores de las columnas en 
un string para poderlo comparar, para ello se deben añadir las columnas una por una al comando SELECT, sin incluir el atributo 
id.*/
--Encontrar duplicados con Cast:
SELECT (ejercicios.alumnos.nombre,
        ejercicios.alumnos.apellido,
        ejercicios.alumnos.email,
        ejercicios.alumnos.colegiatura,
        ejercicios.alumnos.fecha_incorporacion,
        ejercicios.alumnos.carrera_id,
        ejercicios.alumnos.tutor_id)::text, COUNT(*) AS num_filas
FROM	  ejercicios.alumnos
GROUP BY  (ejercicios.alumnos.nombre,
           ejercicios.alumnos.apellido,
           ejercicios.alumnos.email,
           ejercicios.alumnos.colegiatura,
           ejercicios.alumnos.fecha_incorporacion,
           ejercicios.alumnos.carrera_id,
           ejercicios.alumnos.tutor_id)
HAVING num_filas > 1;
--Encontrar duplicados con subconsultas y Window Functions:
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado, 
que a su vez particione los datos para excluir la columna id y así poder encontrar los duplicados.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar, si se quiere mostrar todas, se utiliza 
    un asterisco *.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada partición de filas dentro de 
    una consulta, comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
          - PARTITION BY: Comando para agrupar las filas resultantes de una consulta según uno o más atributos especificados 
            de forma muy similar a como funciona el comando GROUP BY. Las particiones se usan para calcular ciertos valores 
            numéricos asociados a cada agrupación como ROW_NUMBER(), RANK(), SUM(), AVG(), mostrando así en la tabla del 
            resultado, mínimo dos columnas, en la primera se indica el valor de la columna o columnas indicadas, osea las 
            particiones y en la segunda se coloca el resultado del cálculo realizado para cada valor de la primera columna.
          - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
            resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia 
            abajo en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de 
            forma descendente (de más a menos) se añade la sentencia DESC.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT  *
FROM (
  SELECT ROW_NUMBER() OVER(
    PARTITION BY  nombre,
                  apellido,
                  email,
                  colegiatura,
                  fecha_incorporacion,
                  carrera_id,
                  tutor_id
    ORDER BY id ASC
  ) AS filas_duplicadas, *
  --Todo este comando es equivalente a este otro pero con particiones: SELECT ROW_NUMBER() OVER() AS row_id, *
  FROM	  ejercicios.alumnos
) AS query_anidado_duplicados
WHERE query_anidado_duplicados.filas_duplicadas > 1;
/*Encontrar y borrar filas duplicadas con subconsultas, Window Functions y Where Arrays:
  - DELETE: Comando para borrar el valor de una columna en específico perteneciente a una tabla, para ello se utiliza la 
    siguiente sintaxis:
        DELETE	FROM	“Nombre_Entidad_o_Tabla”
        WHERE	“Nombre_Atributo_o_Columna” = "Valor_Fila_o_Identificador”;
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
      condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
        - IN: Si se quiere agregar un filtro en forma de Array estático, se utiliza la instrucción IN seguida de sus valores 
          entre paréntesis (valorArray_1, …, valorArray_n) y con eso se podrán indicar varios valores de filtro específicos.
          Si se quiere obtener sus valores opuestos, se usa la instrucción NOT IN.
            WHERE	Nombre_Atributo_o_Columna IN (arrayValor_1, ..., arrayValor_n)*/
DELETE FROM ejercicios.alumnos
WHERE id IN (
  SELECT  id
  FROM (
    SELECT ROW_NUMBER() OVER(
      PARTITION BY  nombre,
                    apellido,
                    email,
                    colegiatura,
                    fecha_incorporacion,
                    carrera_id,
                    tutor_id
      ORDER BY id ASC
    ) AS filas_duplicadas, *
    --Todo este comando es equivalente a este otro pero con particiones: SELECT ROW_NUMBER() OVER() AS row_id, *
    FROM	  ejercicios.alumnos
  ) AS query_anidado_duplicados
  WHERE query_anidado_duplicados.filas_duplicadas > 1
);





/*7.	Realiza una consulta SQL que filtre las filas de información de la tabla alumnos obtenidas a través de varios valores 
estáticos, pero estos no deben estar incluidos en un array, sino en un valor de tipo range. Para ello en pgAdmin se selecciona 
la opción de: Tools → Query Tool.
  - Recordemos que las consultas que obtienen filas de información de una tabla a través de varios valores estáticos incluidos 
    en un array se ejecutan a través de los comandos WHERE e IN, pero esto se puede manejar también con tipos de dato Range, 
    los cuales representan los siguientes intervalos de valores continuos:
      - int4range: Representa un rango de enteros de 4 bytes (de 0 a 65,000).
      - int8range: Representa un rango de enteros de 8 bytes (de 0 a 4 millones).
      - numrange: Representa un rango de números enteros o decimales (de 1.5 a 10.5).
      - tsrange: Representa un rango de fecha/hora sin zona horaria (timestamp).
      - tstzrange: Rango de fecha/hora con zona horaria (timestamp with time zone).
      - daterange: Representa un rango de fechas (date).
Primero se obtendrán los rangos utilizando el comando WHERE/IN (Arrays), el comando AND y el comando BETWEEN/AND y luego se 
analizará la alternativa de realizar la misma operación con tipos de dato Range.*/
--Consulta con obtención de Intervalos por medio del comando WHERE/IN (Arrays):
SELECT  *
FROM    ejercicios.alumnos
WHERE   tutor_id IN (1,2,3,4,5,6,7,8,9,10);
--Consulta con obtención de Intervalos por medio del comando AND:
SELECT  *
FROM    ejercicios.alumnos
WHERE   tutor_id >= 1
        AND tutor_id <= 10;
--Consulta con obtención de Intervalos por medio del comando BETWEEN/AND:
SELECT  *
FROM    ejercicios.alumnos
WHERE   tutor_id BETWEEN 1 AND 10;
/*OBTENCIÓN DE INTERVALOS CON TIPOS DE DATO RANGE:
Cuando se utilicen tipos de dato range en consultas SQL, usualmente se acompañan de los siguientes operadores para realizar 
acciones con ellos:
  - @> (Contiene): Operación que verifica si un rango contiene otro conjunto de valores estáticos o un valor singular en 
    específico, devolviendo un booleano True si existe el valor o False si no existe.
  - * (Intersección): Usualmente este operador multiplica dos valores numéricos, pero cuando se aplica a tipos de dato range, 
    obtiene su intersección y devuelve el rango de donde esto ocurre.
  - && (Intersección): Verifica si dos rangos, arrays, o conjuntos se superponen o interseccionan, devolviendo un booleano True 
    si existe superposición o False si no existe.
  - UPPER(): Convierte una cadena de texto a mayúsculas o devuelve el valor máximo de un tipo de dato range.
  - LOWER(): Convierte una cadena de texto a minúsculas o devuelve el valor mínimo de un tipo de dato range.
  - ISEMPTY(): Verifica si un tipo de dato range está vacío, devolviendo un booleano True si no existe ningún valor o False si 
    existe alguno.
Primero se realizarán ejemplos sencillos del uso de los tipos de datos range y luego se aplicarán a consultas.*/
--Ejemplo de operación simple del operador @> (Contiene) con tipos de dato range:
SELECT  int4range(10,20) @> 3;
--Ejemplo de operación simple del operador * (Intersección) con tipos de dato range:
SELECT  int8range(10,20) * int8range(15,22);
--Ejemplo de operación simple del operador && (Intersección) con tipos de dato range:
SELECT  numrange(11.1,22.2) && numrange(20.0,30.0);
--Ejemplo de operación simple del operador UPPER() con tipos de dato range:
SELECT  UPPER(numrange(12.8,30.5));
--Ejemplo de operación simple del operador ISEMPTY() con tipos de dato range:
SELECT  ISEMPTY(numrange(12.8,30.5));
--Consulta con obtención de Intervalos por medio de tipos de dato range:
SELECT  *
FROM    ejercicios.alumnos
WHERE   int4range(0,10) @> tutor_id;





/*8.	Realiza una consulta SQL que encuentre el rango numérico de filas donde se intersectan las columnas tutor_id y carrera_id 
pertenecientes a la tabla alumnos, obtenidas a través de valores tipo range. Para ello en pgAdmin se selecciona la opción de: 
Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica a un tipo de dato range, solo se ejecutará una vez y sirve para indicar el límite mínimo y máximo 
de un rango numérico.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - numrange: Representa un rango de números enteros o decimales (de 1.5 a 10.5).
  - MIN(): Devuelve el valor mínimo de la columna que reciba como parámetro.
  - MAX(): Devuelve el valor máximo de la columna que reciba como parámetro.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
Cuando se utilicen tipos de dato range en consultas SQL, usualmente se acompañan de algún operador para realizar acciones con 
ellos, en este caso solo se explicará el de intersección porque es el que sirve para la resolver el problema:
  - * (Intersección): Usualmente este operador multiplica dos valores numéricos, pero cuando se aplica a tipos de dato range, 
    obtiene su intersección y devuelve el rango de datos donde esto ocurre.
  - Ejemplo de operación simple del operador * (Intersección) con tipos de dato range:
      SELECT  int8range(10,20) * int8range(15,22); = [15,20)*/
SELECT  numrange(
	(SELECT MIN(tutor_id) FROM ejercicios.alumnos),
	(SELECT MAX(tutor_id) FROM ejercicios.alumnos)
) * numrange(
	(SELECT MIN(carrera_id) FROM ejercicios.alumnos),
	(SELECT MAX(carrera_id) FROM ejercicios.alumnos)
);





/*9.	Realiza una consulta SQL que obtenga y acomode sus filas a través de los valores máximos de 2 columnas con valores de 
tipos diferentes carrera_id (tipo de dato numérico) y fecha_incorporacion (tipo de dato date) pertenecientes a la tabla 
alumnos. Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.
  - Para acomodar los resultados de una consulta en función de los valores mínimos o máximos de alguna de sus columnas, 
    usualmente se utilizan los comandos GROUP BY y ORDER BY. Pero cuando no solamente se quiere agrupar sus resultados a 
    través de los valores mínimos o máximos de una sola una columna, sino de varias, se debe además hacer uso de los comandos 
    MAX() y MIN() donde se esté declarando el comando SELECT en el código SQL.
Si no se utilizan los comandos MAX() o MIN() en conjunto con las funciones GROUP BY y ORDER BY, se obtendrá solamente el 
máximo de toda la tabla y esto se asignará a cada fila de agrupaciones, pero no se obtendrá el máximo de cada agrupación.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - MIN(): Devuelve el valor mínimo de la columna que reciba como parámetro.
  - MAX(): Devuelve el valor máximo de la columna que reciba como parámetro.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - GROUP BY: Esta sentencia agrupa las filas resultantes de una consulta según uno o más atributos especificados. Se utiliza 
    junto los métodos COUNT(), SUM(), AVG(), MIN(), MAX(), etc. para calcular ciertos valores numéricos asociados a cada 
    agrupación, mostrando así en la tabla del resultado, mínimo dos columnas, en la primera se indica el valor de la columna o 
    columnas indicadas en el comando GROUP BY y en la segunda se coloca el resultado del cálculo realizado para cada valor de 
    la primera columna.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.*/
--No se puede hacer esto: Porque se obtendrá el máximo de toda la tabla y se asignará a cada columna.
SELECT carrera_id, fecha_incorporacion
FROM ejercicios.alumnos
GROUP BY carrera_id, fecha_incorporacion
ORDER BY carrera_id DESC;
--Se debe hacer esto: Para que se obtenga el máximo de cada agrupación (cada fila).
SELECT carrera_id, MAX(fecha_incorporacion)
FROM ejercicios.alumnos
GROUP BY carrera_id
ORDER BY carrera_id DESC;
/*10.	Realiza una consulta SQL que acomode sus filas en orden alfabético y numéricamente a través de las 2 columnas con valores 
de tipos diferentes tutor_id (tipo de dato numérico) y nombre (tipo de dato string) pertenecientes a la tabla alumnos. Para 
ello en pgAdmin se selecciona la opción de: Tools → Query Tool.*/
--No se puede hacer esto: Porque se obtendrá el máximo de toda la tabla y se asignará a cada columna.
SELECT tutor_id, nombre
FROM ejercicios.alumnos
GROUP BY tutor_id, nombre
ORDER BY tutor_id DESC;
--Se debe hacer esto: Para que se obtenga el máximo de cada agrupación (cada fila).
SELECT tutor_id, MIN(nombre)
FROM ejercicios.alumnos
GROUP BY tutor_id
ORDER BY tutor_id DESC;





/*11.	Realiza una consulta SQL que analice el caso donde un alumno se encuentre dando tutorías a otros alumnos dentro de una 
misma clase, obteniendo así el nombre y apellido del alumno que tome cada tutoría y el nombre y apellido de su alumno tutor. 
Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - CONCAT(): Comando opcional que se utiliza para concatenar o unir valores variables extraídos de las columnas de una tabla 
    con strings específicos para mostrar la información con cierto formato.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - JOIN: A través de la sentencia FROM se indica de qué tabla se extraerán los datos, de una consulta, pero este comando solo 
    sirve cuando esto se realiza para una sola entidad, por lo que cuando se quiera extraer filas de datos de dos o más tablas 
    distintas, se añade la instrucción JOIN. Es muy importante mencionar que esto solo se podrá realizar en aquellas entidades 
    que se encuentren enlazadas a través de una relación, osea cuando una contenga una PRIMARY KEY y la otra posea una FOREIGN 
    KEY (o las dos posean FOREIGN KEYS si tienen cardinalidad N:N).
    - Los self JOINs se utilizan para poder realizar operaciones JOIN a través de diferentes instancias o copias de una misma 
      tabla, en vez de hacerlo con más de una entidad, logrando así obtener la intersección, unión, etc. de sus columnas. Para 
      ello se debe asignar un alias a cada instancia con el comando AS y a través de dichos alias se realizan las operaciones 
      lógicas de los Diagramas de Venn, según el resultado que se quiera obtener con el comando ON y las columnas que se busque 
      relacionar entre las copias de la tabla.
  - ON: Este comando se utiliza en una instrucción JOIN para especificar la condición de unión entre las tablas que se están 
    combinando, describiendo así cómo las filas de una tabla se relacionan con las filas de otra tabla en función de los 
    valores de una o más columnas comunes.
Los Self JOINs son utilizados cuando existan casos donde los datos de una tabla se reutilicen, como en este caso donde una 
instancia de la clase alumno, puede tener asignado un id_tutor y a su vez la otra instancia está relacionada con esa primera.*/
--Consulta self JOIN sin concatenación de los valores de sus columnas:
SELECT 	alumno.nombre,
		    alumno.apellido,
        tutor.nombre,
        tutor.apellido
FROM 	  ejercicios.alumnos AS alumno
	INNER JOIN	ejercicios.alumnos AS tutor ON alumno.tutor_id = tutor.id;
--Consulta self JOIN con concatenación de los valores de sus columnas:
SELECT 	CONCAT(alumno.nombre, ' ', alumno.apellido) AS nombre_alumno,
        CONCAT(tutor.nombre, ' ', tutor.apellido) AS nombre_tutor
FROM 	  ejercicios.alumnos AS alumno
	INNER JOIN	ejercicios.alumnos AS tutor ON alumno.tutor_id = tutor.id;
/*12.	Realiza una consulta SQL que analice el caso donde un alumno se encuentre dando tutorías a otros alumnos dentro de una 
misma clase, obteniendo primero el nombre y apellido del alumno tutor y luego el número de alumnos a los que enseña, ordenando 
su resultado de mayor a menor y mostrando el top 10 de alumnos tutores. Para ello en pgAdmin se selecciona la opción de: 
Tools → Query Tool.
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
  - GROUP BY: Esta sentencia agrupa las filas resultantes de una consulta según uno o más atributos especificados. Se utiliza 
    junto los métodos COUNT(), SUM(), AVG(), MIN(), MAX(), etc. para calcular ciertos valores numéricos asociados a cada 
    agrupación, mostrando así en la tabla del resultado, mínimo dos columnas, en la primera se indica el valor de la columna o 
    columnas indicadas en el comando GROUP BY y en la segunda se coloca el resultado del cálculo realizado para cada valor de 
    la primera columna.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.*/
--Consulta self JOIN con concatenación de los valores de sus columnas, ordenamiento de mayor a menor y mostrando solo 10 datos:
SELECT 	  CONCAT(tutor.nombre, ' ', tutor.apellido) AS nombre_tutor,
          COUNT(*) AS alumnos_por_tutor
FROM 	    ejercicios.alumnos AS alumno
	INNER JOIN	ejercicios.alumnos AS tutor ON alumno.tutor_id = tutor.id
GROUP BY  nombre_tutor
ORDER BY  alumnos_por_tutor DESC
LIMIT     10;
/*13.	Realiza una consulta SQL que analice el caso donde un alumno se encuentre dando tutorías a otros alumnos dentro de una 
misma clase, obteniendo el promedio de alumnos que tienen todas las filas de alumnos tutores. Para ello en pgAdmin se 
selecciona la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado, 
que a su vez particione los datos para excluir la columna id y así poder encontrar los duplicados.
  - AVG(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el valor promedio de todas sus filas de datos.
  - GROUP BY: Esta sentencia agrupa las filas resultantes de una consulta según uno o más atributos especificados. Se utiliza 
    junto los métodos COUNT(), SUM(), AVG(), MIN(), MAX(), etc. para calcular ciertos valores numéricos asociados a cada 
    agrupación, mostrando así en la tabla del resultado, mínimo dos columnas, en la primera se indica el valor de la columna o 
    columnas indicadas en el comando GROUP BY y en la segunda se coloca el resultado del cálculo realizado para cada valor de 
    la primera columna.*/
--Consulta self JOIN, agrupamiento de datos por medio del nombre del alumno tutor, mostrando el promedio de alumnos:
SELECT  AVG(alumnos_por_tutor) AS promedio_alumnos_por_tutor
FROM    (
  SELECT 	  tutor.nombre AS nombre_tutor,
            COUNT(*) AS alumnos_por_tutor
  FROM 	    ejercicios.alumnos AS alumno
    INNER JOIN	ejercicios.alumnos AS tutor ON alumno.tutor_id = tutor.id
  GROUP BY  nombre_tutor
) AS alumnos_tutor;





/*14.	Realiza una consulta SQL donde, después de haber eliminado ciertas profesiones en una escuela, averigüemos cuáles alumnos 
se han quedado sin ninguna carrera asignada. Para ello se analiza el caso donde se tengan dos tablas distintas, una de alumnos 
y otra de carreras, estas no se encuentran previamente unidas, pero se pueden relacionar a través de la columna carrera_id de 
la entidad alumnos y el atributo id de la entidad carreras. Para resolver el ejercicio se debe realizar una operación JOIN 
entre ellas. Por lo cual, en pgAdmin se debe seleccionar la opción de: Tools → Query Tool.
  a.	Para resolver el ejercicio primero debemos saber en la tabla alumnos cuáles son las carrera_id que existen y cuántos 
      alumnos le corresponden a cada uno.
  b.	Luego debemos saber cuál es la carrera_id que posee el mayor número de alumnos y cuál es la menor.
  c.	Después debemos asegurarnos de que en la tabla carreras no existan los id de carrera del 30 al 40.
  d.	Finalmente, debemos realizar una operación de Diferencia izquierda: A – B, donde A = alumnos y B = carreras, para saber 
      así los alumnos que no tienen asignada ninguna carrera.
Esto se puede resolver con una operación JOIN de diferencia, para la cual ya existe una forma estandarizada de aplicación:
  -	LEFT JOIN: Diferencia izquierda: A – B.
    SELECT	Nombre_Atributo		FROM		Nombre_Tabla_Izq
    LEFT JOIN  Nombre_Tabla_Der ON Tabla_Izq.PRIMARY_KEY = Tabla_Der.FOREIGN_KEY
    WHERE		Tabla_Der.FOREIGN_KEY IS NULL;*/
--Conteo de alumnos por carrera, agrupando las filas que pertenecen a cada id y ordenandolas por # de carrera de mayor a menor.
SELECT 		carrera_id, COUNT(*) AS alumnos_por_carrera
FROM		  ejercicios.alumnos
GROUP BY	carrera_id
ORDER BY	carrera_id DESC;
--Conteo de alumnos por carrera, agrupando las filas que pertenecen a cada id y ordenandolas por # de alumnos de mayor a menor.
SELECT 		carrera_id, COUNT(*) AS alumnos_por_carrera
FROM		  ejercicios.alumnos
GROUP BY	carrera_id
ORDER BY	alumnos_por_carrera DESC;
--Eliminación de las carreras con id de 30 a 40 de la tabla carreras, para posteriormente poder hacer una diferencia A-B.
DELETE 	FROM ejercicios.carreras
WHERE 	id BETWEEN 30 AND 40;
--Diagrama de Venn de Diferencia A-B = alumnos-carreras
SELECT 	  CONCAT(A.nombre, ' ', A.apellido),
          A.carrera_id,
          B.id,
          B.carrera
FROM	    ejercicios.alumnos AS A
	LEFT JOIN ejercicios.carreras AS B
	ON      A.carrera_id = B.id
WHERE 		B.id IS NULL
ORDER BY	A.carrera_id;
/*15.	En el ejercicio anterior se realizó la operación de Diferencia izquierda: A – B, con una variante del comando JOIN, donde 
A = alumnos y B = carreras, ahora realiza las operaciones faltantes de Intersección: A ∩ B, Unión: A U B, Diferencia e 
intersección izquierda: A – B + (A∩B), Diferencia e intersección derecha: B – A + (A∩B), Diferencia derecha: B – A y Diferencia 
simétrica: AUB-(A∩B). Para ello todos los siguientes códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción 
de: Tools → Query Tool.*/
--Diagrama de Venn de Diferencia izquierda A-B = alumnos-carreras
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	LEFT JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
WHERE 		  B.id IS NULL
ORDER BY	  A.carrera_id DESC;
--Diagrama de Venn de Diferencia e intersección izquierda: A – B + (A∩B)
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	LEFT JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
ORDER BY	  A.carrera_id DESC;
--Diagrama de Venn de Unión AUB = alumnos U carreras
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	FULL OUTER JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
ORDER BY	  A.carrera_id DESC;
--Diagrama de Venn de Diferencia derecha B-A = carreras-alumnos
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	RIGHT JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
WHERE 		  A.carrera_id IS NULL
ORDER BY	  B.id DESC;
--Diagrama de Venn de Diferencia e intersección derecha: B – A + (A∩B)
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	RIGHT JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
ORDER BY	  A.carrera_id DESC;
--Diagrama de Venn de Intersección: A∩B
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	INNER JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
ORDER BY	  A.carrera_id DESC;
--Diagrama de Venn de Diferencia simétrica: AUB-(A∩B)
SELECT 	  	CONCAT(A.nombre, ' ', A.apellido),
          	A.carrera_id,
          	B.id,
          	B.carrera
FROM	      ejercicios.alumnos AS A
	FULL OUTER JOIN ejercicios.carreras AS B
	ON        A.carrera_id = B.id
WHERE 		  A.carrera_id IS NULL
		OR 	    B.id IS NULL
ORDER BY	  B.id DESC;





/*16.	Realiza una consulta SQL que genere triángulos a través de varios métodos recursivo (que se ejecuten varias veces). Para 
ello en pgAdmin se selecciona la opción de: Tools → Query Tool.
  - lpad('string_base', numLetras, 'caracteres_de_relleno'): Método que siempre se coloca a la izquierda de la función SELECT, 
    la cual sirve para declarar un string de cierto número de letras estático, para ello recibe los siguientes parámetros:
      - 'string_base': Indica el string base que se colocará hasta la derecha del string total.
      - numLetras: Es un número entero que indica el número de letras totales del string.
          - Dentro de este parámetro se puede colocar el nombre de alguna columna numérica de la tabla utilizada en el Query y 
            esto logrará que se muestre el número de letras correspondiente a cada fila de dicha columna de forma cíclica, 
            logrando crear así triángulos.
          - WHERE: Si el método lpad() se utiliza junto al comando WHERE, la columna indicada en este parámetro se tomará como 
            una variable numérica y con este comando se limitará el número ejecuciones del método lpad() a través de cierta 
            condición matemática (=, >, <, etc.).
      - 'caracteres_de_relleno': Parámetro que indica el caracter que se colocará en los espacios vacíos que deban rellenarse 
        en la parte izquierda del string.
  - rpad('string_base', numLetras, 'caracteres_de_relleno'): Método que realiza la misma función del método lpad, pero en vez 
    de colocar su string base hasta la izquierda, lo coloca hasta la derecha.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - CAST(variable   AS  tipo_de_dato): Comando que transforma el tipo de dato de una variable a otro, el cual está indicado
    después del comando AS.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.*/
--Método lpad() estático:
SELECT 	lpad('di_cer0', 20, 'x');
--Método lpad() recursivo con columna numérica y limitado por el comando WHERE:
SELECT 	lpad('di_cer0', id, '/')
FROM	  ejercicios.alumnos
WHERE 	id <= 12;
--Método lpad() recursivo con columna numérica generada por una subconsulta y reformateada con el comando CAST():
SELECT 	lpad('*', CAST(num_subconsulta AS int), '*')
FROM (
	SELECT 	ROW_NUMBER() OVER() AS num_subconsulta, *
	FROM 	ejercicios.alumnos
) AS    columna_numerica_subquery
WHERE 	id <= 7;





/*17.	Realiza una consulta SQL que genere una serie de números consecutivos (un rango) a través del método generate_series(). 
Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.
  - generate_series(numInicio, numFinal, paso): Método para generar una serie de números consecutivos (un rango), que recibe 
    los siguientes parámetros:
      - numInicio: Indica el número inicial del rango.
      - numFinal: Indica el número final del rango.
      - paso: Es el número con el cuál aumenta o decrece el valor de los números consecutivos dentro del rango. 
          - Si no se indica ningún paso, este por default será de 1.
          - Se puede crear un rango decreciente solamente cuando se indique explícitamente en el tercer parámetro un paso 
            negativo, sino no se nos permitirá crear dicho rango.
          - WITH ordinality: Esta instrucción opcional agrega un índice que cuenta desde 1 todas las filas de la tabla creada
            por el rango creado.
  - current_date: Método para obtener la fecha actual del sistema en el formato YYYY-MM-DD.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - Cast(::): Un Cast se refiere a la transformación de un tipo de dato en otro distinto y su sintaxis es alguna de las 
    siguientes: 
        tabla.columna::nuevo_tipo_de_dato
        (tabla.columna_1,…, tabla.columna_n)::nuevo_tipo_de_dato
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - lpad('string_base', numLetras, 'caracteres_de_relleno'): Método que siempre se coloca a la izquierda de la función SELECT, 
    la cual sirve para declarar un string de cierto número de letras estático, para ello recibe los siguientes parámetros:
      - 'string_base': Indica el string base que se colocará hasta la derecha del string total.
      - numLetras: Es un número entero que indica el número de letras totales del string.
          - Dentro de este parámetro se puede colocar el nombre de alguna columna numérica de la tabla utilizada en el Query y 
            esto logrará que se muestre el número de letras correspondiente a cada fila de dicha columna de forma cíclica, 
            logrando crear así triángulos.
          - WHERE: Si el método lpad() se utiliza junto al comando WHERE, la columna indicada en este parámetro se tomará como 
            una variable numérica y con este comando se limitará el número ejecuciones del método lpad() a través de cierta 
            condición matemática (=, >, <, etc.).
      - 'caracteres_de_relleno': Parámetro que indica el caracter que se colocará en los espacios vacíos que deban rellenarse 
        en la parte izquierda del string.
  - rpad('string_base', numLetras, 'caracteres_de_relleno'): Método que realiza la misma función del método lpad, pero en vez 
    de colocar su string base hasta la izquierda, lo coloca hasta la derecha.
  - CAST(variable   AS  tipo_de_dato): Comando que transforma el tipo de dato de una variable a otro, el cual está indicado
    después del comando AS.*/
--Método generate_series() para generar rango numérico creciente sin paso indicado explícitamente:
SELECT  *
FROM    generate_series(1.1, 4);
/*Método generate_series() para generar rango de tipo timestamp creciente con paso indicado explícitamente:
  - timestamp: En este tipo de dato se pueden especificar partes de la fecha u hora a través de los strings: years, months, 
    days, hours, minutes, seconds, quarters, dow (día de la semana), doy (día del año), etc.*/
SELECT  *
FROM    generate_series('2024-04-06 00:00:00'::timestamp, '2024-04-09 00:00:00', '10 hours');
--Método generate_series() para generar rango numérico decreciente sin paso indicado explícitamente: Generará un arreglo vacío.
SELECT  *
FROM    generate_series(4, 3);
--Método generate_series() para generar rango numérico decreciente con paso indicado explícitamente:
SELECT  *
FROM    generate_series(5, 1, -2);
--Operación con un rango numérico creado por el método generate_series() y la fecha actual del sistema current_date:
SELECT  current_date + tablaRango.numeros AS fechas_rango
FROM    generate_series(0, 14, 7) AS tablaRango(numeros);
--Operación JOIN de una tabla con un rango numérico creado por el método generate_series():
SELECT    alumno.id,
          CONCAT(alumno.nombre, ' ', alumno.apellido),
          alumno.carrera_id,
          tablaRango.numeros
FROM      ejercicios.alumnos AS alumno
  INNER JOIN generate_series(0, 10) AS tablaRango(numeros)
  ON      tablaRango.numeros = alumno.carrera_id
ORDER BY  alumno.carrera_id;
--Generación de un rango numérico creado por el método generate_series() y su índice incluido con el comando WITH:
SELECT  *
FROM    generate_series(10, 2, -2) WITH ordinality;
--Creación de triángulos con un rango numérico creado por el método generate_series() con índice incluid y el método lpad():
SELECT  lpad('^', CAST(ordinality AS int), '*')
FROM    generate_series(10, 2, -2) WITH ordinality;





/*18.	Realiza una consulta SQL que a través de expresiones regulares analice si el contenido de una columna es o no un email. 
Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.*/
--Consulta con expresiones regulares para encontrar cualquier email:
SELECT  email
FROM    ejercicios.alumnos
WHERE   email ~*'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}';
--Consulta con expresiones regulares para encontrar una terminación de email específica:
SELECT  email
FROM    ejercicios.alumnos
WHERE   email ~*'[A-Z0-9._%+-]+@google[A-Z0-9.-]+\.[A-Z]{2,4}';