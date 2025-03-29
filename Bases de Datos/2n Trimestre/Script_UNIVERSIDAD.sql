CREATE TABLE curso(
	idCurso numeric(2),
    nombreDescriptivo varchar(10) not null,
    nAsignaturas numeric(3) not null,
    PRIMARY KEY(idCurso)
);

CREATE TABLE profesor(
	idProfesor char(5),
    NIF char(9) unique,
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50),
    email varchar (50) unique,
    direccion varchar(100) not null,
    codigoPostal numeric(5) not null,
    municipio varchar(50) not null,
    provincia varchar(50) not null,
    categoria VARCHAR(100) NOT NULL,
    CHECK (categoria IN (
        'Catedráticos de Universidad',
        'Titulares Universidad',
        'Catedráticos de Escuela Universitaria',
        'Titulares de Escuela Universitaria',
        'Eméritos',
        'Contratados Doctores',
        'Contratados Doctores Interinos',
        'Asociados',
        'Asociado Interino',
        'Ayudantes Doctores',
        'Otros Investigadores Doctores',
        'PDI predoctoral'
    )),
    PRIMARY KEY(idProfesor)
);


CREATE TABLE asignatura(
	curso numeric(2) not null,
    idAsignatura char(5) not null,
    nombre varchar(150) unique,
    cuatrimestre NUMERIC(1),
    creditos real not null,
    caracter VARCHAR(20) not null,
    coordinador char(5) not null,
    PRIMARY KEY(idAsignatura),
    FOREIGN KEY(curso) REFERENCES curso(idCurso),
    FOREIGN KEY(coordinador) REFERENCES profesor(idProfesor),
	CHECK (cuatrimestre IN ( 1, 2)),
	CHECK (caracter IN ('obligatoria', 'optativa'))
);
    
CREATE TABLE alumno(
	idAlumno char(5) not null,
    NIF char(9)unique, -- NIF es una cadena de caracteres de longitud fija de 9 y un valor único
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50),
    email varchar(50) unique,
    direccion varchar(100) not null,
    codigoPostal numeric(5) not null,
    municipio varchar(50) not null,
    provincia varchar(50) not null,
    PRIMARY KEY(idAlumno)
    );
    
CREATE TABLE matricula(
    idAlumno char(5) not null,
    idAsignatura char(5) not null,
    nota real not null,
    FOREIGN KEY(idAlumno) REFERENCES alumno(idAlumno),
	FOREIGN KEY(idAsignatura) REFERENCES asignatura(idAsignatura),
    CHECK (nota > 0)
    );

CREATE TABLE impartir(
    idProfesor char(5) not null,
    idAsignatura char(5) not null,
    FOREIGN KEY(idProfesor) REFERENCES profesor(idProfesor),
	FOREIGN KEY(idAsignatura) REFERENCES asignatura(idAsignatura)
);

	-- Olvidé incluir el campo beca en alumno. Lo incluiremos con alter table
ALTER TABLE alumno
ADD beca BOOLEAN not null;


-- CARGA DE DATOS
	/*Carga con inserción manual datos curso. Únicamente introduciremos los datos de idCurso y nombreDescriptivo
    ya que  nASignaturas depende del sumatorio de las asignaturas pertenecientes a otra tabla */ 
INSERT INTO curso VALUES(1, 'Primero', 10);
INSERT INTO curso VALUES(2, 'Segundo', 10);
INSERT INTO curso VALUES(3, 'Terceo', 10);
INSERT INTO curso VALUES(4, 'Cuarto', 53);
INSERT INTO curso VALUES(5, 'Master', 11);
INSERT INTO curso VALUES(6, 'Doctorado', 6);

    -- Carga con inserción manual de datos profesor
INSERT INTO profesor VALUES('PR001','34417139B','Juan','Infante','Fraidias','juan.infante.fraidias@ucm.com','Calle de los Almendros , 86',28070,'Las Rozas','Madrid','Asociados');
INSERT INTO profesor VALUES('PR002','52479077P','David','Serna','Balmori','david.serna.balmori@ucm.com','Calle Abarejo , 44',28017,'Brea de Tajo','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR003','84277383X','Josefa','Pedraza','Travez','josefa.pedraza.travez@ucm.com','Calle Abogados de Atocha , 145',28035,'El Molar','Madrid','Contratados Doctores');
INSERT INTO profesor VALUES('PR004','72702217A','Jose Antonio','Belda','Leno','jose.antonio.belda.leno@ucm.com','Calle de Ayamonte , 186',28080,'Pezuela de las Torres','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR005','75239553F','Jose Luis','Barragan','Usategui','jose.luis.barragan.usategui@ucm.com','Travesia del Almendro , 97',28038,'Robledillo de la Jara','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR006','81953461Y','Francisco Javier','Reig','Amills','francisco.javier.reig.amills@ucm.com','Calle de la Albericia , 134',28071,'Colmenarejo','Madrid','Contratados Doctores Interinos');
INSERT INTO profesor VALUES('PR007','18598553N','Ana Maria','De Diego','Bocigas','ana.maria.de.diego.bocigas@ucm.com','Avenida de los Andes , 188',28030,'Prádena del Rincón','Madrid','PDI predoctoral');
INSERT INTO profesor VALUES('PR008','72252271H','Carlos','Fuertes','Carulla','carlos.fuertes.carulla@ucm.com','Calle Águeda , 26',28046,'Velilla de San Antonio','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR009','70631063C','Daniel','Aguado','Pastrana','daniel.aguado.pastrana@ucm.com','Calle de Antoñita Jiménez , 122',28041,'Talamanca de Jarama','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR010','15794042W','Maria Dolores','Espino','Zamudio','maria.dolores.espino.zamudio@ucm.com','Calle del Arroyo de la Elipa , 189',28034,'San Martín de la Vega','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR011','86245635W','Maria Pilar','Valderrama','Urquiaga','maria.pilar.valderrama.urquiaga@ucm.com','Calle Alisios , 150',28006,'Chapinería','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR012','83153833C','Miguel','Fuentes','Andreu','miguel.fuentes.andreu@ucm.com','Calle de la Alcoholera , 12',28080,'Pozuelo del Rey','Madrid','Contratados Doctores Interinos');
INSERT INTO profesor VALUES('PR013','55710808P','Maria Teresa','Pico','Zoyo','maria.teresa.pico.zoyo@ucm.com','Calle de Arenas de Iguña , 17',28080,'Algete','Madrid','Ayudantes Doctores');
INSERT INTO profesor VALUES('PR014','52041463T','Ana','Andujar','Popovici','ana.andujar.popovici@ucm.com','Calle de las Aguas , 61',28035,'Cabanillas de la Sierra','Madrid','Otros Investigadores Doctores');
INSERT INTO profesor VALUES('PR015','81703794T','Rafael','Murcia','Petrov','rafael.murcia.petrov@ucm.com','Calle Almendro , 53',28012,'Tielmes','Madrid','PDI predoctoral');
INSERT INTO profesor VALUES('PR016','36742399V','Jose Manuel','Antolin','Diranzo','jose.manuel.antolin.diranzo@ucm.com','Calle Azabache , 190',28012,'Piñuécar-Gandullas','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR017','33150418J','Pedro','Calderon','Domenech','pedro.calderon.domenech@ucm.com','Carretera de Alpedrete , 104',28008,'Ciempozuelos','Madrid','Contratados Doctores');
INSERT INTO profesor VALUES('PR018','82285639Q','Laura','Bueno','Sobreira','laura.bueno.sobreira@ucm.com','Calle de los Árboles , 198',28039,'Cabanillas de la Sierra','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR019','37497894I','Francisca','Smith','Mafla','francisca.smith.mafla@ucm.com','Calle del Arco , 149',28029,'Moralzarzal','Madrid','Otros Investigadores Doctores');
INSERT INTO profesor VALUES('PR020','34744580Y','Antonia','Vara','Esarte','antonia.vara.esarte@ucm.com','Calle de Alba de Tormes , 123',28030,'Valdemoro','Madrid','Contratados Doctores');
INSERT INTO profesor VALUES('PR021','25542059S','Alejandro','Piã‘A','Ivars','alejandro.piã‘a.ivars@ucm.com','Calle Alfonso X El Sabio , 199',28008,'Colmenar de Oreja','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR022','71976482V','Dolores','Amoros','Cases','dolores.amoros.cases@ucm.com','Calle de las Acacias , 109',28048,'Manzanares el Real','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR023','76471428I','Antonio','Quero','Atienza','antonio.quero.atienza@ucm.com','Vereda de las Arboledas , 89',28015,'Sevilla la Nueva','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR024','57354131X','Jose','Valera','Bardal','jose.valera.bardal@ucm.com','Calle de la Alegría , 82',28034,'Villa del Prado','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR025','21841380T','Maria Carmen','Palacios','Cholvi','maria.carmen.palacios.cholvi@ucm.com','Calle Apolo , 32',28083,'Meco','Madrid','Otros Investigadores Doctores');
INSERT INTO profesor VALUES('PR026','86751787V','Maria','Lucena','Nebra','maria.lucena.nebra@ucm.com','Calle Arroyo de los Berros , 31',28046,'Moraleja de Enmedio','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR027','35634129C','Manuel','Falcon','Zendoia','manuel.falcon.zendoia@ucm.com','Calle de Aguileñas , 65',28041,'Mejorada del Campo','Madrid','Titulares de Escuela Universitaria');
INSERT INTO profesor VALUES('PR028','67157773L','Francisco','Cid','Lubiano','francisco.cid.lubiano@ucm.com','Travesia Antón , 55',28045,'Madrid','Madrid','Asociado Interino');
INSERT INTO profesor VALUES('PR029','34163047Q','Carmen','Pino','Holgueras','carmen.pino.holgueras@ucm.com','Calle de Alcalá de Guadaira , 170',28048,'Rozas de Puerto Real','Madrid','Titulares de Escuela Universitaria');
INSERT INTO profesor VALUES('PR030','78969666B','Juan','Perera','Chao','juan.perera.chao@ucm.com','Calle del Arroyo , 34',28009,'Pinilla del Valle','Madrid','Asociados');
INSERT INTO profesor VALUES('PR031','15480959Q','David','Galindo','Chirila','david.galindo.chirila@ucm.com','Calle de Asunción Cuestablanca , 40',28040,'La Cabrera','Madrid','Asociado Interino');
INSERT INTO profesor VALUES('PR032','76367475V','Josefa','Villena','Hombrados','josefa.villena.hombrados@ucm.com','Calle de Alonso de Mendoza , 161',28043,'Boadilla del Monte','Madrid','PDI predoctoral');
INSERT INTO profesor VALUES('PR033','64389449W','Jose Antonio','Bonilla','Abello','jose.antonio.bonilla.abello@ucm.com','Calle de Albalate del Arzobispo , 51',28016,'Navalafuente','Madrid','Ayudantes Doctores');
INSERT INTO profesor VALUES('PR034','47783567D','Jose Luis','Yague','Liern','jose.luis.yague.liern@ucm.com','Calle Atocha , 133',28023,'Puebla de la Sierra','Madrid','Ayudantes Doctores');
INSERT INTO profesor VALUES('PR035','13616538V','Javier','Exposito','Orejuela','javier.exposito.orejuela@ucm.com','Calle los Acebos , 138',28086,'Valdemaqueda','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR036','78722469N','Isabel','Chaves','Cantisano','isabel.chaves.cantisano@ucm.com','Calle de Alcudia , 14',28006,'San Fernando de Henares','Madrid','Catedráticos de Escuela Universitaria');
INSERT INTO profesor VALUES('PR037','45405804R','Jesus','Cerezo','Esquer','jesus.cerezo.esquer@ucm.com','Calle Armonía , 61',28087,'Robledo de Chavela','Madrid','Contratados Doctores');
INSERT INTO profesor VALUES('PR038','25187565W','Francisco Javier','Aguilera','Pavlova','francisco.javier.aguilera.pavlova@ucm.com','Calle Acacia , 53',28014,'Boadilla del Monte','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR039','19655057F','Ana Maria','Guillen','Bembibre','ana.maria.guillen.bembibre@ucm.com','Pasaje Almendro del Paular , 167',28071,'Puentes Viejas','Madrid','Catedráticos de Universidad');
INSERT INTO profesor VALUES('PR040','29987297T','Carlos','De Las Heras','Orrego','carlos.de.las.heras.orrego@ucm.com','Calle del Alcalde Ramón del Yerro Ordóñez , 135',28011,'El Molar','Madrid','Eméritos');
INSERT INTO profesor VALUES('PR041','22835810F','Daniel','De La Rosa','Gaudes','daniel.de.la.rosa.gaudes@ucm.com','Calle del Alcalde Pablo Durán y Pérez de Castro , 2',28050,'Fuentidueña de Tajo','Madrid','Ayudantes Doctores');
INSERT INTO profesor VALUES('PR042','63215069W','Maria Dolores','Casanova','Ocasar','maria.dolores.casanova.ocasar@ucm.com','Calle de las Arenas , 161',28083,'Braojos de la Sierra','Madrid','Contratados Doctores Interinos');
INSERT INTO profesor VALUES('PR043','83480230A','Maria Pilar','Bejarano','De La Piedad','maria.pilar.bejarano.de.la.piedad@ucm.com','Calle Aldea del Fresno , 105',28071,'Coslada','Madrid','Contratados Doctores Interinos');
INSERT INTO profesor VALUES('PR044','19206079I','Miguel','Silva','Rose','miguel.silva.rose@ucm.com','Calle de Asunción , 173',28049,'Bustarviejo','Madrid','Asociado Interino');
INSERT INTO profesor VALUES('PR045','66989687K','Maria Teresa','Valderrama','Ruperez','maria.teresa.valderrama.ruperez@ucm.com','Plaza de Antonio Chenel Antoñete , 152',28014,'Lozoyuela-Navas-Sieteiglesias','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR046','47970524A','Ana','Padron','Balada','ana.padron.balada@ucm.com','Calle de Argentona , 179',28002,'Boadilla del Monte','Madrid','Titulares Universidad');
INSERT INTO profesor VALUES('PR047','76965754O','Rafael','Figueroa','Casal','rafael.figueroa.casal@ucm.com','Calle de la Aeronave , 37',28004,'Colmenarejo','Madrid','PDI predoctoral');
INSERT INTO profesor VALUES('PR048','48034341Q','Jose Manuel','Nevado','Veras','jose.manuel.nevado.veras@ucm.com','Calle Arlanza , 170',28001,'Ajalvir','Madrid','Catedráticos de Universidad');


    -- Carga con inserción manual de datos asignatura
