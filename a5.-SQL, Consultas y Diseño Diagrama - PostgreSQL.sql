--CÓDIGO SQL BASE DE DATOS RELACIONAL:
/*Los dos sub-lenguajes más importantes del lenguaje SQL son llamados DDL y DML, primero se explicará el DDL que sirve para 
estructurar la base de datos:
    • DDL (Data Definition Language): La función principal de este sub-lenguaje de SQL es la de crear la estructura de una 
      base de datos. Esto se refiere a las entidades, atributos, relaciones, etc. que son descritos en un diagrama ER o en 
      un diagrama físico. 
      Los 3 comandos con los que cuenta para llevar a cabo la estructuración de datos con el lenguaje DDL son los siguientes:
        o CREATE: Comando que ayuda a crear una base de datos, tabla, vista, índice, etc.
        o ALTER: Comando que ayuda a alterar o modificar una entidad, tabla, tipo de dato, etc.
        o DROP: Comando que ayuda a eliminar elementos de una base de datos. Esta se debe utilizar con mucho cuidado, ya 
          que accidentalmente podríamos borrar nuestra db completa.

    Algunos de los elementos u objetos que se van a manipular con los comandos DDL son los siguientes:
    o DATABASE: Se refiere a la base de datos, a veces también se le llama SCHEMA.
    o TABLE: Las tablas se refieren a la visualización de los datos después de haberlas modelado a través de un diagrama 
    ER o diagrama físico.
    o VIEW: Las vistas se refieren a la forma en la que se pueden interpretar y ordenar los datos extraídos de una database, 
    de tal forma que puedan ser entendidos o de utilidad para el usuario, ya que, en las tablas de las bases de datos, 
    muchas veces la información está segmentada y de esta forma la podemos filtrar y organizar.

    • DML (Data Manipulation Language): La función principal de este sub-lenguaje de SQL es la de manipular los datos de una 
      base de datos, ya sea para crear vistas o para meter, actualizar, borrar o extraer datos. Los 4 comandos con los que 
      cuenta para llevar a cabo la manipulación de datos con el lenguaje DML son los siguientes:
        o INSERT: Comando que permite introducir nuevas filas de datos (también llamados registros o tuplas) a la tabla 
          (entidad) de una base de datos.
        o UPDATE: Comando que actualiza o modifica datos ya existentes en la tabla de una base de datos.
        o DELETE: Instrucción que sirve para borrar toda la fila de datos de una tabla perteneciente a una base de datos.
        o SELECT: Este comando es muy importante, ya que permite traer información de la base de datos, ya sea para crear una 
          vista, extraerla para ponerla en otro lado, etc.*/

/*INSERTAR VARIAS FILAS (REGISTROS O TUPLAS) DE DATOS ALEATORIOS EN LA BASE DE DATOS CON SQL UTILIZANDO MOCKAROO:
Cuando se quiera añadir datos aleatorios de forma masiva en un database (una vez que ya se hayan creado y relacionado sus 
tablas), se puede utilizar la herramienta Mockaroo, en ella se debe indicar el mismo nombre de atributo de la tabla, el tipo 
de dato aleatorio que corresponde a esa columna, el número de filas de datos que se crearán, el formato SQL del código 
resultante y el nombre de la tabla. 
Al dar clic en el botón de Preview → SQL se verá el código SQL que utilice varios comandos INSERT para añadir varios datos 
aleatorios a la vez, ya que estemos conformes con los datos mostrados en la vista previa, podemos descargar el archivo con 
extensión SQL. La herramienta Mockaroo es web y se encuentra en el siguiente enlace: https://mockaroo.com/:
INSERT	INTO	Nombre_Entidad_o_Tabla(
	Nombre_Atributo_o_Columna_1,
	Nombre_Atributo_o_Columna_2,
	Nombre_Atributo_o_Columna_n
)
VALUES(
	“Valor_Atributo_o_Columna_1”,
	“Valor_Atributo_o_Columna_2”,
	“Valor_Atributo_o_Columna_n”
);*/
/*En el ejercicio que se llevará a cabo se realiza el diseño de la base de datos de una estación de transporte masiva como 
lo puede ser un tren, metro o algo así, la cual cuenta con las siguientes tablas.
  -	Pasajeros: Id_Pasajero (Primary Key), Nombre, Dirección de Residencia, Fecha de Nacimiento.
  -	Estaciones: Id_Estación (Primary Key), Nombre de Estación, Dirección de la Estación.
  -	Trenes: Id_Tren (Primary Key), Modelo del Tren, Capacidad de Pasajeros.
    -	Trayectos: Id_Trayecto (Primary Key), Id_Estación, Id_Tren, Nombre de Ruta.
    -	Viajes: Id_Viaje (Primary Key), Id_Pasajero, Id_Trayecto, Tiempo de Inicio del Viaje, Tiempo Final del Viaje.*/
