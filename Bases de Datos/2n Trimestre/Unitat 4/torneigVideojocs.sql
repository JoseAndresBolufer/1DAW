--EJERCICIO 1

CREATE TABLE videojuegos(
	nombre VARCHAR(50),
	genero VARCHAR(50),
	desarrollador VARCHAR(50),
	anyo_lanzamiento INT CHECK (anyo_lanzamiento > 1980),
	CONSTRAINT pk_videojuegos PRIMARY KEY (nombre)
)


CREATE TABLE jugadores(
	nickname VARCHAR(50),
	nombre_completo VARCHAR(50),
	fecha_nacimiento DATE,
	nivel_experiencia INT CHECK (nivel_experiencia BETWEEN 1 AND 100),
	CONSTRAINT pk_jugadores PRIMARY KEY (nickname)
)

CREATE TABLE partidas(
	videojuego VARCHAR(50),
	jugador VARCHAR(50),
	puntuacion INT CHECK (puntuacion <=0),
	fecha DATE,
	CONSTRAINT pk_partidas PRIMARY KEY (jugador, videojuego, fecha),
	CONSTRAINT fk_partidas_videojuego FOREIGN KEY (videojuego) REFERENCES videojuegos(nombre),
	CONSTRAINT fk_partidas_jugadores FOREIGN KEY (jugador) REFERENCES jugadores(nickname)
)

CREATE TABLE equipos(
	nombre_equipo VARCHAR(50),
	lider VARCHAR(50),
	fecha_creacion DATE,
	CONSTRAINT pk_equipos PRIMARY KEY (nombre_equipo),
	CONSTRAINT fk_equipos_jugadores FOREIGN KEY (lider) REFERENCES jugadores(nickname)
)

--EJERCICIO 2

ALTER TABLE videojuegos
ADD COLUMN popularidad VARCHAR(50) CHECK (popularidad IN('Alta', 'Media', 'Baja'))

--EJERCICIO 3

INSERT INTO videojuegos (nombre, genero, desarrollador, anyo_lanzamiento, popularidad)
VALUES ('The Legend of Zelda', 'Aventura', 'Nintendo', 1986, 'Alta');

INSERT INTO videojuegos (nombre, genero, desarrollador, anyo_lanzamiento, popularidad)
VALUES ('Among Us', 'Multijugador', 'InnerSloth', 2018, 'Media');

INSERT INTO videojuegos (nombre, genero, desarrollador, anyo_lanzamiento, popularidad)
VALUES ('Pac-Man', 'Arcade', 'Namco', 1980, 'Baja'); --Error por año de lanzamiento

INSERT INTO jugadores (nickname, nombre_completo, fecha_nacimiento, nivel_experiencia)
VALUES ('ZeldaFan', 'Alice Smith', '1990-04-15', 80);

INSERT INTO jugadores (nickname, nombre_completo, fecha_nacimiento, nivel_experiencia)
VALUES ('GamerX', 'Bob Brown', '1985-11-23', 95);

INSERT INTO jugadores (nickname, nombre_completo, fecha_nacimiento, nivel_experiencia)
VALUES ('PacManKing', 'Charlie Lee', '1975-09-10', 60);

INSERT INTO partidas (videojuego, jugador, puntuacion, fecha)
VALUES ('The Legend of Zelda', 'ZeldaFan', 1500, '2023-12-10');

ALTER TABLE partidas
DROP CONSTRAINT partidas_puntuacion_check;

ALTER TABLE partidas ADD CONSTRAINT partidas_puntuacion_check CHECK (puntuacion >= 0);

INSERT INTO partidas (videojuego, jugador, puntuacion, fecha)
VALUES ('Among Us', 'GamerX', 200, '2023-11-01');

INSERT INTO partidas (videojuego, jugador, puntuacion, fecha)
VALUES ('Pac-Man', 'PacManKing', 5000, '2023-10-20'); --Error porque 'Pac-Man' no está como videojuego por la restricción de año de desarrollo

INSERT INTO equipos (nombre_equipo, lider, fecha_creacion)
VALUES ('Hyrule Warriors', 'ZeldaFan', '2021-06-15');

INSERT INTO equipos (nombre_equipo, lider, fecha_creacion)
VALUES ('Arcade Masters', 'PacManKing', '2020-03-20');

--EJERCICIO 4

UPDATE videojuegos
SET popularidad = 'Alta'
WHERE nombre = 'Among Us';

UPDATE jugadores
SET nivel_experiencia = +10
WHERE nickname = 'PacManKing';

UPDATE partidas
SET puntuacion = 2000
WHERE videojuego = 'Legend of Zelda' AND jugador = 'ZeldaFan';

DELETE FROM videojuegos
WHERE nombre = 'Pac-Man';

DELETE FROM jugadores
WHERE nickname ='GamerX'; --Da error porque hay una restriccion de existencia entre partidas y jugadores

--EJERCICIO 5

ALTER TABLE partidas
DROP CONSTRAINT fk_partidas_jugadores,
ADD CONSTRAINT fk_partidas_jugadores FOREIGN KEY (jugador) REFERENCES jugadores(nickname) ON UPDATE CASCADE;

ALTER TABLE equipos
DROP CONSTRAINT fk_equipos_jugadores,
ADD CONSTRAINT fk_equipos_jugadores FOREIGN KEY (jugador) REFERENCES jugadores(nickname) ON UPDATE CASCADE;

UPDATE jugadores
SET nickname = 'Zelda_SuperFan'
WHERE nickname = 'ZeldaFan';

