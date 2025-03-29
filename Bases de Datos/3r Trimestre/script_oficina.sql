DROP table IF EXISTS empleados;
DROP TABLE IF EXISTS oficinas;
DROP TABLE IF EXISTS secciones;

create table secciones(
	codigo int,
	nombre varchar(20),
	sueldo decimal(5,2),
	primary key (codigo)
);

CREATE TABLE oficinas (
    codigo_oficina INT PRIMARY KEY,
    nombre_oficina VARCHAR(50),
    ubicacion VARCHAR(100)
);

create table empleados(
	dni char(8),
	sexo char(1),
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(30),
	seccion int not null,
	cantidadhijos int,
	estadocivil char(10),
	fechaingreso date,
	codigo_oficina INT,
	primary key (dni),
	foreign key (seccion) references secciones (codigo),
	FOREIGN KEY (codigo_oficina) REFERENCES oficinas (codigo_oficina)
);

insert into secciones(codigo,nombre,sueldo)
values(1,'Administracion',300);

insert into secciones(codigo,nombre,sueldo)
values(2,'Contabilidad',400);

insert into secciones(codigo,nombre,sueldo)
values(3,'Sistemas',500);

INSERT INTO oficinas (codigo_oficina, nombre_oficina, ubicacion)
VALUES
    (1, 'Oficina Central', 'Madrid'),
    (2, 'Oficina Norte', 'Bilbao'),
    (3, 'Oficina Sur', 'Sevilla'),
	(4, 'Oficina Levante', 'Alicante');


insert into empleados
(dni,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso, codigo_oficina)
values('22222222','F','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10', 1);

insert into empleados
(dni,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso, codigo_oficina)
values('23333333', NULL,'Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10', 1);

insert into empleados(dni,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso, codigo_oficina)
values('24444444','M','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12', 4);

insert into empleados(dni,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso, codigo_oficina)
values('25555555','M','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09', 3);

insert into empleados(dni,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso, codigo_oficina)
values('26666666',NULL,'Perez','Laura','Peru 1254',3,3,'casado','2000-05-09', 1);

INSERT INTO empleados (dni, sexo, apellido, nombre, domicilio, seccion, cantidadhijos, estadocivil, fechaingreso, codigo_oficina)
VALUES ('12345678', 'M', 'González', 'Ana', 'Calle Mayor 123', 1, 2, 'Casado', '2023-01-15', 3),
    ('98765432', 'F', 'Martínez', 'Carlos', 'Avenida Libertad 456', 2, 0, 'Soltero', '2022-11-05', 2),
    ('56789012', 'M', 'Rodríguez', 'Laura', 'Plaza del Sol 789', 3, 1, 'Viudo', '2021-07-20', 2),
    ('34567890', 'F', 'Pérez', 'Juan', 'Calle del Bosque 234', 1, 3, 'Casado', '2020-03-10', 1),
    ('21098765', 'M', 'López', 'María', 'Avenida Central 567', 2, 2, 'Casado', '2019-09-18', 4),
	('11111111', NULL, 'Gómez', 'Luisa', 'Calle del Sol 123', 1, 1, 'Soltero', '2023-02-10', 1),
    ('22222220', NULL, 'Hernández', 'Diego', 'Avenida Central 456', 2, 0, 'Soltero', '2022-10-20', 2),
    ('33333333', NULL, 'Díaz', 'Isabel', 'Plaza Mayor 789', 3, 2, 'Casado', '2021-06-15', 3),
	('87654321', 'F', 'García', 'Pedro', 'Calle del Mar 789', 3, 0, 'Soltero', '2018-05-02', 2),
    ('65432109', 'M', 'Fernández', 'Sara', 'Avenida del Parque 123', 1, 1, 'Casado', '2017-12-12', 1),
    ('44444444', NULL, 'Torres', 'Andrés', 'Callejón Estrecho 234', 1, 0, 'Soltero', '2020-01-05', 2),
    ('55555555', NULL, 'Ruiz', 'Carmen', 'Avenida Libertad 567', 2, 3, 'Casado', '2019-08-18', 1),
    ('43210987', 'F', 'Sánchez', 'Javier', 'Callejón Estrecho 456', 2, 2, 'Casado', '2016-08-25', 4),
    ('78901234', 'M', 'Romero', 'Elena', 'Plaza Mayor 789', 3, 0, 'Soltero', '2015-04-30', 1),
	('66666666', NULL, 'Vargas', 'Manuel', 'Calle del Mar 789', 3, 1, 'Viudo', '2018-04-02', 3),
    ('77777777', NULL, 'Molina', 'Eva', 'Avenida del Parque 123', 1, 2, 'Casado', '2017-11-12', 1),
    ('88888888', 'M', 'Ortega', 'Jorge', 'Plaza del Sol 456', 2, 0, 'Soltero', '2016-07-25', 2),
    ('99999999', NULL, 'Navarro', 'Ana', 'Calle Mayor 789', 3, 1, 'Casado', '2015-03-30', 4);  