--PASAJEROS - DATOS ALEATORIOS DE MOCKAROO:
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Laurie Verring', '0 Sunnyside Avenue', '1994-06-16');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Leilah Callow', '80 Dexter Plaza', '1972-01-07');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Brigit MacGee', '5360 Donald Way', '2008-01-14');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cordell Grigorey', '2476 Mandrake Terrace', '2020-03-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Shayne Jain', '62635 Carioca Plaza', '1971-03-19');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Roarke Seeviour', '73503 Monica Avenue', '1981-06-21');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Amelina Blanque', '409 Nelson Plaza', '2007-08-27');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Rachelle Malcolmson', '3595 Hoepker Hill', '2009-12-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Garrek Poznanski', '98 Vera Parkway', '1987-08-17');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Rosemaria Schaffler', '03257 Mendota Alley', '1984-07-27');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Shawna Wythill', '078 Manley Place', '1987-09-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Illa Methingam', '82886 Hazelcrest Parkway', '1985-01-16');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Nataline Goldster', '2235 Ridgeview Lane', '1984-06-11');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Ezra Greeves', '7 Bellgrove Place', '1983-12-26');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Rubi Dorrian', '69 Norway Maple Center', '2021-03-18');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cordy Chaunce', '52791 Eagan Trail', '1980-03-20');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Huntlee Corry', '518 Sutteridge Park', '2006-11-26');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Dorthy Mithun', '71 Roxbury Trail', '1997-09-13');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Hermon Bartolini', '2 Northfield Lane', '1985-08-07');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Fidel Postians', '6980 Delaware Drive', '1990-11-24');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Nikkie Ekins', '6 Lake View Park', '2006-04-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Gordie Jecock', '73023 Hollow Ridge Trail', '2007-04-13');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Demetrius Scothorn', '4526 Sunnyside Crossing', '2018-07-17');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Weider Oulett', '49 Green Ridge Road', '2004-05-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Kesley Vanyarkin', '578 Dawn Trail', '1971-08-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Amaleta Wyne', '79 Ludington Center', '1984-08-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Andria O''Quin', '3 Aberg Pass', '2014-03-11');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Tanya Minget', '69453 Butterfield Parkway', '2013-05-16');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Franky Kibard', '6077 Utah Road', '2024-03-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Hebert Pfleger', '88 Gulseth Circle', '1992-06-27');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Baxie Chiverton', '829 Vernon Way', '1983-01-24');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Roldan Jamieson', '385 Elgar Street', '2019-10-25');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Antone Peterffy', '29999 Graedel Hill', '2008-01-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cesya Broomhall', '7760 Westport Street', '2012-03-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Perceval Raeburn', '907 Westend Point', '2007-10-11');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Christye Alben', '086 Bluejay Street', '1976-06-03');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Daune Longley', '954 Ohio Junction', '2018-12-07');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Elwira Spedroni', '3978 Lawn Junction', '2023-10-16');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Nat Causon', '47909 Bashford Point', '1995-11-22');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cass Issatt', '2086 Hagan Trail', '2018-06-30');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Luise Sholl', '3809 Miller Avenue', '2017-09-13');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Les Reditt', '773 Lunder Alley', '1976-12-29');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Guntar Oats', '28 Sommers Junction', '1993-09-20');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Dorothy Aldrick', '2413 South Lane', '2022-05-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Tobie Chitson', '9010 Anhalt Way', '1992-11-22');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Hoyt Leversuch', '2 Mesta Road', '2021-09-25');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Noelle Kitching', '915 Talmadge Road', '1970-09-22');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Loree Utley', '6788 Reindahl Street', '1983-01-17');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Joana Stilgo', '87 Menomonie Road', '2024-04-20');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Amabel Jedraszczyk', '76742 New Castle Street', '1979-10-07');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Philippine Fozzard', '30 Loeprich Point', '2003-02-07');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Saraann Cyphus', '2495 Golf View Drive', '2022-04-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Tanny Tawn', '12825 Rusk Parkway', '1996-03-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Hunt Adds', '25 Loftsgordon Center', '1994-10-16');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Car Blade', '615 Vahlen Way', '2013-06-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Christian Milthorpe', '9431 4th Avenue', '1972-11-09');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Grady Felipe', '67 Dexter Place', '2005-09-09');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Kaia Cromly', '14 Lyons Road', '1978-02-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Saba Cuppleditch', '8 3rd Lane', '1994-03-30');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Angy Stairmond', '40037 Golf Circle', '2002-12-13');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Sharai Auld', '19226 Bultman Park', '2005-01-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Ayn Somerville', '794 Cambridge Junction', '1976-10-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Sasha Hughs', '96 Grasskamp Court', '1997-12-05');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Ira Pont', '18890 School Trail', '1977-05-24');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Angeli Kramer', '90 Holy Cross Lane', '2015-12-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Barbee Muschette', '5184 Carberry Road', '1981-09-14');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Merna Milella', '8 Shoshone Park', '1974-08-04');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Onofredo Easter', '42827 Montana Park', '1976-04-02');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Katine Drakes', '685 Southridge Street', '1998-11-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Patience Cawsby', '669 Oak Valley Drive', '1994-03-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Nappie Calderonello', '875 Trailsway Place', '2006-01-26');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Giacobo Canas', '65683 Weeping Birch Street', '1971-12-06');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Aurelia McNeice', '45 Eliot Center', '1982-09-15');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Aubrey Jacquot', '47731 Melody Place', '2006-10-15');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Grissel Rehorek', '96458 Shoshone Pass', '1973-05-06');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Kennan Lathey', '11 Forster Crossing', '1985-05-06');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cecil Giggs', '18202 Montana Place', '2012-06-02');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Todd Yarrall', '3 Butternut Avenue', '1999-12-18');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Leoline Mariot', '8826 Reinke Park', '1984-10-02');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Hart Isted', '74 Ridge Oak Place', '2004-02-25');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Chelsy Stormes', '4 Colorado Lane', '2016-11-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Lotty Rowlin', '586 Towne Junction', '1990-03-02');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Jonah Scoyne', '89 Grover Parkway', '1993-09-15');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Candace Swetman', '88 Monterey Street', '2007-03-21');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Zorah Leahy', '8318 Kinsman Alley', '2003-03-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Demetre Witton', '531 Westerfield Pass', '2004-04-19');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Tad Hackley', '6 Hanover Crossing', '1998-11-20');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Sarene Southerns', '73 Bowman Circle', '2013-05-28');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Lucio Chopy', '089 Hoard Center', '1977-07-20');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Donall Tizzard', '762 Springs Drive', '1978-07-06');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Merilee MacDermid', '01936 Victoria Pass', '1971-08-19');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Johna Yeomans', '805 Leroy Avenue', '1990-11-13');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Gawen Gauden', '63195 Gateway Crossing', '1977-03-24');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Carroll Egdale', '01058 Sutherland Circle', '2012-10-30');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Ashton Kristoffersen', '27595 Vahlen Point', '1997-07-01');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Opal Burgess', '6 Towne Avenue', '1980-07-12');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Broderick Shelsher', '32406 Fieldstone Crossing', '1991-02-23');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Tracie Oertzen', '43778 Hauk Street', '1993-07-04');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Scarface Bulleyn', '238 Linden Center', '1971-08-27');
insert into public.pasajero (nombre, direccion_residencia, fecha_nacimiento) values ('Cristine Grahlman', '9 Pierstorff Park', '2019-08-25');

