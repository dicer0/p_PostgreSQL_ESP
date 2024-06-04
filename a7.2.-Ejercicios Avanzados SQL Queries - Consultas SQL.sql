--CONSULTAS SQL:
/*FETCH: Este comando se puede usar de diversas maneras para controlar y limitar el número de filas devueltas por una 
consulta. Las variaciones de FETCH se centran principalmente en las palabras clave que lo acompañan, como FIRST, NEXT, 
ROWS, PERCENT y WITH TIES.
  - FETCH FIRST n ROWS ONLY: Recupera las primeras n filas.
  - FETCH NEXT  n ROWS ONLY: Recupera las siguientes n filas, aunque es equivalente a FETCH FIRST si no se usa en junto 
    al comando OFFSET.
      - OFFSET x ROWS FETCH NEXT n ROWS ONLY: Recupera n filas después de saltar x filas inicialmente.
  - FETCH FIRST numero_porcentaje PERCENT ROWS ONLY: Recupera el primer porcentaje especificado de filas de toda la tabla.
  - FETCH FIRST n ROWS WITH TIES: Recupera n filas de la tabla, pero si es que filas adicionales tienen su mismo valor, 
    también se incluyan de forma automática, no estando limtado entonces a traer n filas forzosamente.*/
