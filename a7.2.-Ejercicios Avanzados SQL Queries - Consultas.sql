--CONSULTAS SQL:
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
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y forzosamente se les debe asignar 
un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será utilizado por 
el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo del comando 
exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar, si se quiere mostrar todas, se utiliza 
    un asterisco *.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define el conjunto de filas sobre las cuales opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar exactamente a cuáles filas de la tabla nos estamos refiriendo, filtrando así la consulta a 
    través de cierta condición matemática (=, >, <, etc.), ya que la extracción se puede realizar de una o varias filas, para 
    ello se utiliza el comando WHERE acompañado del valor de algún atributo.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, pero sin cambiar la forma en que se muestran los datos, agregando información extra a cada fila de la tabla 
para poder realizarlos.*/
SELECT 	*
FROM	(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM	ejercicios.alumnos
) AS query_alumnos_anidado
WHERE row_id = 1;



/*2.	Realiza una consulta SQL que obtenga el registro o fila del atributo colegiatura perteneciente a la tabla alumnos que 
tenga el segundo valor más alto. Para ello todos los siguientes códigos son equivalentes. Para ello todos los siguientes 
códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y forzosamente se les debe asignar 
un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será utilizado por 
el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo del comando 
exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
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
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y forzosamente se les debe asignar 
un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será utilizado por 
el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo del comando 
exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
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
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y forzosamente se les debe asignar 
un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será utilizado por 
el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo del comando 
exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
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