--ESTACIONES - DATOS ALEATORIOS DE MOCKAROO:
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Moen, Upton and Jacobson', '43755 Autumn Leaf Parkway');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('McGlynn-Kilback', '55 Grim Drive');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Shanahan, Abshire and Adams', '18 Bunker Hill Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Mraz and Sons', '6481 Northwestern Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Padberg LLC', '11 Anhalt Drive');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Christiansen-Dooley', '8740 Golden Leaf Road');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Corwin-Metz', '31790 Mifflin Avenue');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Aufderhar-Medhurst', '0116 Briar Crest Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Altenwerth-Schuster', '18374 Burrows Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Becker, Romaguera and Kirlin', '46706 Armistice Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kulas, Gorczany and Schmidt', '61 Dorton Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Veum-O''Hara', '08 Armistice Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Price Group', '4 Riverside Alley');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ziemann Inc', '522 Scofield Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Towne-Kris', '5 Vera Point');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Lueilwitz, Towne and Cole', '9876 Shasta Park');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ferry-Towne', '2 Meadow Ridge Point');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Davis-Abshire', '69 Village Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Weissnat Inc', '6 Main Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Conroy, Gutmann and O''Connell', '740 Dahle Plaza');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Beier Group', '1230 Susan Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Sanford-Jacobi', '7 Del Mar Drive');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Feeney Inc', '3704 Nevada Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Osinski, Pollich and Balistreri', '25 Bluestem Plaza');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kunde-Bechtelar', '03 Spohn Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Wolf-Kuvalis', '4 Northport Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Streich and Sons', '58 Lighthouse Bay Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Herman-Murphy', '66034 Village Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Zboncak Group', '7 Pearson Point');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Legros LLC', '144 Rockefeller Plaza');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Crist Inc', '9 Melby Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Sawayn Inc', '15 Gale Place');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Marquardt LLC', '31 Menomonie Street');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Blanda and Sons', '4789 Nobel Avenue');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Marquardt, Witting and Aufderhar', '18 Gale Road');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Murphy Inc', '5670 Prentice Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Stamm-Barrows', '45730 Bobwhite Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kozey, Goyette and Johnson', '87848 Thompson Drive');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Gorczany-Hettinger', '1502 Bluejay Junction');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Price-Predovic', '7 Mitchell Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ortiz Group', '82 Sheridan Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Feest, Mitchell and Crooks', '33376 Crowley Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ryan-Lehner', '88029 Havey Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Block-Mertz', '945 Old Shore Place');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Pagac and Sons', '23727 Lakewood Gardens Place');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Crooks, Schamberger and Schmitt', '47 Corscot Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Tremblay Group', '8200 Fallview Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Powlowski-Koss', '47730 Hoepker Road');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Emmerich, Grady and Bogisich', '806 Ramsey Parkway');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Braun, Gleichner and Hammes', '78 Morning Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Will-Gleichner', '408 Hovde Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Murazik-Fay', '07461 Northfield Road');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Parisian, Maggio and Block', '09 Pearson Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Morissette, Bernhard and Ankunding', '7 Superior Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Bahringer-Ferry', '336 High Crossing Court');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Olson, Anderson and Wolff', '13541 Grim Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Gutkowski, Trantow and Franecki', '808 Buena Vista Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Schaefer Group', '78 Buell Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Gusikowski-Ortiz', '56 Schiller Parkway');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('DuBuque-Wuckert', '61 Coleman Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Satterfield Group', '4 Gerald Park');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Bernhard, Schaden and Lueilwitz', '1255 Stuart Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Greenfelder-Walter', '90 Beilfuss Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Baumbach-Jacobi', '8 6th Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Medhurst, Mertz and Schmidt', '3242 6th Road');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Hane, Bradtke and Kub', '4821 Mallory Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ankunding and Sons', '25 Anniversary Point');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Miller-Braun', '3841 Lakeland Point');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Senger and Sons', '61 Westerfield Parkway');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Hermiston LLC', '0612 Lunder Crossing');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Ritchie and Sons', '31 Green Parkway');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kuhn, Windler and Kautzer', '78978 Daystar Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Pagac, Bernhard and Dooley', '11 Moulton Junction');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Cruickshank-Murray', '6849 Fallview Plaza');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kris-Barton', '73 Manley Avenue');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('O''Conner, Schmitt and Huel', '327 International Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Powlowski, Kunze and Schaden', '611 Butterfield Court');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Cormier, Koepp and Towne', '0871 Utah Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Conn-Skiles', '22 Birchwood Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Collier and Sons', '22 Express Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Hilll-Cronin', '332 Fordem Pass');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Feeney Inc', '714 Blue Bill Park Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Daugherty, Lockman and Dibbert', '222 Milwaukee Avenue');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Emmerich-Okuneva', '93 Westend Park');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Stark LLC', '24324 Gina Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Goyette, Ferry and Rice', '2 Superior Center');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Gislason and Sons', '368 Summer Ridge Drive');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Bins and Sons', '94495 Arrowood Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Vandervort-Rempel', '40911 Melvin Park');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Keeling, Heller and Heaney', '9 Oak Plaza');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Schumm, Wilkinson and Wolf', '8 Nelson Circle');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Boyer, Reynolds and Reinger', '83 Moulton Hill');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Lemke, Orn and Terry', '94539 Milwaukee Lane');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Considine and Sons', '8 Mockingbird Trail');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Kuhlman-Crist', '24067 Mesta Court');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Effertz LLC', '475 Ronald Regan Court');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Bogisich-Stamm', '0 Sherman Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Hilll, West and Predovic', '5 Drewry Court');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Strosin LLC', '81913 Main Terrace');
insert into public.estacion (nombre_estacion, direccion_estacion) values ('Lemke LLC', '09 Beilfuss Parkway');