INSERT INTO asignatura VALUES (1,'AS001','Algebra lineal','2',6,'obligatoria','PR001');
INSERT INTO asignatura VALUES (1,'AS002','Análisis exploratorio de datos','1',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (1,'AS003','Análisis matemático','1',6,'obligatoria','PR003');
INSERT INTO asignatura VALUES (1,'AS004','Fundamentos de computadores y sistemas operativos','2',6,'obligatoria','PR004');
INSERT INTO asignatura VALUES (1,'AS005','Fundamentos de organización de empresas','1',6,'obligatoria','PR005');
INSERT INTO asignatura VALUES (1,'AS006','Fundamentos de programación','1',6,'obligatoria','PR004');
INSERT INTO asignatura VALUES (1,'AS007','Matemáticas discretas','1',6,'obligatoria','PR003');
INSERT INTO asignatura VALUES (1,'AS008','Modelos estadísticos para la toma de decisiones I','2',6,'obligatoria','PR008');
INSERT INTO asignatura VALUES (1,'AS009','Programación','2',6,'obligatoria','PR004');
INSERT INTO asignatura VALUES (1,'AS010','Proyecto I. Comprensión de datos','2',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (2,'AS011','Adquisición y transmisión de datos','1',6,'obligatoria','PR004');
INSERT INTO asignatura VALUES (2,'AS012','Bases de datos','1',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (2,'AS013','Comportamiento económico y social','1',6,'obligatoria','PR006');
INSERT INTO asignatura VALUES (2,'AS014','Estructuras de datos','1',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (2,'AS015','Gestión de datos','2',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (2,'AS016','Modelado discreto y teoría de la información','2',6,'obligatoria','PR007');
INSERT INTO asignatura VALUES (2,'AS017','Modelos descriptivos y predictivos I','2',6,'obligatoria','PR008');
INSERT INTO asignatura VALUES (2,'AS018','Modelos estadísticos para la toma de decisiones II','1',6,'obligatoria','PR008');
INSERT INTO asignatura VALUES (2,'AS019','Proyecto II. Integración y preparación de datos','2',6,'obligatoria','PR009');
INSERT INTO asignatura VALUES (2,'AS020','Seguridad de los datos','2',6,'obligatoria','PR004');
INSERT INTO asignatura VALUES (3,'AS021','Algorítmica','2',6,'obligatoria','PR001');
INSERT INTO asignatura VALUES (3,'AS022','Economía digital','1',6,'obligatoria','PR006');
INSERT INTO asignatura VALUES (3,'AS023','Evaluación','2',6,'obligatoria','PR007');
INSERT INTO asignatura VALUES (3,'AS024','Infraestrutura para el procesamiento de datos','1',6,'obligatoria','PR009');
INSERT INTO asignatura VALUES (3,'AS025','Lenguaje natural y recuperación de la información','2',6,'obligatoria','PR009');
INSERT INTO asignatura VALUES (3,'AS026','Modelado y simulación continuos','2',6,'obligatoria','PR010');
INSERT INTO asignatura VALUES (3,'AS027','Modelos descriptivos y predictivos II','1',6,'obligatoria','PR008');
INSERT INTO asignatura VALUES (3,'AS028','Proyecto III. Analisis de datos','2',6,'obligatoria','PR010');
INSERT INTO asignatura VALUES (3,'AS029','Representación del conocimiento y razonamiento','1',6,'obligatoria','PR011');
INSERT INTO asignatura VALUES (3,'AS030','Visualización','1',6,'obligatoria','PR010');
INSERT INTO asignatura VALUES (4,'AS031','Gestión de proyectos','1',5,'obligatoria','PR005');
INSERT INTO asignatura VALUES (4,'AS032','Marco profesional','1',5,'obligatoria','PR006');
INSERT INTO asignatura VALUES (4,'AS033','Optimización','1',6,'obligatoria','PR015');
INSERT INTO asignatura VALUES (4,'AS034','Técnicas escalables en aprendizaje automático','1',6,'obligatoria','PR024');
INSERT INTO asignatura VALUES (4,'AS035','Trabajo Fin de Grado','2',12,'obligatoria','PR036');
INSERT INTO asignatura VALUES (4,'AS036','Alemán académico y profesional A1','1',5,'optativa','PR020');
INSERT INTO asignatura VALUES (4,'AS037','Alemán académico y profesional A2','2',5,'optativa','PR020');
INSERT INTO asignatura VALUES (4,'AS038','Alemán académico y profesional B1','1',5,'optativa','PR020');
INSERT INTO asignatura VALUES (4,'AS039','Alemán académico y profesional B2','2',5,'optativa','PR020');
INSERT INTO asignatura VALUES (4,'AS040','Análisis de datos en entornos industriales','1',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS041','Análisis de imágenes y vídeos','1',5,'optativa','PR021');
INSERT INTO asignatura VALUES (4,'AS042','Análisis de mercados y aplicaciones financieras','1',5,'optativa','PR005');
INSERT INTO asignatura VALUES (4,'AS043','Análisis de redes sociales','1',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS044','Analítica de datos en educació','1',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS045','Analítica de datos en seguridad','1',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS046','Bases de datos avanzadas y distribuidas','1',5,'optativa','PR016');
INSERT INTO asignatura VALUES (4,'AS047','Biomedical data science','1',5,'optativa','PR026');
INSERT INTO asignatura VALUES (4,'AS048','Business Analytics','2',5,'optativa','PR005');
INSERT INTO asignatura VALUES (4,'AS049','Cibermetría','2',5,'optativa','PR004');
INSERT INTO asignatura VALUES (4,'AS050','Estructuas de datos y algoritmos escalables','2',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS051','Français scientifique et technique - B1','1',5,'optativa','PR027');
INSERT INTO asignatura VALUES (4,'AS052','Francés académico y profesional A1','1',5,'optativa','PR027');
INSERT INTO asignatura VALUES (4,'AS053','Francés académico y profesional A2','2',5,'optativa','PR027');
INSERT INTO asignatura VALUES (4,'AS054','Frances académico y profesional B1','1',5,'optativa','PR027');
INSERT INTO asignatura VALUES (4,'AS055','Frances académico y profesional B2','2',5,'optativa','PR027');
INSERT INTO asignatura VALUES (4,'AS056','Gestion clínica y de servicios de salud','2',5,'optativa','PR011');
INSERT INTO asignatura VALUES (4,'AS057','Gestión de datos científicos en salud','2',5,'optativa','PR015');
INSERT INTO asignatura VALUES (4,'AS058','Gestión de datos en logística y cadenas de suministro','2',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS059','Inglés B2','1',5,'optativa','PR030');
INSERT INTO asignatura VALUES (4,'AS060','Intercambio Académico I','1',3,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS061','Intercambio Académico II','1',3,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS062','Intercambio Académico III','2',3,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS063','Intercambio Académico IV','2',3,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS064','Intercambio Académico V','2',3,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS065','Intercambio Académico VI','1',5,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS066','Intercambio Académico VII','1',5,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS067','Intercambio Académico VIII','2',5,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS068','Intercambio Académico IX','2',5,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS069','Intercambio Académico X','1',6,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS070','Intercambio Académico XI','2',6,'optativa','PR031');
INSERT INTO asignatura VALUES (4,'AS071','Italiano académico y profesional A1','1',5,'optativa','PR029');
INSERT INTO asignatura VALUES (4,'AS072','Marketing','2',5,'optativa','PR005');
INSERT INTO asignatura VALUES (4,'AS073','Modelos de programación para computación de datos','2',5,'optativa','PR004');
INSERT INTO asignatura VALUES (4,'AS074','Procesamiento y análisis de biosecuencias','2',5,'optativa','PR025');
INSERT INTO asignatura VALUES (4,'AS075','Programación para Internet de las Cosas (IoT)','2',5,'optativa','PR004');
INSERT INTO asignatura VALUES (4,'AS076','Sistemas de información empresarial','2',5,'optativa','PR005');
INSERT INTO asignatura VALUES (4,'AS077','Sistemas inteligentes de transporte','2',5,'optativa','PR006');
INSERT INTO asignatura VALUES (4,'AS078','Técnicas de previsión','2',5,'optativa','PR006');
INSERT INTO asignatura VALUES (4,'AS079','Tratamiento de datos geoespaciales','2',5,'optativa','PR002');
INSERT INTO asignatura VALUES (4,'AS080','Tratamiento de la infromación en IoT','2',5,'optativa','PR033');
INSERT INTO asignatura VALUES (4,'AS081','Visualización interactiva','2',5,'optativa','PR015');
INSERT INTO asignatura VALUES (4,'AS082','Inglés C1','1',5,'optativa','PR034');
INSERT INTO asignatura VALUES (4,'AS083','Inglés C2','2',5,'optativa','PR034');
INSERT INTO asignatura VALUES (5,'AS084','Fundamentos de tratamiento de datos para Data Science','1',6,'obligatoria','PR002');
INSERT INTO asignatura VALUES (5,'AS085','Modelos y aprendizaje estadístico','1',6,'obligatoria','PR008');
INSERT INTO asignatura VALUES (5,'AS086','Aprendizaje automático aplicado (Machine Learning)','1',6,'obligatoria','PR036');
INSERT INTO asignatura VALUES (5,'AS087','Minería de texto y procesamiento del lenguaje natural (PNL)','1',6,'obligatoria','PR036');
INSERT INTO asignatura VALUES (5,'AS088','Inteligencia de negocio y visualización','1',6,'obligatoria','PR036');
INSERT INTO asignatura VALUES (5,'AS089','Infraestructura Big Data','2',6,'obligatoria','PR036');
INSERT INTO asignatura VALUES (5,'AS090','Almacenamiento e integración de datos','2',6,'obligatoria','PR022');
INSERT INTO asignatura VALUES (5,'AS091','Valor y contexto de la analítica big data','2',6,'obligatoria','PR022');
INSERT INTO asignatura VALUES (5,'AS092','Aplicaciones analíticas. Casos Practicos','2',6,'obligatoria','PR022');
INSERT INTO asignatura VALUES (5,'AS093','Trabajo Fin de Master','2',6,'obligatoria','PR010');
INSERT INTO asignatura VALUES (5,'AS094','Curso de metodologías ágiles','2',6,'optativa','PR010');
INSERT INTO asignatura VALUES (6,'AS095','Técnicas y metodología de la minería de datos (SEMMA)','1',0,'optativa','PR002');
INSERT INTO asignatura VALUES (6,'AS096','Gestión y explotación de almacenes de datos','1',0,'optativa','PR002');
INSERT INTO asignatura VALUES (6,'AS097','Redes neuronales y algoritmos genéticos','1',0,'optativa','PR037');
INSERT INTO asignatura VALUES (6,'AS098','Gestión de relaciones con el cliente CRM','2',0,'optativa','PR005');
INSERT INTO asignatura VALUES (6,'AS099','Inteligencia de negocio y cuadro de mando integral','2',0,'optativa','PR005');
INSERT INTO asignatura VALUES (6,'AS100','Modelos de decisión en marketing','2',0,'optativa','PR005');

--Impartir
INSERT INTO impartir(idProfesor, idAsignatura)
VALUES('PR001', 'AS001'),
('PR029', 'AS001'),
('PR008', 'AS001'),
('PR002', 'AS002'),
('PR033', 'AS002'),
('PR046', 'AS002'),
('PR003', 'AS003'),
('PR002', 'AS003'),
('PR026', 'AS003'),
('PR004', 'AS004'),
('PR014', 'AS004'),
('PR003', 'AS004'),
('PR005', 'AS005'),
('PR035', 'AS005'),
('PR046', 'AS005'),
('PR004', 'AS006'),
('PR014', 'AS006'),
('PR002', 'AS006'),
('PR003', 'AS007'),
('PR011', 'AS007'),
('PR021', 'AS007'),
('PR008', 'AS008'),
('PR048', 'AS008'),
('PR013', 'AS008'),
('PR004', 'AS009'),
('PR020', 'AS009'),
('PR001', 'AS009'),
('PR002', 'AS010'),
('PR024', 'AS010'),
('PR025', 'AS010'),
('PR004', 'AS011'),
('PR010', 'AS011'),
('PR029', 'AS011'),
('PR002', 'AS012'),
('PR009', 'AS012'),
('PR026', 'AS012'),
('PR006', 'AS013'),
('PR020', 'AS013'),
('PR014', 'AS013'),
('PR002', 'AS014'),
('PR024', 'AS014'),
('PR021', 'AS014'),
('PR002', 'AS015'),
('PR004', 'AS015'),
('PR001', 'AS015'),
('PR007', 'AS016'),
('PR016', 'AS016'),
('PR041', 'AS016'),
('PR008', 'AS017'),
('PR026', 'AS017'),
('PR044', 'AS017'),
('PR008', 'AS018'),
('PR022', 'AS018'),
('PR033', 'AS018'),
('PR009', 'AS019'),
('PR034', 'AS019'),
('PR002', 'AS019'),
('PR004', 'AS020'),
('PR027', 'AS020'),
('PR022', 'AS020'),
('PR001', 'AS021'),
('PR048', 'AS021'),
('PR026', 'AS021'),
('PR006', 'AS022'),
('PR011', 'AS022'),
('PR006', 'AS022'),
('PR007', 'AS023'),
('PR008', 'AS023'),
('PR044', 'AS023'),
('PR009', 'AS024'),
('PR041', 'AS024'),
('PR041', 'AS024'),
('PR009', 'AS025'),
('PR018', 'AS025'),
('PR017', 'AS025'),
('PR010', 'AS026'),
('PR015', 'AS026'),
('PR012', 'AS026'),
('PR008', 'AS027'),
('PR023', 'AS027'),
('PR005', 'AS027'),
('PR010', 'AS028'),
('PR005', 'AS028'),
('PR002', 'AS028'),
('PR011', 'AS029'),
('PR014', 'AS029'),
('PR024', 'AS029'),
('PR010', 'AS030'),
('PR010', 'AS030'),
('PR030', 'AS030'),
('PR005', 'AS031'),
('PR037', 'AS031'),
('PR024', 'AS031'),
('PR006', 'AS032'),
('PR003', 'AS032'),
('PR039', 'AS032'),
('PR015', 'AS033'),
('PR045', 'AS033'),
('PR015', 'AS033'),
('PR024', 'AS034'),
('PR011', 'AS034'),
('PR001', 'AS034'),
('PR036', 'AS035'),
('PR008', 'AS035'),
('PR042', 'AS035'),
('PR020', 'AS036'),
('PR041', 'AS036'),
('PR022', 'AS036'),
('PR020', 'AS037'),
('PR020', 'AS037'),
('PR016', 'AS037'),
('PR020', 'AS038'),
('PR040', 'AS038'),
('PR019', 'AS038'),
('PR020', 'AS039'),
('PR020', 'AS039'),
('PR038', 'AS039'),
('PR002', 'AS040'),
('PR003', 'AS040'),
('PR010', 'AS040'),
('PR021', 'AS041'),
('PR023', 'AS041'),
('PR012', 'AS041'),
('PR005', 'AS042'),
('PR034', 'AS042'),
('PR017', 'AS042'),
('PR002', 'AS043'),
('PR014', 'AS043'),
('PR024', 'AS043'),
('PR002', 'AS044'),
('PR007', 'AS044'),
('PR011', 'AS044'),
('PR002', 'AS045'),
('PR047', 'AS045'),
('PR006', 'AS045'),
('PR016', 'AS046'),
('PR014', 'AS046'),
('PR014', 'AS046'),
('PR026', 'AS047'),
('PR036', 'AS047'),
('PR029', 'AS047'),
('PR005', 'AS048'),
('PR021', 'AS048'),
('PR037', 'AS048'),
('PR004', 'AS049'),
('PR040', 'AS049'),
('PR040', 'AS049'),
('PR002', 'AS050'),
('PR025', 'AS050'),
('PR043', 'AS050'),
('PR027', 'AS051'),
('PR024', 'AS051'),
('PR042', 'AS051'),
('PR027', 'AS052'),
('PR029', 'AS052'),
('PR039', 'AS052'),
('PR027', 'AS053'),
('PR044', 'AS053'),
('PR047', 'AS053'),
('PR027', 'AS054'),
('PR021', 'AS054'),
('PR028', 'AS054'),
('PR027', 'AS055'),
('PR029', 'AS055'),
('PR044', 'AS055'),
('PR011', 'AS056'),
('PR038', 'AS056'),
('PR043', 'AS056'),
('PR015', 'AS057'),
('PR020', 'AS057'),
('PR024', 'AS057'),
('PR002', 'AS058'),
('PR006', 'AS058'),
('PR039', 'AS058'),
('PR030', 'AS059'),
('PR022', 'AS059'),
('PR046', 'AS059'),
('PR031', 'AS060'),
('PR037', 'AS060'),
('PR005', 'AS060'),
('PR031', 'AS061'),
('PR028', 'AS061'),
('PR042', 'AS061'),
('PR031', 'AS062'),
('PR025', 'AS062'),
('PR047', 'AS062'),
('PR031', 'AS063'),
('PR042', 'AS063'),
('PR039', 'AS063'),
('PR031', 'AS064'),
('PR002', 'AS064'),
('PR002', 'AS064'),
('PR031', 'AS065'),
('PR006', 'AS065'),
('PR024', 'AS065'),
('PR031', 'AS066'),
('PR018', 'AS066'),
('PR038', 'AS066'),
('PR031', 'AS067'),
('PR048', 'AS067'),
('PR019', 'AS067'),
('PR031', 'AS068'),
('PR027', 'AS068'),
('PR029', 'AS068'),
('PR031', 'AS069'),
('PR038', 'AS069'),
('PR035', 'AS069'),
('PR031', 'AS070'),
('PR048', 'AS070'),
('PR020', 'AS070'),
('PR029', 'AS071'),
('PR041', 'AS071'),
('PR046', 'AS071'),
('PR005', 'AS072'),
('PR038', 'AS072'),
('PR035', 'AS072'),
('PR004', 'AS073'),
('PR023', 'AS073'),
('PR045', 'AS073'),
('PR025', 'AS074'),
('PR019', 'AS074'),
('PR010', 'AS074'),
('PR004', 'AS075'),
('PR028', 'AS075'),
('PR047', 'AS075'),
('PR005', 'AS076'),
('PR039', 'AS076'),
('PR010', 'AS076'),
('PR006', 'AS077'),
('PR004', 'AS077'),
('PR046', 'AS077'),
('PR006', 'AS078'),
('PR036', 'AS078'),
('PR020', 'AS078'),
('PR002', 'AS079'),
('PR031', 'AS079'),
('PR019', 'AS079'),
('PR033', 'AS080'),
('PR046', 'AS080'),
('PR019', 'AS080'),
('PR015', 'AS081'),
('PR045', 'AS081'),
('PR041', 'AS081'),
('PR034', 'AS082'),
('PR038', 'AS082'),
('PR023', 'AS082'),
('PR034', 'AS083'),
('PR023', 'AS083'),
('PR047', 'AS083'),
('PR002', 'AS084'),
('PR034', 'AS084'),
('PR011', 'AS084'),
('PR008', 'AS085'),
('PR008', 'AS085'),
('PR021', 'AS085'),
('PR036', 'AS086'),
('PR002', 'AS086'),
('PR038', 'AS086'),
('PR036', 'AS087'),
('PR001', 'AS087'),
('PR002', 'AS087'),
('PR036', 'AS088'),
('PR013', 'AS088'),
('PR028', 'AS088'),
('PR036', 'AS089'),
('PR004', 'AS089'),
('PR007', 'AS089'),
('PR022', 'AS090'),
('PR005', 'AS090'),
('PR035', 'AS090'),
('PR022', 'AS091'),
('PR038', 'AS091'),
('PR009', 'AS091'),
('PR022', 'AS092'),
('PR021', 'AS092'),
('PR022', 'AS092'),
('PR010', 'AS093'),
('PR040', 'AS093'),
('PR022', 'AS093'),
('PR010', 'AS094'),
('PR039', 'AS094'),
('PR028', 'AS094'),
('PR002', 'AS095'),
('PR029', 'AS095'),
('PR009', 'AS095'),
('PR002', 'AS096'),
('PR041', 'AS096'),
('PR045', 'AS096'),
('PR037', 'AS097'),
('PR036', 'AS097'),
('PR013', 'AS097'),
('PR005', 'AS098'),
('PR040', 'AS098'),
('PR014', 'AS098'),
('PR005', 'AS099'),
('PR044', 'AS099'),
('PR019', 'AS099'),
('PR005', 'AS100'),
('PR021', 'AS100'),
('PR026', 'AS100');


INSERT INTO alumno(idAlumno,NIF,nombre ,apellido1, apellido2, email,direccion,codigoPostal ,municipio,provincia,beca)
VALUES('AL001', '12345678A', 'Antonio', 'Garcia', 'Cano', 'antonio.garcia.cano@ucm.com', 'Calle de La Acebeda , 106', 28025, 'Batres', 'Madrid', FALSE),
('AL002', '12345679B', 'Jose', 'Gonzalez', 'Guerrero', 'jose.gonzalez.guerrero@ucm.com', 'Camino de La Aceña , 340', 28040, 'San Martín de Valdeiglesias', 'Madrid', FALSE),
('AL003', '12345680C', 'Maria Carmen', 'Rodriguez', 'Lozano', 'maria.carmen.rodriguez.lozano@ucm.com', 'Calle de La Adrada , 342', 28048, 'Horcajo de la Sierra-Aoslos', 'Madrid', FALSE),
('AL004', '12345681D', 'Maria', 'Fernandez', 'Cortes', 'maria.fernandez.cortes@ucm.com', 'Paraje La Aldehuela , 242', 28043, 'Cenicientos', 'Madrid', TRUE),
('AL005', '12345682E', 'Manuel', 'Lopez', 'Castillo', 'manuel.lopez.castillo@ucm.com', 'Paraje La Aldehuela , 154', 28022, 'Manzanares el Real', 'Madrid', FALSE),
('AL006', '12345683F', 'Francisco', 'Martinez', 'Santos', 'francisco.martinez.santos@ucm.com', 'Paraje La Aldehuela , 34', 28021, 'Cobeña', 'Madrid', FALSE),
('AL007', '12345684G', 'Carmen', 'Sanchez', 'Garrido', 'carmen.sanchez.garrido@ucm.com', 'Calle de La Alegría de la Huerta , 155', 28018, 'Parla', 'Madrid', FALSE),
('AL008', '12345685H', 'Juan', 'Perez', 'Medina', 'juan.perez.medina@ucm.com', 'Calle La Almazara , 487', 28037, 'Soto del Real', 'Madrid', FALSE),
('AL009', '12345686I', 'David', 'Gomez', 'Nuñez', 'david.gomez.nuñez@ucm.com', 'Plaza de La Almunia , 64', 28019, 'Colmenarejo', 'Madrid', TRUE),
('AL010', '12345687J', 'Josefa', 'Martin', 'Iglesias', 'josefa.martin.iglesias@ucm.com', 'Calle de La Bañeza , 464', 28044, 'Talamanca de Jarama', 'Madrid', FALSE),
('AL011', '12345688K', 'Jose Antonio', 'Jimenez', 'Sanz', 'jose.antonio.jimenez.sanz@ucm.com', 'Calle La Bruja , 355', 28046, 'Madrid', 'Madrid', FALSE),
('AL012', '12345689L', 'Jose Luis', 'Ruiz', 'Marin', 'jose.luis.ruiz.marin@ucm.com', 'Calle de La Cabaña , 30', 28036, 'Fuente el Saz de Jarama', 'Madrid', FALSE),
('AL013', '12345690M', 'Javier', 'Hernandez', 'Rubio', 'javier.hernandez.rubio@ucm.com', 'Calle de La Cabrera , 473', 28046, 'Alameda del Valle', 'Madrid', FALSE),
('AL014', '12345691N', 'Isabel', 'Diaz', 'Ortiz', 'isabel.diaz.ortiz@ucm.com', 'Camino de La Cabrera , 36', 28032, 'San Martín de Valdeiglesias', 'Madrid', TRUE),
('AL015', '12345692O', 'Jesus', 'Moreno', 'Castro', 'jesus.moreno.castro@ucm.com', 'Vereda de La Calderona , 423', 28020, 'Pelayos de la Presa', 'Madrid', FALSE),
('AL016', '12345693P', 'Francisco Javier', 'Alvarez', 'Delgado', 'francisco.javier.alvarez.delgado@ucm.com', 'Calle La Caleriza , 366', 28000, 'San Martín de la Vega', 'Madrid', FALSE),
('AL017', '12345694Q', 'Ana Maria', 'Muñoz', 'Ortega', 'ana.maria.muñoz.ortega@ucm.com', 'Calle de La Calesera , 304', 28016, 'Torrelodones', 'Madrid', FALSE),
('AL018', '12345695R', 'Carlos', 'Romero', 'Morales', 'carlos.romero.morales@ucm.com', 'Calle La Callejuela , 498', 28028, 'Navalagamella', 'Madrid', FALSE),
('AL019', '12345696S', 'Daniel', 'Alonso', 'Molina', 'daniel.alonso.molina@ucm.com', 'Urbanizacion La Campanera , 195', 28032, 'Pozuelo del Rey', 'Madrid', TRUE),
('AL020', '12345697T', 'Maria Dolores', 'Gutierrez', 'Suarez', 'maria.dolores.gutierrez.suarez@ucm.com', 'Calle de La Canción del Olvido , 79', 28001, 'Quijorna', 'Madrid', FALSE),
('AL021', '12345698U', 'Maria Pilar', 'Navarro', 'Blanco', 'maria.pilar.navarro.blanco@ucm.com', 'Calle La Canda , 268', 28016, 'Camarma de Esteruelas', 'Madrid', FALSE),
('AL022', '12345699V', 'Miguel', 'Torres', 'Serrano', 'miguel.torres.serrano@ucm.com', 'Calle de La Caoba , 500', 28044, 'Corpa', 'Madrid', FALSE),
('AL023', '12345700W', 'Maria Teresa', 'Dominguez', 'Ramirez', 'maria.teresa.dominguez.ramirez@ucm.com', 'Plaza de La Carolina , 358', 28006, 'Valdemorillo', 'Madrid', FALSE),
('AL024', '12345701X', 'Ana', 'Vazquez', 'Gil', 'ana.vazquez.gil@ucm.com', 'Calle de La Ceiba , 356', 28031, 'Cadalso de los Vidrios', 'Madrid', TRUE),
('AL025', '12345702Y', 'Rafael', 'Ramos', 'Ramos', 'rafael.ramos.ramos@ucm.com', 'Calle de La Cenicienta , 154', 28044, 'Aldea del Fresno', 'Madrid', FALSE),
('AL026', '12345703Z', 'Ana Maria', 'Muñoz', 'Ortega', 'ana.maria.muñoz.ortega2@ucm.com', 'Finca La Cervera , 372', 28053, 'Navalafuente', 'Madrid', FALSE),
('AL027', '12345704A', 'Pedro', 'Ramirez', 'Dominguez', 'pedro.ramirez.dominguez@ucm.com', 'Camino de La China a Vallecas , 37', 28048, 'Lozoyuela-Navas-Sieteiglesias', 'Madrid', FALSE),
('AL028', '12345705B', 'Laura', 'Serrano', 'Torres', 'laura.serrano.torres@ucm.com', 'Calle de La Chulapona , 85', 28037, 'Cobeña', 'Madrid', FALSE),
('AL029', '12345706C', 'Francisca', 'Blanco', 'Navarro', 'francisca.blanco.navarro@ucm.com', 'Calle La Cieguita de Getafe , 227', 28047, 'Gargantilla del Lozoya y Pinilla de Buitrago', 'Madrid', TRUE),
('AL030', '12345707D', 'Antonia', 'Suarez', 'Gutierrez', 'antonia.suarez.gutierrez@ucm.com', 'Plaza de La Corrala , 232', 28053, 'Morata de Tajuña', 'Madrid', FALSE),
('AL031', '12345708E', 'Alejandro', 'Molina', 'Alonso', 'alejandro.molina.alonso@ucm.com', 'Calle de La Corte de Faraón , 139', 28016, 'Campo Real', 'Madrid', FALSE),
('AL032', '12345709F', 'Dolores', 'Morales', 'Romero', 'dolores.morales.romero@ucm.com', 'Calle La Coruña , 377', 28054, 'Zarzalejo', 'Madrid', FALSE),
('AL033', '12345710G', 'Angel', 'Ortega', 'Muñoz', 'angel.ortega.Muñoz@ucm.com', 'Calle La Coruña , 294', 28017, 'Valdaracete', 'Madrid', FALSE),
('AL034', '12345711H', 'Maria Angeles', 'Delgado', 'Alvarez', 'maria.angeles.delgado.alvarez@ucm.com', 'Calle de La Coruña , 474', 28049, 'La Serna del Monte', 'Madrid', TRUE),
('AL035', '12345712I', 'Cristina', 'Castro', 'Moreno', 'cristina.castro.moreno@ucm.com', 'Calle de La Coruña , 373', 28017, 'Morata de Tajuña', 'Madrid', FALSE),
('AL036', '12345713J', 'Miguel Angel', 'Ortiz', 'Diaz', 'miguel.angel.ortiz.diaz@ucm.com', 'Calle La Coruña , 379', 28016, 'Garganta de los Montes', 'Madrid', FALSE),
('AL037', '12345714K', 'Jose Maria', 'Rubio', 'Hernandez', 'jose.maria.rubio.hernandez@ucm.com', 'Calle La Coruña , 420', 28039, 'Daganzo de Arriba', 'Madrid', FALSE),
('AL038', '12345715L', 'Fernando', 'Marin', 'Ruiz', 'fernando.marin.ruiz@ucm.com', 'Calle La Cruz , 248', 28006, 'Tielmes', 'Madrid', FALSE),
('AL039', '12345716M', 'Marta', 'Sanz', 'Jimenez', 'marta.sanz.jimenez@ucm.com', 'Travesia La Dehesa , 55', 28003, 'La Serna del Monte', 'Madrid', TRUE),
('AL040', '12345717N', 'Luis', 'Nuñez', 'Martin', 'luis.Nuñez.martin@ucm.com', 'Calle de La del Manojo de Rosas , 396', 28029, 'Olmeda de las Fuentes', 'Madrid', FALSE),
('AL041', '12345718O', 'Maria Jose', 'Iglesias', 'Gomez', 'maria.jose.iglesias.gomez@ucm.com', 'Calle de La del Soto del Parral , 274', 28021, 'Rascafría', 'Madrid', FALSE),
('AL042', '12345719P', 'Maria Isabel', 'Medina', 'Perez', 'maria.isabel.medina.perez@ucm.com', 'Calle de La Diligencia , 173', 28026, 'Ambite', 'Madrid', FALSE),
('AL043', '12345720Q', 'Pablo', 'Garrido', 'Sanchez', 'pablo.garrido.sanchez@ucm.com', 'Calle de La Dolorosa , 195', 28055, 'Valdaracete', 'Madrid', FALSE),
('AL044', '12345721R', 'Sergio', 'Santos', 'Martinez', 'sergio.santos.martinez@ucm.com', 'Parque de La Elipa , 292', 28041, 'Navarredonda y San Mamés', 'Madrid', TRUE),
('AL045', '12345722S', 'Jorge', 'Castillo', 'Lopez', 'jorge.castillo.lopez@ucm.com', 'Calle La Encina , 379', 28040, 'Tielmes', 'Madrid', FALSE),
('AL046', '12345723T', 'Alberto', 'Cortes', 'Fernandez', 'alberto.cortes.fernandez@ucm.com', 'Lugar La Encinilla , 116', 28028, 'Boadilla del Monte', 'Madrid', FALSE),
('AL047', '12345724U', 'Pilar', 'Lozano', 'Rodriguez', 'pilar.lozano.rodriguez@ucm.com', 'Camino de La Ermita de Valmayor , 357', 28051, 'El Berrueco', 'Madrid', FALSE),
('AL048', '12345725V', 'Maria Luisa', 'Guerrero', 'Gonzalez', 'maria.luisa.guerrero.gonzalez@ucm.com', 'Urbanizacion La Ermita , 483', 28001, 'Los Molinos', 'Madrid', FALSE),
('AL049', '12345726W', 'Lucia', 'Cano', 'Garcia', 'lucia.cano.garcia@ucm.com', 'Calle de La Escala , 229', 28051, 'San Martín de la Vega', 'Madrid', TRUE),
('AL050', '12345727X', 'Antonio', 'Alonso', 'Paredes', 'antonio.alonso.paredes@ucm.com', 'Calle de La Escuela de Vallecas , 125', 28027, 'Nuevo Baztán', 'Madrid', FALSE),
('AL051', '12345728Y', 'Jose', 'Alvarez', 'Anton', 'jose.alvarez.anton@ucm.com', 'Calle de La Española , 91', 28048, 'Loeches', 'Madrid', FALSE),
('AL052', '12345729Z', 'Maria Carmen', 'Blanco', 'Ballesteros', 'maria.carmen.blanco.ballesteros@ucm.com', 'Calle de La Estrada , 37', 28023, 'Moraleja de Enmedio', 'Madrid', FALSE),
('AL053', '12345730A', 'Maria', 'Cano', 'Valverde', 'maria.cano.valverde@ucm.com', 'Lugar La Fábrica , 97', 28006, 'Horcajuelo de la Sierra', 'Madrid', FALSE),
('AL054', '12345731B', 'Manuel', 'Castillo', 'Maldonado', 'manuel.castillo.maldonado@ucm.com', 'Finca La Flamenca , 97', 28036, 'Torrejón de Ardoz', 'Madrid', TRUE),
('AL055', '12345732C', 'Francisco', 'Castro', 'Bautista', 'francisco.castro.bautista@ucm.com', 'Calle La Flor de la Mancha , 391', 28014, 'Puentes Viejas', 'Madrid', FALSE),
('AL056', '12345733D', 'Carmen', 'Cortes', 'Valle', 'carmen.cortes.valle@ucm.com', 'Calle de La Fuente , 12', 28050, 'Montejo de la Sierra', 'Madrid', FALSE),
('AL057', '12345734E', 'Juan', 'Delgado', 'Ponce', 'juan.delgado.ponce@ucm.com', 'Finca La Gamonosa , 134', 28024, 'Humanes de Madrid', 'Madrid', FALSE),
('AL058', '12345735F', 'David', 'Diaz', 'Rodrigo', 'david.diaz.rodrigo@ucm.com', 'Avenida de La Gavia , 274', 28037, 'Braojos de la Sierra', 'Madrid', FALSE),
('AL059', '12345736G', 'Josefa', 'Dominguez', 'Lorente', 'josefa.dominguez.lorente@ucm.com', 'Calle La Granja , 68', 28025, 'Torrejón de Velasco', 'Madrid', TRUE),
('AL060', '12345737H', 'Jose Antonio', 'Fernandez', 'Oliva', 'jose.antonio.fernandez.oliva@ucm.com', 'Camino de La Granja , 314', 28012, 'Robledillo de la Jara', 'Madrid', FALSE),
('AL061', '12345738I', 'Jose Luis', 'Garcia', 'Juan', 'jose.luis.garcia.juan@ucm.com', 'Carretera de La Granja , 191', 28053, 'Robledillo de la Jara', 'Madrid', FALSE),
('AL062', '12345739J', 'Javier', 'Garrido', 'Cordero', 'javier.garrido.cordero@ucm.com', 'Calle de La Granja de San Ildefonso , 41', 28024, 'Santa María de la Alameda', 'Madrid', FALSE),
('AL063', '12345740K', 'Isabel', 'Gil', 'Mas', 'isabel.gil.mas@ucm.com', 'Glorieta de La Granjuela , 370', 28013, 'Meco', 'Madrid', FALSE),
('AL064', '12345741L', 'Jesus', 'Gomez', 'Collado', 'jesus.gomez.collado@ucm.com', 'Avenida de La Guindalera , 236', 28049, 'Villalbilla', 'Madrid', TRUE),
('AL065', '12345742A', 'Francisco Javier', 'Gonzalez', 'Murillo', 'francisco.javier.gonzalez.murillo@ucm.com', 'Bulevar de La Habana , 455', 28009, 'Alcalá de Henares', 'Madrid', FALSE),
('AL066', '12345743B', 'Ana Maria', 'Guerrero', 'Pozo', 'ana.maria.guerrero.pozo@ucm.com', 'Calle de La Habana , 269', 28021, 'Valdeolmos-Alalpardo', 'Madrid', FALSE),
('AL067', '12345744C', 'Carlos', 'Gutierrez', 'De La Cruz', 'carlos.gutierrez.de.la.cruz@ucm.com', 'Calle La Haya , 327', 28052, 'Colmenar del Arroyo', 'Madrid', FALSE),
('AL068', '12345745D', 'Daniel', 'Hernandez', 'Cuenca', 'daniel.hernandez.cuenca@ucm.com', 'Calle La Haya , 281', 28032, 'Valdetorres de Jarama', 'Madrid', FALSE),
('AL069', '12345746E', 'Maria Dolores', 'Iglesias', 'Montoya', 'maria.dolores.iglesias.montoya@ucm.com', 'Calle La Herrería , 291', 28036, 'Collado Villalba', 'Madrid', TRUE),
('AL070', '12345747F', 'Maria Pilar', 'Jimenez', 'Martos', 'maria.pilar.jimenez.martos@ucm.com', 'Calle de La Hiruela , 30', 28018, 'Rivas-Vaciamadrid', 'Madrid', FALSE),
('AL071', '12345748G', 'Miguel', 'Lopez', 'Cuevas', 'miguel.lopez.cuevas@ucm.com', 'Carretera de La Hiruela-Cardoso , 275', 28039, 'Horcajo de la Sierra-Aoslos', 'Madrid', FALSE),
('AL072', '12345749H', 'Maria Teresa', 'Lozano', 'Marco', 'maria.teresa.lozano.marco@ucm.com', 'Carretera de La Hiruela-Montejo de la Sierra , 404', 28005, 'Rascafría', 'Madrid', FALSE),
('AL073', '12345750I', 'Ana', 'Marin', 'Barroso', 'ana.marin.barroso@ucm.com', 'Calle de La Huerta de los Rueda , 242', 28015, 'Zarzalejo', 'Madrid', FALSE),
('AL074', '12345751J', 'Rafael', 'Martin', 'Ros', 'rafael.martin.ros@ucm.com', 'Calle La Imagen , 9', 28045, 'Las Rozas de Madrid', 'Madrid', TRUE),
('AL075', '12345752K', 'Jose Manuel', 'Martinez', 'Quesada', 'jose.manuel.martinez.quesada@ucm.com', 'Finca La Isabela , 471', 28036, 'Villar del Olmo', 'Madrid', FALSE),
('AL076', '12345753L', 'Pedro', 'Medina', 'De La Torre', 'pedro.medina.de.la.torre@ucm.com', 'Finca La Josefilla , 211', 28020, 'Anchuelo', 'Madrid', FALSE),
('AL077', '12345754M', 'Laura', 'Molina', 'Barrera', 'laura.molina.barrera@ucm.com', 'Calle de La Latina , 116', 28017, 'Sevilla la Nueva', 'Madrid', FALSE),
('AL078', '12345755N', 'Francisca', 'Morales', 'Ordoñez', 'francisca.morales.ordoñez@ucm.com', 'Calle de La Línea de la Concepción , 400', 28031, 'Villaconejos', 'Madrid', FALSE),
('AL079', '12345756O', 'Antonia', 'Moreno', 'Gimeno', 'antonia.moreno.gimeno@ucm.com', 'Calle de La Lobera , 376', 28033, 'Navalcarnero', 'Madrid', TRUE),
('AL080', '12345757P', 'Alejandro', 'Muñóz', 'Corral', 'alejandro.muñoz.corral@ucm.com', 'Calle La Lobera , 102', 28016, 'Lozoya', 'Madrid', FALSE),
('AL081', '12345758Q', 'Dolores', 'Navarro', 'Alba', 'dolores.navarro.alba@ucm.com', 'Calle La Lorija , 104', 28006, 'Paracuellos de Jarama', 'Madrid', FALSE),
('AL082', '12345759R', 'Angel', 'Nuñez', 'Puig', 'angel.Nuñez.puig@ucm.com', 'Calle La Luna , 171', 28006, 'Móstoles', 'Madrid', FALSE),
('AL083', '12345760S', 'Maria Angeles', 'Ortega', 'Cabello', 'maria.angeles.ortega.cabello@ucm.com', 'Parque de La Maceta , 69', 28051, 'Berzosa del Lozoya', 'Madrid', FALSE),
('AL084', '12345761T', 'Cristina', 'Ortiz', 'Pulido', 'cristina.ortiz.pulido@ucm.com', 'Plaza de La Mancha , 135', 28014, 'Velilla de San Antonio', 'Madrid', TRUE),
('AL085', '12345762U', 'Miguel Angel', 'Perez', 'Rojo', 'miguel.angel.perez.rojo@ucm.com', 'Calle de La Manga , 411', 28019, 'Ajalvir', 'Madrid', FALSE),
('AL086', '12345763V', 'Jose Maria', 'Ramirez', 'Navas', 'jose.maria.ramirez.navas@ucm.com', 'Calle de La Martina , 56', 28053, 'Leganés', 'Madrid', FALSE),
('AL087', '12345764W', 'Fernando', 'Ramos', 'Saiz', 'fernando.ramos.saiz@ucm.com', 'Calle de La Maso , 168', 28043, 'Boadilla del Monte', 'Madrid', FALSE),
('AL088', '12345765X', 'Marta', 'Rodriguez', 'Soria', 'marta.rodriguez.soria@ucm.com', 'Calle La Merced , 84', 28010, 'Valdepiélagos', 'Madrid', FALSE),
('AL089', '12345766Y', 'Luis', 'Romero', 'Arenas', 'luis.romero.arenas@ucm.com', 'Finca La Montaña , 385', 28002, 'Lozoyuela-Navas-Sieteiglesias', 'Madrid', TRUE),
('AL090', '12345767Z', 'Maria Jose', 'Rubio', 'Aguado', 'maria.jose.rubio.aguado@ucm.com', 'Glorieta de La Moraleja , 153', 28030, 'Valverde de Alcalá','Madrid', FALSE),
('AL091', '12345768A', 'Maria Isabel', 'Ruiz', 'Domingo', 'maria.isabel.ruiz.domingo@ucm.com', 'Camino de La Muela , 170', 28004, 'Coslada', 'Madrid', FALSE),
('AL092', '12345769B', 'Pablo', 'Sanchez', 'Galindo', 'pablo.sanchez.galindo@ucm.com', 'Camino de La Muñoza , 279', 28038, 'Titulcia', 'Madrid', FALSE),
('AL093', '12345770C', 'Sergio', 'Santos', 'Vallejo', 'sergio.santos.vallejo@ucm.com', 'Carretera de La Muñoza , 328', 28038, 'El Escorial', 'Madrid', FALSE),
('AL094', '12345771D', 'Jorge', 'Sanz', 'Mena', 'jorge.sanz.mena@ucm.com', 'Calle la La Nevera , 278', 28031, 'Santa María de la Alameda', 'Madrid', TRUE),
('AL095', '12345772E', 'Alberto', 'Serrano', 'Escribano', 'alberto.serrano.escribano@ucm.com', 'Calle de La Palma , 159', 28020, 'Villamantilla', 'Madrid', FALSE),
('AL096', '12345773F', 'Pilar', 'Suarez', 'Asensio', 'pilar.suarez.asensio@ucm.com', 'Calle La Palma , 354', 28029, 'Valdetorres de Jarama', 'Madrid', FALSE),
('AL097', '12345774G', 'Maria Luisa', 'Torres', 'Ramon', 'maria.luisa.torres.ramon@ucm.com', 'Calle La Palma , 354', 28024, 'Valdilecha', 'Madrid', FALSE),
('AL098', '12345775H', 'Lucia', 'Vazquez', 'Valencia', 'lucia.vazquez.valencia@ucm.com', 'Finca La Paloma , 181', 28003, 'Cercedilla', 'Madrid', FALSE),
('AL099', '12345776I', 'Antonio', 'Gallego De La Sacristana', 'Lucas', 'antonio.gallego.de.la.sacristana.lucas@ucm.com', 'Calle La Pasa , 307', 28034, 'Villaconejos', 'Madrid', TRUE),
('AL100', '12345777J', 'Jose', 'Boquer', 'Caro', 'jose.boquer.caro@ucm.com', 'Calle La Patata , 261', 28032, 'Nuevo Baztán', 'Madrid', FALSE),
('AL101', '12345778K', 'Maria Carmen', 'Bonelli', 'Blanco', 'maria.carmen.bonelli.blanco@ucm.com', 'Calle de La Patilla , 209', 28033, 'Villaviciosa de Odón', 'Madrid', FALSE),
('AL102', '12345779L', 'Maria', 'Sanchez Giron', 'Cano', 'maria.sanchez.giron.cano@ucm.com', 'Calle La Paz , 407', 28018, 'Serranillos del Valle', 'Madrid', FALSE),
('AL103', '12345780A', 'Manuel', 'Lisart', 'Castillo', 'manuel.lisart.castillo@ucm.com', 'Parque La Paz , 497', 28034, 'Santa María de la Alameda', 'Madrid', FALSE),
('AL104', '12345781B', 'Francisco', 'Baroni', 'Castro', 'francisco.baroni.castro@ucm.com', 'Parque La Paz , 57', 28054, 'Galapagar', 'Madrid', TRUE),
('AL105', '12345782C', 'Carmen', 'Perez De Gracia', 'Cortes', 'carmen.perez.de.gracia.cortes@ucm.com', 'Calle La Pedriza , 162', 28026, 'Ajalvir', 'Madrid', FALSE),
('AL106', '12345783D', 'Juan', 'Maravi', 'Delgado', 'juan.maravi.delgado@ucm.com', 'Calle de La Pícara Molinera , 421', 28047, 'Puentes Viejas', 'Madrid', FALSE),
('AL107', '12345784E', 'David', 'Ahechu', 'Diaz', 'david.ahechu.diaz@ucm.com', 'Calle de La Poveda , 432', 28008, 'Valdemaqueda', 'Madrid', FALSE),
('AL108', '12345785F', 'Josefa', 'Ito', 'Dominguez', 'josefa.ito.dominguez@ucm.com', 'Pasaje de La Poveda , 183', 28037, 'Tielmes', 'Madrid', FALSE),
('AL109', '12345786G', 'Jose Antonio', 'Tsankova', 'Fernandez', 'jose.antonio.tsankova.fernandez@ucm.com', 'Paraje La Poveda y Albanales , 391', 28046, 'Cercedilla', 'Madrid', TRUE),
('AL110', '12345787H', 'Jose Luis', 'Atrari', 'Garcia', 'jose.luis.atrari.garcia@ucm.com', 'Diseminado La Presa y el Cercado , 372', 28020, 'Miraflores de la Sierra', 'Madrid', FALSE),
('AL111', '12345788I', 'Javier', 'Sidi Mohamed', 'Garrido', 'javier.sidi.mohamed.garrido@ucm.com', 'Calle de La Provenza , 247', 28046, 'Cenicientos', 'Madrid', FALSE),
('AL112', '12345789J', 'Isabel', 'El Basri', 'Gil', 'isabel.el.basri.gil@ucm.com', 'Calle de La Pueblanueva , 255', 28013, 'Ciempozuelos', 'Madrid', FALSE),
('AL113', '12345790K', 'Jesus', 'Lindstrom', 'Gomez', 'jesus.lindstrom.gomez@ucm.com', 'Paraje La Quirana , 341', 28050, 'Villaviciosa de Odón', 'Madrid', FALSE),
('AL114', '12345791L', 'Francisco Javier', 'Rizzi', 'Gonzalez', 'francisco.javier.rizzi.gonzalez@ucm.com', 'Calle La Rábida , 167', 28003, 'El Boalo', 'Madrid', TRUE),
('AL115', '12345792M', 'Ana Maria', 'Suleiman', 'Guerrero', 'ana.maria.suleiman.guerrero@ucm.com', 'Calle de La Rábida , 223', 28029, 'Camarma de Esteruelas', 'Madrid', FALSE),
('AL116', '12345793N', 'Alejandro', 'Molina', 'Alonso', 'alejandro.molina.alonso2@ucm.com', 'Calle La Raya , 200', 28007, 'Aldea del Fresno', 'Madrid', FALSE),
('AL117', '12345794O', 'Daniel', 'Logan', 'Hernandez', 'daniel.logan.hernandez@ucm.com', 'Calle de La Reina de África , 472', 28004, 'Villamanta', 'Madrid', FALSE),
('AL118', '12345795P', 'Maria Dolores', 'Riedel', 'Iglesias', 'maria.dolores.riedel.iglesias@ucm.com', 'Plaza de La Remonta , 259', 28044, 'Moraleja de Enmedio', 'Madrid', FALSE),
('AL119', '12345796Q', 'Maria Pilar', 'Rohde', 'Jimenez', 'maria.pilar.rohde.jimenez@ucm.com', 'Pasaje de La Remonta , 479', 28008, 'Parla', 'Madrid', TRUE),
('AL120', '12345797R', 'Miguel', 'Yousef', 'Lopez', 'miguel.yousef.lopez@ucm.com', 'Calle de La Restauración , 302', 28013, 'El Berrueco', 'Madrid', FALSE),
('AL121', '12345798S', 'Maria Teresa', 'Flanagan', 'Lozano', 'maria.teresa.flanagan.lozano@ucm.com', 'Camino La Retuerta-acceso por Municipio de Buitrago , 285', 28029, 'Pinto', 'Madrid', FALSE),
('AL122', '12345799T', 'Ana', 'Nejjar', 'Marin', 'ana.nejjar.marin@ucm.com', 'Calle de La Revoltosa , 420', 28031, 'Perales de Tajuña', 'Madrid', FALSE),
('AL123', '12345800U', 'Rafael', 'Strauss', 'Martin', 'rafael.strauss.martin@ucm.com', 'Plaza La Rinconada , 76', 28054, 'Titulcia', 'Madrid', FALSE),
('AL124', '12345801V', 'Jose Manuel', 'Taoufik', 'Martinez', 'jose.manuel.taoufik.martinez@ucm.com', 'Calle de La Rioja , 320', 28044, 'El Molar', 'Madrid', TRUE),
('AL125', '12345802W', 'Pedro', 'Abu', 'Medina', 'pedro.abu.medina@ucm.com', 'Calle de La Rioja , 378', 28044, 'Manzanares el Real', 'Madrid', FALSE),
('AL126', '12345803X', 'Laura', 'Sheehan', 'Molina', 'laura.sheehan.molina@ucm.com', 'Calle La Rioja , 498', 28032, 'Redueña', 'Madrid', FALSE),
('AL127', '12345804Y', 'Francisca', 'Benkirane', 'Morales', 'francisca.benkirane.morales@ucm.com', 'Calle de La Rioja , 242', 28005, 'Fuentidueña de Tajo', 'Madrid', FALSE),
('AL128', '12345805Z', 'Antonia', 'Chait', 'Moreno', 'antonia.chait.moreno@ucm.com', 'Calle de La Rioja , 354', 28039, 'Villarejo de Salvanés', 'Madrid', FALSE),
('AL129', '12345806A', 'Alejandro', 'Gergely', 'Muñoz', 'alejandro.gergely.Muñoz@ucm.com', 'Calle La Rioja , 112', 28050, 'Navalagamella', 'Madrid', TRUE),
('AL130', '12345807B', 'Dolores', 'Hendriks', 'Navarro', 'dolores.hendriks.navarro@ucm.com', 'Glorieta de La Rioja , 237', 28036, 'Guadarrama', 'Madrid', FALSE),
('AL131', '12345808C', 'Angel', 'Osagiede', 'Nuñez', 'angel.osagiede.Nuñez@ucm.com', 'Travesia de La Rioja , 127', 28008, 'Garganta de los Montes', 'Madrid', FALSE),
('AL132', '12345809D', 'Maria Angeles', 'Tihomirova', 'Ortega', 'maria.angeles.tihomirova.ortega@ucm.com', 'Calle de La Riviera , 475', 28047, 'Parla', 'Madrid', FALSE),
('AL133', '12345810E', 'Cristina', 'Rahoui', 'Ortiz', 'cristina.rahoui.ortiz@ucm.com', 'Parque La Rivota , 499', 28031, 'Puentes Viejas', 'Madrid', FALSE),
('AL134', '12345811F', 'Miguel Angel', 'Wilk', 'Perez', 'miguel.angel.wilk.perez@ucm.com', 'Calle de La Robla , 166', 28047, 'Hoyo de Manzanares', 'Madrid', TRUE),
('AL135', '12345812G', 'Jose Maria', 'Allison', 'Ramirez', 'jose.maria.allison.ramirez@ucm.com', 'Avenida de La Roda , 76', 28009, 'Titulcia', 'Madrid', FALSE),
('AL136', '12345813H', 'Fernando', 'Drummond', 'Ramos', 'fernando.drummond.ramos@ucm.com', 'Calle La Rosa , 118', 28030, 'Colmenar Viejo', 'Madrid', FALSE),
('AL137', '12345814I', 'Marta', 'El Mahmoudi', 'Rodriguez', 'marta.el.mahmoudi.rodriguez@ucm.com', 'Calle de La Rosa del Azafrán , 124', 28029, 'Pozuelo del Rey', 'Madrid', FALSE),
('AL138', '12345815J', 'Luis', 'Marzak', 'Romero', 'luis.marzak.romero@ucm.com', 'Calle de La Salle , 112', 28007, 'Cervera de Buitrago', 'Madrid', FALSE),
('AL139', '12345816K', 'Maria Jose', 'Benbrahim', 'Rubio', 'maria.jose.benbrahim.rubio@ucm.com', 'Calle de La Serna del Monte , 386', 28026, 'La Cabrera', 'Madrid', TRUE),
('AL140', '12345817L', 'Maria Isabel', 'Costantini', 'Ruiz', 'maria.isabel.costantini.ruiz@ucm.com', 'Camino de La solana , 265', 28003, 'Patones', 'Madrid', FALSE),
('AL141', '12345818A', 'Pablo', 'Diakhite', 'Sanchez', 'pablo.diakhite.sanchez@ucm.com', 'Calle de La Tabernera del Puerto , 13', 28038, 'Algete', 'Madrid', FALSE),
('AL142', '12345819B', 'Sergio', 'Petrenko', 'Santos', 'sergio.petrenko.santos@ucm.com', 'Calle de La Tenería , 153', 28009, 'Colmenar Viejo', 'Madrid', FALSE),
('AL143', '12345820C', 'Jorge', 'Arnautu', 'Sanz', 'jorge.arnautu.sanz@ucm.com', 'Calle La Tercia , 447', 28003, 'Navalafuente', 'Madrid', FALSE),
('AL144', '12345821D', 'Alberto', 'Hood', 'Serrano', 'alberto.hood.serrano@ucm.com', 'Calle La Tina , 203', 28025, 'Humanes de Madrid', 'Madrid', TRUE),
('AL145', '12345822E', 'Pilar', 'Lawton', 'Suarez', 'pilar.lawton.suarez@ucm.com', 'Calle La Torre , 166', 28055, 'Miraflores de la Sierra', 'Madrid', FALSE),
('AL146', '12345823F', 'Maria Luisa', 'Bakri', 'Torres', 'maria.luisa.bakri.torres@ucm.com', 'Calle La Valeta , 242', 28031, 'Madrid', 'Madrid', FALSE),
('AL147', '12345824G', 'Lucia', 'Detesan', 'Vazquez', 'lucia.detesan.vazquez@ucm.com', 'Calle La Varga , 79', 28044, 'Cadalso de los Vidrios', 'Madrid', FALSE),
('AL148', '12345825H', 'Antonio', 'Holder', 'Vazquez', 'antonio.holder.vazquez@ucm.com', 'Calle de La Vega , 250', 28053, 'Cadalso de los Vidrios', 'Madrid', FALSE),
('AL149', '12345826I', 'Jose', 'Sawyer', 'Torres', 'jose.sawyer.torres@ucm.com', 'Avenida de La Verbena de la Paloma , 275', 28030, 'Robledo de Chavela', 'Madrid', TRUE),
('AL150', '12345827J', 'Maria Carmen', 'Kocsis', 'Suarez', 'maria.carmen.kocsis.suarez@ucm.com', 'Calle de La Violetera , 25', 28034, 'Santa María de la Alameda', 'Madrid', FALSE),
('AL151', '12345828K', 'Maria', 'Chelu', 'Serrano', 'maria.chelu.serrano@ucm.com', 'Calle de La Zubia , 402', 28046, 'Torrejón de la Calzada', 'Madrid', FALSE),
('AL152', '12345829L', 'Manuel', 'Costinas', 'Sanz', 'manuel.costinas.sanz@ucm.com', 'Calle los Labajos , 92', 28052, 'Cubas de la Sagra', 'Madrid', FALSE),
('AL153', '12345830M', 'Francisco', 'Diakhaby', 'Santos', 'francisco.diakhaby.santos@ucm.com', 'Calle de Labajos , 104', 28023, 'Villanueva del Pardillo', 'Madrid', FALSE),
('AL154', '12345831N', 'Carmen', 'Fateh', 'Sanchez', 'carmen.fateh.sanchez@ucm.com', 'Camino de los Labajos , 400', 28004, 'Villanueva de Perales', 'Madrid', TRUE),
('AL155', '12345832O', 'Juan', 'Gaman', 'Ruiz', 'juan.gaman.ruiz@ucm.com', 'Camino de los Labajos , 243', 28055, 'Buitrago del Lozoya', 'Madrid', FALSE),
('AL156', '12345833P', 'David', 'Ileni', 'Rubio', 'david.ileni.rubio@ucm.com', 'Calle de Labastida , 171', 28035, 'Villanueva de Perales', 'Madrid', FALSE),
('AL157', '12345834Q', 'Josefa', 'Larion', 'Romero', 'josefa.larion.romero@ucm.com', 'Calle Laberinto , 336', 28042, 'Villarejo de Salvanés', 'Madrid', FALSE),
('AL158', '12345835R', 'Jose Antonio', 'Marinica', 'Rodriguez', 'jose.antonio.marinica.rodriguez@ucm.com', 'Calle del Laberinto de Amor , 346', 28053, 'Pinilla del Valle', 'Madrid', FALSE),
('AL159', '12345836S', 'Jose Luis', 'Patras', 'Ramos', 'jose.luis.patras.ramos@ucm.com', 'Plaza del Laberinto , 244', 28052, 'Aldea del Fresno', 'Madrid', TRUE),
('AL160', '12345837T', 'Javier', 'Simonyan', 'Ramirez', 'javier.simonyan.ramirez@ucm.com', 'Avenida Laboral , 128', 28005, 'Braojos de la Sierra', 'Madrid', FALSE),
('AL161', '12345838U', 'Isabel', 'Suleman', 'Perez', 'isabel.suleman.perez@ucm.com', 'Calle del Laboratorio , 18', 28047, 'Olmeda de las Fuentes', 'Madrid', FALSE),
('AL162', '12345839V', 'Jesus', 'Ursaru', 'Ortiz', 'jesus.ursaru.ortiz@ucm.com', 'Carretera del Laboratorio de O.P. , 153', 28008, 'Los Molinos', 'Madrid', FALSE),
('AL163', '12345840W', 'Francisco Javier', 'Pérez', 'Ortega', 'francisco.javier.perez.ortega@ucm.com', 'Plaza las Labores , 37', 28045, 'Buitrago del Lozoya', 'Madrid', FALSE),
('AL164', '12345841X', 'Ana Maria', 'Taza', 'Nuñez', 'ana.maria.taza.Nuñez@ucm.com', 'Senda de Labores , 417', 28010, 'Braojos de la Sierra', 'Madrid', TRUE),
('AL165', '12345842Y', 'Carlos', 'Valdajos', 'Navarro', 'carlos.valdajos.navarro@ucm.com', 'Calle Labrador , 314', 28038, 'El Atazar', 'Madrid', FALSE),
('AL166', '12345843Z', 'Daniel', 'Conget', 'Muñoz', 'daniel.conget.Muñoz@ucm.com', 'Calle del Labrador , 443', 28043, 'Aranjuez', 'Madrid', FALSE),
('AL167', '12345844A', 'Maria Dolores', 'Garra', 'Moreno', 'maria.dolores.garra.moreno@ucm.com', 'Calle del Labrador , 442', 28052, 'Villar del Olmo', 'Madrid', FALSE),
('AL168', '12345845B', 'Maria Pilar', 'Bereciartu', 'Morales', 'maria.pilar.bereciartu.morales@ucm.com', 'Calle del Labrador , 224', 28002, 'Velilla de San Antonio', 'Madrid', FALSE),
('AL169', '12345846C', 'Miguel', 'Ochandio', 'Molina', 'miguel.ochandio.molina@ucm.com', 'Calle del Labrador , 408', 28032, 'Soto del Real', 'Madrid', TRUE),
('AL170', '12345847D', 'Maria Teresa', 'Chies', 'Medina', 'maria.teresa.chies.medina@ucm.com', 'Calle Labradora , 146', 28006, 'Venturada', 'Madrid', FALSE),
('AL171', '12345848E', 'Ana', 'Frochoso', 'Martinez', 'ana.frochoso.martinez@ucm.com', 'Avenida de los Labradores , 272', 28048, 'Getafe', 'Madrid', FALSE),
('AL172', '12345849F', 'Rafael', 'Griñolo', 'Martin', 'rafael.griñolo.martin@ucm.com', 'Calle Labradores , 103', 28046, 'Chapinería', 'Madrid', FALSE),
('AL173', '12345850G', 'Jose Manuel', 'Sterling', 'Marin', 'jose.manuel.sterling.marin@ucm.com', 'Calle de los Labradores , 7', 28047, 'Collado Mediano', 'Madrid', FALSE),
('AL174', '12345851H', 'Alejandro', 'Molina', 'Alonso', 'alejandro.molina.alonso3@ucm.com', 'Calle Labradores , 160', 28048, 'Chinchón', 'Madrid', TRUE),
('AL175', '12345852I', 'Laura', 'Arambulo', 'Lopez', 'laura.arambulo.lopez@ucm.com', 'Calle de los Labradores , 229', 28000, 'Boadilla del Monte', 'Madrid', FALSE),
('AL176', '12345853J', 'Francisca', 'Chenel', 'Jimenez', 'francisca.chenel.jimenez@ucm.com', 'Camino de los Labradores , 380', 28044, 'Paracuellos de Jarama', 'Madrid', FALSE),
('AL177', '12345854K', 'Antonia', 'De Linares', 'Iglesias', 'antonia.de.linares.iglesias@ucm.com', 'Calle Labrantes , 212', 28029, 'Torrejón de la Calzada', 'Madrid', FALSE),
('AL178', '12345855L', 'Alejandro', 'Penelo', 'Hernandez', 'alejandro.penelo.hernandez@ucm.com', 'Calle de las Labrantías , 128', 28022, 'Navalafuente', 'Madrid', FALSE),
('AL179', '12345856A', 'Dolores', 'Cifres', 'Gutierrez', 'dolores.cifres.gutierrez@ucm.com', 'Calle de la Labranza , 82', 28028, 'Casarrubuelos', 'Madrid', TRUE),
('AL180', '12345857B', 'Angel', 'Des', 'Guerrero', 'angel.des.guerrero@ucm.com', 'Calle de la Labranza , 446', 28043, 'Alcorcón', 'Madrid', FALSE),
('AL181', '12345858C', 'Maria Angeles', 'Minondo', 'Gonzalez', 'maria.angeles.minondo.gonzalez@ucm.com', 'Paraje la Labranza , 307', 28038, 'Lozoyuela-Navas-Sieteiglesias', 'Madrid', FALSE),
('AL182', '12345859D', 'Cristina', 'Diaz Llanos', 'Gomez', 'cristina.diaz.llanos.gomez@ucm.com', 'Calle Lacal , 383', 28017, 'Rozas de Puerto Real', 'Madrid', FALSE),
('AL183', '12345860E', 'Miguel Angel', 'Joaquim', 'Gil', 'miguel.angel.joaquim.gil@ucm.com', 'Calle Laccourreye , 50', 28027, 'Pozuelo de Alarcón', 'Madrid', FALSE),
('AL184', '12345861F', 'Jose Maria', 'Valimaña', 'Garrido', 'jose.maria.valimaña.garrido@ucm.com', 'Calle de Lacedón , 330', 28002, 'Alcorcón', 'Madrid', TRUE),
('AL185', '12345862G', 'Fernando', 'Faulin', 'Garcia', 'fernando.faulin.garcia@ucm.com', 'Calle Lacedón , 129', 28034, 'Valdeavero', 'Madrid', FALSE),
('AL186', '12345863H', 'Marta', 'Auchel', 'Fernandez', 'marta.auchel.fernandez@ucm.com', 'Calle de Lacoma , 369', 28014, 'El Atazar', 'Madrid', FALSE),
('AL187', '12345864I', 'Luis', 'Noll', 'Dominguez', 'luis.noll.dominguez@ucm.com', 'Calle de la Ladera , 112', 28026, 'Carabaña', 'Madrid', FALSE),
('AL188', '12345865J', 'Maria Jose', 'Juela', 'Diaz', 'maria.jose.juela.diaz@ucm.com', 'Calle de la Ladera , 68', 28029, 'Pedrezuela', 'Madrid', FALSE),
('AL189', '12345866K', 'Maria Isabel', 'Marcalla', 'Delgado', 'maria.isabel.marcalla.delgado@ucm.com', 'Calle de la Ladera , 142', 28012, 'Colmenar Viejo', 'Madrid', TRUE),
('AL190', '12345867L', 'Pablo', 'Aldaiturriaga', 'Cortes', 'pablo.aldaiturriaga.cortes@ucm.com', 'Calle de la Ladera , 23', 28013, 'Somosierra', 'Madrid', FALSE),
('AL191', '12345868M', 'Sergio', 'Otiniano', 'Castro', 'sergio.otiniano.castro@ucm.com', 'Calle Ladera , 423', 28028, 'Redueña', 'Madrid', FALSE),
('AL192', '12345869N', 'Jorge', 'Pomedio', 'Castillo', 'jorge.pomedio.castillo@ucm.com', 'Calle de la Ladera , 78', 28054, 'Parla', 'Madrid', FALSE),
('AL193', '12345870O', 'Alberto', 'Martin Crespo', 'Cano', 'alberto.martin.crespo.cano@ucm.com', 'Calle Ladera Cerro , 162', 28029, 'Titulcia', 'Madrid', FALSE),
('AL194', '12345871P', 'Pilar', 'Gilda', 'Blanco', 'pilar.gilda.blanco@ucm.com', 'Camino de la Ladera , 87', 28046, 'Pinilla del Valle', 'Madrid', TRUE),
('AL195', '12345872Q', 'Maria Luisa', 'Tillaguango', 'Alvarez', 'maria.luisa.tillaguango.alvarez@ucm.com', 'Camino de la Ladera , 160', 28018, 'El Berrueco', 'Madrid', FALSE),
('AL196', '12345873R', 'Lucia', 'Flamenco', 'Alonso', 'lucia.flamenco.alonso@ucm.com', 'Cañada de la Ladera , 485', 28030, 'Garganta de los Montes', 'Madrid', FALSE),
('AL197', '12345874S', 'Fernando', 'Gironell', 'Pomedio', 'fernando.gironell.pomedio@ucm.com', 'Calle Ladera Cordeles , 105', 28024, 'Gascones', 'Madrid', FALSE),
('AL198', '12345875T', 'Marta', 'Vasques', 'Martin Crespo', 'marta.vasques.martin.crespo@ucm.com', 'Calle Ladera de las Suertes , 473', 28020, 'San Fernando de Henares', 'Madrid', FALSE),
('AL199', '12345876U', 'Luis', 'Vazquez De La Torre', 'Gilda', 'luis.vazquez.de.la.torre.gilda@ucm.com', 'Finca Ladera de las Suertes , 442', 28024, 'Pinilla del Valle', 'Madrid', TRUE);

    -- Carga con inserción manual de datos matricula (idAlumno, idAsignatura, Nota).
INSERT INTO matricula VALUES('AL003','AS001',6.99);
INSERT INTO matricula VALUES('AL003','AS002',9.71);
INSERT INTO matricula VALUES('AL003','AS003',10);
INSERT INTO matricula VALUES('AL003','AS004',8.89);
INSERT INTO matricula VALUES('AL003','AS005',8.49);
INSERT INTO matricula VALUES('AL003','AS006',8.74);
INSERT INTO matricula VALUES('AL003','AS007',5.69);
INSERT INTO matricula VALUES('AL003','AS008',6.91);
INSERT INTO matricula VALUES('AL003','AS009',2.31);
INSERT INTO matricula VALUES('AL003','AS010',9.47);
INSERT INTO matricula VALUES('AL017','AS001',2.97);
INSERT INTO matricula VALUES('AL017','AS002',4.28);
INSERT INTO matricula VALUES('AL017','AS003',7.69);
INSERT INTO matricula VALUES('AL017','AS004',7.23);
INSERT INTO matricula VALUES('AL017','AS005',5.07);
INSERT INTO matricula VALUES('AL017','AS006',6.82);
INSERT INTO matricula VALUES('AL017','AS007',1.22);
INSERT INTO matricula VALUES('AL017','AS008',2.32);
INSERT INTO matricula VALUES('AL017','AS009',5.82);
INSERT INTO matricula VALUES('AL017','AS010',3.39);
INSERT INTO matricula VALUES('AL019','AS001',2.93);
INSERT INTO matricula VALUES('AL019','AS002',9.49);
INSERT INTO matricula VALUES('AL019','AS003',8.77);
INSERT INTO matricula VALUES('AL019','AS004',5.11);
INSERT INTO matricula VALUES('AL019','AS005',4.97);
INSERT INTO matricula VALUES('AL019','AS006',9.82);
INSERT INTO matricula VALUES('AL019','AS007',1.14);
INSERT INTO matricula VALUES('AL019','AS008',1.12);
INSERT INTO matricula VALUES('AL019','AS009',4.73);
INSERT INTO matricula VALUES('AL019','AS010',1.48);
INSERT INTO matricula VALUES('AL045','AS001',5.84);
INSERT INTO matricula VALUES('AL045','AS002',2.24);
INSERT INTO matricula VALUES('AL045','AS003',7.42);
INSERT INTO matricula VALUES('AL045','AS004',3.76);
INSERT INTO matricula VALUES('AL045','AS005',6.41);
INSERT INTO matricula VALUES('AL045','AS006',8.43);
INSERT INTO matricula VALUES('AL045','AS007',10);
INSERT INTO matricula VALUES('AL045','AS008',10);
INSERT INTO matricula VALUES('AL045','AS009',1.22);
INSERT INTO matricula VALUES('AL045','AS010',7.47);
INSERT INTO matricula VALUES('AL052','AS001',3.56);
INSERT INTO matricula VALUES('AL052','AS002',7.23);
INSERT INTO matricula VALUES('AL052','AS003',3.83);
INSERT INTO matricula VALUES('AL052','AS004',2.43);
INSERT INTO matricula VALUES('AL052','AS005',7.68);
INSERT INTO matricula VALUES('AL052','AS006',1.01);
INSERT INTO matricula VALUES('AL052','AS007',3.63);
INSERT INTO matricula VALUES('AL052','AS008',6.26);
INSERT INTO matricula VALUES('AL052','AS009',10);
INSERT INTO matricula VALUES('AL052','AS010',7.67);
INSERT INTO matricula VALUES('AL058','AS001',8.84);
INSERT INTO matricula VALUES('AL058','AS002',1.66);
INSERT INTO matricula VALUES('AL058','AS003',7.07);
INSERT INTO matricula VALUES('AL058','AS004',10);
INSERT INTO matricula VALUES('AL058','AS005',8.71);
INSERT INTO matricula VALUES('AL058','AS006',5.32);
INSERT INTO matricula VALUES('AL058','AS007',1.46);
INSERT INTO matricula VALUES('AL058','AS008',7.02);
INSERT INTO matricula VALUES('AL058','AS009',3.75);
INSERT INTO matricula VALUES('AL058','AS010',5.83);
INSERT INTO matricula VALUES('AL069','AS001',10);
INSERT INTO matricula VALUES('AL069','AS002',6.95);
INSERT INTO matricula VALUES('AL069','AS003',9.83);
INSERT INTO matricula VALUES('AL069','AS004',9.35);
INSERT INTO matricula VALUES('AL069','AS005',8.93);
INSERT INTO matricula VALUES('AL069','AS006',1.59);
INSERT INTO matricula VALUES('AL069','AS007',7.99);
INSERT INTO matricula VALUES('AL069','AS008',6.51);
INSERT INTO matricula VALUES('AL069','AS009',2.58);
INSERT INTO matricula VALUES('AL069','AS010',2.78);
INSERT INTO matricula VALUES('AL076','AS001',7.56);
INSERT INTO matricula VALUES('AL076','AS002',7.51);
INSERT INTO matricula VALUES('AL076','AS003',8.63);
INSERT INTO matricula VALUES('AL076','AS004',8.88);
INSERT INTO matricula VALUES('AL076','AS005',6.78);
INSERT INTO matricula VALUES('AL076','AS006',5.01);
INSERT INTO matricula VALUES('AL076','AS007',9.19);
INSERT INTO matricula VALUES('AL076','AS008',3.53);
INSERT INTO matricula VALUES('AL076','AS009',10);
INSERT INTO matricula VALUES('AL076','AS010',8.99);
INSERT INTO matricula VALUES('AL081','AS001',7.21);
INSERT INTO matricula VALUES('AL081','AS002',3.09);
INSERT INTO matricula VALUES('AL081','AS003',9.84);
INSERT INTO matricula VALUES('AL081','AS004',5.52);
INSERT INTO matricula VALUES('AL081','AS005',1.46);
INSERT INTO matricula VALUES('AL081','AS006',4.09);
INSERT INTO matricula VALUES('AL081','AS007',9.87);
INSERT INTO matricula VALUES('AL081','AS008',10);
INSERT INTO matricula VALUES('AL081','AS009',6.24);
INSERT INTO matricula VALUES('AL081','AS010',8.89);
INSERT INTO matricula VALUES('AL090','AS001',8.12);
INSERT INTO matricula VALUES('AL090','AS002',6.86);
INSERT INTO matricula VALUES('AL090','AS003',1.85);
INSERT INTO matricula VALUES('AL090','AS004',4.43);
INSERT INTO matricula VALUES('AL090','AS005',1.44);
INSERT INTO matricula VALUES('AL090','AS006',1.49);
INSERT INTO matricula VALUES('AL090','AS007',6.58);
INSERT INTO matricula VALUES('AL090','AS008',3.36);
INSERT INTO matricula VALUES('AL090','AS009',7.52);
INSERT INTO matricula VALUES('AL090','AS010',2.32);
INSERT INTO matricula VALUES('AL092','AS001',7.99);
INSERT INTO matricula VALUES('AL092','AS002',2.12);
INSERT INTO matricula VALUES('AL092','AS003',6.15);
INSERT INTO matricula VALUES('AL092','AS004',9.99);
INSERT INTO matricula VALUES('AL092','AS005',3.54);
INSERT INTO matricula VALUES('AL092','AS006',4.83);
INSERT INTO matricula VALUES('AL092','AS007',1.46);
INSERT INTO matricula VALUES('AL092','AS008',6.88);
INSERT INTO matricula VALUES('AL092','AS009',6.22);
INSERT INTO matricula VALUES('AL092','AS010',2.29);
INSERT INTO matricula VALUES('AL103','AS001',7.88);
INSERT INTO matricula VALUES('AL103','AS002',5.39);
INSERT INTO matricula VALUES('AL103','AS003',7.17);
INSERT INTO matricula VALUES('AL103','AS004',7.62);
INSERT INTO matricula VALUES('AL103','AS005',3.25);
INSERT INTO matricula VALUES('AL103','AS006',7.91);
INSERT INTO matricula VALUES('AL103','AS007',3.72);
INSERT INTO matricula VALUES('AL103','AS008',2.22);
INSERT INTO matricula VALUES('AL103','AS009',6.77);
INSERT INTO matricula VALUES('AL103','AS010',8.06);
INSERT INTO matricula VALUES('AL104','AS001',7.28);
INSERT INTO matricula VALUES('AL104','AS002',1.76);
INSERT INTO matricula VALUES('AL104','AS003',8.54);
INSERT INTO matricula VALUES('AL104','AS004',6.74);
INSERT INTO matricula VALUES('AL104','AS005',6.76);
INSERT INTO matricula VALUES('AL104','AS006',4.18);
INSERT INTO matricula VALUES('AL104','AS007',1.46);
INSERT INTO matricula VALUES('AL104','AS008',4.13);
INSERT INTO matricula VALUES('AL104','AS009',2.95);
INSERT INTO matricula VALUES('AL104','AS010',10);
INSERT INTO matricula VALUES('AL108','AS001',1.02);
INSERT INTO matricula VALUES('AL108','AS002',3.47);
INSERT INTO matricula VALUES('AL108','AS003',2.83);
INSERT INTO matricula VALUES('AL108','AS004',5.09);
INSERT INTO matricula VALUES('AL108','AS005',1.94);
INSERT INTO matricula VALUES('AL108','AS006',2.28);
INSERT INTO matricula VALUES('AL108','AS007',7.63);
INSERT INTO matricula VALUES('AL108','AS008',6.25);
INSERT INTO matricula VALUES('AL108','AS009',1.47);
INSERT INTO matricula VALUES('AL108','AS010',10);
INSERT INTO matricula VALUES('AL118','AS001',5.45);
INSERT INTO matricula VALUES('AL118','AS002',5.91);
INSERT INTO matricula VALUES('AL118','AS003',3.29);
INSERT INTO matricula VALUES('AL118','AS004',8.89);
INSERT INTO matricula VALUES('AL118','AS005',8.03);
INSERT INTO matricula VALUES('AL118','AS006',2.45);
INSERT INTO matricula VALUES('AL118','AS007',10);
INSERT INTO matricula VALUES('AL118','AS008',9.37);
INSERT INTO matricula VALUES('AL118','AS009',7.63);
INSERT INTO matricula VALUES('AL118','AS010',7.08);
INSERT INTO matricula VALUES('AL132','AS001',6.93);
INSERT INTO matricula VALUES('AL132','AS002',8.83);
INSERT INTO matricula VALUES('AL132','AS003',6.51);
INSERT INTO matricula VALUES('AL132','AS004',8.31);
INSERT INTO matricula VALUES('AL132','AS005',3.37);
INSERT INTO matricula VALUES('AL132','AS006',6.65);
INSERT INTO matricula VALUES('AL132','AS007',6.25);
INSERT INTO matricula VALUES('AL132','AS008',4.54);
INSERT INTO matricula VALUES('AL132','AS009',8.88);
INSERT INTO matricula VALUES('AL132','AS010',2.29);
INSERT INTO matricula VALUES('AL138','AS001',1.78);
INSERT INTO matricula VALUES('AL138','AS002',6.12);
INSERT INTO matricula VALUES('AL138','AS003',6.95);
INSERT INTO matricula VALUES('AL138','AS004',8.63);
INSERT INTO matricula VALUES('AL138','AS005',1.38);
INSERT INTO matricula VALUES('AL138','AS006',4.67);
INSERT INTO matricula VALUES('AL138','AS007',10);
INSERT INTO matricula VALUES('AL138','AS008',7.01);
INSERT INTO matricula VALUES('AL138','AS009',8.86);
INSERT INTO matricula VALUES('AL138','AS010',5.75);
INSERT INTO matricula VALUES('AL142','AS001',3.65);
INSERT INTO matricula VALUES('AL142','AS002',9.84);
INSERT INTO matricula VALUES('AL142','AS003',10);
INSERT INTO matricula VALUES('AL142','AS004',1.46);
INSERT INTO matricula VALUES('AL142','AS005',7.31);
INSERT INTO matricula VALUES('AL142','AS006',3.72);
INSERT INTO matricula VALUES('AL142','AS007',1.71);
INSERT INTO matricula VALUES('AL142','AS008',2.96);
INSERT INTO matricula VALUES('AL142','AS009',2.01);
INSERT INTO matricula VALUES('AL142','AS010',5.49);
INSERT INTO matricula VALUES('AL147','AS001',1.28);
INSERT INTO matricula VALUES('AL147','AS002',3.81);
INSERT INTO matricula VALUES('AL147','AS003',7.32);
INSERT INTO matricula VALUES('AL147','AS004',10);
INSERT INTO matricula VALUES('AL147','AS005',2.56);
INSERT INTO matricula VALUES('AL147','AS006',4.52);
INSERT INTO matricula VALUES('AL147','AS007',9.48);
INSERT INTO matricula VALUES('AL147','AS008',2.87);
INSERT INTO matricula VALUES('AL147','AS009',3.47);
INSERT INTO matricula VALUES('AL147','AS010',5.99);
INSERT INTO matricula VALUES('AL165','AS001',3.89);
INSERT INTO matricula VALUES('AL165','AS002',2.14);
INSERT INTO matricula VALUES('AL165','AS003',1.76);
INSERT INTO matricula VALUES('AL165','AS004',1.79);
INSERT INTO matricula VALUES('AL165','AS005',10);
INSERT INTO matricula VALUES('AL165','AS006',4.95);
INSERT INTO matricula VALUES('AL165','AS007',4.81);
INSERT INTO matricula VALUES('AL165','AS008',8.36);
INSERT INTO matricula VALUES('AL165','AS009',3.62);
INSERT INTO matricula VALUES('AL165','AS010',3.24);
INSERT INTO matricula VALUES('AL187','AS001',8.49);
INSERT INTO matricula VALUES('AL187','AS002',5.53);
INSERT INTO matricula VALUES('AL187','AS003',2.32);
INSERT INTO matricula VALUES('AL187','AS004',6.19);
INSERT INTO matricula VALUES('AL187','AS005',7.19);
INSERT INTO matricula VALUES('AL187','AS006',8.71);
INSERT INTO matricula VALUES('AL187','AS007',1.18);
INSERT INTO matricula VALUES('AL187','AS008',5.37);
INSERT INTO matricula VALUES('AL187','AS009',3.33);
INSERT INTO matricula VALUES('AL187','AS010',3.51);
INSERT INTO matricula VALUES('AL189','AS001',6.54);
INSERT INTO matricula VALUES('AL189','AS002',7.06);
INSERT INTO matricula VALUES('AL189','AS003',7.67);
INSERT INTO matricula VALUES('AL189','AS004',4.41);
INSERT INTO matricula VALUES('AL189','AS005',1.27);
INSERT INTO matricula VALUES('AL189','AS006',9.19);
INSERT INTO matricula VALUES('AL189','AS007',2.88);
INSERT INTO matricula VALUES('AL189','AS008',3.07);
INSERT INTO matricula VALUES('AL189','AS009',2.99);
INSERT INTO matricula VALUES('AL189','AS010',6.38);
INSERT INTO matricula VALUES('AL194','AS001',3.27);
INSERT INTO matricula VALUES('AL194','AS002',4.34);
INSERT INTO matricula VALUES('AL194','AS003',1.26);
INSERT INTO matricula VALUES('AL194','AS004',3.42);
INSERT INTO matricula VALUES('AL194','AS005',1.72);
INSERT INTO matricula VALUES('AL194','AS006',1.46);
INSERT INTO matricula VALUES('AL194','AS007',2.94);
INSERT INTO matricula VALUES('AL194','AS008',9.34);
INSERT INTO matricula VALUES('AL194','AS009',8.87);
INSERT INTO matricula VALUES('AL194','AS010',5.98);
INSERT INTO matricula VALUES('AL007','AS011',2.16);
INSERT INTO matricula VALUES('AL007','AS012',4.21);
INSERT INTO matricula VALUES('AL007','AS013',9.42);
INSERT INTO matricula VALUES('AL007','AS014',10);
INSERT INTO matricula VALUES('AL007','AS015',9.11);
INSERT INTO matricula VALUES('AL007','AS016',9.83);
INSERT INTO matricula VALUES('AL007','AS017',6.95);
INSERT INTO matricula VALUES('AL007','AS018',9.67);
INSERT INTO matricula VALUES('AL007','AS019',8.42);
INSERT INTO matricula VALUES('AL007','AS020',9.15);
INSERT INTO matricula VALUES('AL010','AS011',9.68);
INSERT INTO matricula VALUES('AL010','AS012',5.57);
INSERT INTO matricula VALUES('AL010','AS013',3.31);
INSERT INTO matricula VALUES('AL010','AS014',1.86);
INSERT INTO matricula VALUES('AL010','AS015',3.47);
INSERT INTO matricula VALUES('AL010','AS016',8.38);
INSERT INTO matricula VALUES('AL010','AS017',10);
INSERT INTO matricula VALUES('AL010','AS018',5.67);
INSERT INTO matricula VALUES('AL010','AS019',6.02);
INSERT INTO matricula VALUES('AL010','AS020',2.07);
INSERT INTO matricula VALUES('AL011','AS011',9.81);
INSERT INTO matricula VALUES('AL011','AS012',1.54);
INSERT INTO matricula VALUES('AL011','AS013',9.76);
INSERT INTO matricula VALUES('AL011','AS014',6.32);
INSERT INTO matricula VALUES('AL011','AS015',5.64);
INSERT INTO matricula VALUES('AL011','AS016',1.07);
INSERT INTO matricula VALUES('AL011','AS017',3.63);
INSERT INTO matricula VALUES('AL011','AS018',9.08);
INSERT INTO matricula VALUES('AL011','AS019',5.45);
INSERT INTO matricula VALUES('AL011','AS020',8.06);
INSERT INTO matricula VALUES('AL025','AS011',2.26);
INSERT INTO matricula VALUES('AL025','AS012',3.69);
INSERT INTO matricula VALUES('AL025','AS013',7.39);
INSERT INTO matricula VALUES('AL025','AS014',2.45);
INSERT INTO matricula VALUES('AL025','AS015',2.34);
INSERT INTO matricula VALUES('AL025','AS016',8.68);
INSERT INTO matricula VALUES('AL025','AS017',1.81);
INSERT INTO matricula VALUES('AL025','AS018',5.31);
INSERT INTO matricula VALUES('AL025','AS019',7.62);
INSERT INTO matricula VALUES('AL025','AS020',6.67);
INSERT INTO matricula VALUES('AL027','AS011',1.39);
INSERT INTO matricula VALUES('AL027','AS012',4.26);
INSERT INTO matricula VALUES('AL027','AS013',8.43);
INSERT INTO matricula VALUES('AL027','AS014',9.12);
INSERT INTO matricula VALUES('AL027','AS015',2.07);
INSERT INTO matricula VALUES('AL027','AS016',6.57);
INSERT INTO matricula VALUES('AL027','AS017',3.02);
INSERT INTO matricula VALUES('AL027','AS018',7.38);
INSERT INTO matricula VALUES('AL027','AS019',10);
INSERT INTO matricula VALUES('AL027','AS020',10);
INSERT INTO matricula VALUES('AL030','AS011',7.97);
INSERT INTO matricula VALUES('AL030','AS012',7.51);
INSERT INTO matricula VALUES('AL030','AS013',3.49);
INSERT INTO matricula VALUES('AL030','AS014',1.52);
INSERT INTO matricula VALUES('AL030','AS015',6.47);
INSERT INTO matricula VALUES('AL030','AS016',2.18);
INSERT INTO matricula VALUES('AL030','AS017',8.23);
INSERT INTO matricula VALUES('AL030','AS018',5.86);
INSERT INTO matricula VALUES('AL030','AS019',9.22);
INSERT INTO matricula VALUES('AL030','AS020',3.74);
INSERT INTO matricula VALUES('AL051','AS011',10);
INSERT INTO matricula VALUES('AL051','AS012',3.24);
INSERT INTO matricula VALUES('AL051','AS013',6.96);
INSERT INTO matricula VALUES('AL051','AS014',3.23);
INSERT INTO matricula VALUES('AL051','AS015',10);
INSERT INTO matricula VALUES('AL051','AS016',10);
INSERT INTO matricula VALUES('AL051','AS017',6.01);
INSERT INTO matricula VALUES('AL051','AS018',10);
INSERT INTO matricula VALUES('AL051','AS019',8.18);
INSERT INTO matricula VALUES('AL051','AS020',9.65);
INSERT INTO matricula VALUES('AL054','AS011',5.43);
INSERT INTO matricula VALUES('AL054','AS012',5.59);
INSERT INTO matricula VALUES('AL054','AS013',10);
INSERT INTO matricula VALUES('AL054','AS014',7.57);
INSERT INTO matricula VALUES('AL054','AS015',5.07);
INSERT INTO matricula VALUES('AL054','AS016',8.32);
INSERT INTO matricula VALUES('AL054','AS017',3.55);
INSERT INTO matricula VALUES('AL054','AS018',5.06);
INSERT INTO matricula VALUES('AL054','AS019',1.58);
INSERT INTO matricula VALUES('AL054','AS020',2.21);
INSERT INTO matricula VALUES('AL064','AS011',10);
INSERT INTO matricula VALUES('AL064','AS012',6.72);
INSERT INTO matricula VALUES('AL064','AS013',1.19);
INSERT INTO matricula VALUES('AL064','AS014',3.06);
INSERT INTO matricula VALUES('AL064','AS015',6.52);
INSERT INTO matricula VALUES('AL064','AS016',1.72);
INSERT INTO matricula VALUES('AL064','AS017',8.14);
INSERT INTO matricula VALUES('AL064','AS018',10);
INSERT INTO matricula VALUES('AL064','AS019',10);
INSERT INTO matricula VALUES('AL064','AS020',8.66);
INSERT INTO matricula VALUES('AL079','AS011',9.64);
INSERT INTO matricula VALUES('AL079','AS012',4.03);
INSERT INTO matricula VALUES('AL079','AS013',9.06);
INSERT INTO matricula VALUES('AL079','AS014',9.83);
INSERT INTO matricula VALUES('AL079','AS015',9.51);
INSERT INTO matricula VALUES('AL079','AS016',1.39);
INSERT INTO matricula VALUES('AL079','AS017',2.87);
INSERT INTO matricula VALUES('AL079','AS018',4.88);
INSERT INTO matricula VALUES('AL079','AS019',5.31);
INSERT INTO matricula VALUES('AL079','AS020',6.57);
INSERT INTO matricula VALUES('AL099','AS011',6.12);
INSERT INTO matricula VALUES('AL099','AS012',10);
INSERT INTO matricula VALUES('AL099','AS013',6.07);
INSERT INTO matricula VALUES('AL099','AS014',10);
INSERT INTO matricula VALUES('AL099','AS015',8.53);
INSERT INTO matricula VALUES('AL099','AS016',2.46);
INSERT INTO matricula VALUES('AL099','AS017',6.84);
INSERT INTO matricula VALUES('AL099','AS018',5.31);
INSERT INTO matricula VALUES('AL099','AS019',4.35);
INSERT INTO matricula VALUES('AL099','AS020',7.77);
INSERT INTO matricula VALUES('AL100','AS011',1.48);
INSERT INTO matricula VALUES('AL100','AS012',7.41);
INSERT INTO matricula VALUES('AL100','AS013',3.16);
INSERT INTO matricula VALUES('AL100','AS014',7.65);
INSERT INTO matricula VALUES('AL100','AS015',2.15);
INSERT INTO matricula VALUES('AL100','AS016',1.91);
INSERT INTO matricula VALUES('AL100','AS017',7.05);
INSERT INTO matricula VALUES('AL100','AS018',2.05);
INSERT INTO matricula VALUES('AL100','AS019',1.11);
INSERT INTO matricula VALUES('AL100','AS020',4.76);
INSERT INTO matricula VALUES('AL101','AS011',7.21);
INSERT INTO matricula VALUES('AL101','AS012',6.14);
INSERT INTO matricula VALUES('AL101','AS013',4.09);
INSERT INTO matricula VALUES('AL101','AS014',8.85);
INSERT INTO matricula VALUES('AL101','AS015',9.82);
INSERT INTO matricula VALUES('AL101','AS016',5.87);
INSERT INTO matricula VALUES('AL101','AS017',3.63);
INSERT INTO matricula VALUES('AL101','AS018',1.67);
INSERT INTO matricula VALUES('AL101','AS019',4.99);
INSERT INTO matricula VALUES('AL101','AS020',5.89);
INSERT INTO matricula VALUES('AL102','AS011',8.75);
INSERT INTO matricula VALUES('AL102','AS012',4.32);
INSERT INTO matricula VALUES('AL102','AS013',5.44);
INSERT INTO matricula VALUES('AL102','AS014',9.06);
INSERT INTO matricula VALUES('AL102','AS015',4.32);
INSERT INTO matricula VALUES('AL102','AS016',5.58);
INSERT INTO matricula VALUES('AL102','AS017',3.38);
INSERT INTO matricula VALUES('AL102','AS018',4.67);
INSERT INTO matricula VALUES('AL102','AS019',3.54);
INSERT INTO matricula VALUES('AL102','AS020',4.32);
INSERT INTO matricula VALUES('AL106','AS011',5.09);
INSERT INTO matricula VALUES('AL106','AS012',2.13);
INSERT INTO matricula VALUES('AL106','AS013',9.86);
INSERT INTO matricula VALUES('AL106','AS014',4.73);
INSERT INTO matricula VALUES('AL106','AS015',1.25);
INSERT INTO matricula VALUES('AL106','AS016',3.05);
INSERT INTO matricula VALUES('AL106','AS017',4.85);
INSERT INTO matricula VALUES('AL106','AS018',9.61);
INSERT INTO matricula VALUES('AL106','AS019',4.95);
INSERT INTO matricula VALUES('AL106','AS020',8.53);
INSERT INTO matricula VALUES('AL112','AS011',4.22);
INSERT INTO matricula VALUES('AL112','AS012',2.26);
INSERT INTO matricula VALUES('AL112','AS013',4.75);
INSERT INTO matricula VALUES('AL112','AS014',9.89);
INSERT INTO matricula VALUES('AL112','AS015',5.25);
INSERT INTO matricula VALUES('AL112','AS016',1.39);
INSERT INTO matricula VALUES('AL112','AS017',8.07);
INSERT INTO matricula VALUES('AL112','AS018',10);
INSERT INTO matricula VALUES('AL112','AS019',5.37);
INSERT INTO matricula VALUES('AL112','AS020',6.74);
INSERT INTO matricula VALUES('AL113','AS011',6.93);
INSERT INTO matricula VALUES('AL113','AS012',4.81);
INSERT INTO matricula VALUES('AL113','AS013',2.25);
INSERT INTO matricula VALUES('AL113','AS014',1.65);
INSERT INTO matricula VALUES('AL113','AS015',4.42);
INSERT INTO matricula VALUES('AL113','AS016',1.81);
INSERT INTO matricula VALUES('AL113','AS017',8.76);
INSERT INTO matricula VALUES('AL113','AS018',2.08);
INSERT INTO matricula VALUES('AL113','AS019',3.95);
INSERT INTO matricula VALUES('AL113','AS020',6.14);
INSERT INTO matricula VALUES('AL119','AS011',10);
INSERT INTO matricula VALUES('AL119','AS012',4.85);
INSERT INTO matricula VALUES('AL119','AS013',10);
INSERT INTO matricula VALUES('AL119','AS014',1.84);
INSERT INTO matricula VALUES('AL119','AS015',4.11);
INSERT INTO matricula VALUES('AL119','AS016',5.68);
INSERT INTO matricula VALUES('AL119','AS017',3.53);
INSERT INTO matricula VALUES('AL119','AS018',2.17);
INSERT INTO matricula VALUES('AL119','AS019',8.75);
INSERT INTO matricula VALUES('AL119','AS020',9.61);
INSERT INTO matricula VALUES('AL123','AS011',5.16);
INSERT INTO matricula VALUES('AL123','AS012',6.29);
INSERT INTO matricula VALUES('AL123','AS013',2.92);
INSERT INTO matricula VALUES('AL123','AS014',9.07);
INSERT INTO matricula VALUES('AL123','AS015',1.81);
INSERT INTO matricula VALUES('AL123','AS016',1.09);
INSERT INTO matricula VALUES('AL123','AS017',4.82);
INSERT INTO matricula VALUES('AL123','AS018',3.92);
INSERT INTO matricula VALUES('AL123','AS019',9.38);
INSERT INTO matricula VALUES('AL123','AS020',8.21);
INSERT INTO matricula VALUES('AL131','AS011',3.77);
INSERT INTO matricula VALUES('AL131','AS012',1.82);
INSERT INTO matricula VALUES('AL131','AS013',2.38);
INSERT INTO matricula VALUES('AL131','AS014',9.03);
INSERT INTO matricula VALUES('AL131','AS015',2.03);
INSERT INTO matricula VALUES('AL131','AS016',10);
INSERT INTO matricula VALUES('AL131','AS017',1.85);
INSERT INTO matricula VALUES('AL131','AS018',8.86);
INSERT INTO matricula VALUES('AL131','AS019',6.82);
INSERT INTO matricula VALUES('AL131','AS020',4.23);
INSERT INTO matricula VALUES('AL152','AS011',3.27);
INSERT INTO matricula VALUES('AL152','AS012',7.17);
INSERT INTO matricula VALUES('AL152','AS013',6.17);
INSERT INTO matricula VALUES('AL152','AS014',9.97);
INSERT INTO matricula VALUES('AL152','AS015',1.35);
INSERT INTO matricula VALUES('AL152','AS016',6.46);
INSERT INTO matricula VALUES('AL152','AS017',10);
INSERT INTO matricula VALUES('AL152','AS018',4.05);
INSERT INTO matricula VALUES('AL152','AS019',2.79);
INSERT INTO matricula VALUES('AL152','AS020',7.02);
INSERT INTO matricula VALUES('AL154','AS011',8.41);
INSERT INTO matricula VALUES('AL154','AS012',7.78);
INSERT INTO matricula VALUES('AL154','AS013',4.25);
INSERT INTO matricula VALUES('AL154','AS014',4.36);
INSERT INTO matricula VALUES('AL154','AS015',9.79);
INSERT INTO matricula VALUES('AL154','AS016',3.08);
INSERT INTO matricula VALUES('AL154','AS017',9.52);
INSERT INTO matricula VALUES('AL154','AS018',5.38);
INSERT INTO matricula VALUES('AL154','AS019',4.14);
INSERT INTO matricula VALUES('AL154','AS020',9.21);
INSERT INTO matricula VALUES('AL160','AS011',10);
INSERT INTO matricula VALUES('AL160','AS012',7.93);
INSERT INTO matricula VALUES('AL160','AS013',1.89);
INSERT INTO matricula VALUES('AL160','AS014',2.23);
INSERT INTO matricula VALUES('AL160','AS015',8.32);
INSERT INTO matricula VALUES('AL160','AS016',3.01);
INSERT INTO matricula VALUES('AL160','AS017',4.59);
INSERT INTO matricula VALUES('AL160','AS018',10);
INSERT INTO matricula VALUES('AL160','AS019',2.82);
INSERT INTO matricula VALUES('AL160','AS020',4.21);
INSERT INTO matricula VALUES('AL161','AS011',4.85);
INSERT INTO matricula VALUES('AL161','AS012',7.11);
INSERT INTO matricula VALUES('AL161','AS013',3.37);
INSERT INTO matricula VALUES('AL161','AS014',2.26);
INSERT INTO matricula VALUES('AL161','AS015',4.99);
INSERT INTO matricula VALUES('AL161','AS016',10);
INSERT INTO matricula VALUES('AL161','AS017',9.13);
INSERT INTO matricula VALUES('AL161','AS018',4.58);
INSERT INTO matricula VALUES('AL161','AS019',7.57);
INSERT INTO matricula VALUES('AL161','AS020',6.87);
INSERT INTO matricula VALUES('AL166','AS011',5.17);
INSERT INTO matricula VALUES('AL166','AS012',1.27);
INSERT INTO matricula VALUES('AL166','AS013',6.77);
INSERT INTO matricula VALUES('AL166','AS014',7.22);
INSERT INTO matricula VALUES('AL166','AS015',1.18);
INSERT INTO matricula VALUES('AL166','AS016',10);
INSERT INTO matricula VALUES('AL166','AS017',7.94);
INSERT INTO matricula VALUES('AL166','AS018',9.51);
INSERT INTO matricula VALUES('AL166','AS019',7.45);
INSERT INTO matricula VALUES('AL166','AS020',7.21);
INSERT INTO matricula VALUES('AL167','AS011',3.92);
INSERT INTO matricula VALUES('AL167','AS012',3.25);
INSERT INTO matricula VALUES('AL167','AS013',2.12);
INSERT INTO matricula VALUES('AL167','AS014',2.96);
INSERT INTO matricula VALUES('AL167','AS015',7.06);
INSERT INTO matricula VALUES('AL167','AS016',8.39);
INSERT INTO matricula VALUES('AL167','AS017',9.39);
INSERT INTO matricula VALUES('AL167','AS018',8.02);
INSERT INTO matricula VALUES('AL167','AS019',7.84);
INSERT INTO matricula VALUES('AL167','AS020',6.27);
INSERT INTO matricula VALUES('AL170','AS011',3.69);
INSERT INTO matricula VALUES('AL170','AS012',2.15);
INSERT INTO matricula VALUES('AL170','AS013',8.15);
INSERT INTO matricula VALUES('AL170','AS014',5.69);
INSERT INTO matricula VALUES('AL170','AS015',6.31);
INSERT INTO matricula VALUES('AL170','AS016',5.18);
INSERT INTO matricula VALUES('AL170','AS017',9.61);
INSERT INTO matricula VALUES('AL170','AS018',2.79);
INSERT INTO matricula VALUES('AL170','AS019',7.01);
INSERT INTO matricula VALUES('AL170','AS020',4.44);
INSERT INTO matricula VALUES('AL177','AS011',6.03);
INSERT INTO matricula VALUES('AL177','AS012',1.88);
INSERT INTO matricula VALUES('AL177','AS013',3.38);
INSERT INTO matricula VALUES('AL177','AS014',6.22);
INSERT INTO matricula VALUES('AL177','AS015',8.16);
INSERT INTO matricula VALUES('AL177','AS016',5.16);
INSERT INTO matricula VALUES('AL177','AS017',2.45);
INSERT INTO matricula VALUES('AL177','AS018',3.63);
INSERT INTO matricula VALUES('AL177','AS019',2.37);
INSERT INTO matricula VALUES('AL177','AS020',4.59);
INSERT INTO matricula VALUES('AL185','AS011',1.02);
INSERT INTO matricula VALUES('AL185','AS012',1.48);
INSERT INTO matricula VALUES('AL185','AS013',10);
INSERT INTO matricula VALUES('AL185','AS014',9.73);
INSERT INTO matricula VALUES('AL185','AS015',10);
INSERT INTO matricula VALUES('AL185','AS016',6.73);
INSERT INTO matricula VALUES('AL185','AS017',9.31);
INSERT INTO matricula VALUES('AL185','AS018',8.77);
INSERT INTO matricula VALUES('AL185','AS019',1.26);
INSERT INTO matricula VALUES('AL185','AS020',10);
INSERT INTO matricula VALUES('AL193','AS011',4.96);
INSERT INTO matricula VALUES('AL193','AS012',7.22);
INSERT INTO matricula VALUES('AL193','AS013',2.35);
INSERT INTO matricula VALUES('AL193','AS014',10);
INSERT INTO matricula VALUES('AL193','AS015',6.79);
INSERT INTO matricula VALUES('AL193','AS016',10);
INSERT INTO matricula VALUES('AL193','AS017',10);
INSERT INTO matricula VALUES('AL193','AS018',3.95);
INSERT INTO matricula VALUES('AL193','AS019',9.58);
INSERT INTO matricula VALUES('AL193','AS020',8.64);
INSERT INTO matricula VALUES('AL197','AS011',7.59);
INSERT INTO matricula VALUES('AL197','AS012',3.07);
INSERT INTO matricula VALUES('AL197','AS013',10);
INSERT INTO matricula VALUES('AL197','AS014',6.75);
INSERT INTO matricula VALUES('AL197','AS015',8.77);
INSERT INTO matricula VALUES('AL197','AS016',5.16);
INSERT INTO matricula VALUES('AL197','AS017',1.06);
INSERT INTO matricula VALUES('AL197','AS018',6.88);
INSERT INTO matricula VALUES('AL197','AS019',7.92);
INSERT INTO matricula VALUES('AL197','AS020',1.88);
INSERT INTO matricula VALUES('AL004','AS021',4.23);
INSERT INTO matricula VALUES('AL004','AS022',9.65);
INSERT INTO matricula VALUES('AL004','AS023',7.75);
INSERT INTO matricula VALUES('AL004','AS024',5.76);
INSERT INTO matricula VALUES('AL004','AS025',3.43);
INSERT INTO matricula VALUES('AL004','AS026',6.95);
INSERT INTO matricula VALUES('AL004','AS027',6.91);
INSERT INTO matricula VALUES('AL004','AS028',9.76);
INSERT INTO matricula VALUES('AL004','AS029',10);
INSERT INTO matricula VALUES('AL004','AS030',4.44);
INSERT INTO matricula VALUES('AL008','AS021',8.29);
INSERT INTO matricula VALUES('AL008','AS022',4.43);
INSERT INTO matricula VALUES('AL008','AS023',4.37);
INSERT INTO matricula VALUES('AL008','AS024',5.02);
INSERT INTO matricula VALUES('AL008','AS025',8.84);
INSERT INTO matricula VALUES('AL008','AS026',4.24);
INSERT INTO matricula VALUES('AL008','AS027',8.02);
INSERT INTO matricula VALUES('AL008','AS028',4.22);
INSERT INTO matricula VALUES('AL008','AS029',9.28);
INSERT INTO matricula VALUES('AL008','AS030',6.18);
INSERT INTO matricula VALUES('AL028','AS021',6.86);
INSERT INTO matricula VALUES('AL028','AS022',8.27);
INSERT INTO matricula VALUES('AL028','AS023',8.17);
INSERT INTO matricula VALUES('AL028','AS024',6.23);
INSERT INTO matricula VALUES('AL028','AS025',3.09);
INSERT INTO matricula VALUES('AL028','AS026',7.93);
INSERT INTO matricula VALUES('AL028','AS027',3.48);
INSERT INTO matricula VALUES('AL028','AS028',2.78);
INSERT INTO matricula VALUES('AL028','AS029',4.48);
INSERT INTO matricula VALUES('AL028','AS030',8.44);
INSERT INTO matricula VALUES('AL031','AS021',8.81);
INSERT INTO matricula VALUES('AL031','AS022',10);
INSERT INTO matricula VALUES('AL031','AS023',9.58);
INSERT INTO matricula VALUES('AL031','AS024',9.96);
INSERT INTO matricula VALUES('AL031','AS025',8.89);
INSERT INTO matricula VALUES('AL031','AS026',3.94);
INSERT INTO matricula VALUES('AL031','AS027',5.14);
INSERT INTO matricula VALUES('AL031','AS028',7.58);
INSERT INTO matricula VALUES('AL031','AS029',9.94);
INSERT INTO matricula VALUES('AL031','AS030',5.68);
INSERT INTO matricula VALUES('AL034','AS021',2.41);
INSERT INTO matricula VALUES('AL034','AS022',4.49);
INSERT INTO matricula VALUES('AL034','AS023',4.23);
INSERT INTO matricula VALUES('AL034','AS024',4.02);
INSERT INTO matricula VALUES('AL034','AS025',4.34);
INSERT INTO matricula VALUES('AL034','AS026',4.95);
INSERT INTO matricula VALUES('AL034','AS027',4.18);
INSERT INTO matricula VALUES('AL034','AS028',7.49);
INSERT INTO matricula VALUES('AL034','AS029',1.48);
INSERT INTO matricula VALUES('AL034','AS030',4.84);
INSERT INTO matricula VALUES('AL043','AS021',7.19);
INSERT INTO matricula VALUES('AL043','AS022',3.09);
INSERT INTO matricula VALUES('AL043','AS023',4.62);
INSERT INTO matricula VALUES('AL043','AS024',2.35);
INSERT INTO matricula VALUES('AL043','AS025',10);
INSERT INTO matricula VALUES('AL043','AS026',2.28);
INSERT INTO matricula VALUES('AL043','AS027',9.61);
INSERT INTO matricula VALUES('AL043','AS028',7.61);
INSERT INTO matricula VALUES('AL043','AS029',4.15);
INSERT INTO matricula VALUES('AL043','AS030',8.44);
INSERT INTO matricula VALUES('AL044','AS021',1.54);
INSERT INTO matricula VALUES('AL044','AS022',4.24);
INSERT INTO matricula VALUES('AL044','AS023',7.81);
INSERT INTO matricula VALUES('AL044','AS024',4.46);
INSERT INTO matricula VALUES('AL044','AS025',2.63);
INSERT INTO matricula VALUES('AL044','AS026',8.25);
INSERT INTO matricula VALUES('AL044','AS027',9.17);
INSERT INTO matricula VALUES('AL044','AS028',2.28);
INSERT INTO matricula VALUES('AL044','AS029',3.54);
INSERT INTO matricula VALUES('AL044','AS030',8.23);
INSERT INTO matricula VALUES('AL047','AS021',9.52);
INSERT INTO matricula VALUES('AL047','AS022',6.64);
INSERT INTO matricula VALUES('AL047','AS023',5.29);
INSERT INTO matricula VALUES('AL047','AS024',2.38);
INSERT INTO matricula VALUES('AL047','AS025',2.89);
INSERT INTO matricula VALUES('AL047','AS026',10);
INSERT INTO matricula VALUES('AL047','AS027',7.09);
INSERT INTO matricula VALUES('AL047','AS028',6.49);
INSERT INTO matricula VALUES('AL047','AS029',10);
INSERT INTO matricula VALUES('AL047','AS030',3.77);
INSERT INTO matricula VALUES('AL050','AS021',7.38);
INSERT INTO matricula VALUES('AL050','AS022',3.84);
INSERT INTO matricula VALUES('AL050','AS023',3.52);
INSERT INTO matricula VALUES('AL050','AS024',8.51);
INSERT INTO matricula VALUES('AL050','AS025',8.61);
INSERT INTO matricula VALUES('AL050','AS026',3.29);
INSERT INTO matricula VALUES('AL050','AS027',8.92);
INSERT INTO matricula VALUES('AL050','AS028',4.82);
INSERT INTO matricula VALUES('AL050','AS029',6.23);
INSERT INTO matricula VALUES('AL050','AS030',8.41);
INSERT INTO matricula VALUES('AL055','AS021',7.06);
INSERT INTO matricula VALUES('AL055','AS022',5.11);
INSERT INTO matricula VALUES('AL055','AS023',6.52);
INSERT INTO matricula VALUES('AL055','AS024',1.57);
INSERT INTO matricula VALUES('AL055','AS025',5.11);
INSERT INTO matricula VALUES('AL055','AS026',6.01);
INSERT INTO matricula VALUES('AL055','AS027',8.09);
INSERT INTO matricula VALUES('AL055','AS028',6.87);
INSERT INTO matricula VALUES('AL055','AS029',6.58);
INSERT INTO matricula VALUES('AL055','AS030',8.19);
INSERT INTO matricula VALUES('AL059','AS021',5.32);
INSERT INTO matricula VALUES('AL059','AS022',8.42);
INSERT INTO matricula VALUES('AL059','AS023',2.42);
INSERT INTO matricula VALUES('AL059','AS024',6.73);
INSERT INTO matricula VALUES('AL059','AS025',7.85);
INSERT INTO matricula VALUES('AL059','AS026',6.41);
INSERT INTO matricula VALUES('AL059','AS027',4.38);
INSERT INTO matricula VALUES('AL059','AS028',1.55);
INSERT INTO matricula VALUES('AL059','AS029',5.98);
INSERT INTO matricula VALUES('AL059','AS030',7.12);
INSERT INTO matricula VALUES('AL071','AS021',1.09);
INSERT INTO matricula VALUES('AL071','AS022',7.36);
INSERT INTO matricula VALUES('AL071','AS023',8.77);
INSERT INTO matricula VALUES('AL071','AS024',1.16);
INSERT INTO matricula VALUES('AL071','AS025',6.57);
INSERT INTO matricula VALUES('AL071','AS026',6.69);
INSERT INTO matricula VALUES('AL071','AS027',10);
INSERT INTO matricula VALUES('AL071','AS028',5.97);
INSERT INTO matricula VALUES('AL071','AS029',8.96);
INSERT INTO matricula VALUES('AL071','AS030',10);
INSERT INTO matricula VALUES('AL072','AS021',8.73);
INSERT INTO matricula VALUES('AL072','AS022',2.77);
INSERT INTO matricula VALUES('AL072','AS023',9.48);
INSERT INTO matricula VALUES('AL072','AS024',3.73);
INSERT INTO matricula VALUES('AL072','AS025',2.78);
INSERT INTO matricula VALUES('AL072','AS026',9.39);
INSERT INTO matricula VALUES('AL072','AS027',3.79);
INSERT INTO matricula VALUES('AL072','AS028',3.91);
INSERT INTO matricula VALUES('AL072','AS029',10);
INSERT INTO matricula VALUES('AL072','AS030',7.68);
INSERT INTO matricula VALUES('AL073','AS021',6.16);
INSERT INTO matricula VALUES('AL073','AS022',1.07);
INSERT INTO matricula VALUES('AL073','AS023',6.88);
INSERT INTO matricula VALUES('AL073','AS024',6.71);
INSERT INTO matricula VALUES('AL073','AS025',5.65);
INSERT INTO matricula VALUES('AL073','AS026',1.56);
INSERT INTO matricula VALUES('AL073','AS027',7.25);
INSERT INTO matricula VALUES('AL073','AS028',6.49);
INSERT INTO matricula VALUES('AL073','AS029',10);
INSERT INTO matricula VALUES('AL073','AS030',9.96);
INSERT INTO matricula VALUES('AL078','AS021',2.55);
INSERT INTO matricula VALUES('AL078','AS022',5.26);
INSERT INTO matricula VALUES('AL078','AS023',10);
INSERT INTO matricula VALUES('AL078','AS024',8.54);
INSERT INTO matricula VALUES('AL078','AS025',10);
INSERT INTO matricula VALUES('AL078','AS026',7.33);
INSERT INTO matricula VALUES('AL078','AS027',10);
INSERT INTO matricula VALUES('AL078','AS028',8.33);
INSERT INTO matricula VALUES('AL078','AS029',9.67);
INSERT INTO matricula VALUES('AL078','AS030',9.41);
INSERT INTO matricula VALUES('AL080','AS021',10);
INSERT INTO matricula VALUES('AL080','AS022',9.79);
INSERT INTO matricula VALUES('AL080','AS023',2.66);
INSERT INTO matricula VALUES('AL080','AS024',4.31);
INSERT INTO matricula VALUES('AL080','AS025',2.06);
INSERT INTO matricula VALUES('AL080','AS026',10);
INSERT INTO matricula VALUES('AL080','AS027',9.78);
INSERT INTO matricula VALUES('AL080','AS028',1.11);
INSERT INTO matricula VALUES('AL080','AS029',9.78);
INSERT INTO matricula VALUES('AL080','AS030',6.94);
INSERT INTO matricula VALUES('AL083','AS021',7.58);
INSERT INTO matricula VALUES('AL083','AS022',8.97);
INSERT INTO matricula VALUES('AL083','AS023',4.07);
INSERT INTO matricula VALUES('AL083','AS024',10);
INSERT INTO matricula VALUES('AL083','AS025',6.61);
INSERT INTO matricula VALUES('AL083','AS026',7.43);
INSERT INTO matricula VALUES('AL083','AS027',6.51);
INSERT INTO matricula VALUES('AL083','AS028',7.78);
INSERT INTO matricula VALUES('AL083','AS029',1.68);
INSERT INTO matricula VALUES('AL083','AS030',9.43);
INSERT INTO matricula VALUES('AL095','AS021',1.11);
INSERT INTO matricula VALUES('AL095','AS022',3.49);
INSERT INTO matricula VALUES('AL095','AS023',4.17);
INSERT INTO matricula VALUES('AL095','AS024',9.43);
INSERT INTO matricula VALUES('AL095','AS025',2.64);
INSERT INTO matricula VALUES('AL095','AS026',7.05);
INSERT INTO matricula VALUES('AL095','AS027',1.21);
INSERT INTO matricula VALUES('AL095','AS028',6.49);
INSERT INTO matricula VALUES('AL095','AS029',10);
INSERT INTO matricula VALUES('AL095','AS030',8.91);
INSERT INTO matricula VALUES('AL096','AS021',9.15);
INSERT INTO matricula VALUES('AL096','AS022',4.63);
INSERT INTO matricula VALUES('AL096','AS023',2.51);
INSERT INTO matricula VALUES('AL096','AS024',2.53);
INSERT INTO matricula VALUES('AL096','AS025',3.02);
INSERT INTO matricula VALUES('AL096','AS026',3.13);
INSERT INTO matricula VALUES('AL096','AS027',5.75);
INSERT INTO matricula VALUES('AL096','AS028',1.35);
INSERT INTO matricula VALUES('AL096','AS029',8.63);
INSERT INTO matricula VALUES('AL096','AS030',9.47);
INSERT INTO matricula VALUES('AL098','AS021',9.84);
INSERT INTO matricula VALUES('AL098','AS022',4.29);
INSERT INTO matricula VALUES('AL098','AS023',9.96);
INSERT INTO matricula VALUES('AL098','AS024',10);
INSERT INTO matricula VALUES('AL098','AS025',6.98);
INSERT INTO matricula VALUES('AL098','AS026',10);
INSERT INTO matricula VALUES('AL098','AS027',4.95);
INSERT INTO matricula VALUES('AL098','AS028',2.91);
INSERT INTO matricula VALUES('AL098','AS029',7.88);
INSERT INTO matricula VALUES('AL098','AS030',7.41);
INSERT INTO matricula VALUES('AL105','AS021',7.86);
INSERT INTO matricula VALUES('AL105','AS022',7.38);
INSERT INTO matricula VALUES('AL105','AS023',4.55);
INSERT INTO matricula VALUES('AL105','AS024',10);
INSERT INTO matricula VALUES('AL105','AS025',1.49);
INSERT INTO matricula VALUES('AL105','AS026',7.14);
INSERT INTO matricula VALUES('AL105','AS027',5.21);
INSERT INTO matricula VALUES('AL105','AS028',1.09);
INSERT INTO matricula VALUES('AL105','AS029',4.38);
INSERT INTO matricula VALUES('AL105','AS030',1.49);
INSERT INTO matricula VALUES('AL110','AS021',5.84);
INSERT INTO matricula VALUES('AL110','AS022',4.59);
INSERT INTO matricula VALUES('AL110','AS023',1.15);
INSERT INTO matricula VALUES('AL110','AS024',6.59);
INSERT INTO matricula VALUES('AL110','AS025',6.18);
INSERT INTO matricula VALUES('AL110','AS026',8.56);
INSERT INTO matricula VALUES('AL110','AS027',10);
INSERT INTO matricula VALUES('AL110','AS028',5.91);
INSERT INTO matricula VALUES('AL110','AS029',1.76);
INSERT INTO matricula VALUES('AL110','AS030',9.63);
INSERT INTO matricula VALUES('AL122','AS021',4.36);
INSERT INTO matricula VALUES('AL122','AS022',10);
INSERT INTO matricula VALUES('AL122','AS023',1.58);
INSERT INTO matricula VALUES('AL122','AS024',1.32);
INSERT INTO matricula VALUES('AL122','AS025',7.77);
INSERT INTO matricula VALUES('AL122','AS026',10);
INSERT INTO matricula VALUES('AL122','AS027',1.19);
INSERT INTO matricula VALUES('AL122','AS028',10);
INSERT INTO matricula VALUES('AL122','AS029',2.53);
INSERT INTO matricula VALUES('AL122','AS030',3.28);
INSERT INTO matricula VALUES('AL124','AS021',6.77);
INSERT INTO matricula VALUES('AL124','AS022',9.94);
INSERT INTO matricula VALUES('AL124','AS023',8.61);
INSERT INTO matricula VALUES('AL124','AS024',10);
INSERT INTO matricula VALUES('AL124','AS025',9.95);
INSERT INTO matricula VALUES('AL124','AS026',7.88);
INSERT INTO matricula VALUES('AL124','AS027',8.42);
INSERT INTO matricula VALUES('AL124','AS028',7.24);
INSERT INTO matricula VALUES('AL124','AS029',8.95);
INSERT INTO matricula VALUES('AL124','AS030',4.54);
INSERT INTO matricula VALUES('AL127','AS021',6.65);
INSERT INTO matricula VALUES('AL127','AS022',9.93);
INSERT INTO matricula VALUES('AL127','AS023',9.18);
INSERT INTO matricula VALUES('AL127','AS024',9.99);
INSERT INTO matricula VALUES('AL127','AS025',6.19);
INSERT INTO matricula VALUES('AL127','AS026',4.93);
INSERT INTO matricula VALUES('AL127','AS027',4.37);
INSERT INTO matricula VALUES('AL127','AS028',2.36);
INSERT INTO matricula VALUES('AL127','AS029',7.57);
INSERT INTO matricula VALUES('AL127','AS030',3.96);
INSERT INTO matricula VALUES('AL134','AS021',10);
INSERT INTO matricula VALUES('AL134','AS022',6.29);
INSERT INTO matricula VALUES('AL134','AS023',2.51);
INSERT INTO matricula VALUES('AL134','AS024',5.71);
INSERT INTO matricula VALUES('AL134','AS025',9.99);
INSERT INTO matricula VALUES('AL134','AS026',5.24);
INSERT INTO matricula VALUES('AL134','AS027',6.06);
INSERT INTO matricula VALUES('AL134','AS028',6.67);
INSERT INTO matricula VALUES('AL134','AS029',4.34);
INSERT INTO matricula VALUES('AL134','AS030',5.72);
INSERT INTO matricula VALUES('AL139','AS021',2.85);
INSERT INTO matricula VALUES('AL139','AS022',9.68);
INSERT INTO matricula VALUES('AL139','AS023',4.12);
INSERT INTO matricula VALUES('AL139','AS024',9.82);
INSERT INTO matricula VALUES('AL139','AS025',1.74);
INSERT INTO matricula VALUES('AL139','AS026',8.16);
INSERT INTO matricula VALUES('AL139','AS027',2.65);
INSERT INTO matricula VALUES('AL139','AS028',3.22);
INSERT INTO matricula VALUES('AL139','AS029',5.36);
INSERT INTO matricula VALUES('AL139','AS030',6.46);
INSERT INTO matricula VALUES('AL145','AS021',7.93);
INSERT INTO matricula VALUES('AL145','AS022',7.73);
INSERT INTO matricula VALUES('AL145','AS023',9.09);
INSERT INTO matricula VALUES('AL145','AS024',3.45);
INSERT INTO matricula VALUES('AL145','AS025',5.14);
INSERT INTO matricula VALUES('AL145','AS026',3.51);
INSERT INTO matricula VALUES('AL145','AS027',2.27);
INSERT INTO matricula VALUES('AL145','AS028',8.77);
INSERT INTO matricula VALUES('AL145','AS029',10);
INSERT INTO matricula VALUES('AL145','AS030',9.48);
INSERT INTO matricula VALUES('AL146','AS021',1.12);
INSERT INTO matricula VALUES('AL146','AS022',8.63);
INSERT INTO matricula VALUES('AL146','AS023',9.93);
INSERT INTO matricula VALUES('AL146','AS024',3.02);
INSERT INTO matricula VALUES('AL146','AS025',7.41);
INSERT INTO matricula VALUES('AL146','AS026',4.95);
INSERT INTO matricula VALUES('AL146','AS027',7.57);
INSERT INTO matricula VALUES('AL146','AS028',1.37);
INSERT INTO matricula VALUES('AL146','AS029',3.94);
INSERT INTO matricula VALUES('AL146','AS030',5.42);
INSERT INTO matricula VALUES('AL149','AS021',3.05);
INSERT INTO matricula VALUES('AL149','AS022',4.22);
INSERT INTO matricula VALUES('AL149','AS023',6.94);
INSERT INTO matricula VALUES('AL149','AS024',9.53);
INSERT INTO matricula VALUES('AL149','AS025',5.59);
INSERT INTO matricula VALUES('AL149','AS026',1.57);
INSERT INTO matricula VALUES('AL149','AS027',5.06);
INSERT INTO matricula VALUES('AL149','AS028',5.22);
INSERT INTO matricula VALUES('AL149','AS029',6.79);
INSERT INTO matricula VALUES('AL149','AS030',5.65);
INSERT INTO matricula VALUES('AL150','AS021',7.13);
INSERT INTO matricula VALUES('AL150','AS022',2.77);
INSERT INTO matricula VALUES('AL150','AS023',2.18);
INSERT INTO matricula VALUES('AL150','AS024',9.09);
INSERT INTO matricula VALUES('AL150','AS025',5.36);
INSERT INTO matricula VALUES('AL150','AS026',1.98);
INSERT INTO matricula VALUES('AL150','AS027',4.18);
INSERT INTO matricula VALUES('AL150','AS028',5.43);
INSERT INTO matricula VALUES('AL150','AS029',6.72);
INSERT INTO matricula VALUES('AL150','AS030',2.83);
INSERT INTO matricula VALUES('AL153','AS021',9.35);
INSERT INTO matricula VALUES('AL153','AS022',9.31);
INSERT INTO matricula VALUES('AL153','AS023',6.82);
INSERT INTO matricula VALUES('AL153','AS024',1.73);
INSERT INTO matricula VALUES('AL153','AS025',7.51);
INSERT INTO matricula VALUES('AL153','AS026',7.36);
INSERT INTO matricula VALUES('AL153','AS027',5.64);
INSERT INTO matricula VALUES('AL153','AS028',5.53);
INSERT INTO matricula VALUES('AL153','AS029',2.77);
INSERT INTO matricula VALUES('AL153','AS030',6.84);
INSERT INTO matricula VALUES('AL155','AS021',9.63);
INSERT INTO matricula VALUES('AL155','AS022',3.13);
INSERT INTO matricula VALUES('AL155','AS023',6.86);
INSERT INTO matricula VALUES('AL155','AS024',10);
INSERT INTO matricula VALUES('AL155','AS025',9.21);
INSERT INTO matricula VALUES('AL155','AS026',2.79);
INSERT INTO matricula VALUES('AL155','AS027',3.74);
INSERT INTO matricula VALUES('AL155','AS028',9.17);
INSERT INTO matricula VALUES('AL155','AS029',4.21);
INSERT INTO matricula VALUES('AL155','AS030',2.85);
INSERT INTO matricula VALUES('AL157','AS021',7.77);
INSERT INTO matricula VALUES('AL157','AS022',5.23);
INSERT INTO matricula VALUES('AL157','AS023',8.04);
INSERT INTO matricula VALUES('AL157','AS024',8.22);
INSERT INTO matricula VALUES('AL157','AS025',9.41);
INSERT INTO matricula VALUES('AL157','AS026',10);
INSERT INTO matricula VALUES('AL157','AS027',2.73);
INSERT INTO matricula VALUES('AL157','AS028',5.97);
INSERT INTO matricula VALUES('AL157','AS029',6.61);
INSERT INTO matricula VALUES('AL157','AS030',5.17);
INSERT INTO matricula VALUES('AL162','AS021',2.79);
INSERT INTO matricula VALUES('AL162','AS022',5.98);
INSERT INTO matricula VALUES('AL162','AS023',7.96);
INSERT INTO matricula VALUES('AL162','AS024',4.94);
INSERT INTO matricula VALUES('AL162','AS025',3.23);
INSERT INTO matricula VALUES('AL162','AS026',10);
INSERT INTO matricula VALUES('AL162','AS027',1.82);
INSERT INTO matricula VALUES('AL162','AS028',7.51);
INSERT INTO matricula VALUES('AL162','AS029',7.68);
INSERT INTO matricula VALUES('AL162','AS030',5.39);
INSERT INTO matricula VALUES('AL175','AS021',1.72);
INSERT INTO matricula VALUES('AL175','AS022',10);
INSERT INTO matricula VALUES('AL175','AS023',8.96);
INSERT INTO matricula VALUES('AL175','AS024',5.91);
INSERT INTO matricula VALUES('AL175','AS025',5.61);
INSERT INTO matricula VALUES('AL175','AS026',10);
INSERT INTO matricula VALUES('AL175','AS027',4.84);
INSERT INTO matricula VALUES('AL175','AS028',9.16);
INSERT INTO matricula VALUES('AL175','AS029',2.25);
INSERT INTO matricula VALUES('AL175','AS030',4.65);
INSERT INTO matricula VALUES('AL180','AS021',6.47);
INSERT INTO matricula VALUES('AL180','AS022',10);
INSERT INTO matricula VALUES('AL180','AS023',5.44);
INSERT INTO matricula VALUES('AL180','AS024',4.55);
INSERT INTO matricula VALUES('AL180','AS025',3.55);
INSERT INTO matricula VALUES('AL180','AS026',8.63);
INSERT INTO matricula VALUES('AL180','AS027',5.83);
INSERT INTO matricula VALUES('AL180','AS028',9.46);
INSERT INTO matricula VALUES('AL180','AS029',8.87);
INSERT INTO matricula VALUES('AL180','AS030',2.12);
INSERT INTO matricula VALUES('AL186','AS021',10);
INSERT INTO matricula VALUES('AL186','AS022',5.45);
INSERT INTO matricula VALUES('AL186','AS023',8.57);
INSERT INTO matricula VALUES('AL186','AS024',2.89);
INSERT INTO matricula VALUES('AL186','AS025',1.53);
INSERT INTO matricula VALUES('AL186','AS026',4.22);
INSERT INTO matricula VALUES('AL186','AS027',4.29);
INSERT INTO matricula VALUES('AL186','AS028',1.09);
INSERT INTO matricula VALUES('AL186','AS029',7.07);
INSERT INTO matricula VALUES('AL186','AS030',7.07);
INSERT INTO matricula VALUES('AL192','AS021',6.03);
INSERT INTO matricula VALUES('AL192','AS022',8.51);
INSERT INTO matricula VALUES('AL192','AS023',6.85);
INSERT INTO matricula VALUES('AL192','AS024',4.54);
INSERT INTO matricula VALUES('AL192','AS025',10);
INSERT INTO matricula VALUES('AL192','AS026',9.55);
INSERT INTO matricula VALUES('AL192','AS027',5.32);
INSERT INTO matricula VALUES('AL192','AS028',4.35);
INSERT INTO matricula VALUES('AL192','AS029',9.28);
INSERT INTO matricula VALUES('AL192','AS030',9.09);
INSERT INTO matricula VALUES('AL196','AS021',1.97);
INSERT INTO matricula VALUES('AL196','AS022',8.52);
INSERT INTO matricula VALUES('AL196','AS023',4.95);
INSERT INTO matricula VALUES('AL196','AS024',7.35);
INSERT INTO matricula VALUES('AL196','AS025',10);
INSERT INTO matricula VALUES('AL196','AS026',10);
INSERT INTO matricula VALUES('AL196','AS027',8.17);
INSERT INTO matricula VALUES('AL196','AS028',1.93);
INSERT INTO matricula VALUES('AL196','AS029',9.81);
INSERT INTO matricula VALUES('AL196','AS030',1.07);
INSERT INTO matricula VALUES('AL002','AS031',8.69);
INSERT INTO matricula VALUES('AL002','AS032',6.57);
INSERT INTO matricula VALUES('AL002','AS033',10);
INSERT INTO matricula VALUES('AL002','AS034',6.58);
INSERT INTO matricula VALUES('AL002','AS035',8.51);
INSERT INTO matricula VALUES('AL002','AS080',7.17);
INSERT INTO matricula VALUES('AL002','AS067',5.62);
INSERT INTO matricula VALUES('AL002','AS070',10);
INSERT INTO matricula VALUES('AL002','AS053',6.99);
INSERT INTO matricula VALUES('AL002','AS078',1.38);
INSERT INTO matricula VALUES('AL005','AS031',7.92);
INSERT INTO matricula VALUES('AL005','AS032',1.06);
INSERT INTO matricula VALUES('AL005','AS033',8.27);
INSERT INTO matricula VALUES('AL005','AS034',3.08);
INSERT INTO matricula VALUES('AL005','AS035',1.35);
INSERT INTO matricula VALUES('AL005','AS048',10);
INSERT INTO matricula VALUES('AL005','AS051',7.39);
INSERT INTO matricula VALUES('AL005','AS038',3.16);
INSERT INTO matricula VALUES('AL005','AS083',6.77);
INSERT INTO matricula VALUES('AL005','AS058',6.64);
INSERT INTO matricula VALUES('AL012','AS031',3.52);
INSERT INTO matricula VALUES('AL012','AS032',5.69);
INSERT INTO matricula VALUES('AL012','AS033',8.33);
INSERT INTO matricula VALUES('AL012','AS034',6.85);
INSERT INTO matricula VALUES('AL012','AS035',6.03);
INSERT INTO matricula VALUES('AL012','AS071',1.16);
INSERT INTO matricula VALUES('AL012','AS081',3.91);
INSERT INTO matricula VALUES('AL012','AS053',3.53);
INSERT INTO matricula VALUES('AL012','AS048',1.31);
INSERT INTO matricula VALUES('AL012','AS041',5.59);
INSERT INTO matricula VALUES('AL013','AS031',6.43);
INSERT INTO matricula VALUES('AL013','AS032',7.02);
INSERT INTO matricula VALUES('AL013','AS033',5.61);
INSERT INTO matricula VALUES('AL013','AS034',1.89);
INSERT INTO matricula VALUES('AL013','AS035',6.83);
INSERT INTO matricula VALUES('AL013','AS044',2.84);
INSERT INTO matricula VALUES('AL013','AS071',2.06);
INSERT INTO matricula VALUES('AL013','AS066',1.47);
INSERT INTO matricula VALUES('AL013','AS070',7.07);
INSERT INTO matricula VALUES('AL013','AS039',10);
INSERT INTO matricula VALUES('AL014','AS031',8.42);
INSERT INTO matricula VALUES('AL014','AS032',8.57);
INSERT INTO matricula VALUES('AL014','AS033',7.06);
INSERT INTO matricula VALUES('AL014','AS034',4.76);
INSERT INTO matricula VALUES('AL014','AS035',5.67);
INSERT INTO matricula VALUES('AL014','AS058',4.65);
INSERT INTO matricula VALUES('AL014','AS044',8.52);
INSERT INTO matricula VALUES('AL014','AS046',7.62);
INSERT INTO matricula VALUES('AL014','AS037',4.42);
INSERT INTO matricula VALUES('AL014','AS046',1.63);
INSERT INTO matricula VALUES('AL016','AS031',3.45);
INSERT INTO matricula VALUES('AL016','AS032',4.33);
INSERT INTO matricula VALUES('AL016','AS033',1.89);
INSERT INTO matricula VALUES('AL016','AS034',10);
INSERT INTO matricula VALUES('AL016','AS035',1.02);
INSERT INTO matricula VALUES('AL016','AS046',1.52);
INSERT INTO matricula VALUES('AL016','AS070',4.79);
INSERT INTO matricula VALUES('AL016','AS039',4.37);
INSERT INTO matricula VALUES('AL016','AS061',4.49);
INSERT INTO matricula VALUES('AL016','AS059',6.75);
INSERT INTO matricula VALUES('AL018','AS031',9.39);
INSERT INTO matricula VALUES('AL018','AS032',10);
INSERT INTO matricula VALUES('AL018','AS033',1.45);
INSERT INTO matricula VALUES('AL018','AS034',4.16);
INSERT INTO matricula VALUES('AL018','AS035',10);
INSERT INTO matricula VALUES('AL018','AS068',2.75);
INSERT INTO matricula VALUES('AL018','AS043',3.75);
INSERT INTO matricula VALUES('AL018','AS083',4.73);
INSERT INTO matricula VALUES('AL018','AS071',3.36);
INSERT INTO matricula VALUES('AL018','AS067',4.55);
INSERT INTO matricula VALUES('AL021','AS031',9.38);
INSERT INTO matricula VALUES('AL021','AS032',5.32);
INSERT INTO matricula VALUES('AL021','AS033',6.82);
INSERT INTO matricula VALUES('AL021','AS034',5.69);
INSERT INTO matricula VALUES('AL021','AS035',6.99);
INSERT INTO matricula VALUES('AL021','AS083',2.32);
INSERT INTO matricula VALUES('AL021','AS041',5.79);
INSERT INTO matricula VALUES('AL021','AS069',5.85);
INSERT INTO matricula VALUES('AL021','AS062',2.69);
INSERT INTO matricula VALUES('AL021','AS067',9.45);
INSERT INTO matricula VALUES('AL022','AS031',7.15);
INSERT INTO matricula VALUES('AL022','AS032',5.75);
INSERT INTO matricula VALUES('AL022','AS033',10);
INSERT INTO matricula VALUES('AL022','AS034',9.02);
INSERT INTO matricula VALUES('AL022','AS035',1.17);
INSERT INTO matricula VALUES('AL022','AS070',3.36);
INSERT INTO matricula VALUES('AL022','AS051',10);
INSERT INTO matricula VALUES('AL022','AS067',5.51);
INSERT INTO matricula VALUES('AL022','AS038',10);
INSERT INTO matricula VALUES('AL022','AS077',3.62);
INSERT INTO matricula VALUES('AL033','AS031',3.73);
INSERT INTO matricula VALUES('AL033','AS032',10);
INSERT INTO matricula VALUES('AL033','AS033',6.45);
INSERT INTO matricula VALUES('AL033','AS034',8.51);
INSERT INTO matricula VALUES('AL033','AS035',1.23);
INSERT INTO matricula VALUES('AL033','AS080',10);
INSERT INTO matricula VALUES('AL033','AS042',10);
INSERT INTO matricula VALUES('AL033','AS043',7.16);
INSERT INTO matricula VALUES('AL033','AS071',1.84);
INSERT INTO matricula VALUES('AL033','AS064',7.88);
INSERT INTO matricula VALUES('AL036','AS031',1.43);
INSERT INTO matricula VALUES('AL036','AS032',9.69);
INSERT INTO matricula VALUES('AL036','AS033',6.67);
INSERT INTO matricula VALUES('AL036','AS034',4.39);
INSERT INTO matricula VALUES('AL036','AS035',8.95);
INSERT INTO matricula VALUES('AL036','AS046',10);
INSERT INTO matricula VALUES('AL036','AS044',7.88);
INSERT INTO matricula VALUES('AL036','AS047',6.43);
INSERT INTO matricula VALUES('AL036','AS047',9.43);
INSERT INTO matricula VALUES('AL036','AS061',8.32);
INSERT INTO matricula VALUES('AL039','AS031',5.79);
INSERT INTO matricula VALUES('AL039','AS032',1.97);
INSERT INTO matricula VALUES('AL039','AS033',9.78);
INSERT INTO matricula VALUES('AL039','AS034',7.33);
INSERT INTO matricula VALUES('AL039','AS035',5.11);
INSERT INTO matricula VALUES('AL039','AS037',6.51);
INSERT INTO matricula VALUES('AL039','AS046',5.22);
INSERT INTO matricula VALUES('AL039','AS075',2.11);
INSERT INTO matricula VALUES('AL039','AS043',7.88);
INSERT INTO matricula VALUES('AL039','AS078',2.48);
INSERT INTO matricula VALUES('AL041','AS031',9.42);
INSERT INTO matricula VALUES('AL041','AS032',3.82);
INSERT INTO matricula VALUES('AL041','AS033',9.26);
INSERT INTO matricula VALUES('AL041','AS034',9.57);
INSERT INTO matricula VALUES('AL041','AS035',1.76);
INSERT INTO matricula VALUES('AL041','AS047',3.96);
INSERT INTO matricula VALUES('AL041','AS043',8.76);
INSERT INTO matricula VALUES('AL041','AS078',10);
INSERT INTO matricula VALUES('AL041','AS051',7.25);
INSERT INTO matricula VALUES('AL041','AS040',3.67);
INSERT INTO matricula VALUES('AL042','AS031',5.11);
INSERT INTO matricula VALUES('AL042','AS032',7.08);
INSERT INTO matricula VALUES('AL042','AS033',3.67);
INSERT INTO matricula VALUES('AL042','AS034',10);
INSERT INTO matricula VALUES('AL042','AS035',2.72);
INSERT INTO matricula VALUES('AL042','AS053',10);
INSERT INTO matricula VALUES('AL042','AS074',1.17);
INSERT INTO matricula VALUES('AL042','AS044',8.14);
INSERT INTO matricula VALUES('AL042','AS068',9.86);
INSERT INTO matricula VALUES('AL042','AS067',10);
INSERT INTO matricula VALUES('AL046','AS031',2.59);
INSERT INTO matricula VALUES('AL046','AS032',8.45);
INSERT INTO matricula VALUES('AL046','AS033',7.81);
INSERT INTO matricula VALUES('AL046','AS034',1.81);
INSERT INTO matricula VALUES('AL046','AS035',4.55);
INSERT INTO matricula VALUES('AL046','AS069',8.78);
INSERT INTO matricula VALUES('AL046','AS066',10);
INSERT INTO matricula VALUES('AL046','AS048',1.88);
INSERT INTO matricula VALUES('AL046','AS076',5.88);
INSERT INTO matricula VALUES('AL046','AS047',7.64);
INSERT INTO matricula VALUES('AL049','AS031',4.78);
INSERT INTO matricula VALUES('AL049','AS032',10);
INSERT INTO matricula VALUES('AL049','AS033',1.61);
INSERT INTO matricula VALUES('AL049','AS034',6.94);
INSERT INTO matricula VALUES('AL049','AS035',2.09);
INSERT INTO matricula VALUES('AL049','AS080',9.15);
INSERT INTO matricula VALUES('AL049','AS047',9.55);
INSERT INTO matricula VALUES('AL049','AS069',6.48);
INSERT INTO matricula VALUES('AL049','AS078',1.38);
INSERT INTO matricula VALUES('AL049','AS044',9.23);
INSERT INTO matricula VALUES('AL060','AS031',9.95);
INSERT INTO matricula VALUES('AL060','AS032',6.28);
INSERT INTO matricula VALUES('AL060','AS033',5.35);
INSERT INTO matricula VALUES('AL060','AS034',4.44);
INSERT INTO matricula VALUES('AL060','AS035',1.15);
INSERT INTO matricula VALUES('AL060','AS039',7.36);
INSERT INTO matricula VALUES('AL060','AS045',8.04);
INSERT INTO matricula VALUES('AL060','AS074',10);
INSERT INTO matricula VALUES('AL060','AS051',10);
INSERT INTO matricula VALUES('AL060','AS081',2.65);
INSERT INTO matricula VALUES('AL065','AS031',6.74);
INSERT INTO matricula VALUES('AL065','AS032',6.24);
INSERT INTO matricula VALUES('AL065','AS033',7.25);
INSERT INTO matricula VALUES('AL065','AS034',1.91);
INSERT INTO matricula VALUES('AL065','AS035',7.11);
INSERT INTO matricula VALUES('AL065','AS044',7.12);
INSERT INTO matricula VALUES('AL065','AS064',6.15);
INSERT INTO matricula VALUES('AL065','AS053',5.91);
INSERT INTO matricula VALUES('AL065','AS037',9.08);
INSERT INTO matricula VALUES('AL065','AS047',6.47);
INSERT INTO matricula VALUES('AL067','AS031',8.41);
INSERT INTO matricula VALUES('AL067','AS032',9.86);
INSERT INTO matricula VALUES('AL067','AS033',4.55);
INSERT INTO matricula VALUES('AL067','AS034',6.92);
INSERT INTO matricula VALUES('AL067','AS035',6.41);
INSERT INTO matricula VALUES('AL067','AS074',4.28);
INSERT INTO matricula VALUES('AL067','AS064',2.07);
INSERT INTO matricula VALUES('AL067','AS080',8.14);
INSERT INTO matricula VALUES('AL067','AS047',4.98);
INSERT INTO matricula VALUES('AL067','AS083',4.52);
INSERT INTO matricula VALUES('AL068','AS031',5.89);
INSERT INTO matricula VALUES('AL068','AS032',5.28);
INSERT INTO matricula VALUES('AL068','AS033',3.21);
INSERT INTO matricula VALUES('AL068','AS034',7.04);
INSERT INTO matricula VALUES('AL068','AS035',7.68);
INSERT INTO matricula VALUES('AL068','AS065',8.38);
INSERT INTO matricula VALUES('AL068','AS067',1.03);
INSERT INTO matricula VALUES('AL068','AS057',5.91);
INSERT INTO matricula VALUES('AL068','AS068',9.01);
INSERT INTO matricula VALUES('AL068','AS044',4.11);
INSERT INTO matricula VALUES('AL074','AS031',9.17);
INSERT INTO matricula VALUES('AL074','AS032',1.68);
INSERT INTO matricula VALUES('AL074','AS033',1.15);
INSERT INTO matricula VALUES('AL074','AS034',7.66);
INSERT INTO matricula VALUES('AL074','AS035',7.36);
INSERT INTO matricula VALUES('AL074','AS051',1.23);
INSERT INTO matricula VALUES('AL074','AS077',3.58);
INSERT INTO matricula VALUES('AL074','AS042',10);
INSERT INTO matricula VALUES('AL074','AS042',7.99);
INSERT INTO matricula VALUES('AL074','AS043',8.11);
INSERT INTO matricula VALUES('AL077','AS031',6.21);
INSERT INTO matricula VALUES('AL077','AS032',4.17);
INSERT INTO matricula VALUES('AL077','AS033',3.51);
INSERT INTO matricula VALUES('AL077','AS034',8.15);
INSERT INTO matricula VALUES('AL077','AS035',7.46);
INSERT INTO matricula VALUES('AL077','AS075',5.56);
INSERT INTO matricula VALUES('AL077','AS058',4.89);
INSERT INTO matricula VALUES('AL077','AS062',10);
INSERT INTO matricula VALUES('AL077','AS037',4.78);
INSERT INTO matricula VALUES('AL077','AS038',8.61);
INSERT INTO matricula VALUES('AL086','AS031',1.39);
INSERT INTO matricula VALUES('AL086','AS032',9.88);
INSERT INTO matricula VALUES('AL086','AS033',2.14);
INSERT INTO matricula VALUES('AL086','AS034',1.52);
INSERT INTO matricula VALUES('AL086','AS035',7.44);
INSERT INTO matricula VALUES('AL086','AS043',10);
INSERT INTO matricula VALUES('AL086','AS070',10);
INSERT INTO matricula VALUES('AL086','AS064',6.31);
INSERT INTO matricula VALUES('AL086','AS068',7.21);
INSERT INTO matricula VALUES('AL086','AS071',7.57);
INSERT INTO matricula VALUES('AL087','AS083',4.46);
INSERT INTO matricula VALUES('AL087','AS070',4.41);
INSERT INTO matricula VALUES('AL087','AS066',4.76);
INSERT INTO matricula VALUES('AL087','AS051',1.82);
INSERT INTO matricula VALUES('AL087','AS057',8.36);
INSERT INTO matricula VALUES('AL087','AS064',1.11);
INSERT INTO matricula VALUES('AL087','AS059',2.52);
INSERT INTO matricula VALUES('AL087','AS077',2.55);
INSERT INTO matricula VALUES('AL087','AS064',2.92);
INSERT INTO matricula VALUES('AL087','AS071',10);
INSERT INTO matricula VALUES('AL088','AS031',9.98);
INSERT INTO matricula VALUES('AL088','AS032',9.25);
INSERT INTO matricula VALUES('AL088','AS033',1.23);
INSERT INTO matricula VALUES('AL088','AS034',6.87);
INSERT INTO matricula VALUES('AL088','AS035',9.88);
INSERT INTO matricula VALUES('AL088','AS061',4.39);
INSERT INTO matricula VALUES('AL088','AS064',6.87);
INSERT INTO matricula VALUES('AL088','AS078',2.02);
INSERT INTO matricula VALUES('AL088','AS048',6.36);
INSERT INTO matricula VALUES('AL088','AS067',2.64);
INSERT INTO matricula VALUES('AL089','AS031',10);
INSERT INTO matricula VALUES('AL089','AS032',7.42);
INSERT INTO matricula VALUES('AL089','AS033',9.22);
INSERT INTO matricula VALUES('AL089','AS034',9.13);
INSERT INTO matricula VALUES('AL089','AS035',9.06);
INSERT INTO matricula VALUES('AL089','AS083',3.17);
INSERT INTO matricula VALUES('AL089','AS083',5.54);
INSERT INTO matricula VALUES('AL089','AS039',7.02);
INSERT INTO matricula VALUES('AL089','AS039',8.31);
INSERT INTO matricula VALUES('AL089','AS076',7.06);
INSERT INTO matricula VALUES('AL094','AS031',4.39);
INSERT INTO matricula VALUES('AL094','AS032',2.29);
INSERT INTO matricula VALUES('AL094','AS033',3.95);
INSERT INTO matricula VALUES('AL094','AS034',3.81);
INSERT INTO matricula VALUES('AL094','AS035',7.45);
INSERT INTO matricula VALUES('AL094','AS069',10);
INSERT INTO matricula VALUES('AL094','AS040',6.52);
INSERT INTO matricula VALUES('AL094','AS059',2.41);
INSERT INTO matricula VALUES('AL094','AS061',6.23);
INSERT INTO matricula VALUES('AL094','AS080',8.63);
INSERT INTO matricula VALUES('AL107','AS031',10);
INSERT INTO matricula VALUES('AL107','AS032',6.42);
INSERT INTO matricula VALUES('AL107','AS033',10);
INSERT INTO matricula VALUES('AL107','AS034',1.27);
INSERT INTO matricula VALUES('AL107','AS035',5.47);
INSERT INTO matricula VALUES('AL107','AS051',5.13);
INSERT INTO matricula VALUES('AL107','AS076',3.16);
INSERT INTO matricula VALUES('AL107','AS067',10);
INSERT INTO matricula VALUES('AL107','AS057',3.79);
INSERT INTO matricula VALUES('AL107','AS058',10);
INSERT INTO matricula VALUES('AL114','AS031',9.19);
INSERT INTO matricula VALUES('AL114','AS032',5.54);
INSERT INTO matricula VALUES('AL114','AS033',1.81);
INSERT INTO matricula VALUES('AL114','AS034',4.24);
INSERT INTO matricula VALUES('AL114','AS035',3.61);
INSERT INTO matricula VALUES('AL114','AS066',4.88);
INSERT INTO matricula VALUES('AL114','AS065',8.47);
INSERT INTO matricula VALUES('AL114','AS042',2.46);
INSERT INTO matricula VALUES('AL114','AS062',4.65);
INSERT INTO matricula VALUES('AL114','AS037',4.96);
INSERT INTO matricula VALUES('AL115','AS031',8.22);
INSERT INTO matricula VALUES('AL115','AS032',4.57);
INSERT INTO matricula VALUES('AL115','AS033',9.92);
INSERT INTO matricula VALUES('AL115','AS034',2.17);
INSERT INTO matricula VALUES('AL115','AS035',10);
INSERT INTO matricula VALUES('AL115','AS042',3.69);
INSERT INTO matricula VALUES('AL115','AS065',9.09);
INSERT INTO matricula VALUES('AL115','AS074',5.13);
INSERT INTO matricula VALUES('AL115','AS080',6.54);
INSERT INTO matricula VALUES('AL115','AS039',3.61);
INSERT INTO matricula VALUES('AL117','AS031',4.98);
INSERT INTO matricula VALUES('AL117','AS032',1.39);
INSERT INTO matricula VALUES('AL117','AS033',8.32);
INSERT INTO matricula VALUES('AL117','AS034',1.95);
INSERT INTO matricula VALUES('AL117','AS035',1.14);
INSERT INTO matricula VALUES('AL117','AS044',4.07);
INSERT INTO matricula VALUES('AL117','AS041',5.23);
INSERT INTO matricula VALUES('AL117','AS075',9.85);
INSERT INTO matricula VALUES('AL117','AS077',1.24);
INSERT INTO matricula VALUES('AL117','AS065',9.21);
INSERT INTO matricula VALUES('AL121','AS031',1.48);
INSERT INTO matricula VALUES('AL121','AS032',6.07);
INSERT INTO matricula VALUES('AL121','AS033',8.86);
INSERT INTO matricula VALUES('AL121','AS034',2.62);
INSERT INTO matricula VALUES('AL121','AS035',10);
INSERT INTO matricula VALUES('AL121','AS045',8.27);
INSERT INTO matricula VALUES('AL121','AS071',7.11);
INSERT INTO matricula VALUES('AL121','AS061',8.64);
INSERT INTO matricula VALUES('AL121','AS041',5.82);
INSERT INTO matricula VALUES('AL121','AS075',2.25);
INSERT INTO matricula VALUES('AL128','AS031',10);
INSERT INTO matricula VALUES('AL128','AS032',3.42);
INSERT INTO matricula VALUES('AL128','AS033',7.31);
INSERT INTO matricula VALUES('AL128','AS034',2.34);
INSERT INTO matricula VALUES('AL128','AS035',7.14);
INSERT INTO matricula VALUES('AL128','AS039',4.82);
INSERT INTO matricula VALUES('AL128','AS074',3.91);
INSERT INTO matricula VALUES('AL128','AS078',5.64);
INSERT INTO matricula VALUES('AL128','AS048',5.13);
INSERT INTO matricula VALUES('AL128','AS077',2.44);
INSERT INTO matricula VALUES('AL136','AS031',10);
INSERT INTO matricula VALUES('AL136','AS032',9.63);
INSERT INTO matricula VALUES('AL136','AS033',7.54);
INSERT INTO matricula VALUES('AL136','AS034',4.33);
INSERT INTO matricula VALUES('AL136','AS035',8.34);
INSERT INTO matricula VALUES('AL136','AS059',4.19);
INSERT INTO matricula VALUES('AL136','AS051',6.17);
INSERT INTO matricula VALUES('AL136','AS045',9.35);
INSERT INTO matricula VALUES('AL136','AS081',7.92);
INSERT INTO matricula VALUES('AL136','AS057',4.59);
INSERT INTO matricula VALUES('AL141','AS031',9.93);
INSERT INTO matricula VALUES('AL141','AS032',2.69);
INSERT INTO matricula VALUES('AL141','AS033',5.39);
INSERT INTO matricula VALUES('AL141','AS034',4.34);
INSERT INTO matricula VALUES('AL141','AS035',1.23);
INSERT INTO matricula VALUES('AL141','AS065',7.54);
INSERT INTO matricula VALUES('AL141','AS051',9.49);
INSERT INTO matricula VALUES('AL141','AS068',10);
INSERT INTO matricula VALUES('AL141','AS042',5.85);
INSERT INTO matricula VALUES('AL141','AS048',4.12);
INSERT INTO matricula VALUES('AL156','AS031',3.74);
INSERT INTO matricula VALUES('AL156','AS032',10);
INSERT INTO matricula VALUES('AL156','AS033',5.03);
INSERT INTO matricula VALUES('AL156','AS034',9.78);
INSERT INTO matricula VALUES('AL156','AS035',4.72);
INSERT INTO matricula VALUES('AL156','AS042',4.75);
INSERT INTO matricula VALUES('AL156','AS065',9.21);
INSERT INTO matricula VALUES('AL156','AS039',5.82);
INSERT INTO matricula VALUES('AL156','AS078',5.66);
INSERT INTO matricula VALUES('AL156','AS053',1.05);
INSERT INTO matricula VALUES('AL163','AS031',3.65);
INSERT INTO matricula VALUES('AL163','AS032',3.87);
INSERT INTO matricula VALUES('AL163','AS033',8.65);
INSERT INTO matricula VALUES('AL163','AS034',2.63);
INSERT INTO matricula VALUES('AL163','AS035',1.41);
INSERT INTO matricula VALUES('AL163','AS048',9.49);
INSERT INTO matricula VALUES('AL163','AS071',8.22);
INSERT INTO matricula VALUES('AL163','AS047',3.39);
INSERT INTO matricula VALUES('AL163','AS066',1.59);
INSERT INTO matricula VALUES('AL163','AS064',7.25);
INSERT INTO matricula VALUES('AL168','AS031',7.27);
INSERT INTO matricula VALUES('AL168','AS032',10);
INSERT INTO matricula VALUES('AL168','AS033',9.34);
INSERT INTO matricula VALUES('AL168','AS034',10);
INSERT INTO matricula VALUES('AL168','AS035',4.62);
INSERT INTO matricula VALUES('AL168','AS044',3.11);
INSERT INTO matricula VALUES('AL168','AS039',8.75);
INSERT INTO matricula VALUES('AL168','AS083',10);
INSERT INTO matricula VALUES('AL168','AS044',4.99);
INSERT INTO matricula VALUES('AL168','AS076',7.87);
INSERT INTO matricula VALUES('AL171','AS031',1.96);
INSERT INTO matricula VALUES('AL171','AS032',2.68);
INSERT INTO matricula VALUES('AL171','AS033',2.72);
INSERT INTO matricula VALUES('AL171','AS034',6.07);
INSERT INTO matricula VALUES('AL171','AS035',8.69);
INSERT INTO matricula VALUES('AL171','AS078',5.24);
INSERT INTO matricula VALUES('AL171','AS059',10);
INSERT INTO matricula VALUES('AL171','AS061',10);
INSERT INTO matricula VALUES('AL171','AS037',2.91);
INSERT INTO matricula VALUES('AL171','AS062',9.35);
INSERT INTO matricula VALUES('AL172','AS031',9.46);
INSERT INTO matricula VALUES('AL172','AS032',3.88);
INSERT INTO matricula VALUES('AL172','AS033',9.47);
INSERT INTO matricula VALUES('AL172','AS034',10);
INSERT INTO matricula VALUES('AL172','AS035',1.91);
INSERT INTO matricula VALUES('AL172','AS062',1.88);
INSERT INTO matricula VALUES('AL172','AS046',2.27);
INSERT INTO matricula VALUES('AL172','AS066',2.86);
INSERT INTO matricula VALUES('AL172','AS081',9.07);
INSERT INTO matricula VALUES('AL172','AS058',7.32);
INSERT INTO matricula VALUES('AL179','AS031',2.37);
INSERT INTO matricula VALUES('AL179','AS032',1.22);
INSERT INTO matricula VALUES('AL179','AS033',4.85);
INSERT INTO matricula VALUES('AL179','AS034',2.85);
INSERT INTO matricula VALUES('AL179','AS035',3.39);
INSERT INTO matricula VALUES('AL179','AS067',5.33);
INSERT INTO matricula VALUES('AL179','AS046',4.01);
INSERT INTO matricula VALUES('AL179','AS045',6.64);
INSERT INTO matricula VALUES('AL179','AS042',8.58);
INSERT INTO matricula VALUES('AL179','AS042',6.85);
INSERT INTO matricula VALUES('AL183','AS031',3.84);
INSERT INTO matricula VALUES('AL183','AS032',1.07);
INSERT INTO matricula VALUES('AL183','AS033',1.22);
INSERT INTO matricula VALUES('AL183','AS034',4.87);
INSERT INTO matricula VALUES('AL183','AS035',8.87);
INSERT INTO matricula VALUES('AL183','AS074',4.11);
INSERT INTO matricula VALUES('AL183','AS074',10);
INSERT INTO matricula VALUES('AL183','AS071',7.35);
INSERT INTO matricula VALUES('AL183','AS042',1.91);
INSERT INTO matricula VALUES('AL183','AS047',4.55);
INSERT INTO matricula VALUES('AL190','AS031',7.35);
INSERT INTO matricula VALUES('AL190','AS032',1.85);
INSERT INTO matricula VALUES('AL190','AS033',4.62);
INSERT INTO matricula VALUES('AL190','AS034',1.75);
INSERT INTO matricula VALUES('AL190','AS035',9.06);
INSERT INTO matricula VALUES('AL190','AS068',10);
INSERT INTO matricula VALUES('AL190','AS046',7.52);
INSERT INTO matricula VALUES('AL190','AS081',7.08);
INSERT INTO matricula VALUES('AL190','AS037',9.73);
INSERT INTO matricula VALUES('AL190','AS062',4.43);
INSERT INTO matricula VALUES('AL001','AS084',2.54);
INSERT INTO matricula VALUES('AL001','AS085',7.37);
INSERT INTO matricula VALUES('AL001','AS086',10);
INSERT INTO matricula VALUES('AL001','AS087',4.96);
INSERT INTO matricula VALUES('AL001','AS088',5.96);
INSERT INTO matricula VALUES('AL001','AS089',5.85);
INSERT INTO matricula VALUES('AL001','AS090',4.15);
INSERT INTO matricula VALUES('AL001','AS091',8.77);
INSERT INTO matricula VALUES('AL001','AS092',4.15);
INSERT INTO matricula VALUES('AL001','AS093',10);
INSERT INTO matricula VALUES('AL006','AS084',10);
INSERT INTO matricula VALUES('AL006','AS085',10);
INSERT INTO matricula VALUES('AL006','AS086',2.65);
INSERT INTO matricula VALUES('AL006','AS087',7.51);
INSERT INTO matricula VALUES('AL006','AS088',2.37);
INSERT INTO matricula VALUES('AL006','AS089',10);
INSERT INTO matricula VALUES('AL006','AS090',4.42);
INSERT INTO matricula VALUES('AL006','AS091',8.61);
INSERT INTO matricula VALUES('AL006','AS092',6.96);
INSERT INTO matricula VALUES('AL006','AS093',10);
INSERT INTO matricula VALUES('AL015','AS084',2.09);
INSERT INTO matricula VALUES('AL015','AS085',9.78);
INSERT INTO matricula VALUES('AL015','AS086',1.87);
INSERT INTO matricula VALUES('AL015','AS087',7.72);
INSERT INTO matricula VALUES('AL015','AS088',6.52);
INSERT INTO matricula VALUES('AL015','AS089',6.71);
INSERT INTO matricula VALUES('AL015','AS090',6.17);
INSERT INTO matricula VALUES('AL015','AS091',8.43);
INSERT INTO matricula VALUES('AL015','AS092',5.67);
INSERT INTO matricula VALUES('AL015','AS093',9.81);
INSERT INTO matricula VALUES('AL023','AS084',3.56);
INSERT INTO matricula VALUES('AL023','AS085',6.19);
INSERT INTO matricula VALUES('AL023','AS086',2.86);
INSERT INTO matricula VALUES('AL023','AS087',6.81);
INSERT INTO matricula VALUES('AL023','AS088',9.98);
INSERT INTO matricula VALUES('AL023','AS089',1.54);
INSERT INTO matricula VALUES('AL023','AS090',6.43);
INSERT INTO matricula VALUES('AL023','AS091',6.27);
INSERT INTO matricula VALUES('AL023','AS092',6.01);
INSERT INTO matricula VALUES('AL023','AS093',1.06);
INSERT INTO matricula VALUES('AL024','AS084',6.81);
INSERT INTO matricula VALUES('AL024','AS085',7.59);
INSERT INTO matricula VALUES('AL024','AS086',1.12);
INSERT INTO matricula VALUES('AL024','AS087',5.08);
INSERT INTO matricula VALUES('AL024','AS088',9.31);
INSERT INTO matricula VALUES('AL024','AS089',3.11);
INSERT INTO matricula VALUES('AL024','AS090',2.69);
INSERT INTO matricula VALUES('AL024','AS091',5.81);
INSERT INTO matricula VALUES('AL024','AS092',3.67);
INSERT INTO matricula VALUES('AL024','AS093',5.23);
INSERT INTO matricula VALUES('AL035','AS084',1.94);
INSERT INTO matricula VALUES('AL035','AS085',6.64);
INSERT INTO matricula VALUES('AL035','AS086',5.37);
INSERT INTO matricula VALUES('AL035','AS087',4.96);
INSERT INTO matricula VALUES('AL035','AS088',6.95);
INSERT INTO matricula VALUES('AL035','AS089',6.91);
INSERT INTO matricula VALUES('AL035','AS090',1.41);
INSERT INTO matricula VALUES('AL035','AS091',5.42);
INSERT INTO matricula VALUES('AL035','AS092',3.35);
INSERT INTO matricula VALUES('AL035','AS093',1.46);
INSERT INTO matricula VALUES('AL037','AS084',10);
INSERT INTO matricula VALUES('AL037','AS085',1.81);
INSERT INTO matricula VALUES('AL037','AS086',7.91);
INSERT INTO matricula VALUES('AL037','AS087',2.56);
INSERT INTO matricula VALUES('AL037','AS088',2.88);
INSERT INTO matricula VALUES('AL037','AS089',3.58);
INSERT INTO matricula VALUES('AL037','AS090',4.38);
INSERT INTO matricula VALUES('AL037','AS091',4.05);
INSERT INTO matricula VALUES('AL037','AS092',5.43);
INSERT INTO matricula VALUES('AL037','AS093',5.16);
INSERT INTO matricula VALUES('AL040','AS084',8.68);
INSERT INTO matricula VALUES('AL040','AS085',6.38);
INSERT INTO matricula VALUES('AL040','AS086',10);
INSERT INTO matricula VALUES('AL040','AS087',9.23);
INSERT INTO matricula VALUES('AL040','AS088',3.63);
INSERT INTO matricula VALUES('AL040','AS089',3.75);
INSERT INTO matricula VALUES('AL040','AS090',8.03);
INSERT INTO matricula VALUES('AL040','AS091',7.01);
INSERT INTO matricula VALUES('AL040','AS092',8.99);
INSERT INTO matricula VALUES('AL040','AS093',9.55);
INSERT INTO matricula VALUES('AL063','AS084',5.47);
INSERT INTO matricula VALUES('AL063','AS085',4.97);
INSERT INTO matricula VALUES('AL063','AS086',7.36);
INSERT INTO matricula VALUES('AL063','AS087',8.06);
INSERT INTO matricula VALUES('AL063','AS088',4.22);
INSERT INTO matricula VALUES('AL063','AS089',1.94);
INSERT INTO matricula VALUES('AL063','AS090',3.57);
INSERT INTO matricula VALUES('AL063','AS091',1.56);
INSERT INTO matricula VALUES('AL063','AS092',10);
INSERT INTO matricula VALUES('AL063','AS093',9.33);
INSERT INTO matricula VALUES('AL075','AS084',1.64);
INSERT INTO matricula VALUES('AL075','AS085',8.84);
INSERT INTO matricula VALUES('AL075','AS086',2.21);
INSERT INTO matricula VALUES('AL075','AS087',5.73);
INSERT INTO matricula VALUES('AL075','AS088',5.73);
INSERT INTO matricula VALUES('AL075','AS089',7.97);
INSERT INTO matricula VALUES('AL075','AS090',7.86);
INSERT INTO matricula VALUES('AL075','AS091',1.11);
INSERT INTO matricula VALUES('AL075','AS092',9.31);
INSERT INTO matricula VALUES('AL075','AS093',9.33);
INSERT INTO matricula VALUES('AL084','AS084',2.97);
INSERT INTO matricula VALUES('AL084','AS085',4.36);
INSERT INTO matricula VALUES('AL084','AS086',1.45);
INSERT INTO matricula VALUES('AL084','AS087',10);
INSERT INTO matricula VALUES('AL084','AS088',1.99);
INSERT INTO matricula VALUES('AL084','AS089',4.71);
INSERT INTO matricula VALUES('AL084','AS090',6.37);
INSERT INTO matricula VALUES('AL084','AS091',2.41);
INSERT INTO matricula VALUES('AL084','AS092',5.75);
INSERT INTO matricula VALUES('AL084','AS093',5.13);
INSERT INTO matricula VALUES('AL091','AS084',1.72);
INSERT INTO matricula VALUES('AL091','AS085',6.21);
INSERT INTO matricula VALUES('AL091','AS086',10);
INSERT INTO matricula VALUES('AL091','AS087',5.62);
INSERT INTO matricula VALUES('AL091','AS088',10);
INSERT INTO matricula VALUES('AL091','AS089',3.43);
INSERT INTO matricula VALUES('AL091','AS090',2.76);
INSERT INTO matricula VALUES('AL091','AS091',9.99);
INSERT INTO matricula VALUES('AL091','AS092',7.12);
INSERT INTO matricula VALUES('AL091','AS093',5.22);
INSERT INTO matricula VALUES('AL093','AS084',5.93);
INSERT INTO matricula VALUES('AL093','AS085',5.09);
INSERT INTO matricula VALUES('AL093','AS086',7.09);
INSERT INTO matricula VALUES('AL093','AS087',8.96);
INSERT INTO matricula VALUES('AL093','AS088',9.48);
INSERT INTO matricula VALUES('AL093','AS089',10);
INSERT INTO matricula VALUES('AL093','AS090',9.42);
INSERT INTO matricula VALUES('AL093','AS091',5.67);
INSERT INTO matricula VALUES('AL093','AS092',4.99);
INSERT INTO matricula VALUES('AL093','AS093',4.71);
INSERT INTO matricula VALUES('AL109','AS084',10);
INSERT INTO matricula VALUES('AL109','AS085',1.62);
INSERT INTO matricula VALUES('AL109','AS086',6.61);
INSERT INTO matricula VALUES('AL109','AS087',5.41);
INSERT INTO matricula VALUES('AL109','AS088',2.51);
INSERT INTO matricula VALUES('AL109','AS089',10);
INSERT INTO matricula VALUES('AL109','AS090',4.32);
INSERT INTO matricula VALUES('AL109','AS091',8.47);
INSERT INTO matricula VALUES('AL109','AS092',10);
INSERT INTO matricula VALUES('AL109','AS093',3.78);
INSERT INTO matricula VALUES('AL116','AS084',2.93);
INSERT INTO matricula VALUES('AL116','AS085',5.66);
INSERT INTO matricula VALUES('AL116','AS086',2.97);
INSERT INTO matricula VALUES('AL116','AS087',2.59);
INSERT INTO matricula VALUES('AL116','AS088',4.24);
INSERT INTO matricula VALUES('AL116','AS089',2.67);
INSERT INTO matricula VALUES('AL116','AS090',1.42);
INSERT INTO matricula VALUES('AL116','AS091',6.65);
INSERT INTO matricula VALUES('AL116','AS092',9.42);
INSERT INTO matricula VALUES('AL116','AS093',9.61);
INSERT INTO matricula VALUES('AL120','AS084',8.31);
INSERT INTO matricula VALUES('AL120','AS085',1.94);
INSERT INTO matricula VALUES('AL120','AS086',4.57);
INSERT INTO matricula VALUES('AL120','AS087',9.83);
INSERT INTO matricula VALUES('AL120','AS088',1.09);
INSERT INTO matricula VALUES('AL120','AS089',5.89);
INSERT INTO matricula VALUES('AL120','AS090',10);
INSERT INTO matricula VALUES('AL120','AS091',9.79);
INSERT INTO matricula VALUES('AL120','AS092',6.34);
INSERT INTO matricula VALUES('AL120','AS093',9.05);
INSERT INTO matricula VALUES('AL129','AS084',2.14);
INSERT INTO matricula VALUES('AL129','AS085',1.04);
INSERT INTO matricula VALUES('AL129','AS086',7.04);
INSERT INTO matricula VALUES('AL129','AS087',9.71);
INSERT INTO matricula VALUES('AL129','AS088',3.33);
INSERT INTO matricula VALUES('AL129','AS089',4.02);
INSERT INTO matricula VALUES('AL129','AS090',9.71);
INSERT INTO matricula VALUES('AL129','AS091',7.89);
INSERT INTO matricula VALUES('AL129','AS092',8.35);
INSERT INTO matricula VALUES('AL129','AS093',3.53);
INSERT INTO matricula VALUES('AL130','AS084',6.78);
INSERT INTO matricula VALUES('AL130','AS085',8.36);
INSERT INTO matricula VALUES('AL130','AS086',3.34);
INSERT INTO matricula VALUES('AL130','AS087',4.25);
INSERT INTO matricula VALUES('AL130','AS088',8.54);
INSERT INTO matricula VALUES('AL130','AS089',7.63);
INSERT INTO matricula VALUES('AL130','AS090',1.34);
INSERT INTO matricula VALUES('AL130','AS091',9.34);
INSERT INTO matricula VALUES('AL130','AS092',6.06);
INSERT INTO matricula VALUES('AL130','AS093',1.74);
INSERT INTO matricula VALUES('AL133','AS084',6.55);
INSERT INTO matricula VALUES('AL133','AS085',6.17);
INSERT INTO matricula VALUES('AL133','AS086',6.63);
INSERT INTO matricula VALUES('AL133','AS087',10);
INSERT INTO matricula VALUES('AL133','AS088',7.37);
INSERT INTO matricula VALUES('AL133','AS089',1.51);
INSERT INTO matricula VALUES('AL133','AS090',6.43);
INSERT INTO matricula VALUES('AL133','AS091',8.64);
INSERT INTO matricula VALUES('AL133','AS092',7.18);
INSERT INTO matricula VALUES('AL133','AS093',3.63);
INSERT INTO matricula VALUES('AL137','AS084',9.47);
INSERT INTO matricula VALUES('AL137','AS085',5.62);
INSERT INTO matricula VALUES('AL137','AS086',8.75);
INSERT INTO matricula VALUES('AL137','AS087',5.92);
INSERT INTO matricula VALUES('AL137','AS088',7.96);
INSERT INTO matricula VALUES('AL137','AS089',3.69);
INSERT INTO matricula VALUES('AL137','AS090',5.37);
INSERT INTO matricula VALUES('AL137','AS091',4.19);
INSERT INTO matricula VALUES('AL137','AS092',1.95);
INSERT INTO matricula VALUES('AL137','AS093',7.42);
INSERT INTO matricula VALUES('AL140','AS084',10);
INSERT INTO matricula VALUES('AL140','AS085',8.45);
INSERT INTO matricula VALUES('AL140','AS086',4.26);
INSERT INTO matricula VALUES('AL140','AS087',7.45);
INSERT INTO matricula VALUES('AL140','AS088',9.98);
INSERT INTO matricula VALUES('AL140','AS089',6.22);
INSERT INTO matricula VALUES('AL140','AS090',3.34);
INSERT INTO matricula VALUES('AL140','AS091',10);
INSERT INTO matricula VALUES('AL140','AS092',10);
INSERT INTO matricula VALUES('AL140','AS093',1.15);
INSERT INTO matricula VALUES('AL144','AS084',7.58);
INSERT INTO matricula VALUES('AL144','AS085',10);
INSERT INTO matricula VALUES('AL144','AS086',1.79);
INSERT INTO matricula VALUES('AL144','AS087',7.25);
INSERT INTO matricula VALUES('AL144','AS088',1.57);
INSERT INTO matricula VALUES('AL144','AS089',10);
INSERT INTO matricula VALUES('AL144','AS090',1.12);
INSERT INTO matricula VALUES('AL144','AS091',1.81);
INSERT INTO matricula VALUES('AL144','AS092',4.26);
INSERT INTO matricula VALUES('AL144','AS093',3.27);
INSERT INTO matricula VALUES('AL148','AS084',3.76);
INSERT INTO matricula VALUES('AL148','AS085',5.94);
INSERT INTO matricula VALUES('AL148','AS086',3.16);
INSERT INTO matricula VALUES('AL148','AS087',8.46);
INSERT INTO matricula VALUES('AL148','AS088',1.19);
INSERT INTO matricula VALUES('AL148','AS089',6.96);
INSERT INTO matricula VALUES('AL148','AS090',7.79);
INSERT INTO matricula VALUES('AL148','AS091',7.85);
INSERT INTO matricula VALUES('AL148','AS092',5.85);
INSERT INTO matricula VALUES('AL148','AS093',8.07);
INSERT INTO matricula VALUES('AL151','AS084',2.32);
INSERT INTO matricula VALUES('AL151','AS085',5.45);
INSERT INTO matricula VALUES('AL151','AS086',4.66);
INSERT INTO matricula VALUES('AL151','AS087',3.96);
INSERT INTO matricula VALUES('AL151','AS088',4.02);
INSERT INTO matricula VALUES('AL151','AS089',9.98);
INSERT INTO matricula VALUES('AL151','AS090',1.27);
INSERT INTO matricula VALUES('AL151','AS091',10);
INSERT INTO matricula VALUES('AL151','AS092',2.06);
INSERT INTO matricula VALUES('AL151','AS093',4.33);
INSERT INTO matricula VALUES('AL159','AS084',9.56);
INSERT INTO matricula VALUES('AL159','AS085',7.59);
INSERT INTO matricula VALUES('AL159','AS086',8.41);
INSERT INTO matricula VALUES('AL159','AS087',1.33);
INSERT INTO matricula VALUES('AL159','AS088',4.84);
INSERT INTO matricula VALUES('AL159','AS089',2.63);
INSERT INTO matricula VALUES('AL159','AS090',7.38);
INSERT INTO matricula VALUES('AL159','AS091',8.54);
INSERT INTO matricula VALUES('AL159','AS092',2.76);
INSERT INTO matricula VALUES('AL159','AS093',3.13);
INSERT INTO matricula VALUES('AL164','AS084',7.67);
INSERT INTO matricula VALUES('AL164','AS085',1.36);
INSERT INTO matricula VALUES('AL164','AS086',6.13);
INSERT INTO matricula VALUES('AL164','AS087',4.72);
INSERT INTO matricula VALUES('AL164','AS088',2.34);
INSERT INTO matricula VALUES('AL164','AS089',3.55);
INSERT INTO matricula VALUES('AL164','AS090',1.81);
INSERT INTO matricula VALUES('AL164','AS091',6.44);
INSERT INTO matricula VALUES('AL164','AS092',4.72);
INSERT INTO matricula VALUES('AL164','AS093',1.33);
INSERT INTO matricula VALUES('AL169','AS084',7.24);
INSERT INTO matricula VALUES('AL169','AS085',5.15);
INSERT INTO matricula VALUES('AL169','AS086',4.35);
INSERT INTO matricula VALUES('AL169','AS087',7.27);
INSERT INTO matricula VALUES('AL169','AS088',6.59);
INSERT INTO matricula VALUES('AL169','AS089',10);
INSERT INTO matricula VALUES('AL169','AS090',6.67);
INSERT INTO matricula VALUES('AL169','AS091',2.88);
INSERT INTO matricula VALUES('AL169','AS092',9.06);
INSERT INTO matricula VALUES('AL169','AS093',8.69);
INSERT INTO matricula VALUES('AL176','AS084',6.15);
INSERT INTO matricula VALUES('AL176','AS085',1.16);
INSERT INTO matricula VALUES('AL176','AS086',9.08);
INSERT INTO matricula VALUES('AL176','AS087',9.83);
INSERT INTO matricula VALUES('AL176','AS088',2.74);
INSERT INTO matricula VALUES('AL176','AS089',6.64);
INSERT INTO matricula VALUES('AL176','AS090',8.75);
INSERT INTO matricula VALUES('AL176','AS091',8.85);
INSERT INTO matricula VALUES('AL176','AS092',3.38);
INSERT INTO matricula VALUES('AL176','AS093',3.96);
INSERT INTO matricula VALUES('AL182','AS084',2.47);
INSERT INTO matricula VALUES('AL182','AS085',10);
INSERT INTO matricula VALUES('AL182','AS086',9.19);
INSERT INTO matricula VALUES('AL182','AS087',2.31);
INSERT INTO matricula VALUES('AL182','AS088',5.28);
INSERT INTO matricula VALUES('AL182','AS089',3.91);
INSERT INTO matricula VALUES('AL182','AS090',8.95);
INSERT INTO matricula VALUES('AL182','AS091',5.07);
INSERT INTO matricula VALUES('AL182','AS092',2.11);
INSERT INTO matricula VALUES('AL182','AS093',5.66);
INSERT INTO matricula VALUES('AL184','AS084',8.85);
INSERT INTO matricula VALUES('AL184','AS085',4.53);
INSERT INTO matricula VALUES('AL184','AS086',7.65);
INSERT INTO matricula VALUES('AL184','AS087',7.75);
INSERT INTO matricula VALUES('AL184','AS088',5.64);
INSERT INTO matricula VALUES('AL184','AS089',10);
INSERT INTO matricula VALUES('AL184','AS090',3.29);
INSERT INTO matricula VALUES('AL184','AS091',5.55);
INSERT INTO matricula VALUES('AL184','AS092',4.05);
INSERT INTO matricula VALUES('AL184','AS093',6.97);
INSERT INTO matricula VALUES('AL188','AS084',7.66);
INSERT INTO matricula VALUES('AL188','AS085',6.11);
INSERT INTO matricula VALUES('AL188','AS086',2.64);
INSERT INTO matricula VALUES('AL188','AS087',3.22);
INSERT INTO matricula VALUES('AL188','AS088',6.73);
INSERT INTO matricula VALUES('AL188','AS089',5.29);
INSERT INTO matricula VALUES('AL188','AS090',3.35);
INSERT INTO matricula VALUES('AL188','AS091',1.26);
INSERT INTO matricula VALUES('AL188','AS092',6.55);
INSERT INTO matricula VALUES('AL188','AS093',6.27);
INSERT INTO matricula VALUES('AL195','AS084',10);
INSERT INTO matricula VALUES('AL195','AS085',7.21);
INSERT INTO matricula VALUES('AL195','AS086',9.58);
INSERT INTO matricula VALUES('AL195','AS087',5.48);
INSERT INTO matricula VALUES('AL195','AS088',2.89);
INSERT INTO matricula VALUES('AL195','AS089',4.94);
INSERT INTO matricula VALUES('AL195','AS090',7.56);
INSERT INTO matricula VALUES('AL195','AS091',3.32);
INSERT INTO matricula VALUES('AL195','AS092',5.47);
INSERT INTO matricula VALUES('AL195','AS093',7.05);
INSERT INTO matricula VALUES('AL199','AS084',2.04);
INSERT INTO matricula VALUES('AL199','AS085',3.13);
INSERT INTO matricula VALUES('AL199','AS086',9.01);
INSERT INTO matricula VALUES('AL199','AS087',7.87);
INSERT INTO matricula VALUES('AL199','AS088',4.52);
INSERT INTO matricula VALUES('AL199','AS089',8.35);
INSERT INTO matricula VALUES('AL199','AS090',9.12);
INSERT INTO matricula VALUES('AL199','AS091',7.32);
INSERT INTO matricula VALUES('AL199','AS092',7.71);
INSERT INTO matricula VALUES('AL199','AS093',3.42);
INSERT INTO matricula VALUES('AL009','AS100',2.85);
INSERT INTO matricula VALUES('AL020','AS099',3.18);
INSERT INTO matricula VALUES('AL026','AS100',8.07);
INSERT INTO matricula VALUES('AL029','AS097',9.45);
INSERT INTO matricula VALUES('AL032','AS097',5.86);
INSERT INTO matricula VALUES('AL038','AS100',7.88);
INSERT INTO matricula VALUES('AL048','AS099',2.15);
INSERT INTO matricula VALUES('AL053','AS097',6.77);
INSERT INTO matricula VALUES('AL056','AS097',5.94);
INSERT INTO matricula VALUES('AL057','AS099',10);
INSERT INTO matricula VALUES('AL061','AS095',7.56);
INSERT INTO matricula VALUES('AL062','AS095',6.24);
INSERT INTO matricula VALUES('AL066','AS097',7.91);
INSERT INTO matricula VALUES('AL070','AS099',1.48);
INSERT INTO matricula VALUES('AL082','AS100',2.94);
INSERT INTO matricula VALUES('AL085','AS099',3.47);
INSERT INTO matricula VALUES('AL097','AS100',1.74);
INSERT INTO matricula VALUES('AL111','AS097',10);
INSERT INTO matricula VALUES('AL125','AS095',10);
INSERT INTO matricula VALUES('AL126','AS097',2.96);
INSERT INTO matricula VALUES('AL135','AS099',2.44);
INSERT INTO matricula VALUES('AL143','AS099',7.78);
INSERT INTO matricula VALUES('AL158','AS100',3.51);
INSERT INTO matricula VALUES('AL173','AS095',6.71);
INSERT INTO matricula VALUES('AL174','AS095',10);
INSERT INTO matricula VALUES('AL178','AS099',1.17);
INSERT INTO matricula VALUES('AL181','AS095',3.01);
INSERT INTO matricula VALUES('AL191','AS095',7.55);
INSERT INTO matricula VALUES('AL198','AS100',4.45);