--TRENES - DATOS ALEATORIOS DE MOCKAROO:
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Ranger', 1);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Catera', 2);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('200', 3);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Outlook', 4);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Crossfire Roadster', 5);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sedona', 6);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Montero', 7);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('M3', 8);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LS', 9);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Probe', 10);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Envoy', 11);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Camaro', 12);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Taurus', 13);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Savana 2500', 14);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('IS', 15);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Forester', 16);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Camry', 17);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sentra', 18);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Tahoe', 19);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('SC', 20);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Express 2500', 21);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('S-Class', 22);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LS', 23);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Civic', 24);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LR3', 25);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('911', 26);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Insight', 27);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Tredia', 28);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Rodeo', 29);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Cooper', 30);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('MP4-12C', 31);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Equus', 32);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('200', 33);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Z3', 34);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LeSabre', 35);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('SLS AMG', 36);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('E-Class', 37);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Grand Am', 38);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Bravada', 39);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Acclaim', 40);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('RX-7', 41);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('CX-7', 42);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sonata', 43);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('TL', 44);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LTD', 45);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Mazda3', 46);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Discovery', 47);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Suburban 2500', 48);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('LeMans', 49);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Challenger', 50);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Grand Caravan', 51);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Jetta', 52);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('300SD', 53);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('FJ Cruiser', 54);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Venza', 55);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Ranger', 56);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Accord', 57);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Skylark', 58);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Town Car', 59);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('G-Class', 60);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Celica', 61);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('E350', 62);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Range Rover', 63);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('GTO', 64);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('V8 Vantage S', 65);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Rabbit', 66);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Roadmaster', 67);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Crown Victoria', 68);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sable', 69);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Expedition EL', 70);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Mirage', 71);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('CT', 72);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('740', 73);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Milan', 74);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sable', 75);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('GT500', 76);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Continental', 77);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Galant', 78);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('F-250 Super Duty', 79);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Cutlass Supreme', 80);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Spectra', 81);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Tempo', 82);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('STS', 83);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Cirrus', 84);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Sebring', 85);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Camaro', 86);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Marauder', 87);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('X-Type', 88);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Diamante', 89);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Outback Sport', 90);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('VUE', 91);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('New Beetle', 92);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Montero Sport', 93);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Laser', 94);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Fortwo', 95);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('NSX', 96);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Discovery', 97);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Jimmy', 98);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('X3', 99);
insert into public.tren (modelo_tren, capacidad_pasajeros) values ('Explorer Sport Trac', 100);

--TRAYECTOS - DATOS ALEATORIOS DE MOCKAROO:
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (96, 67, 'Latlux');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (40, 6, 'Home Ing');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (60, 48, 'Subin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (29, 31, 'Sonsing');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (41, 3, 'Sonsing');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (26, 66, 'Asoka');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (60, 33, 'Sub-Ex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (53, 38, 'Temp');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (17, 7, 'Pannier');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (28, 9, 'Bamity');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (82, 22, 'Y-Solowarm');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (25, 4, 'Subin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (56, 34, 'Viva');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (59, 17, 'Viva');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (26, 28, 'Temp');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (48, 66, 'Greenlam');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (59, 5, 'Fixflex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (51, 65, 'Flexidy');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (70, 80, 'Domainer');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (63, 21, 'Ronstring');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (49, 76, 'Stim');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (27, 65, 'Overhold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (61, 9, 'Stringtough');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (86, 24, 'Zathin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (36, 23, 'Wrapsafe');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (57, 57, 'It');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (36, 13, 'Aerified');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (14, 67, 'Hatity');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (56, 47, 'Daltfresh');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (44, 36, 'Sonair');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (49, 86, 'Kanlam');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (70, 83, 'Voltsillam');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (17, 34, 'Otcom');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (44, 57, 'Tampflex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (37, 79, 'Tin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (51, 34, 'Vagram');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (96, 63, 'Tres-Zap');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (37, 48, 'Tampflex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (4, 47, 'Job');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (29, 82, 'Stringtough');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (57, 15, 'Sub-Ex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (33, 60, 'Daltfresh');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (25, 43, 'Redhold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (97, 32, 'Aerified');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (19, 96, 'Sonsing');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (27, 36, 'Keylex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (1, 33, 'Voltsillam');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (72, 51, 'Namfix');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (21, 20, 'Daltfresh');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (59, 63, 'Redhold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (16, 48, 'Subin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (93, 100, 'Opela');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (4, 32, 'Cardify');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (33, 7, 'Matsoft');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (98, 76, 'Tampflex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (40, 43, 'Stringtough');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (38, 68, 'Trippledex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (93, 46, 'Opela');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (33, 14, 'Fix San');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (64, 70, 'Tin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (37, 32, 'Greenlam');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (51, 34, 'Zathin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (48, 51, 'Ronstring');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (77, 14, 'Y-Solowarm');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (66, 83, 'Voyatouch');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (81, 96, 'Lotstring');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (98, 44, 'Subin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (81, 91, 'Viva');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (20, 22, 'Vagram');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (27, 22, 'Fix San');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (84, 89, 'Zontrax');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (86, 92, 'Tin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (38, 22, 'Bitchip');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (34, 43, 'Temp');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (16, 71, 'Stronghold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (68, 62, 'Alpha');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (4, 12, 'Cardify');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (71, 32, 'Solarbreeze');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (40, 11, 'Solarbreeze');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (41, 8, 'Ronstring');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (53, 12, 'Tempsoft');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (77, 10, 'Home Ing');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (55, 89, 'Fix San');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (44, 47, 'Namfix');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (31, 46, 'Stronghold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (51, 60, 'Zontrax');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (35, 10, 'Tempsoft');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (40, 94, 'Stronghold');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (50, 4, 'Trippledex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (6, 99, 'Sub-Ex');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (90, 81, 'Y-Solowarm');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (50, 10, 'Alpha');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (85, 73, 'Lotlux');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (21, 74, 'Zontrax');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (8, 6, 'Andalax');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (1, 67, 'Tin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (8, 28, 'Veribet');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (70, 88, 'Cookley');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (67, 58, 'Subin');
insert into public.trayecto (id_estacion, id_tren, nombre_ruta) values (68, 11, 'Home Ing');

--VIAJES - DATOS ALEATORIOS DE MOCKAROO:
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (53, 58, '1:19 PM', '8:48 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (25, 29, '8:38 PM', '12:16 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (47, 15, '5:48 PM', '1:54 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (13, 32, '4:35 PM', '10:09 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (97, 95, '1:09 AM', '5:57 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (20, 93, '7:16 PM', '12:54 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (41, 92, '7:48 PM', '9:27 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (7, 24, '7:29 PM', '1:48 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (26, 56, '4:40 PM', '9:52 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (5, 93, '2:36 PM', '11:28 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (24, 31, '8:47 PM', '2:30 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (16, 14, '3:30 PM', '11:00 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (10, 90, '3:48 PM', '11:25 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (39, 76, '2:17 PM', '9:15 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (63, 19, '4:23 PM', '8:34 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (8, 96, '2:39 PM', '9:56 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (63, 68, '4:16 PM', '9:37 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (12, 44, '11:51 PM', '5:17 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (88, 81, '10:55 PM', '10:44 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (53, 93, '12:01 PM', '9:52 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (96, 59, '4:37 PM', '4:08 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (5, 24, '3:19 PM', '8:29 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (92, 33, '4:48 AM', '6:09 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (8, 35, '3:10 PM', '1:22 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (41, 33, '10:24 AM', '1:53 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (10, 66, '8:34 AM', '10:32 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (57, 85, '10:02 PM', '10:47 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (92, 31, '12:30 AM', '11:19 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (29, 63, '1:48 PM', '4:21 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (39, 79, '12:05 PM', '3:44 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (28, 96, '3:10 AM', '12:11 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (14, 30, '6:54 PM', '5:21 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (20, 83, '6:15 PM', '1:59 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (85, 84, '4:00 PM', '5:41 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (36, 42, '6:00 AM', '3:51 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (61, 17, '8:38 AM', '8:28 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (46, 42, '3:24 PM', '7:18 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (89, 70, '3:35 AM', '10:48 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (79, 20, '9:04 PM', '11:48 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (75, 38, '1:10 PM', '7:16 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (95, 90, '8:10 AM', '11:52 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (13, 61, '3:17 PM', '5:16 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (36, 67, '3:44 PM', '2:44 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (38, 77, '3:05 PM', '9:04 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (58, 14, '11:25 AM', '3:00 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (27, 30, '11:56 AM', '6:13 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (70, 36, '6:27 PM', '10:37 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (12, 12, '6:40 AM', '11:36 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (93, 12, '10:39 PM', '12:59 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (53, 32, '9:10 AM', '1:44 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (14, 83, '3:49 AM', '9:02 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (91, 60, '6:58 AM', '12:11 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (93, 71, '5:59 AM', '9:01 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (68, 95, '4:18 AM', '7:54 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (68, 73, '10:49 AM', '12:27 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (99, 67, '4:32 PM', '2:00 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (23, 19, '3:01 PM', '12:05 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (41, 81, '11:01 AM', '8:46 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (95, 40, '4:49 AM', '8:47 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (99, 30, '8:01 AM', '11:06 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (39, 67, '5:45 AM', '7:03 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (16, 44, '7:56 PM', '1:09 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (6, 30, '10:38 PM', '4:13 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (78, 89, '11:19 AM', '3:59 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (41, 19, '3:52 PM', '7:25 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (16, 67, '6:52 PM', '7:59 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (94, 17, '7:30 AM', '4:10 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (19, 46, '1:38 PM', '12:00 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (98, 77, '6:52 AM', '7:49 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (14, 35, '12:32 AM', '10:25 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (91, 11, '7:42 PM', '2:46 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (49, 88, '7:56 AM', '5:50 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (16, 32, '9:07 AM', '4:55 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (48, 33, '7:27 AM', '3:55 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (71, 80, '8:40 PM', '4:34 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (8, 98, '4:14 AM', '3:51 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (97, 5, '1:10 PM', '3:19 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (50, 34, '6:59 AM', '5:24 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (93, 5, '6:00 PM', '7:14 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (64, 87, '8:35 AM', '5:51 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (68, 24, '2:31 PM', '8:48 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (77, 74, '12:07 AM', '4:59 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (21, 83, '5:33 AM', '3:15 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (60, 40, '6:09 AM', '6:35 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (7, 62, '5:46 AM', '1:25 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (17, 43, '11:04 AM', '9:17 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (66, 74, '5:22 AM', '7:34 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (8, 43, '11:20 PM', '3:12 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (55, 82, '9:36 AM', '8:17 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (42, 99, '5:12 AM', '8:39 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (93, 19, '2:48 AM', '10:14 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (35, 64, '3:49 PM', '12:51 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (92, 70, '3:29 PM', '6:55 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (86, 24, '7:32 AM', '8:11 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (86, 72, '7:42 PM', '10:54 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (38, 31, '7:03 AM', '6:57 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (76, 95, '12:58 AM', '11:18 AM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (79, 36, '6:01 PM', '7:29 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (33, 65, '7:50 PM', '12:49 PM');
insert into public.viaje (id_pasajero, id_trayecto, tiempo_inicio, tiempo_fin) values (92, 51, '8:42 PM', '2:49 PM');