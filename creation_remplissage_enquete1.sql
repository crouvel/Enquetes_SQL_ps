CREATE TABLE IF NOT EXISTS personne (
    nom VARCHAR(200) NOT NULL,
    prenom VARCHAR(200) NOT NULL,
    date_naissance DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS niveau (
    nom_niveau VARCHAR(50) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS classe (
    id_classe SERIAL PRIMARY KEY,
    nom_classe VARCHAR(50) NOT NULL,
    niveau VARCHAR(50) REFERENCES niveau NOT NULL
);

CREATE TABLE IF NOT EXISTS eleve (
    num_eleve INTEGER PRIMARY KEY NOT NULL CHECK (num_eleve > 0),
    est_dyslexique BOOLEAN NOT NULL,
    classe INTEGER REFERENCES classe NOT NULL
) INHERITS (personne);

CREATE TABLE IF NOT EXISTS professeur (
    num_prof INTEGER PRIMARY KEY NOT NULL CHECK (num_prof > 0),
    est_agrege BOOLEAN NOT NULL
) INHERITS (personne);

CREATE TABLE IF NOT EXISTS matiere (
    nom_matiere VARCHAR(100) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS enseigner (
    prof INTEGER REFERENCES professeur NOT NULL,
    matiere VARCHAR(100) REFERENCES matiere NOT NULL,
    classe INTEGER REFERENCES classe NOT NULL,
    UNIQUE (prof, matiere, classe)
);

CREATE TABLE IF NOT EXISTS controle (
    id_controle SERIAL PRIMARY KEY,
    prof INTEGER REFERENCES professeur NOT NULL,
    matiere VARCHAR(100) REFERENCES matiere NOT NULL,
    classe INTEGER REFERENCES classe NOT NULL,
    note_max INTEGER NOT NULL CHECK (note_max > 0),
    coefficient NUMERIC(3, 2) NOT NULL CHECK (coefficient >= 0),
    date DATE,
    description VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS notation (
    eleve INTEGER REFERENCES eleve ON DELETE CASCADE NOT NULL,
    controle INTEGER REFERENCES controle ON DELETE CASCADE NOT NULL,
    note INTEGER NOT NULL,
    UNIQUE (eleve, controle)
);


INSERT INTO niveau VALUES ('6eme');
INSERT INTO niveau VALUES ('5eme');
INSERT INTO niveau VALUES ('4eme');
INSERT INTO niveau VALUES ('3eme');
INSERT INTO niveau VALUES ('Seconde');
INSERT INTO niveau VALUES ('Premiere');
INSERT INTO niveau VALUES ('Terminale');


--
-- TOC entry 2930 (class 0 OID 41207)
-- Dependencies: 199
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO classe VALUES (1,'Classe de 6eme',  '6eme');
INSERT INTO classe VALUES (2,'Classe de 5eme',  '5eme');
INSERT INTO classe VALUES (3,'Classe de 4eme',  '4eme');
INSERT INTO classe VALUES (4,'Classe de 3eme',  '3eme');
INSERT INTO classe VALUES (5,'Classe de seconde',  'Seconde');
INSERT INTO classe VALUES (6,'Classe de premiere',  'Premiere');
INSERT INTO classe VALUES (7,'Classe de terminale',  'Terminale');

--
-- TOC entry 2933 (class 0 OID 41235)
-- Dependencies: 202
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: -
--


INSERT INTO matiere VALUES ('Francais');
INSERT INTO matiere VALUES ('Histoire-geographie');
INSERT INTO matiere VALUES ('Mathematiques');
INSERT INTO matiere VALUES ('Physique-chimie');
INSERT INTO matiere VALUES ('SVT');
INSERT INTO matiere VALUES ('Sport');



--
--' TOC entry', 2932 (class 0 OID 41229)
-- Dependencies: 201
-- Data for Name: professeur; Type: TABLE DATA; Schema: public; Owner: -
--


INSERT INTO professeur VALUES ('Marie',  'Vermine', '1969-03-25', 1, 'f');
INSERT INTO professeur VALUES ('Gilbert',  'Leclerc',  '1986-04-06',2, 't');
INSERT INTO professeur VALUES ('Ann',  'Texier', '1989-07-24',3,'t');
INSERT INTO professeur VALUES ('Yolande', 'Lavergne', '1980-07-12',4, 'f');
INSERT INTO professeur VALUES ('Jennifer', 'Roche', '1976-03-07', 5, 'f');
INSERT INTO professeur VALUES ('Colett',  'Da costa', '1981-01-13', 6, 'f');



--
-- TOC entry 2936 (class 0 OID 41262)
-- Dependencies: 205
-- Data for Name: controle; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO controle VALUES (1,	1,	'Francais',	1,	20,	3.00,	'2022-04-25',   'Controle de Francais du 25/04/2022');
INSERT INTO controle VALUES (2,	1,	'Francais',	1,	20,	3.00,	'2022-06-16',	'Controle de Francais du 16/06/2022');
INSERT INTO controle VALUES (3,	1,	'Francais',	1,	20,	3.00,	'2022-06-20',	'Controle de Francais du 20/06/2022');
INSERT INTO controle VALUES (4,	1,	'Francais',	1,	10,	3.00,	'2021-11-22',	'Controle de Francais du 22/11/2021');
INSERT INTO controle VALUES (5,	1,	'Francais',	1,	20,	2.00,	'2022-02-23',	'Controle de Francais du 23/02/2022');
INSERT INTO controle VALUES (6,	1,	'Francais',	1,	20,	2.00,	'2022-03-06',	'Controle de Francais du 06/03/2022');
INSERT INTO controle VALUES (7,	1,	'Francais',	1,	20,	1.00,	'2022-02-21',	'Controle de Francais du 21/02/2022');
INSERT INTO controle VALUES (8,	1,	'Francais',	1,	20,	2.00,	'2022-04-29',	'Controle de Francais du 29/04/2022');
INSERT INTO controle VALUES (9,	1,	'Francais',	2,	20,	3.00,	'2021-11-10',	'Controle de Francais du 10/11/2021');
INSERT INTO controle VALUES (10,	1,	'Francais',	2,	20,	1.00,	'2022-04-26',	'Controle de Francais du 26/04/2022');
INSERT INTO controle VALUES (11,	1,	'Francais',	2,	10,	2.00,	'2022-04-09',	'Controle de Francais du 09/04/2022');
INSERT INTO controle VALUES (12,	1,	'Francais',	2,	20,	2.00,	'2021-09-20',	'Controle de Francais du 20/09/2021');
INSERT INTO controle VALUES (13,	1,	'Francais',	2,	20,	2.00,	'2022-04-08',	'Controle de Francais du 08/04/2022');
INSERT INTO controle VALUES (14,	1,	'Francais',	2,	10,	1.00,	'2022-04-04',	'Controle de Francais du 04/04/2022');
INSERT INTO controle VALUES (15,	1,	'Francais',	2,	20,	1.00,	'2022-02-10',	'Controle de Francais du 10/02/2022');
INSERT INTO controle VALUES (16,	1,	'Francais',	2,	20,	1.00,	'2022-03-26',	'Controle de Francais du 26/03/2022');
INSERT INTO controle VALUES (17,	1,	'Francais',	3,	20,	3.00,	'2021-10-17',	'Controle de Francais du 17/10/2021');
INSERT INTO controle VALUES (18,	1,	'Francais',	3,	20,	2.00,	'2021-09-16',	'Controle de Francais du 16/09/2021');
INSERT INTO controle VALUES (19,	1,	'Francais',	3,	20,	1.00,	'2021-09-05',	'Controle de Francais du 05/09/2021');
INSERT INTO controle VALUES (20,	1,	'Francais',	3,	20,	3.00,	'2022-04-11',	'Controle de Francais du 11/04/2022');
INSERT INTO controle VALUES (21,	1,	'Francais',	3,	20,	2.00,	'2022-02-16',	'Controle de Francais du 16/02/2022');
INSERT INTO controle VALUES (22,	1,	'Francais',	3,	20,	1.00,	'2021-10-27',	'Controle de Francais du 27/10/2021');
INSERT INTO controle VALUES (23,	1,	'Francais',	3,	20,	2.00,	'2021-10-29',	'Controle de Francais du 29/10/2021');
INSERT INTO controle VALUES (24,	1,	'Francais',	3,	20,	2.00,	'2022-01-24',	'Controle de Francais du 24/01/2022');
INSERT INTO controle VALUES (25,	1,	'Francais',	4,	20,	3.00,	'2022-06-09',	'Controle de Francais du 09/06/2022');
INSERT INTO controle VALUES (26,	1,	'Francais',	4,	20,	1.00,	'2022-01-28',	'Controle de Francais du 28/01/2022');
INSERT INTO controle VALUES (27,	1,	'Francais',	4,	20,	2.00,	'2021-11-02',	'Controle de Francais du 02/11/2021');
INSERT INTO controle VALUES (28,	1,	'Francais',	4,	5, 1.00,	'2021-10-31',	'Controle de Francais du 31/10/2021');
INSERT INTO controle VALUES (29,	1,	'Francais',	4,	20,	3.00,	'2022-02-26',	'Controle de Francais du 26/02/2022');
INSERT INTO controle VALUES (30,	1,	'Francais',	4,	20,	3.00,	'2021-10-22',	'Controle de Francais du 22/10/2021');
INSERT INTO controle VALUES (31,	1,	'Francais',	4,	20,	2.00,	'2021-12-16',	'Controle de Francais du 16/12/2021');
INSERT INTO controle VALUES (32,	1,	'Francais',	4,	20,	3.00,	'2022-06-08',	'Controle de Francais du 08/06/2022');
INSERT INTO controle VALUES (33,	1,	'Francais',	5,	20,	2.00,	'2021-09-03',	'Controle de Francais du 03/09/2021');
INSERT INTO controle VALUES (34,	1,	'Francais',	5,	20,	2.00,	'2022-03-31',	'Controle de Francais du 31/03/2022');
INSERT INTO controle VALUES (35,	1,	'Francais',	5,	20,	2.00,	'2022-01-10',	'Controle de Francais du 10/01/2022');
INSERT INTO controle VALUES (36,	1,	'Francais',	5,	20,	1.00,	'2021-10-31',	'Controle de Francais du 31/10/2021');
INSERT INTO controle VALUES (37,	1,	'Francais',	5,	20,	3.00,	'2022-05-29',	'Controle de Francais du 29/05/2022');
INSERT INTO controle VALUES (38,	1,	'Francais',	5,	20,	1.00,	'2021-09-26',	'Controle de Francais du 26/09/2021');
INSERT INTO controle VALUES (39,	1,	'Francais',	5,	20,	1.00,	'2022-01-21',	'Controle de Francais du 21/01/2022');
INSERT INTO controle VALUES (40,	1,	'Francais',	5,	20,	3.00,	'2021-12-26',	'Controle de Francais du 26/12/2021');
INSERT INTO controle VALUES (41,	1,	'Francais',	6,	20,	3.00,	'2022-04-28',	'Controle de Francais du 28/04/2022');
INSERT INTO controle VALUES (42,	1,	'Francais',	6,	20,	3.00,	'2021-09-18',	'Controle de Francais du 18/09/2021');
INSERT INTO controle VALUES (43,	1,	'Francais',	6,	20,	2.00,	'2021-11-05',	'Controle de Francais du 05/11/2021');
INSERT INTO controle VALUES (44,	1,	'Francais',	6,	10,	1.00,	'2021-12-31',	'Controle de Francais du 31/12/2021');
INSERT INTO controle VALUES (45,	1,	'Francais',	6,	20,	1.00,	'2022-03-24',	'Controle de Francais du 24/03/2022');
INSERT INTO controle VALUES (46,	1,	'Francais',	6,	20,	2.00,	'2022-06-13',	'Controle de Francais du 13/06/2022');
INSERT INTO controle VALUES (47,	1,	'Francais',	6,	20,	3.00,	'2021-11-11',	'Controle de Francais du 11/11/2021');
INSERT INTO controle VALUES (48,	1,	'Francais',	6,	20,	2.00,	'2022-03-26',	'Controle de Francais du 26/03/2022');
INSERT INTO controle VALUES (49,	1,	'Francais',	7,	10,	1.00,	'2021-09-05',	'Controle de Francais du 05/09/2021');
INSERT INTO controle VALUES (50,	1,	'Francais',	7,	20,	3.00,	'2022-06-02',	'Controle de Francais du 02/06/2022');
INSERT INTO controle VALUES (51,	1,	'Francais',	7,	20,	3.00,	'2022-03-23',	'Controle de Francais du 23/03/2022');
INSERT INTO controle VALUES (52,	1,	'Francais',	7,	20, 3.00,	'2021-12-01',	'Controle de Francais du 01/12/2021');
INSERT INTO controle VALUES (53,	1,	'Francais',	7,	20,	3.00,	'2022-03-30',	'Controle de Francais du 30/03/2022');
INSERT INTO controle VALUES (54,	1,	'Francais',	7,	10,	3.00,	'2022-01-17',	'Controle de Francais du 17/01/2022');
INSERT INTO controle VALUES (55,	1,	'Francais',	7,	20,	1.00,	'2021-11-21',	'Controle de Francais du 21/11/2021');
INSERT INTO controle VALUES (56,	1,	'Francais',	7,	20,	1.00,	'2022-02-27',	'Controle de Francais du 27/02/2022');
INSERT INTO controle VALUES (57,	2,	'Histoire-geographie',	1,	20,	1.00,	'2022-03-09',	'Controle de Histoire-geographie du 09/03/2022');
INSERT INTO controle VALUES (58,	2,	'Histoire-geographie',	1, 20,	3.00,	'2021-12-21',	'Controle de Histoire-geographie du 21/12/2021');
INSERT INTO controle VALUES (59,	2,	'Histoire-geographie',	1,	10,	2.00,	'2021-12-31',	'Controle de Histoire-geographie du 31/12/2021');
INSERT INTO controle VALUES (60,	2,	'Histoire-geographie',	1,	20,	1.00,	'2022-01-01',	'Controle de Histoire-geographie du 01/01/2022');
INSERT INTO controle VALUES (61,	2,	'Histoire-geographie',	1,	20,	3.00,	'2021-10-12',	'Controle de Histoire-geographie du 12/10/2021');
INSERT INTO controle VALUES (62,	2,	'Histoire-geographie',	1,	10,	3.00,	'2022-04-20',	'Controle de Histoire-geographie du 20/04/2022');
INSERT INTO controle VALUES (63,	2,	'Histoire-geographie',	1,	20,	1.00,	'2021-11-03',	'Controle de Histoire-geographie du 03/11/2021');
INSERT INTO controle VALUES (64,	2,	'Histoire-geographie',	1,	20,	2.00,	'2022-05-25',	'Controle de Histoire-geographie du 25/05/2022');
INSERT INTO controle VALUES (65,	2,	'Histoire-geographie',	2,	20,	2.00,	'2021-12-15',	'Controle de Histoire-geographie du 15/12/2021');
INSERT INTO controle VALUES (66,	2,	'Histoire-geographie',	2,	20,	3.00,	'2022-03-03',	'Controle de Histoire-geographie du 03/03/2022');
INSERT INTO controle VALUES (67,	2,	'Histoire-geographie',	2,	20,	3.00,	'2022-05-21',	'Controle de Histoire-geographie du 21/05/2022');
INSERT INTO controle VALUES (68,	2,	'Histoire-geographie',	2,	20,	1.00,	'2022-05-26',	'Controle de Histoire-geographie du 26/05/2022');
INSERT INTO controle VALUES (69,	2,	'Histoire-geographie',	2,	20,	2.00,	'2022-04-28',	'Controle de Histoire-geographie du 28/04/2022');
INSERT INTO controle VALUES (70,	2,	'Histoire-geographie',	2,	20,	3.00,	'2021-11-10',	'Controle de Histoire-geographie du 10/11/2021');
INSERT INTO controle VALUES (71,	2,	'Histoire-geographie',	2,	10,	3.00,	'2021-11-09',	'Controle de Histoire-geographie du 09/11/2021');
INSERT INTO controle VALUES (72,	2,	'Histoire-geographie',	2,	20,	3.00,	'2022-02-14',	'Controle de Histoire-geographie du 14/02/2022');
INSERT INTO controle VALUES (73,	2,	'Histoire-geographie',	3,	20,	1.00,	'2022-05-03',	'Controle de Histoire-geographie du 03/05/2022');
INSERT INTO controle VALUES (74,	2,	'Histoire-geographie',	3,	10,	3.00,	'2022-02-19',	'Controle de Histoire-geographie du 19/02/2022');
INSERT INTO controle VALUES (75,	2,	'Histoire-geographie',	3,	20,	2.00,	'2021-09-15',	'Controle de Histoire-geographie du 15/09/2021');
INSERT INTO controle VALUES (76,	2,	'Histoire-geographie',	3,	20,	2.00,	'2022-04-07',	'Controle de Histoire-geographie du 07/04/2022');
INSERT INTO controle VALUES (77,	2,	'Histoire-geographie',	3,	10,	2.00,	'2021-10-09',	'Controle de Histoire-geographie du 09/10/2021');
INSERT INTO controle VALUES (78,	2,	'Histoire-geographie',	3,	20,	2.00,	'2022-05-01',	'Controle de Histoire-geographie du 01/05/2022');
INSERT INTO controle VALUES (79,	2,	'Histoire-geographie',	3,	20,	2.00,	'2021-10-22',	'Controle de Histoire-geographie du 22/10/2021');
INSERT INTO controle VALUES (80,	2,	'Histoire-geographie',	3,	10,	3.00,	'2021-09-10',	'Controle de Histoire-geographie du 10/09/2021');
INSERT INTO controle VALUES (81,	2,	'Histoire-geographie',	4,	5,	3.00,	'2021-12-28',	'Controle de Histoire-geographie du 28/12/2021');
INSERT INTO controle VALUES (82,	2,	'Histoire-geographie',	4,	20,	2.00,	'2022-01-09',	'Controle de Histoire-geographie du 09/01/2022');
INSERT INTO controle VALUES (83,	2,	'Histoire-geographie',	4,	20,	1.00,	'2022-01-17',	'Controle de Histoire-geographie du 17/01/2022');
INSERT INTO controle VALUES (84,	2,	'Histoire-geographie',	4,	20,	3.00,	'2022-01-28',	'Controle de Histoire-geographie du 28/01/2022');
INSERT INTO controle VALUES (85,	2,	'Histoire-geographie',	4,	5,	2.00,	'2021-10-17',	'Controle de Histoire-geographie du 17/10/2021');
INSERT INTO controle VALUES (86,	2,	'Histoire-geographie',	4,	20,	1.00,	'2022-01-12',	'Controle de Histoire-geographie du 12/01/2022');
INSERT INTO controle VALUES (87,	2,	'Histoire-geographie',	4,	20,	2.00,	'2022-05-20',	'Controle de Histoire-geographie du 20/05/2022');
INSERT INTO controle VALUES (88,	2,	'Histoire-geographie',	4,	20,	3.00,	'2022-01-06',	'Controle de Histoire-geographie du 06/01/2022');
INSERT INTO controle VALUES (89,	2,	'Histoire-geographie',	5,	10,	3.00,	'2022-04-22',	'Controle de Histoire-geographie du 22/04/2022');
INSERT INTO controle VALUES (90,	2,	'Histoire-geographie',	5,	20,	1.00,	'2022-01-22',	'Controle de Histoire-geographie du 22/01/2022');
INSERT INTO controle VALUES (91,	2,	'Histoire-geographie',	5,	20,	1.00,	'2021-10-23',	'Controle de Histoire-geographie du 23/10/2021');
INSERT INTO controle VALUES (92,	2,	'Histoire-geographie',	5,	20,	3.00,	'2022-02-18',	'Controle de Histoire-geographie du 18/02/2022');
INSERT INTO controle VALUES (93,	2,	'Histoire-geographie',	5,	5,	3.00,	'2021-09-13',	'Controle de Histoire-geographie du 13/09/2021');
INSERT INTO controle VALUES (94,	2,	'Histoire-geographie',	5,	20,	1.00,	'2022-01-21',	'Controle de Histoire-geographie du 21/01/2022');
INSERT INTO controle VALUES (95,	2,	'Histoire-geographie',	5,	5,	1.00,	'2022-04-24',	'Controle de Histoire-geographie du 24/04/2022');
INSERT INTO controle VALUES (96,	2,	'Histoire-geographie',	5,	20,	2.00,	'2022-04-16',	'Controle de Histoire-geographie du 16/04/2022');
INSERT INTO controle VALUES (97,	2,	'Histoire-geographie',	6,	20,	3.00,	'2022-02-21',	'Controle de Histoire-geographie du 21/02/2022');
INSERT INTO controle VALUES (98,	2,	'Histoire-geographie',	6,	20,	3.00,	'2022-01-14',	'Controle de Histoire-geographie du 14/01/2022');
INSERT INTO controle VALUES (99,	2,	'Histoire-geographie',	6,	20,	1.00,	'2021-11-30',	'Controle de Histoire-geographie du 30/11/2021');
INSERT INTO controle VALUES (100, 2,	'Histoire-geographie',	6,	5,	3.00,	'2022-02-19',	'Controle de Histoire-geographie du 19/02/2022');
INSERT INTO controle VALUES (101,	2,	'Histoire-geographie',	6,	20, 1.00,	'2022-05-03',	'Controle de Histoire-geographie du 03/05/2022');
INSERT INTO controle VALUES (102,2,	'Histoire-geographie',	6,	20,	1.00,	'2022-04-16',	'Controle de Histoire-geographie du 16/04/2022');
INSERT INTO controle VALUES (103,2,	'Histoire-geographie',	6,	20,	3.00,	'2022-03-29',	'Controle de Histoire-geographie du 29/03/2022');
INSERT INTO controle VALUES (104,	2,	'Histoire-geographie',	6,	20,	3.00,	'2021-11-27',	'Controle de Histoire-geographie du 27/11/2021');
INSERT INTO controle VALUES (105,	2,	'Histoire-geographie',	7,	20,	3.00,	'2022-02-22',	'Controle de Histoire-geographie du 22/02/2022');
INSERT INTO controle VALUES (106,	2,	'Histoire-geographie',	7,	20,	3.00,	'2022-02-22',	'Controle de Histoire-geographie du 22/02/2022');
INSERT INTO controle VALUES (107,	2,	'Histoire-geographie',	7,	10,	1.00,	'2021-11-03',	'Controle de Histoire-geographie du 03/11/2021');
INSERT INTO controle VALUES (108,	2,	'Histoire-geographie',	7,	20,	3.00,	'2022-03-13',	'Controle de Histoire-geographie du 13/03/2022');
INSERT INTO controle VALUES (109,	2,	'Histoire-geographie',	7,	20,	1.00,	'2021-12-25',	'Controle de Histoire-geographie du 25/12/2021');
INSERT INTO controle VALUES (110,	2,	'Histoire-geographie',	7,	20, 2.00,	'2021-10-11',	'Controle de Histoire-geographie du 11/10/2021');
INSERT INTO controle VALUES (111	,2,	'Histoire-geographie',	7,	20,	1.00,	'2022-06-07',	'Controle de Histoire-geographie du 07/06/2022');
INSERT INTO controle VALUES (112	,2,'Histoire-geographie',	7,	20,	3.00,	'2021-12-14',	'Controle de Histoire-geographie du 14/12/2021');
INSERT INTO controle VALUES (113,	3,	'Mathematiques',	1,	20,	3.00,	'2021-11-14',	'Controle de Mathematiques du 14/11/2021');
INSERT INTO controle VALUES (114,	3,	'Mathematiques',	1,	20,	3.00,	'2021-12-11',	'Controle de Mathematiques du 11/12/2021');
INSERT INTO controle VALUES (115,	3,	'Mathematiques',	1,	20,	1.00,	'2021-10-13',	'Controle de Mathematiques du 13/10/2021');
INSERT INTO controle VALUES (116,	3,	'Mathematiques',	1,	5,	2.00,	'2022-02-11',	'Controle de Mathematiques du 11/02/2022');
INSERT INTO controle VALUES (117,	3,	'Mathematiques',	1,	20,	3.00,	'2022-01-23',	'Controle de Mathematiques du 23/01/2022');
INSERT INTO controle VALUES (118,	3,	'Mathematiques',	1,	20,	1.00,	'2022-02-20',	'Controle de Mathematiques du 20/02/2022');
INSERT INTO controle VALUES (119,	3,	'Mathematiques',	1,	20,	2.00,	'2021-09-25',	'Controle de Mathematiques du 25/09/2021');
INSERT INTO controle VALUES (120,	3,	'Mathematiques',	1,	20,	1.00,	'2022-05-19',	'Controle de Mathematiques du 19/05/2022');
INSERT INTO controle VALUES (121,	3,	'Mathematiques',	2,	5,	1.00,	'2022-04-20',	'Controle de Mathematiques du 20/04/2022');
INSERT INTO controle VALUES (122,	3,	'Mathematiques',	2,	20,	3.00,	'2021-12-11',	'Controle de Mathematiques du 11/12/2021');
INSERT INTO controle VALUES (123,	3,	'Mathematiques',	2,	20,	3.00,	'2022-03-22',	'Controle de Mathematiques du 22/03/2022');
INSERT INTO controle VALUES (124,	3,	'Mathematiques',	2,	20,	3.00,	'2022-05-30',	'Controle de Mathematiques du 30/05/2022');
INSERT INTO controle VALUES (125,	3,	'Mathematiques',	2,	20,	2.00,	'2021-12-13',	'Controle de Mathematiques du 13/12/2021');
INSERT INTO controle VALUES (126,	3,	'Mathematiques',	2,	20,	1.00,	'2022-04-29',	'Controle de Mathematiques du 29/04/2022');
INSERT INTO controle VALUES (127,	3,	'Mathematiques',	2,	20,	2.00,	'2021-11-08',	'Controle de Mathematiques du 08/11/2021');
INSERT INTO controle VALUES (128,	3,	'Mathematiques',	2,	20,	3.00,	'2022-05-17',	'Controle de Mathematiques du 17/05/2022');
INSERT INTO controle VALUES (129,	3,	'Mathematiques',	3,	20,	2.00,	'2021-09-25',	'Controle de Mathematiques du 25/09/2021');
INSERT INTO controle VALUES (130,	3,	'Mathematiques',	3,	20,	3.00,	'2022-02-18',	'Controle de Mathematiques du 18/02/2022');
INSERT INTO controle VALUES (131,	3,	'Mathematiques',	3,	20,	2.00,	'2022-01-28',	'Controle de Mathematiques du 28/01/2022');
INSERT INTO controle VALUES (132,	3,	'Mathematiques',	3,	10,	3.00,	'2021-09-27',	'Controle de Mathematiques du 27/09/2021');
INSERT INTO controle VALUES (133,	3,	'Mathematiques',	3,	20,	2.00,	'2021-10-26',	'Controle de Mathematiques du 26/10/2021');
INSERT INTO controle VALUES (134,	3,	'Mathematiques',	3,	20,	3.00,	'2022-02-08',	'Controle de Mathematiques du 08/02/2022');
INSERT INTO controle VALUES (135,	3,	'Mathematiques',	3,	20,	2.00,	'2022-01-09',	'Controle de Mathematiques du 09/01/2022');
INSERT INTO controle VALUES (136,	3,	'Mathematiques',	3,	20,	3.00,	'2021-11-03',	'Controle de Mathematiques du 03/11/2021');
INSERT INTO controle VALUES (290,	6,	'Sport',	2 ,10,	2.00,	'2021-10-28',	'Controle de Sport du 28/10/2021');
INSERT INTO controle VALUES (137,	3,	'Mathematiques',	4,	20,	3.00,	'2021-10-19',	'Controle de Mathematiques du 19/10/2021');
INSERT INTO controle VALUES (138,	3,	'Mathematiques',	4,	20,	1.00,	'2022-02-19',	'Controle de Mathematiques du 19/02/2022');
INSERT INTO controle VALUES (139,	3,	'Mathematiques',	4,	20,	1.00,	'2021-11-28',	'Controle de Mathematiques du 28/11/2021');
INSERT INTO controle VALUES (140,	3,	'Mathematiques',	4,	10,	1.00,	'2022-03-31',	'Controle de Mathematiques du 31/03/2022');
INSERT INTO controle VALUES (141,	3,	'Mathematiques',	4,	20,	2.00,	'2022-02-12',	'Controle de Mathematiques du 12/02/2022');
INSERT INTO controle VALUES (142,	3,	'Mathematiques',	4,	20,	1.00,	'2022-01-02',	'Controle de Mathematiques du 02/01/2022');
INSERT INTO controle VALUES (143,	3,	'Mathematiques',	4,	20,	2.00,	'2022-02-25',	'Controle de Mathematiques du 25/02/2022');
INSERT INTO controle VALUES (144,	3,	'Mathematiques',	4,	20,	1.00,	'2022-02-22',	'Controle de Mathematiques du 22/02/2022');
INSERT INTO controle VALUES (145,	3,	'Mathematiques',	5,	20,	3.00,	'2021-09-22',	'Controle de Mathematiques du 22/09/2021');
INSERT INTO controle VALUES (146,	3,	'Mathematiques',	5,	10,	3.00,	'2022-03-13',	'Controle de Mathematiques du 13/03/2022');
INSERT INTO controle VALUES (147,	3,	'Mathematiques',	5,	5,	2.00,	'2021-10-06',	'Controle de Mathematiques du 06/10/2021');
INSERT INTO controle VALUES (148,	3,	'Mathematiques',	5,	20,	1.00,	'2022-05-18',	'Controle de Mathematiques du 18/05/2022');
INSERT INTO controle VALUES (149,	3,	'Mathematiques',	5,	20,	1.00,	'2021-11-17',	'Controle de Mathematiques du 17/11/2021');
INSERT INTO controle VALUES (150,	3,	'Mathematiques',	5,	20,	2.00,	'2022-04-24',	'Controle de Mathematiques du 24/04/2022');
INSERT INTO controle VALUES (151,	3,	'Mathematiques',	5,	20,	3.00,	'2022-02-18',	'Controle de Mathematiques du 18/02/2022');
INSERT INTO controle VALUES (152,	3,	'Mathematiques',	5,	10,	2.00,	'2021-12-11',	'Controle de Mathematiques du 11/12/2021');
INSERT INTO controle VALUES (153,	3,	'Mathematiques',	6,	20,	3.00,	'2022-06-23',	'Controle de Mathematiques du 23/06/2022');
INSERT INTO controle VALUES (154,	3,	'Mathematiques',	6,	10,	3.00,	'2022-04-02',	'Controle de Mathematiques du 02/04/2022');
INSERT INTO controle VALUES (155,	3,	'Mathematiques',	6,	10,	1.00,	'2021-11-15',	'Controle de Mathematiques du 15/11/2021');
INSERT INTO controle VALUES (156,	3,	'Mathematiques',	6,	20,	1.00,	'2022-05-06',	'Controle de Mathematiques du 06/05/2022');
INSERT INTO controle VALUES (157,	3,	'Mathematiques',	6,	10,	2.00,	'2021-09-11',	'Controle de Mathematiques du 11/09/2021');
INSERT INTO controle VALUES (158,	3,	'Mathematiques',	6,	20,	3.00,	'2022-04-01',	'Controle de Mathematiques du 01/04/2022');
INSERT INTO controle VALUES (159,	3,	'Mathematiques',	6,	20,	3.00,	'2022-03-13',	'Controle de Mathematiques du 13/03/2022');
INSERT INTO controle VALUES (160,	3,	'Mathematiques',	6,	20,	2.00,	'2022-05-23',	'Controle de Mathematiques du 23/05/2022');
INSERT INTO controle VALUES (161,	3,	'Mathematiques',	7,	20,	3.00,	'2022-04-21',	'Controle de Mathematiques du 21/04/2022');
INSERT INTO controle VALUES (162,	3,	'Mathematiques',	7,	20,	1.00,	'2021-11-25',	'Controle de Mathematiques du 25/11/2021');
INSERT INTO controle VALUES (163,	3,	'Mathematiques',	7,	20,	2.00,	'2021-10-11',	'Controle de Mathematiques du 11/10/2021');
INSERT INTO controle VALUES (164,	3,	'Mathematiques',	7,	20,	1.00,	'2022-04-10',	'Controle de Mathematiques du 10/04/2022');
INSERT INTO controle VALUES (165,	3,	'Mathematiques',	7,	5,	3.00,	'2022-01-20',	'Controle de Mathematiques du 20/01/2022');
INSERT INTO controle VALUES (166,	3,	'Mathematiques',	7,	10,	3.00,	'2021-10-05',	'Controle de Mathematiques du 05/10/2021');
INSERT INTO controle VALUES (167,	3,	'Mathematiques',	7,	20,	2.00,	'2022-06-19',	'Controle de Mathematiques du 19/06/2022');
INSERT INTO controle VALUES (168,	3,	'Mathematiques',	7,	20,	2.00,	'2021-10-28',	'Controle de Mathematiques du 28/10/2021');
INSERT INTO controle VALUES (169,	4,	'Physique-chimie',	1,	20,	3.00,	'2022-06-09',	'Controle de Physique-chimie du 09/06/2022');
INSERT INTO controle VALUES (170,	4,	'Physique-chimie',	1,	20,	1.00,	'2021-11-15',	'Controle de Physique-chimie du 15/11/2021');
INSERT INTO controle VALUES (171,4,	'Physique-chimie',	1,	20,	1.00,	'2022-06-11',	'Controle de Physique-chimie du 11/06/2022');
INSERT INTO controle VALUES (172,	4,	'Physique-chimie',	1,	20,	3.00,	'2022-02-13',	'Controle de Physique-chimie du 13/02/2022');
INSERT INTO controle VALUES (173,	4,	'Physique-chimie',	1,	20,	3.00,	'2021-09-13',	'Controle de Physique-chimie du 13/09/2021');
INSERT INTO controle VALUES (174,	4,	'Physique-chimie',	1,	10,	2.00,	'2022-06-03',	'Controle de Physique-chimie du 03/06/2022');
INSERT INTO controle VALUES (175,	4,	'Physique-chimie',	1,	20,	3.00,	'2022-03-01',	'Controle de Physique-chimie du 01/03/2022');
INSERT INTO controle VALUES (176,	4,	'Physique-chimie',	1,	20,	2.00,	'2021-11-01',	'Controle de Physique-chimie du 01/11/2021');
INSERT INTO controle VALUES (177,	4,	'Physique-chimie',	2,	20,	2.00,	'2021-10-28',	'Controle de Physique-chimie du 28/10/2021');
INSERT INTO controle VALUES (178,	4,	'Physique-chimie',	2,	20,	1.00,	'2022-01-04',	'Controle de Physique-chimie du 04/01/2022');
INSERT INTO controle VALUES (179,	4,	'Physique-chimie',	2,	20,	3.00,	'2021-09-05',	'Controle de Physique-chimie du 05/09/2021');
INSERT INTO controle VALUES (180,	4,	'Physique-chimie',	2,	20,	2.00,	'2022-03-28',	'Controle de Physique-chimie du 28/03/2022');
INSERT INTO controle VALUES (181,	4,	'Physique-chimie',	2,	20,	2.00,	'2021-10-13',	'Controle de Physique-chimie du 13/10/2021');
INSERT INTO controle VALUES (182,	4,	'Physique-chimie',	2,	20,	3.00,	'2022-01-21',	'Controle de Physique-chimie du 21/01/2022');
INSERT INTO controle VALUES (183,	4,	'Physique-chimie',	2,	20,	1.00,	'2022-04-02',	'Controle de Physique-chimie du 02/04/2022');
INSERT INTO controle VALUES (184,	4,	'Physique-chimie',	2,	10,	1.00,	'2022-06-19',	'Controle de Physique-chimie du 19/06/2022');
INSERT INTO controle VALUES (185,	4,	'Physique-chimie',	3,	20,	3.00,	'2021-11-11',	'Controle de Physique-chimie du 11/11/2021');
INSERT INTO controle VALUES (186,	4,	'Physique-chimie',	3,	5,	3.00,   '2022-03-17',  'Controle de Physique-chimie du 17/03/2022');
INSERT INTO controle VALUES (187,	4,	'Physique-chimie',	3,	20,	1.00,	'2022-06-10',	'Controle de Physique-chimie du 10/06/2022');
INSERT INTO controle VALUES (188,	4,	'Physique-chimie',	3,	20,	3.00,	'2022-06-23',	'Controle de Physique-chimie du 23/06/2022');
INSERT INTO controle VALUES (189,	4,	'Physique-chimie',	3,	20,	2.00,	'2022-04-20',	'Controle de Physique-chimie du 20/04/2022');
INSERT INTO controle VALUES (190,	4,	'Physique-chimie',	3,	10,	1.00,	'2022-02-18',	'Controle de Physique-chimie du 18/02/2022');
INSERT INTO controle VALUES (191,	4,	'Physique-chimie',	3,	10,	2.00,	'2022-05-13',	'Controle de Physique-chimie du 13/05/2022');
INSERT INTO controle VALUES (192,	4,	'Physique-chimie',	3,	5,	1.00,   '2021-10-30',	'Controle de Physique-chimie du 30/10/2021');
INSERT INTO controle VALUES (193,	4,	'Physique-chimie',	4,	10,	3.00,	'2022-06-24',	'Controle de Physique-chimie du 24/06/2022');
INSERT INTO controle VALUES (194,	4,	'Physique-chimie',	4,	20,	3.00,	'2021-09-14',	'Controle de Physique-chimie du 14/09/2021');
INSERT INTO controle VALUES (195,	4,	'Physique-chimie',	4,	5,	2.00,   '2022-04-11',	'Controle de Physique-chimie du 11/04/2022');
INSERT INTO controle VALUES (196,	4,	'Physique-chimie',	4,	20,	1.00,	'2021-12-16',	'Controle de Physique-chimie du 16/12/2021');
INSERT INTO controle VALUES (197,	4,	'Physique-chimie',	4,	5,	1.00,   '2022-03-17',  'Controle de Physique-chimie du 17/03/2022');
INSERT INTO controle VALUES (198,	4,	'Physique-chimie',	4,	5,	1.00,   '2021-12-10',	'Controle de Physique-chimie du 10/12/2021');
INSERT INTO controle VALUES (199,	4,	'Physique-chimie',	4,	20,	1.00,	'2022-03-04',	'Controle de Physique-chimie du 04/03/2022');
INSERT INTO controle VALUES (200,	4,	'Physique-chimie',	4,	10,	1.00,	'2022-05-29',	'Controle de Physique-chimie du 29/05/2022');
INSERT INTO controle VALUES (201,	4,	'Physique-chimie',	5,	20,	2.00,	'2022-02-03',	'Controle de Physique-chimie du 03/02/2022');
INSERT INTO controle VALUES (202,	4,	'Physique-chimie',	5,	20,	3.00,	'2022-02-10',	'Controle de Physique-chimie du 10/02/2022');
INSERT INTO controle VALUES (203,	4,	'Physique-chimie',	5,	20,	3.00,	'2022-06-20',	'Controle de Physique-chimie du 20/06/2022');
INSERT INTO controle VALUES (204,	4,	'Physique-chimie',	5,	20,	2.00,	'2021-10-03',	'Controle de Physique-chimie du 03/10/2021');
INSERT INTO controle VALUES (205,	4,	'Physique-chimie',	5,	20,	3.00,	'2022-06-16',	'Controle de Physique-chimie du 16/06/2022');
INSERT INTO controle VALUES (206,	4,	'Physique-chimie',	5,	20,	1.00,	'2022-01-19',	'Controle de Physique-chimie du 19/01/2022');
INSERT INTO controle VALUES (207,	4,	'Physique-chimie',	5,	20,	2.00,	'2022-05-15',	'Controle de Physique-chimie du 15/05/2022');
INSERT INTO controle VALUES (208,	4,	'Physique-chimie',	5,	20,	3.00,	'2021-10-14',	'Controle de Physique-chimie du 14/10/2021');
INSERT INTO controle VALUES (209,	4,	'Physique-chimie',	6,	20,	3.00,	'2022-06-22',	'Controle de Physique-chimie du 22/06/2022');
INSERT INTO controle VALUES (210,	4,	'Physique-chimie',	6,	20,	2.00,	'2021-10-24',	'Controle de Physique-chimie du 24/10/2021');
INSERT INTO controle VALUES (211,	4,	'Physique-chimie',	6,	20,	3.00,	'2022-01-05',	'Controle de Physique-chimie du 05/01/2022');
INSERT INTO controle VALUES (212,	4,	'Physique-chimie',	6,	20,	3.00,	'2021-10-31',	'Controle de Physique-chimie du 31/10/2021');
INSERT INTO controle VALUES (213,	4,	'Physique-chimie',	6,	20,	1.00,	'2021-11-02',	'Controle de Physique-chimie du 02/11/2021');
INSERT INTO controle VALUES (214,	4,	'Physique-chimie',	6,	20,	3.00,	'2021-09-11',	'Controle de Physique-chimie du 11/09/2021');
INSERT INTO controle VALUES (215,	4,	'Physique-chimie',	6,	5,	1.00,   '2021-11-17',	'Controle de Physique-chimie du 17/11/2021');
INSERT INTO controle VALUES (216,	4,	'Physique-chimie',	6,	20,	1.00,	'2022-05-23',	'Controle de Physique-chimie du 23/05/2022');
INSERT INTO controle VALUES (217,	4,	'Physique-chimie',	7,	20,	3.00,	'2021-09-26',	'Controle de Physique-chimie du 26/09/2021');
INSERT INTO controle VALUES (218,	4,	'Physique-chimie',	7,	20,	3.00,	'2021-09-06',	'Controle de Physique-chimie du 06/09/2021');
INSERT INTO controle VALUES (219,	4,	'Physique-chimie',	7,	20,	1.00,	'2022-01-24',	'Controle de Physique-chimie du 24/01/2022');
INSERT INTO controle VALUES (220,	4,	'Physique-chimie',	7,	20,	1.00,	'2021-10-17',	'Controle de Physique-chimie du 17/10/2021');
INSERT INTO controle VALUES (221,	4,	'Physique-chimie',	7,	20,	3.00,	'2021-09-09',	'Controle de Physique-chimie du 09/09/2021');
INSERT INTO controle VALUES (222,	4,	'Physique-chimie',	7,	20,	3.00,	'2021-10-08',	'Controle de Physique-chimie du 08/10/2021');
INSERT INTO controle VALUES (223,	4,	'Physique-chimie',	7,	5,	2.00,   '2021-09-23',	'Controle de Physique-chimie du 23/09/2021');
INSERT INTO controle VALUES (224,	4,	'Physique-chimie',	7,	20,	3.00,	'2022-04-15',	'Controle de Physique-chimie du 15/04/2022');
INSERT INTO controle VALUES (225,	5,	'SVT',	1,	20,	3.00,	'2022-02-10',	'Controle de SVT du 10/02/2022');
INSERT INTO controle VALUES (226,	5,	'SVT',	1,	20,	3.00,	'2022-03-12',	'Controle de SVT du 12/03/2022');
INSERT INTO controle VALUES (227,	5,	'SVT',	1,	20,	1.00,	'2021-12-19',	'Controle de SVT du 19/12/2021');
INSERT INTO controle VALUES (228,	5,	'SVT',	1,	20,	3.00,	'2022-04-12',	'Controle de SVT du 12/04/2022');
INSERT INTO controle VALUES (229,	5,	'SVT',	1,	10,	3.00,	'2021-10-01',	'Controle de SVT du 01/10/2021');
INSERT INTO controle VALUES (230,	5,	'SVT',	1,	20,	2.00,	'2022-01-22',	'Controle de SVT du 22/01/2022');
INSERT INTO controle VALUES (231,	5,	'SVT',	1,	20,	2.00,	'2022-05-24',	'Controle de SVT du 24/05/2022');
INSERT INTO controle VALUES (232,	5,	'SVT',	1,	20,	1.00,	'2021-11-09',	'Controle de SVT du 09/11/2021');
INSERT INTO controle VALUES (233,	5,	'SVT',	2,	20,	1.00,	'2022-03-14',	'Controle de SVT du 14/03/2022');
INSERT INTO controle VALUES (234,	5,	'SVT',	2,	5,	2.00, '2022-06-25',    'Controle de SVT du 25/06/2022');
INSERT INTO controle VALUES (235,	5,	'SVT',	2,	20,	3.00,	'2021-10-14',	'Controle de SVT du 14/10/2021');
INSERT INTO controle VALUES (236,	5,	'SVT',	2,	20,	3.00,	'2022-03-20',	'Controle de SVT du 20/03/2022');
INSERT INTO controle VALUES (237,	5,	'SVT',	2,	20,	3.00,	'2021-12-12',	'Controle de SVT du 12/12/2021');
INSERT INTO controle VALUES (238,	5,	'SVT',	2,	20,	3.00,	'2022-03-16',	'Controle de SVT du 16/03/2022');
INSERT INTO controle VALUES (239,	5,	'SVT',	2,	20,	1.00,	'2021-10-19',	'Controle de SVT du 19/10/2021');
INSERT INTO controle VALUES (240,	5,	'SVT',	2,	20,	2.00,	'2022-03-10',	'Controle de SVT du 10/03/2022');
INSERT INTO controle VALUES (241,	5,	'SVT',	3,	20,	2.00,	'2022-06-07',	'Controle de SVT du 07/06/2022');
INSERT INTO controle VALUES (242,	5,	'SVT',	3,	20,	3.00,	'2022-03-15',	'Controle de SVT du 15/03/2022');
INSERT INTO controle VALUES (243,	5,	'SVT',	3,	20,	3.00,	'2022-06-17',	'Controle de SVT du 17/06/2022');
INSERT INTO controle VALUES (244,	5,	'SVT',	3,	20,	3.00,	'2022-03-26',	'Controle de SVT du 26/03/2022');
INSERT INTO controle VALUES (245,	5,	'SVT',	3,	20,	3.00,	'2022-05-26',	'Controle de SVT du 26/05/2022');
INSERT INTO controle VALUES (246,	5,	'SVT',	3,	20,	3.00,	'2022-01-29',	'Controle de SVT du 29/01/2022');
INSERT INTO controle VALUES (247,	5,	'SVT',	3,	20,	3.00,	'2022-01-08',	'Controle de SVT du 08/01/2022');
INSERT INTO controle VALUES (248,	5,	'SVT',	3,	20,	1.00,	'2021-12-18',	'Controle de SVT du 18/12/2021');
INSERT INTO controle VALUES (249,	5,	'SVT',	4,	20,	2.00,	'2021-12-01',	'Controle de SVT du 01/12/2021');
INSERT INTO controle VALUES (250,	5,	'SVT',	4,	20,	2.00,	'2022-05-27',	'Controle de SVT du 27/05/2022');
INSERT INTO controle VALUES (251,	5,	'SVT',	4,	10,	2.00,	'2022-06-25',	'Controle de SVT du 25/06/2022');
INSERT INTO controle VALUES (252,	5,	'SVT',	4,	20,	1.00,	'2022-03-28',	'Controle de SVT du 28/03/2022');
INSERT INTO controle VALUES (253,	5,	'SVT',	4,	20,	3.00,	'2021-10-01',	'Controle de SVT du 01/10/2021');
INSERT INTO controle VALUES (254,	5,	'SVT',	4,	10,	1.00,	'2022-06-07',	'Controle de SVT du 07/06/2022');
INSERT INTO controle VALUES (255,	5,	'SVT',	4,	20,	2.00,	'2021-10-26',	'Controle de SVT du 26/10/2021');
INSERT INTO controle VALUES (256,	5,	'SVT',	4,	20,	3.00,	'2021-09-19',	'Controle de SVT du 19/09/2021');
INSERT INTO controle VALUES (257,	5,	'SVT',	5,	20,	2.00,	'2022-06-22',	'Controle de SVT du 22/06/2022');
INSERT INTO controle VALUES (258,	5,	'SVT',	5,	20,	3.00,	'2022-06-09',	'Controle de SVT du 09/06/2022');
INSERT INTO controle VALUES (259,	5,	'SVT',	5,	10,	1.00,	'2021-09-08',	'Controle de SVT du 08/09/2021');
INSERT INTO controle VALUES (260,	5,	'SVT',	5,	20,	3.00,	'2022-04-01',	'Controle de SVT du 01/04/2022');
INSERT INTO controle VALUES (261,	5,	'SVT',	5,	20,	1.00,	'2022-03-09',	'Controle de SVT du 09/03/2022');
INSERT INTO controle VALUES (262,	5,	'SVT',	5,	20,	1.00,	'2021-11-17',	'Controle de SVT du 17/11/2021');
INSERT INTO controle VALUES (263,	5,	'SVT',	5,	20,	2.00,	'2021-09-12',	'Controle de SVT du 12/09/2021');
INSERT INTO controle VALUES (264,	5,	'SVT',	5,	20,	2.00,	'2022-01-09',	'Controle de SVT du 09/01/2022');
INSERT INTO controle VALUES (265,	5,	'SVT',	6,	20,	1.00,	'2021-12-01',	'Controle de SVT du 01/12/2021');
INSERT INTO controle VALUES (266,	5,	'SVT',	6,	20,	1.00,	'2021-12-15',	'Controle de SVT du 15/12/2021');
INSERT INTO controle VALUES (267,	5,	'SVT',	6,	10,	3.00,	'2022-05-14',	'Controle de SVT du 14/05/2022');
INSERT INTO controle VALUES (268,	5,	'SVT',	6,	10,	2.00,	'2022-06-02',	'Controle de SVT du 02/06/2022');
INSERT INTO controle VALUES (269,	5,	'SVT',	6,	10,	1.00,	'2021-09-18',	'Controle de SVT du 18/09/2021');
INSERT INTO controle VALUES (270,	5,	'SVT',	6,	20,	2.00,	'2021-10-16',	'Controle de SVT du 16/10/2021');
INSERT INTO controle VALUES (271,	5,	'SVT',	6,	20,	2.00,	'2022-01-08',	'Controle de SVT du 08/01/2022');
INSERT INTO controle VALUES (272,	5,	'SVT',	6,	10,	2.00,	'2022-06-11',	'Controle de SVT du 11/06/2022');
INSERT INTO controle VALUES (273, 5,	'SVT',	7,	5,	2.00, '2022-01-19',    'Controle de SVT du 19/01/2022');
INSERT INTO controle VALUES (274,	5,	'SVT',	7,	20,	1.00,	'2021-10-09',	'Controle de SVT du 09/10/2021');
INSERT INTO controle VALUES (275,	5,	'SVT',	7,	20,	1.00,	'2022-06-01',	'Controle de SVT du 01/06/2022');
INSERT INTO controle VALUES (276,	5,	'SVT',	7,	20,	1.00,	'2022-02-07',	'Controle de SVT du 07/02/2022');
INSERT INTO controle VALUES (277,	5,	'SVT',	7,	5,	2.00, '2022-04-01',    'Controle de SVT du 01/04/2022');
INSERT INTO controle VALUES (278,	5,	'SVT',	7,	20,	3.00,	'2021-11-25',	'Controle de SVT du 25/11/2021');
INSERT INTO controle VALUES (279,	5,	'SVT',	7,	10,	1.00,	'2021-09-11',	'Controle de SVT du 11/09/2021');
INSERT INTO controle VALUES (280,	5,	'SVT',	7,	20,	2.00,	'2021-12-14',	'Controle de SVT du 14/12/2021');
INSERT INTO controle VALUES (281,	6,	'Sport',	1,	5,	3.00,   '2022-03-06',  'Controle de Sport du 06/03/2022');
INSERT INTO controle VALUES (282,	6,	'Sport',	1,	20,	2.00,	'2022-01-09',	'Controle de Sport du 09/01/2022');
INSERT INTO controle VALUES (283,	6,	'Sport',	1,	20,	2.00,	'2022-02-08',	'Controle de Sport du 08/02/2022');
INSERT INTO controle VALUES (284,	6,	'Sport',	1,	10,	1.00,	'2022-06-02',	'Controle de Sport du 02/06/2022');
INSERT INTO controle VALUES (285,	6,	'Sport',	1,	20,	1.00,	'2022-01-16',	'Controle de Sport du 16/01/2022');
INSERT INTO controle VALUES (286,	6,	'Sport',	1,	5,	1.00,  '2021-10-09' ,  'Controle de Sport du 09/10/2021');
INSERT INTO controle VALUES (287,	6,	'Sport',	1,	20,	1.00,	'2022-03-16',	'Controle de Sport du 16/03/2022');
INSERT INTO controle VALUES (288,	6,	'Sport',	1,	20,	2.00,	'2022-05-01',	'Controle de Sport du 01/05/2022');
INSERT INTO controle VALUES (289,	6,	'Sport',	2,	20,	2.00,	'2022-02-21',	'Controle de Sport du 21/02/2022');
INSERT INTO controle VALUES (291,	6,	'Sport',	2,	20,	2.00,	'2022-02-04',	'Controle de Sport du 04/02/2022');
INSERT INTO controle VALUES (292,	6,	'Sport',	2,	20,	2.00,	'2022-01-10',	'Controle de Sport du 10/01/2022');
INSERT INTO controle VALUES (293,	6,	'Sport',	2,	20,	2.00,	'2022-01-20',	'Controle de Sport du 20/01/2022');
INSERT INTO controle VALUES (294,	6,	'Sport',	2,	20,	3.00,	'2021-12-01',	'Controle de Sport du 01/12/2021');
INSERT INTO controle VALUES (295,	6,	'Sport',	2,	20,	1.00,	'2021-10-05',	'Controle de Sport du 05/10/2021');
INSERT INTO controle VALUES (296,	6,	'Sport',	2,	20,	3.00,	'2022-05-03',	'Controle de Sport du 03/05/2022');
INSERT INTO controle VALUES (297,	6,	'Sport',	3,	20,	3.00,	'2021-09-06',	'Controle de Sport du 06/09/2021');
INSERT INTO controle VALUES (298,	6,	'Sport',	3,	20,	1.00,	'2021-09-09',	'Controle de Sport du 09/09/2021');
INSERT INTO controle VALUES (299,	6,	'Sport',	3,	20,	3.00,	'2022-01-13',	'Controle de Sport du 13/01/2022');
INSERT INTO controle VALUES (300,	6,	'Sport',	3,	20,	1.00,	'2022-02-15',	'Controle de Sport du 15/02/2022');
INSERT INTO controle VALUES (301, 6,	'Sport',	3,	20,	2.00,	'2022-05-20',	'Controle de Sport du 20/05/2022');
INSERT INTO controle VALUES (302,	6,	'Sport',	3,	20,	2.00,	'2022-04-26',	'Controle de Sport du 26/04/2022');
INSERT INTO controle VALUES (303,	6,	'Sport',	3,	10,	3.00,	'2021-12-27',	'Controle de Sport du 27/12/2021');
INSERT INTO controle VALUES (304,	6,	'Sport',	3,	20,	2.00,	'2022-05-15',	'Controle de Sport du 15/05/2022');
INSERT INTO controle VALUES (305,	6,	'Sport',	4,	20,	2.00,	'2021-10-24',	'Controle de Sport du 24/10/2021');
INSERT INTO controle VALUES (306,	6,	'Sport',	4,	20,	2.00,	'2022-06-14',	'Controle de Sport du 14/06/2022');
INSERT INTO controle VALUES (307,	6,	'Sport',	4,	20,	3.00,	'2022-03-29',	'Controle de Sport du 29/03/2022');
INSERT INTO controle VALUES (308,	6,	'Sport',	4,	20,	3.00,	'2022-05-23',	'Controle de Sport du 23/05/2022');
INSERT INTO controle VALUES (309,	6,	'Sport',	4,	20,	2.00,	'2021-12-07',	'Controle de Sport du 07/12/2021');
INSERT INTO controle VALUES (310,	6,	'Sport',	4,	10,	1.00,	'2021-10-31',	'Controle de Sport du 31/10/2021');
INSERT INTO controle VALUES (311,	6,	'Sport',	4,	20,	3.00,	'2021-10-20',	'Controle de Sport du 20/10/2021');
INSERT INTO controle VALUES (312,	6,	'Sport',	4,	5,	1.00,  '2021-10-29' ,  'Controle de Sport du 29/10/2021');
INSERT INTO controle VALUES (313,	6,	'Sport',	5,	20,	2.00,	'2021-12-11',	'Controle de Sport du 11/12/2021');
INSERT INTO controle VALUES (314,	6,	'Sport',	5,	20,	1.00,	'2021-10-13',	'Controle de Sport du 13/10/2021');
INSERT INTO controle VALUES (315,	6,	'Sport',	5,	10,	1.00,	'2022-02-01',	'Controle de Sport du 01/02/2022');
INSERT INTO controle VALUES (316,	6,	'Sport',	5,	20,	1.00,	'2021-09-30',	'Controle de Sport du 30/09/2021');
INSERT INTO controle VALUES (317,	6,	'Sport',	5,	10,	2.00,	'2022-03-08',	'Controle de Sport du 08/03/2022');
INSERT INTO controle VALUES (318,	6,	'Sport',	5,	20,	3.00,	'2022-05-17',	'Controle de Sport du 17/05/2022');
INSERT INTO controle VALUES (319,	6,	'Sport',	5,	20,	1.00,	'2022-02-24',	'Controle de Sport du 24/02/2022');
INSERT INTO controle VALUES (320,	6,	'Sport',	5,	20,	1.00,	'2022-01-10',	'Controle de Sport du 10/01/2022');
INSERT INTO controle VALUES (321,	6,	'Sport',	6,	5,	3.00,  '2021-11-10' ,  'Controle de Sport du 10/11/2021');
INSERT INTO controle VALUES (322,	6,	'Sport',	6,	20,	1.00,	'2022-06-01',	'Controle de Sport du 01/06/2022');
INSERT INTO controle VALUES (323,	6,	'Sport',	6,	10,	2.00,	'2022-01-18',	'Controle de Sport du 18/01/2022');
INSERT INTO controle VALUES (324,	6,	'Sport',	6,	20,	1.00,	'2021-10-05',	'Controle de Sport du 05/10/2021');
INSERT INTO controle VALUES (325,	6,	'Sport',	6,	10,	3.00,	'2022-01-11',	'Controle de Sport du 11/01/2022');
INSERT INTO controle VALUES (326,	6,	'Sport',	6,	20,	2.00,	'2022-04-05',	'Controle de Sport du 05/04/2022');
INSERT INTO controle VALUES (327,	6,	'Sport',	6,	5,	1.00,   '2022-01-02',  'Controle de Sport du 02/01/2022');
INSERT INTO controle VALUES (328,	6,	'Sport',	6,	20,	1.00,	'2021-11-15',	'Controle de Sport du 15/11/2021');
INSERT INTO controle VALUES (329,	6,	'Sport',	7,	10,	2.00,	'2021-11-22',	'Controle de Sport du 22/11/2021');
INSERT INTO controle VALUES (330,	6,	'Sport',	7,	20,	1.00,	'2021-12-18',	'Controle de Sport du 18/12/2021');
INSERT INTO controle VALUES (331,	6,	'Sport',	7,	20,	3.00,	'2021-09-12',	'Controle de Sport du 12/09/2021');
INSERT INTO controle VALUES (332,	6,	'Sport',	7,	10,	1.00,	'2022-01-08',	'Controle de Sport du 08/01/2022');
INSERT INTO controle VALUES (333, 6,	'Sport',	7,	20,	1.00,	'2022-01-27',	'Controle de Sport du 27/01/2022');
INSERT INTO controle VALUES (334,	6,	'Sport',	7,	20,	2.00,	'2021-10-09',	'Controle de Sport du 09/10/2021');
INSERT INTO controle VALUES (335,	6,	'Sport',	7,	20,	1.00,	'2021-09-08',	'Controle de Sport du 08/09/2021');
INSERT INTO controle VALUES (336,	6,	'Sport',	7,	20,	2.00,	'2022-01-03',	'Controle de Sport du 03/01/2022');
INSERT INTO controle VALUES (337,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (338,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (339,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (340,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (341,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (342,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (343,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (344,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (345,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (346,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (347,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (348,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (349,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (350,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (351,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (352,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (353,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (354,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (355,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (356,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (357,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (358,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (359,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (360,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (361,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (362,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (363,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (364,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (365,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (366,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (367,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (368,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (369,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (370,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (371,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (372,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (373,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (374,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (375,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (376,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (377,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (378,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (379,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (380,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (381, 1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (382, 1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (383,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (384,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (385,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');
INSERT INTO controle VALUES (386,	1,	'Francais',	1,	20,	1.00,	'2022-06-30',	'Controle exceptionnel du 30/06/2022');



--
-- TOC entry 2931 (class 0 OID 41218)
-- Dependencies: 200
-- Data for Name: eleve; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO eleve (nom, prenom, date_naissance, num_eleve, est_dyslexique, classe)
VALUES
('Norbert',    'Barthelemy',  '2011-10-18',  11244206,    'f',   1),
('Pascal', 'Gervais', '2011-03-12',  12057283,    'f',   1),
('Leopold',    'Rocher',  '2011-06-07',  13668883,    'f',   1),
('Angele', 'Remy',    '2011-05-06',  13684450,    'f',   1),
('Edmond', 'Jouve',  '2011-12-17',  14493579,    'f',   1),
('Viviane',    'Poncet',  '2010-12-14',  17188037,    'f',   1),
('Chloe',  'Robin',   '2010-07-31',  19542698,    't',   1),
('Ernest', 'Fischer', '2010-12-03',  24834676,    'f',   1),
('Stanislas',  'Dupuy',   '2010-05-26',  26790179,    'f',   1),
('Alphonse',   'Jacquot', '2011-06-17',  31193777,    'f',   1),
('Philippe',   'Castel',  '2010-10-19',  31568819,    'f',   1),
('Claire', 'Tanguy',  '2010-11-27',  33871863,    'f',   1),
('Sarah',  'Cartier', '2010-09-29',  36598030,    'f',   1),
('Emilien',    'Leon',    '2011-01-11',  44005211,    'f',   1),
('Ghislain',   'Gallet',  '2011-03-05',  44008477,    'f',   1),
('Nabil',  'Jourdan', '2010-06-17',  47468588,    'f',   1),
('Johan',  'Schmitt', '2011-02-27',  48126470,    'f',   1),
('Jeremie',    'Girault', '2010-11-30',  50417103,    'f',   1),
('Axel',   'Delaunay',    '2010-06-09',  51671643,    'f',   1),
('Mickael',    'Carpentier',  '2010-06-28',  52220638,    'f',   1),
('Therese',    'Cros',    '2011-12-11',  59334127,    'f',   1),
('Marina Gilbert', '2010-06-28',  63887324,    'f',   1),
('Noemie', 'Mahe',    '2010-12-20',  64578632,    't',   1),
('Jeanne', 'Hoarau',  '2010-04-14',  69181739,    'f',   1),
('Thomas', 'Laval',   '2011-07-06',  74239452,    'f',   1),
('Richard',    'Carpentier',  '2010-05-13',  75119033,    'f',   1),
('Celine', 'Peltier', '2011-05-08',  77713039,    'f',   1),
('Gustave',    'Devaux',  '2010-08-29',  77718435,    'f',   1),
('Bernard',    'Samson',  '2011-11-15',  79468224,    't',   1),
('Eugenie',    'Munoz',   '2010-04-30',  80712718,    'f',   1),
('Teddy',  'Lopez',   '2010-08-10',  81512193,    'f',   1),
('Corinne',    'Brault',  '2010-03-25',  81753964,    'f',   1),
('Elizabeth',  'Millet',  '2011-05-01',  89130287,    'f',   1),
('Constant',   'Moreno',  '2011-12-29',  90582251,    't',   1),
('Andre',  'Rossignol',   '2010-10-10',  93040696,    'f',   1),
('Colette',    'Vallee',  '2010-03-27',  93220018,    't',   1),
('Peggy',  'Michelet',    '2010-01-22',  94248610,    'f',   1),
('Denise', 'Perrot',  '2011-10-17',  96590182,    'f',   1),
('Francisco',  'Lecomte', '2010-03-17',  99597461,    'f',   1),
('Jackie', 'Simon',   '2010-06-30',  10998691,    'f',   2),
('Sylvie', 'Delaunay',    '2010-09-19',  11304461,    'f',   2),
('Mario',  'Laborde', '2010-12-03',  12505676,    'f',   2),
('Thi',    'Gibert',  '2010-12-27',  15974674,    'f',   2),
('France', 'Sabatier',    '2010-07-22',  19137151,    'f',   2),
('Marianne',   'Deschamps',   '2010-02-06',  19867677,    'f',   2),
('Claudine',   'Mas', '2009-03-04',  23607067,    'f',   2),
('Pierrette',  'Laval',   '2010-04-20',  23995642,    'f',   2),
('Cathy',  'Berthier',    '2009-08-06',  28916456,    't',   2),
('Joaquim',    'Colin',   '2010-01-09',  30187810,    'f',   2),
('Delphine',   'Noel',    '2009-10-07',  31282994,    'f',   2),
('Denise', 'Pommier', '2009-10-05',  31628825,    'f',   2),
('Gilbert',    'Laporte', '2010-08-21',  31852049,    't',   2),
('Eddy',   'Marion',  '2009-08-30',  32033788,    'f',   2),
('Emile',  'Fortin',  '2009-12-04',  35365463,    'f',   2),
('Sylvie', 'Lagarde', '2009-05-21',  35507115,    'f',   2),
('Louise', 'Dubois',  '2010-01-10',  35992111,    'f',   2),
('Constant',   'Martinez',    '2009-06-05',  42685896,    'f',   2),
('Raoul',  'Renard',  '2009-09-21',  42768632,    'f',   2),
('Johanna',    'Marques', '2009-08-16',  43500959,    'f',   2),
('Germaine',   'Lemoine', '2009-06-22',  46844640,    'f',   2),
('Laura',  'Merle',   '2010-12-06',  48563699,    'f',   2),
('Estelle',    'Martel', '2009-09-19',  54679482,    'f',   2),
('Bastien',    'Louis',   '2009-04-29',  57467650,    'f',   2),
('Ghislaine',  'Favier',  '2010-12-05',  59916483,    'f',   2),
('Andree', 'Barre',   '2009-10-29',  64398919,    'f',   2),
('Mourad', 'Chauvin', '2010-11-04',  64530056,    'f',   2),
('Francisco',  'Blanc',   '2009-03-08',  66921228,    'f',   2),
('Josiane',    'Roussel', '2010-11-11',  68529349,    'f',   2),
('Martine',    'Raynaud', '2010-12-15',  68677240,    't',   2),
('Colette',    'Jacob',   '2010-11-01',  71708814,    'f',   2),
('Gael',   'Costa',   '2009-10-24',  80614518,    'f',   2),
('Christine',  'Schneider',   '2010-04-03',  81768602,    'f',   2),
('Juan',   'Blanc' ,  '2010-05-28',  84158312,    'f',   2),
('Joaquim',    'Gimenez', '2009-02-10',  85368583,    'f',   2),
('Lucile', 'Carpentier',  '2010-10-16',  85632352,    'f',   2),
('Ahmed', 'Rossi',   '2010-01-08',  86872045,    't',   2),
('Marcel', 'Jouve',   '2010-03-16',  90935543,    't',   2),
('Ahmed',  'Peltier', '2010-12-07',  91565702,    'f',   2),
('Benedicte',  'Alves',   '2008-05-24',  10534206,    'f',   3),
('Gisele', 'Garcia',  '2009-12-26',  20236412,    'f',   3),
('Samuel', 'Samson',  '2008-02-20',  20427756,    'f',   3),
('Angele', 'Pierre',  '2009-10-12',  21931678,    'f',   3),
('Thi',    'Bourgeois',   '2009-06-22',  22730658,    'f',   3),
('Solange',    'Vincent', '2008-12-03',  22844995,    'f',   3),
('Nicolas',    'Reynaud', '2008-01-04',  24474176,    'f',   3),
('Louisette',  'Lasserre',    '2008-05-18',  27595348,    'f',   3),
('Francois',   'Perrier', '2009-01-21',  27965307,    'f',   3),
('Gerard', 'Barbier', '2009-11-23',  28915481,    'f',   3),
('Rachid', 'Fontaine',    '2008-11-11',   29172201,   'f' ,  3),
('Elisabeth',  'Lambert', '2009-06-10',  30157844,    't',   3),
('Kevin',  'Dupin',   '2009-05-08',  30589090,    'f',   3),
('Daniel', 'Barbe',   '2008-08-05',  35563113,    'f',   3),
('Denise', 'Barre',   '2009-09-21',  35733587,    't',   3),
('Colette',    'Rolland', '2008-06-15',  36969032,    'f',   3),
('Marceau',    'Letellier',   '2009-11-18',  37560862,    'f',   3),
('Jacques',    'Boucher', '2009-03-17',  40384219,    'f',   3),
('Frederic',   'Pasquier',    '2009-02-06',  41609700,    'f',   3),
('Alban',  'Blanchard',   '2008-01-20',  43320982,    'f',   3),
('Adolphe',    'Martinet',    '2008-12-22',  45814182,    't',   3),
('Angelique', 'Parent',  '2008-12-22',  52238473,    'f',   3),
('Mathieu',    'Launay',  '2008-03-30',  53104670,    'f',   3),
('Constant',   'Maurin',  '2009-06-01',  55810467,    't',   3),
('Fabien', 'Toussaint',   '2009-03-14',  56046099,    'f',   3),
('Rene', 'Caron',   '2009-05-03',  63156760,    'f',   3),
('Juliette',   'Bouvet',  '2009-04-05',  63217302,    't',   3),
('Bruno',  'Jacques', '2009-10-27',  63246226,    'f',   3),
('Delphine',   'Charbonnier', '2009-02-04',  64973126,    't',   3),
('Maria',  'Boulanger',   '2008-04-15',  72751710,    't',   3),
('Gregoire',   'Carre',   '2008-08-26',  74447273,    'f',   3),

('Max', 'Charpentier', '2008-03-11',  75640107,    'f',   3),
('Lucie',  'Louis',   '2009-03-19',  84633041,    'f',   3),
('Marie',  'Marc',    '2009-08-26',  86264655,    't',   3),
('Albert',  'Ferreira',    '2009-03-04',  86534235,    'f',   3),
('Claudia', 'Verdier', '2008-08-17',  91750903,    'f',   3),
('Elie',   'Didier',  '2008-03-31',  95787979,    'f',   3),
('Fernand', 'Pereira', '2009-02-16',  96820901,    'f',   3),
('Olga',    'Stephan', '2009-07-25',  97314565,    'f',   3),
('Lucienne',   'Pierre', '2007-08-12',  10281753,    'f',   4),
('Abel',   'Benard',  '2007-09-01',  12332209,    'f',   4),
('Gilbert', 'Marchand',    '2008-11-02',  14627641,    'f',   4),
('Patrick', 'Blanchard',   '2007-12-30',  15710421,    'f',   4),
('Constant',    'Comte',  '2008-11-20',  16659116,    't',   4),
('Christel',   'Lopes',   '2008-06-10',  17123230,    't',   4),
('Gilberte',   'Rigal',  '2007-02-02',  20885928,    't',   4),
('Rachel', 'Leveque', '2008-03-15',  22715713,    'f',   4),
('Johanna', 'Gilles',  '2007-06-22',  23166329,    't',   4),
('Aurelien',    'Granier', '2008-10-15',  26047923,    'f',   4),
('Anna',    'Felix',   '2008-02-15',  26487936,    't',   4),
('Hubert',  'Berard',  '2007-04-22',  27162414,    'f',   4),
('Julien',  'Da costa',    '2007-12-04',  27204056,    't',   4),
('Janine', 'Daniel', '2007-12-14',  33937912,    'f',   4),
('Alain',  'Bouvet',  '2007-01-14',  36065627,    'f',   4),
('Karim',   'Basset',  '2007-06-01',  36354616,    'f',   4),
('Natacha', 'Weiss',   '2008-09-04',  43246940,    'f',   4),
('Gaston',  'Louis',   '2007-05-24',  47791655,    'f',   4),
('Raymonde',   'Moreno',  '2008-05-31',  48743705,    'f',   4),
('Leopold', 'Berard',  '2008-06-06',  51572168,    'f',   4),
('Alexandra',   'Prevost', '2008-09-06',  52567239,    'f',   4),
('Hugues',  'Brun',    '2007-06-27',  52794581,    'f',   4),
('Mathieu', 'Dupin',   '2008-11-29',  55549712,    'f',   4),
('Francis', 'Thierry', '2007-03-29',  55813326,    'f',   4),
('Arnaud', 'Roy', '2007-09-30',  56462246,    'f',   4),
('Rolande', 'Lucas',   '2008-03-09',  57253118,    'f',   4),
('Brahim',  'Letellier',   '2007-10-11',  63899654,    'f',   4),
('Mathilde',   'Soulier', '2007-01-08',  66407977,    'f',   4),
('Maryvonne',  'Schmidt', '2008-10-19',  72936625,    'f',   4),
('Rachel', 'Lacombe', '2007-01-25',  75692632,    'f',   4),
('Caroline',   'Gregoire',   '2007-06-09',  76662813,    'f',   4),
('Josiane', 'Guerin',  '2008-06-28',  78445718,    'f',   4),
('Yvan',    'Mary',    '2007-08-02',  81965142,    'f',   4),
('Nelly',   'Huet',    '2008-12-11',  83201687,    't',   4),
('Aline',  'Maurin',  '2008-10-14',  84667886,    'f',   4),
('Nadia',   'Bernard', '2007-08-18',  86461348,    't',   4),
('Abel',   'Langlois',    '2007-06-20',  89715013,    'f',   4),
('Berthe', 'Mathieu', '2008-01-15',  97467090,    't',   4),
('Yvan',    'Jacquot', '2008-10-29',  99904277,    'f',   4),
('Mickael','Valentin',   '2006-03-22',  12695343,    'f',   5),
('Mylene', 'Chambon', '2006-08-24',  15330035,    'f',   5),
('Yvette', 'Faure',  '2007-12-24',  19611576,    'f',   5),
('Alban',   'Remy',    '2006-05-24',  22491150,    'f',   5),
('Valerie','Meunier', '2006-04-23',  23144259,    'f',   5),
('Brigitte',   'Ferrari', '2006-05-16',  24655905,    'f',   5),
('Eugenie','Sanchez', '2006-12-11',  25179222,    'f',   5),
('Luc', 'Faure',  '2007-10-10',  26326420,    'f',   5),
('Bastien', 'Grange', '2006-11-26',  28827259,    'f',   5),
('Emma',    'Faure',  '2006-08-25',  29386219,    'f',   5),
('Ginette', 'Roche',  '2007-09-30',  29557897,    'f',   5),
('Marion',  'Chauvin', '2006-12-13',  30901477,    'f',   5),
('Anita',   'Poncet',  '2006-02-08',  34457914,    'f',   5),
('Remy',    'Costa',   '2007-09-29',  34619084,    'f',   5),
('Matthieu',    'Thomas',  '2007-03-16',  35183865,    'f',   5),
('Youssef', 'Jamet',   '2006-06-16',  39409116,    'f',   5),
('Willy',   'Pelletier',   '2006-08-22',  41083936,    'f',   5),
('Pascal', 'Bourgeois',   '2006-03-07',  42620373,    'f',   5),
('Steve',  'Hoarau',  '2006-12-29',  45241147,    'f',   5),
('Thomas',  'Becker',  '2006-04-22',  46275969,    'f',   5),
('Hugues',  'Blanchet',    '2006-09-23',  50649325,    't',   5),
('Alphonse',   'Lacroix', '2006-01-20',  53972238,    'f',   5),
('Renee',  'Joseph',  '2007-05-01',  54954233,    'f',   5),
('Renaud',  'Fournier',    '2006-11-30',  56622972,    'f',   5),
('Yann',    'Schneider',   '2007-06-02',  60594527,    'f',   5),
('Madeleine',  'Pichon',  '2006-09-12',  61414047,    'f',   5),
('Aline',  'Lemoine', '2006-05-16',  66542703,    'f',   5),
('Emmanuel',   'Andre',  '2006-12-17',  66905564,    'f',   5),
('Marie',  'Julien',  '2006-08-11',  68727765,    't',   5),
('Christiane', 'Rault',   '2006-11-10',  71257664,    'f',   5),
('Gaelle', 'Gilles',  '2006-09-18',  74709445,    'f',   5),
('Said',   'Rolland', '2007-10-12',  76257107,    'f',   5),
('Danielle',   'Collet',  '2006-02-23',  79360908,    'f',   5),
('Vanessa', 'Billard', '2007-09-16',  79593813,    'f',   5),
('Lucie',  'Barre',  '2007-11-14',  86510574,    't',   5),
('Edith',   'Boyer',   '2006-02-23',  86930808,    'f',   5),
('Cecile', 'Gimenez', '2007-05-13',  91074522,    't',   5),
('Vincent', 'Georges', '2006-01-07',  91980591,    'f',   5),
('Nadege', 'Noel',   '2007-04-20',  96116283,    't',   5),
('Marcelle',   'Boulay',  '2005-08-03',  13933301,    'f',  6),
('Francoise',  'Alexandre',  '2006-09-16',  16797391,    'f',   6),
('Charles', 'Jacob',   '2005-12-20',  18029580,    't',  6),
('Jane',   'Roger',   '2005-12-03',  23412027,    'f',  6),
('Serge',  'Lenoir',  '2005-11-28',  33583386,    'f',  6),
('Lea', 'Francois',    '2006-10-27',  33809838,    't',   6),
('Sebastien',   'Bodin',   '2005-08-24',  35544401,    'f',  6),
('Angelique',  'Billard', '2005-03-23',  38867925,    'f',  6),
('Claudia', 'Besnard', '2006-10-28',  39014661,    'f',   6),
('Marius',  'Forestier',   '2006-08-28',  40177208,    'f',   6),
('Marlene','Sauvage', '2005-11-29',  44508242,    'f',   6),
('Aurelien',    'Pruvost', '2006-02-06',  44975872,    'f',   6),
('Maurice','Brunet',  '2005-08-03',  45124404,    'f',  6),
('Bertrand',    'Vallee', '2006-02-25',  46341250,    'f',   6),
('Anne',   'Lesage', '2006-04-29',  47992460,    'f',   6),
('Elsa',    'Renault', '2006-09-28',  50255297,    't',   6),
('Patricia',    'Prevot',  '2005-06-09',  54277909,    'f',  6),
('Loic',    'Dubreuil',   '2005-06-26',  55075253,    'f',  6),
('Samuel', 'Wagner',  '2006-09-27',  55481497,    'f',   6),
('Morgane','Lebrun',  '2005-08-19',  55920827,    'f',  6),
('Ahmed',   'Blanc',   '2005-06-19',  59394502,    'f',  6),
('Ghislain',    'Lepage', '2006-09-20',  60555723,    'f',   6),
('Edwige', 'Hardy',   '2006-11-24',  61496547,    'f',   6),
('Sonia',   'Munoz',   '2006-03-22',  62998010,    'f',   6),
('Morgane','Cartier', '2006-05-24',  64445490,    'f',   6),
('Marceau', 'Ollivier',    '2006-05-28',  65440089,    'f',   6),
('Raymonde',   'Delannoy',    '2005-01-28',  66080147,    'f',  6),
('Noel',   'Bonhomme',   '2006-12-28',  72165244,    't',   6),
('Marina',  'Grandjean',   '2006-03-22',  73317454,    'f',   6),
('Yvonne', 'Chauvet', '2005-07-05',  74288538,    'f',  6),
('Paule',  'Buisson', '2005-09-07',  77026788,    'f',  6),
('Simone', 'Grandjean',   '2005-06-21',  77271695,    'f',  6),
('Simone', 'Girard',  '2006-01-30',  78162009,    't',   6),
('Linda',   'Riviere', '2005-05-20',  78641051,    'f',   6),
('Chantal','Parmentier',  '2005-09-30',  82567240,    'f',  6),
('Pascal', 'Leroux',  '2006-05-23',  85700983,    'f',   6),
('Agnes',   'Lebrun',  '2005-08-09',  87657665,    'f',  6),
('Alfred',  'Gillet',  '2006-03-13',  89132300,    'f',   6),
('Jocelyne',   'Bodin',   '2006-05-31',  92475083,    'f',   6),
('Katia',   'Raymond', '2005-07-17',  11060460,    'f',  7),
('Boris',   'Tanguy',  ,'2004-07-31',  12676344,    'f',   7),
('Romain',  'Gilles',  '2005-09-04',  13798907,    'f',  7),
('Dany',    'Lemonnier',   '2005-02-28',  14857390,    'f',  7),
('Angele', 'Baudry',  '2005-04-29',  14876495,    'f',  7),
('Alban',   'Charpentier' ,'2004-03-22', 15291264,    'f',   7),
('Jocelyn', 'Vallee' ,'2004-02-07',  15835420,    'f',   7),
('Antonin', 'Arnaud'  ,'2004-02-05',  17358086,    'f',   7),
('Carole', 'Rodriguez'   ,'2004-11-28',  18167729,    'f',   7),
('Amelie', 'Guillou', '2005-09-30',  22735531,    'f',  7),
('Ben', 'Roussel', '2005-04-19',  31721186,    't',   7),
('Marjorie',   'Blin'    ,'2004-02-28',  33551716,   'f',   7),
('Florence',   'Dupuis' ,'2004-08-07',  37864801,    'f',   7),
('Sylvie', 'Collet',  '2005-06-09',  39028666,    'f',  7),
('Steven',  'Vaillant',    '2005-09-15', 39291233,    'f',  7),
('Pascal', 'Riou'    ,'2004-03-26',  42119585,    'f',   7),
('Thi', 'Barbier', '2005-07-08',  44618350,    'f',  7),
('Jessica', 'Louis'   ,'2004-03-26',  44809709,    'f',   7),
('Johann',  'Marion'  ,'2004-08-11',  47500359 ,   'f',   7),
('Sylvie', 'Granier' ,'2004-09-16',  51067129,    'f',   7),
('Yves',    'Cartier' ,'2004-04-10',  53414159,    'f',   7),
('Sandrine',   'Gervais', '2005-12-12',  58498985,    't',  7),
('Claire', 'Faure',  '2005-11-21',  59542319,    'f',  7),
('Joseph',  'Gilbert', '2005-10-02',  60436435,    'f',  7),
('Joachim', 'Guy' ,'2004-01-03',  63239930,    'f',   7),
('Elizabeth',   'Perrot'  ,'2004-07-29',  67735490,    't',   7),
('Christine',  'Fernandez',   '2005-07-30',  68243902,    'f',  7),
('Louis',   'Chauvin', '2005-01-14',  70714030,    'f',  7),
('Jose',   'Collin'  ,'2004-06-20',  71582989,    'f',   7),
('Claudine',   'Charpentier', '2005-06-06',  82232362,    'f',  7),
('Mireille',   'Lamy'    ,'2004-09-04',  86606105,   'f',   7),
('Yann',    'Boyer'   ,'2004-02-21',  88571574,    'f',   7),
('Regine', 'Lasserre',   '2005-04-08',  92033729,    'f',  7),
('Fernande',   'Caron'   ,'2004-01-09',  92343797,    'f',   7),
('Virginie',   'Marc'    ,'2004-12-27',  92883827,    'f',   7),
('Georges', 'Hoarau',  '2005-11-29',  93501906,    'f',  7),
('El', 'Clement' ,'2004-03-14',  95481005,    'f',   7),
('Gustave','Doucet'  ,'2004-05-27',  97792734,    'f',   7),
('Constant',    'Colin'   ,'2004-06-22',  99115530,    'f',   7);




--
-- TOC entry 2934 (class 0 OID 41240)
-- Dependencies: 203
-- Data for Name: enseigner; Type: TABLE DATA; Schema: public; Owner: -
--

--COPY public.enseigner (prof, matiere, classe) FROM stdin;
/*INSERT INTO enseigner (prof, matiere, classe)
VALUES
(1,	'Francais',	1),
(1,	'Francais',	2),
(1,	'Francais',	3),
(1,	'Francais',	4),
(1,	'Francais',	5),
(1,	'Francais',	6),
(1,	'Francais',	7),
(2,	'Histoire-geographie',	1),
(2,	'Histoire-geographie',	2),
(2,	'Histoire-geographie',	3),
(2,	'Histoire-geographie',	4),
(2,	'Histoire-geographie',	5),
(2,	'Histoire-geographie',	6),
(2,	'Histoire-geographie',	7),
(3,	'Mathematiques',	1),
(3,	'Mathematiques',	2),
(3,	'Mathematiques',	3),
(3,	'Mathematiques',	4),
(3,	'Mathematiques',	5),
(3,	'Mathematiques',	6),
(3,	'Mathematiques',	7),
(4,	'Physique-chimie',	1),
(4,	'Physique-chimie',	2),
(4,	'Physique-chimie',	3),
(4,	'Physique-chimie',	4),
(4,	'Physique-chimie',	5),
(4,	'Physique-chimie',	6),
(4,	'Physique-chimie',	7),
(5, 'SVT', 1),
(5,	'SVT' ,2),
(5,	'SVT',	3),
(5,	'SVT',	4),
(5,	'SVT',	5),
(5,	'SVT',	6),
(5,	'SVT',	7),
(6, 'Sport',	1),
(6,	'Sport',	2),
(6,	'Sport',	3),
(6,	'Sport',	4),
(6,	'Sport',	5),
(6,	'Sport',	6),
(6,	'Sport',	7);



--,
--- TOC ent',ry 2937 (class 0 OID 41288)
-- Dependencies: 206
-- Data for Name: notation; Type: TABLE DATA; Schema: public; Owner: -
--

--COPY public.notation (eleve, controle, note) FROM stdin;
INSERT INTO notation (eleve, controle, note)
VALUES
(11244206,	1	8
),(12057283,	1	7
),(13668883,	1	14),
(13684450,	1	4
),(14493579,	1	14),
(17188037,	1	9
),(19542698,	1	14),
(24834676,	1	9
),(26790179,	1	3
),(31193777,	1	11),
(31568819,	1	4
),(33871863,	1	6
),(36598030,	1	9
),(44005211,	1	4
),(44008477,	1	6
),(47468588,	1	8
),(48126470,	1	8
),(50417103,	1	4
),(51671643,	1	12),
(52220638,	1	10),
(59334127,	1	4
),(63887324,	1	9
),(64578632,	1	6
),(69181739,	1	0
),(74239452,	1	10),
(75119033,	1	12),
(77713039,	1	8
),(77718435,	1	14),
(79468224,	1	2
),(80712718,	1	2
),(81512193,	1	3
),(81753964,	1	7
),(89130287,	1	8
),(90582251,	1	3
),(93040696,	1	12),
(93220018,	1	3
),(94248610,	1	7
),(96590182,	1	9
),(99597461,	1	20),
(11244206,	2,	3
),
(12057283,	2,	5
),
(13668883,	2,	11),

(13684450,	2,	13),

(14493579,	2,	11),

(17188037,	2,	13),

(19542698,	2,	2
),
(24834676,	2,	5
),
(26790179,	2,	9
),
(31193777,	2,	11),

(31568819,	2,	12),

(33871863,	2,	4
),
(36598030,	2,	13),

(44005211,	2,	18),

(44008477,	2,	12),

(47468588,	2,	12),

(48126470,	2,	6
),
(50417103,	2,	7
),
(51671643,	2,	8
),
(52220638,	2,	12),

(59334127,	2,	4
),
(63887324,	2,	11),

(64578632,	2,	14),

(69181739,	2,	13),

(74239452,	2,	0
),
(75119033,	2,	7
),
(77713039,	2,	6
),
(77718435,	2,	3
),
(79468224,	2,	13),

(80712718,	2,	5
),
(81512193,	2,	1
),
(81753964,	2,	12),

(89130287,	2,	8
),
(90582251,	2,	16),

(93040696,	2,	9
),
(93220018,	2,	8
),
(94248610,	2,	9
),
(96590182,	2,	15),

(99597461,	2,	9
),
(11244206,	3,	15),

(12057283,	3,	18),

(13668883,	3,	10),

(13684450,	3,	17),

(14493579,	3,	20),

(17188037,	3,	12),

(19542698,	3,	5
),
(24834676,	3,	14),

(26790179,	3,	10),

(31193777,	3,	11),

(31568819,	3,	8
),
(33871863,	3,	14),

(36598030,	3,	10),

(44005211,	3,	13),

(44008477,	3,	7
),
(47468588,	3,	16),

(48126470,	3,	6
),
(50417103,	3,	14),

(51671643,	3,	11),

(52220638,	3,	9
),
(59334127,	3,	20),

(63887324,	3,	5
),
(64578632,	3,	2
),
(69181739,	3,	13),

(74239452,	3,	6
),
(75119033,	3,	9
),
(77713039,	3,	20),

(77718435,	3,	12),

(79468224,	3,	14),

(80712718,	3,	11),

(81512193,	3,	9
),
(81753964,	3,	5
),
(89130287,	3,	10),

(90582251,	3,	16),

(93040696,	3,	8
),
(93220018,	3,	13),

(94248610,	3,	13),

(96590182,	3,	13),

(99597461,	3,	15),

(11244206,	4,	10),

(12057283,	4,	8
),
(13668883,	4,	7
),
(13684450,	4,	7
),
(14493579,	4,	6
),
(17188037,	4,	10),

(19542698,	4,	9
),
(24834676,	4,	8
),
(26790179,	4,	6
),
(31193777,	4,	6
),
(31568819,	4,	5
),
(33871863,	4,	9
),
(36598030,	4,	6
),
(44005211,	4,	5
),
(44008477,	4,	8
),
(47468588,	4,	6
),
(48126470,	4,	1
),
(50417103,	4,	10),

(51671643,	4,	5
),
(52220638,	4,	10),

(59334127,	4,	3
),
(63887324,	4,	2
),
(64578632,	4,	8
),
(69181739,	4,	6
),
(74239452,	4,	3
),
(75119033,	4,	10),

(77713039,	4,	10),

(77718435,	4,	7
),
(79468224,	4,	10),

(80712718,	4,	4
),
(81512193,	4,	10),

(81753964,	4,	6
),
(89130287,	4,	3
),
(90582251,	4,	10),

(93040696,	4,	10),

(93220018,	4,	10),

(94248610,	4,	3
),
(96590182,	4,	8
),
(99597461,	4,	6
),
(11244206,	5,	6
),
(12057283,	5,	2
),
(13668883,	5,	6
),
(13684450,	5,	10),

(14493579,	5,	7
),
(17188037,	5,	13),

(19542698,	5,	16),

(24834676,	5,	8
),
(26790179,	5,	8
),
(31193777,	5,	8
),
(31568819,	5,	5
),
(33871863,	5,	14),

(36598030,	5,	11),

(44005211,	5,	8
),
(44008477,	5,	15),

(47468588,	5,	11),

(48126470,	5,	15),

(50417103,	5,	15),

(51671643,	5,	8
),
(52220638,	5,	5
),
(59334127,	5,	7
),
(63887324,	5,	13),

(64578632,	5,	9
),
(69181739,	5,	10),

(74239452,	5,	11),

(75119033,	5,	20),

(77713039,	5,	9
),
(77718435,	5,	6
),
(79468224,	5,	10),

(80712718,	5,	11),

(81512193,	5,	11),

(81753964,	5,	8
),
(89130287,	5,	11),

(90582251,	5,	16),

(93040696,	5,	7
),
(93220018,	5,	14),

(94248610,	5,	12),

(96590182,	5,	20),

(99597461,	5,	9
),
(11244206,	6,	4
),
(12057283,	6,	5
),
(13668883,	6,	20),

(13684450,	6,	16),

(14493579,	6,	11),

(17188037,	6,	6
),
(19542698,	6,	9
),
(24834676,	6,	10),

(26790179,	6,	12),

(31193777,	6,	15),

(31568819,	6,	11),

(33871863,	6,	20),

(36598030,	6,	20),

(44005211,	6,	14),

(44008477,	6,	9
),
(47468588,	6,	11),

(48126470,	6,	9
),
(50417103,	6,	14),

(51671643,	6,	14),

(52220638,	6,	16),

(59334127,	6,	17),

(63887324,	6,	10),

(64578632,	6,	13),

(69181739,	6,	11),

(74239452,	6,	9
),
(75119033,	6,	20),

(77713039,	6,	6
),
(77718435,	6,	10),

(79468224,	6,	8
),
(80712718,	6,	9
),
(81512193,	6,	13),

(81753964,	6,	14),

(89130287,	6,	9
),
(90582251,	6,	10),

(93040696,	6,	13),

(93220018,	6,	6
),
(94248610,	6,	10),

(96590182,	6,	20),

(99597461,	6,	11),

(11244206,	7,	11),

(12057283,	7,	12),

(13668883,	7,	6
),
(13684450,	7,	12),

(14493579,	7,	13),

(17188037,	7,	7
),
(19542698,	7,	11),

(24834676,	7,	14),

(26790179,	7,	2
),
(31193777,	7,	18),

(31568819,	7,	8
),
(33871863,	7,	14),

(36598030,	7,	15),

(44005211,	7,	20),

(44008477,	7,	14),

(47468588,	7,	17),

(48126470,	7,	16),

(50417103,	7,	13),

(51671643,	7,	20),

(52220638,	7,	12),

(59334127,	7,	13),

(63887324,	7,	9
),
(64578632,	7,	4
),
(69181739,	7,	14),

(74239452,	7,	7
),
(75119033,	7,	10),

(77713039,	7,	15),

(77718435,	7,	10),

(79468224,	7,	13),

(80712718,	7,	13),

(81512193,	7,	15),

(81753964,	7,	10),

(89130287,	7,	14),

(90582251,	7,	12),

(93040696,	7,	17),

(93220018,	7,	10),

(94248610,	7,	7
),
(96590182,	7,	3
),
(99597461,	7,	6
),
(11244206,	8,	20),

(12057283,	8,	9
),
(13668883,	8,	19),

(13684450,	8,	16),

(14493579,	8,	10),

(17188037,	8,	16),

(19542698,	8,	9
),
(24834676,	8,	20),

(26790179,	8,	17),

(31193777,	8,	12),

(31568819,	8,	16),

(33871863,	8,	18),

(36598030,	8,	16),

(44005211,	8,	13),

(44008477,	8,	13),

(47468588,	8,	16),

(48126470,	8,	7
),
(50417103,	8,	14),

(51671643,	8,	7
),
(52220638,	8,	11),

(59334127,	8,	20),

(63887324,	8,	10),

(64578632,	8,	19),

(69181739,	8,	11),

(74239452,	8,	14),

(75119033,	8,	14),

(77713039,	8,	12),

(77718435,	8,	14),

(79468224,	8,	19),

(80712718,	8,	13),

(81512193,	8,	12),

(81753964,	8,	17),

(89130287,	8,	17),

(90582251,	8,	6
),
(93040696,	8,	17),

(93220018,	8,	14),

(94248610,	8,	16),

(96590182,	8,	9
),
(99597461,	8,	9
),
(10998691,	9,	17),

(11304461,	9,	8
),
(12505676,	9,	14),

(15974674,	9,	11),

(19137151,	9,	14),

(19867677,	9,	11),

(23607067,	9,	8
),
(23995642,	9,	13),

(28916456,	9,	8
),
(30187810,	9,	7
),
(31282994,	9,	18),

(31628825,	9,	18),

(31852049,	9,	14),

(32033788,	9,	13),

(35365463,	9,	14),

(35507115,	9,	7
),
(35992111,	9,	12),

(42685896,	9,	10),

(42768632,	9,	7
),
(43500959,	9,	18),

(46844640,	9,	11),

(48563699,	9,	18),

(54679482,	9,	14),

(57467650,	9,	13),

(59916483,	9,	12),

(64398919,	9,	13),

(64530056,	9,	12),

(66921228,	9,	18),

(68529349,	9,	13),

(68677240,	9,	6
),
(71708814,	9,	6
),
(80614518,	9,	18),

(81768602,	9,	11),

(84158312,	9,	12),

(85368583,	9,	6
),
(85632352,	9,	16),

(86872045,	9,	14),

(90935543,	9,	14),

(91565702,	9,	11),

(10998691,	10,	8
),
(11304461,	10,	6
),
(12505676,	10,	15),

(15974674,	10,	11),

(19137151,	10,	5
),
(19867677,	10,	14),

(23607067,	10,	10),

(23995642,	10,	16),

(28916456,	10,	10),

(30187810,	10,	5
),
(31282994,	10,	7
),
(31628825,	10,	12),

(31852049,	10,	9
),
(32033788,	10,	10),

(35365463,	10,	7
),
(35507115,	10,	4
),
(35992111,	10,	13),

(42685896,	10,	10),

(42768632,	10,	12),

(43500959,	10,	2
),
(46844640,	10,	8
),
(48563699,	10,	11),

(54679482,	10,	13),

(57467650,	10,	9
),
(59916483,	10,	9
),
(64398919,	10,	14),

(64530056,	10,	0
),
(66921228,	10,	5
),
(68529349,	10,	8
),
(68677240,	10,	3
),
(71708814,	10,	7
),
(80614518,	10,	1
),
(81768602,	10,	6
),
(84158312,	10,	8
),
(85368583,	10,	10),

(85632352,	10,	15),

(86872045,	10,	6
),
(90935543,	10,	11),

(91565702,	10,	3
),
(10998691,	11,	6
),
(11304461,	11,	4
),
(12505676,	11,	3
),
(15974674,	11,	5
),
(19137151,	11,	7
),
(19867677,	11,	9
),
(23607067,	11,	7
),
(23995642,	11,	5
),
(28916456,	11,	1
),
(30187810,	11,	5
),
(31282994,	11,	7
),
(31628825,	11,	6
),
(31852049,	11,	5
),
(32033788,	11,	6
),
(35365463,	11,	4
),
(35507115,	11,	6
),
(35992111,	11,	9
),
(42685896,	11,	10),

(42768632,	11,	9
),
(43500959,	11,	7
),
(46844640,	11,	2
),
(48563699,	11,	6
),
(54679482,	11,	7
),
(57467650,	11,	10),

(59916483,	11,	8
),
(64398919,	11,	3
),
(64530056,	11,	3
),
(66921228,	11,	7
),
(68529349,	11,	2
),
(68677240,	11,	8
),
(71708814,	11,	6
),
(80614518,	11,	7
),
(81768602,	11,	4
),
(84158312,	11,	3
),
(85368583,	11,	4
),
(85632352,	11,	0
),
(86872045,	11,	5
),
(90935543,	11,	4
),
(91565702,	11,	7
),
(10998691,	12,	13),

(11304461,	12,	20),

(12505676,	12,	13),

(15974674,	12,	15),

(19137151,	12,	16),

(19867677,	12,	16),

(23607067,	12,	12),

(23995642,	12,	12),

(28916456,	12,	15),

(30187810,	12,	11),

(31282994,	12,	14),

(31628825,	12,	9
),
(31852049,	12,	19),

(32033788,	12,	14),

(35365463,	12,	13),

(35507115,	12,	18),

(35992111,	12,	13),

(42685896,	12,	17),

(42768632,	12,	13),

(43500959,	12,	20),

(46844640,	12,	10),

(48563699,	12,	16),

(54679482,	12,	18),

(57467650,	12,	11),

(59916483,	12,	18),

(64398919,	12,	18),

(64530056,	12,	16),

(66921228,	12,	15),

(68529349,	12,	8
),
(68677240,	12,	16),

(71708814,	12,	7
),
(80614518,	12,	14),

(81768602,	12,	12),

(84158312,	12,	10),

(85368583,	12,	14),

(85632352,	12,	16),

(86872045,	12,	6
),
(90935543,	12,	10),

(91565702,	12,	19),

(10998691,	13,	13),

(11304461,	13,	12),

(12505676,	13,	9
),
(15974674,	13,	17),

(19137151,	13,	17),

(19867677,	13,	12),

(23607067,	13,	18),

(23995642,	13,	11),

(28916456,	13,	16),

(30187810,	13,	15),

(31282994,	13,	17),

(31628825,	13,	15),

(31852049,	13,	7
),
(32033788,	13,	14),

(35365463,	13,	10),

(35507115,	13,	5
),
(35992111,	13,	9
),
(42685896,	13,	13),

(42768632,	13,	6
),
(43500959,	13,	14),

(46844640,	13,	13),

(48563699,	13,	4
),
(54679482,	13,	6
),
(57467650,	13,	10),

(59916483,	13,	13),

(64398919,	13,	8
),
(64530056,	13,	14),

(66921228,	13,	15),

(68529349,	13,	8
),
(68677240,	13,	12),

(71708814,	13,	13),

(80614518,	13,	6
),
(81768602,	13,	8
),
(84158312,	13,	9
),
(85368583,	13,	6
),
(85632352,	13,	8
),
(86872045,	13,	13),

(90935543,	13,	13),

(91565702,	13,	12),

(10998691,	14,	8
),
(11304461,	14,	7
),
(12505676,	14,	10),

(15974674,	14,	6
),
(19137151,	14,	4
),
(19867677,	14,	8
),
(23607067,	14,	5
),
(23995642,	14,	10),

(28916456,	14,	8
),
(30187810,	14,	6
),
(31282994,	14,	3
),
(31628825,	14,	10),

(31852049,	14,	7
),
(32033788,	14,	2
),
(35365463,	14,	10),

(35507115,	14,	6
),
(35992111,	14,	8
),
(42685896,	14,	8
),
(42768632,	14,	6
),
(43500959,	14,	9
),
(46844640,	14,	10),

(48563699,	14,	2
),
(54679482,	14,	10),

(57467650,	14,	4
),
(59916483,	14,	7
),
(64398919,	14,	2
),
(64530056,	14,	7
),
(66921228,	14,	6
),
(68529349,	14,	1
),
(68677240,	14,	4
),
(71708814,	14,	4
),
(80614518,	14,	8
),
(81768602,	14,	9
),
(84158312,	14,	10),

(85368583,	14,	8
),
(85632352,	14,	5
),
(86872045,	14,	1
),
(90935543,	14,	4
),
(91565702,	14,	10),

(10998691,	15,	13),
(11304461,	15,	12),
(12505676,	15,	14),
(15974674,	15,	17),
(19137151,	15,	14),
(19867677,	15,	15),
(23607067,	15,	15),
(23995642,	15,	16),
(28916456,	15,	16),
(30187810,	15,	20),
(31282994,	15,	10),
(31628825,	15,	9
),(31852049,	15,	18),
(32033788,	15,	15),
(35365463,	15,	10),
(35507115,	15,	18),
(35992111,	15,	18),
(42685896,	15,	14),
(42768632,	15,	20),
(43500959,	15,	14),
(46844640,	15,	20),
(48563699,	15,	12),
(54679482,	15,	12),
(57467650,	15,	18),
(59916483,	15,	9
),(64398919,	15,	17),
(64530056,	15,	12),
(66921228,	15,	13),
(68529349,	15,	3
),(68677240,	15,	16),
(71708814,	15,	11),
(80614518,	15,	11),
(81768602,	15,	15),
(84158312,	15,	15),
(85368583,	15,	14),
(85632352,	15,	19),
(86872045,	15,	18),
(90935543,	15,	17),
(91565702,	15,	10),
(10998691,	16,	11),

(11304461,	16,	15),

(12505676,	16,	4
),
(15974674,	16,	5
),
(19137151,	16,	5
),
(19867677,	16,	9
),
(23607067,	16,	10),

(23995642,	16,	7
),
(28916456,	16,	5
),
(30187810,	16,	9
),
(31282994,	16,	8
),
(31628825,	16,	11),

(31852049,	16,	6
),
(32033788,	16,	10),

(35365463,	16,	8
),
(35507115,	16,	0
),
(35992111,	16,	9
),
(42685896,	16,	0
),
(42768632,	16,	2
),
(43500959,	16,	13),

(46844640,	16,	12),

(48563699,	16,	13),

(54679482,	16,	9
),
(57467650,	16,	13),

(59916483,	16,	4
),
(64398919,	16,	0
),
(64530056,	16,	8
),
(66921228,	16,	4
),
(68529349,	16,	11),

(68677240,	16,	9
),
(71708814,	16,	11),

(80614518,	16,	11),

(81768602,	16,	7
),
(84158312,	16,	9
),
(85368583,	16,	8
),
(85632352,	16,	3
),
(86872045,	16,	0
),
(90935543,	16,	14),

(91565702,	16,	12),

(10534206,	17,	10),

(20236412,	17,	19),

(20427756,	17,	9
),
(21931678,	17,	14),

(22730658,	17,	11),

(22844995,	17,	6
),
(24474176,	17,	9
),
(27595348,	17,	12),

(27965307,	17,	12),

(28915481,	17,	16),

(29172201,	17,	13),

(30157844,	17,	8
),
(30589090,	17,	19),

(35563113,	17,	17),

(35733587,	17,	18),

(36969032,	17,	11),

(37560862,	17,	4
),
(40384219,	17,	13),

(41609700,	17,	2
),
(43320982,	17,	3
),
(45814182,	17,	12),

(52238473,	17,	6
),
(53104670,	17,	14),

(55810467,	17,	18),

(56046099,	17,	11),

(63156760,	17,	2
),
(63217302,	17,	18),

(63246226,	17,	6
),
(64973126,	17,	15),

(72751710,	17,	11),

(74447273,	17,	10),

(75640107,	17,	10),

(84633041,	17,	16),

(86264655,	17,	13),

(86534235,	17,	14),

(91750903,	17,	19),

(95787979,	17,	13),

(96820901,	17,	8
),
(97314565,	17,	12),

(10534206,	18,	11),
(20236412,	18,	15),
(20427756,	18,	15),
(21931678,	18,	1
),(22730658,	18,	13),
(22844995,	18,	19),
(24474176,	18,	9
),(27595348,	18,	15),
(27965307,	18,	20),
(28915481,	18,	10),
(29172201,	18,	10),
(30157844,	18,	11),
(30589090,	18,	13),
(35563113,	18,	12),
(35733587,	18,	14),
(36969032,	18,	10),
(37560862,	18,	9
),(40384219,	18,	7
),(41609700,	18,	19),
(43320982,	18,	10),
(45814182,	18,	13),
(52238473,	18,	16),
(53104670,	18,	9
),(55810467,	18,	7
),(56046099,	18,	11),
(63156760,	18,	9
),(63217302,	18,	16),
(63246226,	18,	11),
(64973126,	18,	5
),(72751710,	18,	8
),(74447273,	18,	15),
(75640107,	18,	17),
(84633041,	18,	15),
(86264655,	18,	10),
(86534235,	18,	16),
(91750903,	18,	18),
(95787979,	18,	13),
(96820901,	18,	14),
(97314565,	18,	15),
(10534206,	19,	12),
(20236412,	19,	12),
(20427756,	19,	10),
(21931678,	19,	10),
(22730658,	19,	10),
(22844995,	19,	15),
(24474176,	19,	12),
(27595348,	19,	15),
(27965307,	19,	17),
(28915481,	19,	15),
(29172201,	19,	14),
(30157844,	19,	4
),(30589090,	19,	13),
(35563113,	19,	13),
(35733587,	19,	13),
(36969032,	19,	7
),(37560862,	19,	9
),(40384219,	19,	12),
(41609700,	19,	8
),(43320982,	19,	12),
(45814182,	19,	9
),(52238473,	19,	8
),(53104670,	19,	13),
(55810467,	19,	16),
(56046099,	19,	14),
(63156760,	19,	12),
(63217302,	19,	11),
(63246226,	19,	13),
(64973126,	19,	10),
(72751710,	19,	14),
(74447273,	19,	17),
(75640107,	19,	13),
(84633041,	19,	11),
(86264655,	19,	14),
(86534235,	19,	13),
(91750903,	19,	19),
(95787979,	19,	14),
(96820901,	19,	10),
(97314565,	19,	20),
(10534206,	20,	17),
(20236412,	20,	5
),(20427756,	20,	12),
(21931678,	20,	11),
(22730658,	20,	1
),(22844995,	20,	7
),(24474176,	20,	13),
(27595348,	20,	12),
(27965307,	20,	6
),(28915481,	20,	9),
(29172201,	20,	11),
(30157844,	20,	13),
(30589090,	20,	12),
(35563113,	20,	12),
(35733587,	20,	12),
(36969032,	20,	6
),(37560862,	20,	8
),(40384219,	20,	7
),(41609700,	20,	4
),(43320982,	20,	9
),(45814182,	20,	2
),(52238473,	20,	5
),(53104670,	20,	0
),(55810467,	20,	14),
(56046099,	20,	13),
(63156760,	20,	9
),(63217302,	20,	12),
(63246226,	20,	6
),(64973126,	20,	0
),(72751710,	20,	6
),(74447273,	20,	0
),(75640107,	20,	13),
(84633041,	20,	10),
(86264655,	20,	8
),(86534235,	20,	11),
(91750903,	20,	6
),(95787979,	20,	13),
(96820901,	20,	9
),(97314565,	20,	2
),
(10534206,	21,	12),

(20236412,	21,	12),

(20427756,	21,	12),

(21931678,	21,	20),

(22730658,	21,	18),

(22844995,	21,	19),

(24474176,	21,	19),

(27595348,	21,	18),

(27965307,	21,	20),

(28915481,	21,	11),
(29172201,	21,	16),

(30157844,	21,	12),

(30589090,	21,	20),

(35563113,	21,	9
),
(35733587,	21,	11),

(36969032,	21,	12),

(37560862,	21,	14),

(40384219,	21,	14),

(41609700,	21,	12),

(43320982,	21,	12),

(45814182,	21,	14),

(52238473,	21,	15),

(53104670,	21,	12),

(55810467,	21,	13),

(56046099,	21,	18),

(63156760,	21,	18),

(63217302,	21,	17),

(63246226,	21,	19),

(64973126,	21,	13),

(72751710,	21,	17),

(74447273,	21,	12),

(75640107,	21,	9
),
(84633041,	21,	13),

(86264655,	21,	12),

(86534235,	21,	12),

(91750903,	21,	12),

(95787979,	21,	11),

(96820901,	21,	11),

(97314565,	21,	16),

(10534206,	22,	14),

(20236412,	22,	15),

(20427756,	22,	15),

(21931678,	22,	15),

(22730658,	22,	12),

(22844995,	22,	9
),
(24474176,	22,	12),

(27595348,	22,	14),

(27965307,	22,	9
),
(28915481,	22,	12),

(29172201,	22,	13),

(30157844,	22,	13),

(30589090,	22,	16),

(35563113,	22,	13),

(35733587,	22,	20),

(36969032,	22,	8
),
(37560862,	22,	11),

(40384219,	22,	15),

(41609700,	22,	14),

(43320982,	22,	17),

(45814182,	22,	18),

(52238473,	22,	16),

(53104670,	22,	12),

(55810467,	22,	12),

(56046099,	22,	16),

(63156760,	22,	5
),
(63217302,	22,	13),

(63246226,	22,	13),

(64973126,	22,	6
),
(72751710,	22,	11),

(74447273,	22,	17),

(75640107,	22,	20),

(84633041,	22,	10),

(86264655,	22,	13),

(86534235,	22,	9
),
(91750903,	22,	13),

(95787979,	22,	15),

(96820901,	22,	16),

(97314565,	22,	8
),
(10534206,	23,	10),

(20236412,	23,	10),

(20427756,	23,	6
),
(21931678,	23,	5
),
(22730658,	23,	6
),
(22844995,	23,	9
),
(24474176,	23,	10),

(27595348,	23,	14),

(27965307,	23,	11),

(28915481,	23,	9),
(29172201,	23,	10),

(30157844,	23,	8
),
(30589090,	23,	12),

(35563113,	23,	13),

(35733587,	23,	9
),
(36969032,	23,	15),

(37560862,	23,	11),

(40384219,	23,	15),

(41609700,	23,	13),

(43320982,	23,	7
),
(45814182,	23,	15),

(52238473,	23,	12),

(53104670,	23,	11),

(55810467,	23,	14),

(56046099,	23,	8
),
(63156760,	23,	18),

(63217302,	23,	9
),
(63246226,	23,	8
),
(64973126,	23,	10),

(72751710,	23,	15),

(74447273,	23,	11),

(75640107,	23,	10),

(84633041,	23,	11),

(86264655,	23,	14),

(86534235,	23,	10),

(91750903,	23,	6
),
(95787979,	23,	18),

(96820901,	23,	17),

(97314565,	23,	17),

(10534206,	24,	8
),
(20236412,	24,	11),

(20427756,	24,	6
),
(21931678,	24,	11),

(22730658,	24,	12),

(22844995,	24,	12),

(24474176,	24,	7
),
(27595348,	24,	7
),
(27965307,	24,	12),

(28915481,	24,	9),
(29172201,	24,	7),
(30157844,	24,	11),

(30589090,	24,	9
),
(35563113,	24,	1
),
(35733587,	24,	12),

(36969032,	24,	6
),
(37560862,	24,	2
),
(40384219,	24,	9
),
(41609700,	24,	6
),
(43320982,	24,	14),

(45814182,	24,	10),

(52238473,	24,	12),

(53104670,	24,	12),

(55810467,	24,	6
),
(56046099,	24,	5
),
(63156760,	24,	8
),
(63217302,	24,	11),

(63246226,	24,	11),

(64973126,	24,	6
),
(72751710,	24,	2
),
(74447273,	24,	12),

(75640107,	24,	13),

(84633041,	24,	10),

(86264655,	24,	9
),
(86534235,	24,	7
),
(91750903,	24,	5
),
(95787979,	24,	0
),
(96820901,	24,	8
),
(97314565,	24,	2
),
(10281753,	25,	10),

(12332209,	25,	17),

(14627641,	25,	5
),
(15710421,	25,	18),

(16659116,	25,	7
),
(17123230,	25,	12),

(20885928,	25,	9
),
(22715713,	25,	6
),
(23166329,	25,	9
),
(26047923,	25,	7
),
(26487936,	25,	7
),
(27162414,	25,	2
),
(27204056,	25,	11),

(33937912,	25,	8
),
(36065627,	25,	16),

(36354616,	25,	13),

(43246940,	25,	12),

(47791655,	25,	10),

(48743705,	25,	4
),
(51572168,	25,	12),

(52567239,	25,	9
),
(52794581,	25,	11),

(55549712,	25,	12),

(55813326,	25,	8
),
(56462246,	25,	15),

(57253118,	25,	9
),
(63899654,	25,	4
),
(66407977,	25,	3
),
(72936625,	25,	6
),
(75692632,	25,	7
),
(76662813,	25,	12),

(78445718,	25,	6
),
(81965142,	25,	12),

(83201687,	25,	11),

(84667886,	25,	6
),
(86461348,	25,	14),

(89715013,	25,	18),

(97467090,	25,	3
),
(99904277,	25,	8
),
(10281753,	26,	9
),
(12332209,	26,	10),

(14627641,	26,	17),

(15710421,	26,	0
),
(16659116,	26,	9
),
(17123230,	26,	5
),
(20885928,	26,	10),

(22715713,	26,	12),

(23166329,	26,	11),

(26047923,	26,	20),

(26487936,	26,	5
),
(27162414,	26,	9
),
(27204056,	26,	15),

(33937912,	26,	13),

(36065627,	26,	9
),
(36354616,	26,	8
),
(43246940,	26,	10),

(47791655,	26,	2
),
(48743705,	26,	3
),
(51572168,	26,	12),

(52567239,	26,	12),

(52794581,	26,	15),

(55549712,	26,	12),

(55813326,	26,	9
),
(56462246,	26,	11),

(57253118,	26,	12),

(63899654,	26,	10),

(66407977,	26,	10),

(72936625,	26,	3
),
(75692632,	26,	7
),
(76662813,	26,	6
),
(78445718,	26,	12),

(81965142,	26,	7
),
(83201687,	26,	11),

(84667886,	26,	7
),
(86461348,	26,	8
),
(89715013,	26,	1
),
(97467090,	26,	6
),
(99904277,	26,	8
),
(10281753,	27,	4
),
(12332209,	27,	14),

(14627641,	27,	4
),
(15710421,	27,	14),

(16659116,	27,	12),

(17123230,	27,	9
),
(20885928,	27,	0
),
(22715713,	27,	7
),
(23166329,	27,	18),

(26047923,	27,	13),

(26487936,	27,	7
),
(27162414,	27,	9
),
(27204056,	27,	9
),
(33937912,	27,	7
),
(36065627,	27,	3
),
(36354616,	27,	15),

(43246940,	27,	10),

(47791655,	27,	12),

(48743705,	27,	10),

(51572168,	27,	11),

(52567239,	27,	2
),
(52794581,	27,	10),

(55549712,	27,	14),

(55813326,	27,	12),

(56462246,	27,	5
),
(57253118,	27,	8
),
(63899654,	27,	8
),
(66407977,	27,	7
),
(72936625,	27,	3
),
(75692632,	27,	11),

(76662813,	27,	5
),
(78445718,	27,	13),

(81965142,	27,	12),

(83201687,	27,	0
),
(84667886,	27,	5
),
(86461348,	27,	10),

(89715013,	27,	16),

(97467090,	27,	7
),
(99904277,	27,	8
),
(10281753,	28,	3),
(12332209,	28,	5),
(14627641,	28,	5),
(15710421,	28,	4),
(16659116,	28,	4),
(17123230,	28,	4),
(20885928,	28,	3),
(22715713,	28,	4),
(23166329,	28,	5),
(26047923,	28,	4),
(26487936,	28,	5),
(27162414,	28,	5),
(27204056,	28,	5),
(33937912,	28,	5),
(36065627,	28,	1),
(36354616,	28,	5),
(43246940,	28,	5),
(47791655,	28,	5),
(48743705,	28,	5),
(51572168,	28,	5),
(52567239,	28,	3),
(52794581,	28,	5),
(55549712,	28,	4),
(55813326,	28,	5),
(56462246,	28,	1),
(57253118,	28,	5),
(63899654,	28,	5),
(66407977,	28,	4),
(72936625,	28,	5),
(75692632,	28,	3),
(76662813,	28,	2),
(78445718,	28,	5),
(81965142,	28,	1),
(83201687,	28,	5),
(84667886,	28,	5),
(86461348,	28,	3),
(89715013,	28,	5),
(97467090,	28,	3),
(99904277,	28,	5),
(10281753,	29,	9
),
(12332209,	29,	5
),
(14627641,	29,	9
),
(15710421,	29,	13),

(16659116,	29,	14),

(17123230,	29,	9
),
(20885928,	29,	13),

(22715713,	29,	9
),
(23166329,	29,	10),

(26047923,	29,	13),

(26487936,	29,	10),

(27162414,	29,	12),

(27204056,	29,	12),

(33937912,	29,	11),

(36065627,	29,	11),

(36354616,	29,	12),

(43246940,	29,	12),

(47791655,	29,	10),

(48743705,	29,	9
),
(51572168,	29,	7
),
(52567239,	29,	7
),
(52794581,	29,	20),

(55549712,	29,	8
),
(55813326,	29,	14),

(56462246,	29,	7
),
(57253118,	29,	9
),
(63899654,	29,	14),

(66407977,	29,	4
),
(72936625,	29,	14),

(75692632,	29,	18),

(76662813,	29,	9
),
(78445718,	29,	16),

(81965142,	29,	14),

(83201687,	29,	11),

(84667886,	29,	7
),
(86461348,	29,	7
),
(89715013,	29,	20),

(97467090,	29,	14),

(99904277,	29,	18),

(10281753,	30,	10),

(12332209,	30,	11),

(14627641,	30,	12),

(15710421,	30,	11),

(16659116,	30,	12),

(17123230,	30,	8
),
(20885928,	30,	0
),
(22715713,	30,	9
),
(23166329,	30,	10),

(26047923,	30,	9
),
(26487936,	30,	7
),
(27162414,	30,	13),

(27204056,	30,	2
),
(33937912,	30,	6
),
(36065627,	30,	6
),
(36354616,	30,	2
),
(43246940,	30,	12),

(47791655,	30,	8
),
(48743705,	30,	11),

(51572168,	30,	6
),
(52567239,	30,	11),

(52794581,	30,	14),

(55549712,	30,	8
),
(55813326,	30,	6
),
(56462246,	30,	12),

(57253118,	30,	10),

(63899654,	30,	2
),
(66407977,	30,	13),

(72936625,	30,	11),

(75692632,	30,	3
),
(76662813,	30,	0
),
(78445718,	30,	20),

(81965142,	30,	6
),
(83201687,	30,	11),

(84667886,	30,	2
),
(86461348,	30,	12),

(89715013,	30,	13),

(97467090,	30,	1
),
(99904277,	30,	2
),
(10281753,	31,	10),

(12332209,	31,	7
),
(14627641,	31,	13),

(15710421,	31,	7
),
(16659116,	31,	12),

(17123230,	31,	4
),
(20885928,	31,	5
),
(22715713,	31,	14),

(23166329,	31,	11),

(26047923,	31,	6
),
(26487936,	31,	7
),
(27162414,	31,	12),

(27204056,	31,	12),

(33937912,	31,	6
),
(36065627,	31,	0
),
(36354616,	31,	12),

(43246940,	31,	13),

(47791655,	31,	4
),
(48743705,	31,	8
),
(51572168,	31,	14),

(52567239,	31,	8
),
(52794581,	31,	8
),
(55549712,	31,	5
),
(55813326,	31,	6
),
(56462246,	31,	11),

(57253118,	31,	15),

(63899654,	31,	8
),
(66407977,	31,	13),

(72936625,	31,	6
),
(75692632,	31,	4
),
(76662813,	31,	5
),
(78445718,	31,	14),

(81965142,	31,	11),

(83201687,	31,	7
),
(84667886,	31,	19),

(86461348,	31,	11),

(89715013,	31,	13),

(97467090,	31,	10),

(99904277,	31,	6
),
(10281753,	32,	6
),
(12332209,	32,	10),

(14627641,	32,	10),

(15710421,	32,	8
),
(16659116,	32,	8
),
(17123230,	32,	7
),
(20885928,	32,	12),

(22715713,	32,	7
),
(23166329,	32,	14),

(26047923,	32,	8
),
(26487936,	32,	8
),
(27162414,	32,	2
),
(27204056,	32,	7
),
(33937912,	32,	12),

(36065627,	32,	7
),
(36354616,	32,	6
),
(43246940,	32,	3
),
(47791655,	32,	11),

(48743705,	32,	4
),
(51572168,	32,	11),

(52567239,	32,	12),

(52794581,	32,	6
),
(55549712,	32,	5
),
(55813326,	32,	9
),
(56462246,	32,	17),

(57253118,	32,	4
),
(63899654,	32,	11),

(66407977,	32,	4
),
(72936625,	32,	4
),
(75692632,	32,	10),

(76662813,	32,	7
),
(78445718,	32,	7
),
(81965142,	32,	20),

(83201687,	32,	12),

(84667886,	32,	9
),
(86461348,	32,	6
),
(89715013,	32,	5
),
(97467090,	32,	4
),
(99904277,	32,	3
),
(12695343,	33,	15),

(15330035,	33,	17),

(19611576,	33,	11),

(22491150,	33,	17),

(23144259,	33,	9
),
(24655905,	33,	18),

(25179222,	33,	14),

(26326420,	33,	12),

(28827259,	33,	16),

(29386219,	33,	20),

(29557897,	33,	13),

(30901477,	33,	6
),
(34457914,	33,	14),

(34619084,	33,	20),

(35183865,	33,	16),

(39409116,	33,	11),

(41083936,	33,	14),

(42620373,	33,	17),

(45241147,	33,	13),

(46275969,	33,	14),

(50649325,	33,	9
),
(53972238,	33,	17),

(54954233,	33,	12),

(56622972,	33,	10),

(60594527,	33,	8
),
(61414047,	33,	14),

(66542703,	33,	17),

(66905564,	33,	13),

(68727765,	33,	19),

(71257664,	33,	10),

(74709445,	33,	14),

(76257107,	33,	12),

(79360908,	33,	6
),
(79593813,	33,	11),

(86510574,	33,	20),

(86930808,	33,	14),

(91074522,	33,	3
),
(91980591,	33,	16),

(96116283,	33,	10),

(12695343,	34,	5
),
(15330035,	34,	5
),
(19611576,	34,	9
),
(22491150,	34,	17),

(23144259,	34,	12),

(24655905,	34,	15),

(25179222,	34,	17),

(26326420,	34,	7
),
(28827259,	34,	4
),
(29386219,	34,	12),

(29557897,	34,	14),

(30901477,	34,	3
),
(34457914,	34,	3
),
(34619084,	34,	11),

(35183865,	34,	9
),
(39409116,	34,	9
),
(41083936,	34,	12),

(42620373,	34,	11),

(45241147,	34,	0
),
(46275969,	34,	8
),
(50649325,	34,	9
),
(53972238,	34,	6
),
(54954233,	34,	4
),
(56622972,	34,	9
),
(60594527,	34,	4
),
(61414047,	34,	7
),
(66542703,	34,	10),

(66905564,	34,	13),

(68727765,	34,	2
),
(71257664,	34,	12),

(74709445,	34,	7
),
(76257107,	34,	8
),
(79360908,	34,	4
),
(79593813,	34,	5
),
(86510574,	34,	11),

(86930808,	34,	12),

(91074522,	34,	15),

(91980591,	34,	10),

(96116283,	34,	7
),
(12695343,	35,	12),

(15330035,	35,	13),

(19611576,	35,	10),

(22491150,	35,	16),

(23144259,	35,	10),

(24655905,	35,	7
),
(25179222,	35,	19),

(26326420,	35,	18),

(28827259,	35,	18),

(29386219,	35,	9
),
(29557897,	35,	11),

(30901477,	35,	12),

(34457914,	35,	12),

(34619084,	35,	12),

(35183865,	35,	20),

(39409116,	35,	16),

(41083936,	35,	15),

(42620373,	35,	12),

(45241147,	35,	13),

(46275969,	35,	17),

(50649325,	35,	13),

(53972238,	35,	18),

(54954233,	35,	19),

(56622972,	35,	7
),
(60594527,	35,	19),

(61414047,	35,	17),

(66542703,	35,	20),

(66905564,	35,	15),

(68727765,	35,	17),

(71257664,	35,	10),

(74709445,	35,	9
),
(76257107,	35,	11),

(79360908,	35,	9
),
(79593813,	35,	13),

(86510574,	35,	12),

(86930808,	35,	8
),
(91074522,	35,	13),

(91980591,	35,	20),

(96116283,	35,	13),

(12695343,	36,	17),

(15330035,	36,	15),

(19611576,	36,	12),

(22491150,	36,	14),

(23144259,	36,	14),

(24655905,	36,	8
),
(25179222,	36,	16),

(26326420,	36,	12),

(28827259,	36,	14),

(29386219,	36,	16),

(29557897,	36,	8
),
(30901477,	36,	4
),
(34457914,	36,	16),

(34619084,	36,	7
),
(35183865,	36,	16),

(39409116,	36,	8
),
(41083936,	36,	17),

(42620373,	36,	10),

(45241147,	36,	6
),
(46275969,	36,	8
),
(50649325,	36,	10),

(53972238,	36,	14),

(54954233,	36,	9
),
(56622972,	36,	9
),
(60594527,	36,	13),

(61414047,	36,	8
),
(66542703,	36,	14),

(66905564,	36,	15),

(68727765,	36,	13),

(71257664,	36,	10),

(74709445,	36,	0
),
(76257107,	36,	14),

(79360908,	36,	10),

(79593813,	36,	6
),
(86510574,	36,	11),

(86930808,	36,	11),

(91074522,	36,	10),

(91980591,	36,	12),

(96116283,	36,	14),

(12695343,	37,	12),

(15330035,	37,	16),

(19611576,	37,	10),

(22491150,	37,	11),

(23144259,	37,	20),

(24655905,	37,	9
),
(25179222,	37,	13),

(26326420,	37,	16),

(28827259,	37,	16),

(29386219,	37,	11),

(29557897,	37,	6
),
(30901477,	37,	19),

(34457914,	37,	20),

(34619084,	37,	11),

(35183865,	37,	14),

(39409116,	37,	17),

(41083936,	37,	11),

(42620373,	37,	9
),
(45241147,	37,	13),

(46275969,	37,	10),

(50649325,	37,	18),

(53972238,	37,	12),

(54954233,	37,	14),

(56622972,	37,	18),

(60594527,	37,	16),

(61414047,	37,	13),

(66542703,	37,	8
),
(66905564,	37,	13),

(68727765,	37,	9
),
(71257664,	37,	14),

(74709445,	37,	16),

(76257107,	37,	15),

(79360908,	37,	12),

(79593813,	37,	14),

(86510574,	37,	15),

(86930808,	37,	10),

(91074522,	37,	8
),
(91980591,	37,	10),

(96116283,	37,	16),

(12695343,	38,	19),

(15330035,	38,	14),

(19611576,	38,	16),

(22491150,	38,	8
),
(23144259,	38,	12),

(24655905,	38,	12),

(25179222,	38,	9
),
(26326420,	38,	14),

(28827259,	38,	16),

(29386219,	38,	15),

(29557897,	38,	14),

(30901477,	38,	16),

(34457914,	38,	19),

(34619084,	38,	13),

(35183865,	38,	11),

(39409116,	38,	17),

(41083936,	38,	11),

(42620373,	38,	7
),
(45241147,	38,	13),

(46275969,	38,	9
),
(50649325,	38,	12),

(53972238,	38,	17),

(54954233,	38,	17),

(56622972,	38,	19),

(60594527,	38,	6
),
(61414047,	38,	8
),
(66542703,	38,	14),

(66905564,	38,	15),

(68727765,	38,	0
),
(71257664,	38,	9
),
(74709445,	38,	17),

(76257107,	38,	9
),
(79360908,	38,	14),

(79593813,	38,	16),

(86510574,	38,	16),

(86930808,	38,	16),

(91074522,	38,	15),

(91980591,	38,	7
),
(96116283,	38,	11),

(12695343,	39,	8
),
(15330035,	39,	8
),
(19611576,	39,	10),

(22491150,	39,	11),

(23144259,	39,	16),

(24655905,	39,	7
),
(25179222,	39,	15),

(26326420,	39,	14),

(28827259,	39,	5
),
(29386219,	39,	8
),
(29557897,	39,	10),

(30901477,	39,	9
),
(34457914,	39,	13),

(34619084,	39,	6
),
(35183865,	39,	6
),
(39409116,	39,	12),

(41083936,	39,	1
),
(42620373,	39,	11),

(45241147,	39,	11),

(46275969,	39,	8
),
(50649325,	39,	6
),
(53972238,	39,	7
),
(54954233,	39,	4
),
(56622972,	39,	9
),
(60594527,	39,	9
),
(61414047,	39,	9
),
(66542703,	39,	6
),
(66905564,	39,	11),

(68727765,	39,	0
),
(71257664,	39,	12),

(74709445,	39,	16),

(76257107,	39,	11),

(79360908,	39,	5
),
(79593813,	39,	14),

(86510574,	39,	15),

(86930808,	39,	6
),
(91074522,	39,	9
),
(91980591,	39,	12),

(96116283,	39,	7
),
(12695343,	40,	10),

(15330035,	40,	11),

(19611576,	40,	9
),
(22491150,	40,	17),

(23144259,	40,	13),

(24655905,	40,	8
),
(25179222,	40,	13),

(26326420,	40,	18),

(28827259,	40,	16),

(29386219,	40,	11),

(29557897,	40,	11),

(30901477,	40,	19),

(34457914,	40,	13),

(34619084,	40,	20),

(35183865,	40,	14),

(39409116,	40,	17),

(41083936,	40,	20),

(42620373,	40,	14),

(45241147,	40,	18),

(46275969,	40,	14),

(50649325,	40,	14),

(53972238,	40,	12),

(54954233,	40,	11),

(56622972,	40,	20),

(60594527,	40,	14),

(61414047,	40,	17),

(66542703,	40,	8
),
(66905564,	40,	9
),
(68727765,	40,	13),

(71257664,	40,	10),

(74709445,	40,	11),

(76257107,	40,	12),

(79360908,	40,	14),

(79593813,	40,	12),

(86510574,	40,	16),

(86930808,	40,	13),

(91074522,	40,	20),

(91980591,	40,	12),

(96116283,	40,	13),

(13933301,	41,	7
),
(16797391,	41,	9
),
(18029580,	41,	5
),
(23412027,	41,	14),

(33583386,	41,	15),

(33809838,	41,	11),

(35544401,	41,	17),

(38867925,	41,	14),

(39014661,	41,	11),

(40177208,	41,	14),

(44508242,	41,	15),

(44975872,	41,	18),

(45124404,	41,	10),

(46341250,	41,	5
),
(47992460,	41,	8
),
(50255297,	41,	9
),
(54277909,	41,	7
),
(55075253,	41,	10),

(55481497,	41,	10),

(55920827,	41,	19),

(59394502,	41,	10),

(60555723,	41,	16),

(61496547,	41,	9
),
(62998010,	41,	9
),
(64445490,	41,	15),

(65440089,	41,	16),

(66080147,	41,	13),

(72165244,	41,	13),

(73317454,	41,	11),

(74288538,	41,	15),

(77026788,	41,	7
),
(77271695,	41,	19),

(78162009,	41,	7
),
(78641051,	41,	4
),
(82567240,	41,	13),

(85700983,	41,	7
),
(87657665,	41,	16),

(89132300,	41,	10),

(92475083,	41,	15),

(13933301,	42,	3
),(16797391,	42,	1
),(18029580,	42,	15),
(23412027,	42,	4
),(33583386,	42,	4
),(33809838,	42,	0
),(35544401,	42,	4
),(38867925,	42,	6
),(39014661,	42,	6
),(40177208,	42,	3
),(44508242,	42,	6
),(44975872,	42,	11),
(45124404,	42,	4
),(46341250,	42,	6
),(47992460,	42,	4
),(50255297,	42,	7
),(54277909,	42,	11),
(55075253,	42,	10),
(55481497,	42,	15),
(55920827,	42,	14),
(59394502,	42,	11),
(60555723,	42,	6
),(61496547,	42,	10),
(62998010,	42,	9
),(64445490,	42,	7
),(65440089,	42,	4
),(66080147,	42,	5
),(72165244,	42,	13),
(73317454,	42,	2
),(74288538,	42,	9
),(77026788,	42,	3
),(77271695,	42,	8
),(78162009,	42,	6
),(78641051,	42,	8
),(82567240,	42,	8
),(85700983,	42,	15),
(87657665,	42,	3
),(89132300,	42,	3
),(92475083,	42,	12),
(13933301,	43,	17),

(16797391,	43,	7
),
(18029580,	43,	10),

(23412027,	43,	8
),
(33583386,	43,	8
),
(33809838,	43,	9
),
(35544401,	43,	12),

(38867925,	43,	15),

(39014661,	43,	10),

(40177208,	43,	13),

(44508242,	43,	12),

(44975872,	43,	12),

(45124404,	43,	16),

(46341250,	43,	10),

(47992460,	43,	16),

(50255297,	43,	12),

(54277909,	43,	16),

(55075253,	43,	14),

(55481497,	43,	15),

(55920827,	43,	15),

(59394502,	43,	15),

(60555723,	43,	4
),
(61496547,	43,	9
),
(62998010,	43,	11),

(64445490,	43,	14),

(65440089,	43,	18),

(66080147,	43,	8
),
(72165244,	43,	14),

(73317454,	43,	12),

(74288538,	43,	13),

(77026788,	43,	17),

(77271695,	43,	9
),
(78162009,	43,	12),

(78641051,	43,	14),

(82567240,	43,	7
),
(85700983,	43,	12),

(87657665,	43,	17),

(89132300,	43,	14),

(92475083,	43,	10),

(13933301,	44,	3
),
(16797391,	44,	10),

(18029580,	44,	3
),
(23412027,	44,	7
),
(33583386,	44,	6
),
(33809838,	44,	8
),
(35544401,	44,	4
),
(38867925,	44,	9
),
(39014661,	44,	2
),
(40177208,	44,	7
),
(44508242,	44,	9
),
(44975872,	44,	5
),
(45124404,	44,	6
),
(46341250,	44,	4
),
(47992460,	44,	6
),
(50255297,	44,	8
),
(54277909,	44,	9
),
(55075253,	44,	10),

(55481497,	44,	4
),
(55920827,	44,	2
),
(59394502,	44,	0
),
(60555723,	44,	7
),
(61496547,	44,	6
),
(62998010,	44,	5
),
(64445490,	44,	6
),
(65440089,	44,	5
),
(66080147,	44,	10),

(72165244,	44,	6
),
(73317454,	44,	6
),
(74288538,	44,	3
),
(77026788,	44,	3
),
(77271695,	44,	7
),
(78162009,	44,	1
),
(78641051,	44,	7
),
(82567240,	44,	8
),
(85700983,	44,	7
),
(87657665,	44,	3
),
(89132300,	44,	9
),
(92475083,	44,	7
),
(13933301,	45,	3
),
(16797391,	45,	12),

(18029580,	45,	13),

(23412027,	45,	10),

(33583386,	45,	8
),
(33809838,	45,	13),

(35544401,	45,	7
),
(38867925,	45,	3
),
(39014661,	45,	11),

(40177208,	45,	7
),
(44508242,	45,	8
),
(44975872,	45,	10),

(45124404,	45,	6
),
(46341250,	45,	3
),
(47992460,	45,	1
),
(50255297,	45,	8
),
(54277909,	45,	8
),
(55075253,	45,	6
),
(55481497,	45,	5
),
(55920827,	45,	15),

(59394502,	45,	8
),
(60555723,	45,	7
),
(61496547,	45,	8
),
(62998010,	45,	9
),
(64445490,	45,	9
),
(65440089,	45,	9
),
(66080147,	45,	8
),
(72165244,	45,	10),

(73317454,	45,	8
),
(74288538,	45,	1
),
(77026788,	45,	9
),
(77271695,	45,	5
),
(78162009,	45,	12),

(78641051,	45,	7
),
(82567240,	45,	2
),
(85700983,	45,	7
),
(87657665,	45,	9
),
(89132300,	45,	10),

(92475083,	45,	3
),
(13933301,	46,	6
),
(16797391,	46,	4
),
(18029580,	46,	6
),
(23412027,	46,	9
),
(33583386,	46,	7
),
(33809838,	46,	13),

(35544401,	46,	12),

(38867925,	46,	11),

(39014661,	46,	11),

(40177208,	46,	8
),
(44508242,	46,	11),

(44975872,	46,	9
),
(45124404,	46,	10),

(46341250,	46,	10),

(47992460,	46,	10),

(50255297,	46,	2
),
(54277909,	46,	7
),
(55075253,	46,	7
),
(55481497,	46,	6
),
(55920827,	46,	11),

(59394502,	46,	9
),
(60555723,	46,	6
),
(61496547,	46,	9
),
(62998010,	46,	8
),
(64445490,	46,	17),

(65440089,	46,	8
),
(66080147,	46,	5
),
(72165244,	46,	15),

(73317454,	46,	13),

(74288538,	46,	14),

(77026788,	46,	10),

(77271695,	46,	15),

(78162009,	46,	9
),
(78641051,	46,	13),

(82567240,	46,	8
),
(85700983,	46,	2
),
(87657665,	46,	15),

(89132300,	46,	5
),
(92475083,	46,	9
),
(13933301,	47,	11),

(16797391,	47,	10),

(18029580,	47,	10),

(23412027,	47,	8
),
(33583386,	47,	11),

(33809838,	47,	6
),
(35544401,	47,	10),

(38867925,	47,	8
),
(39014661,	47,	5
),
(40177208,	47,	6
),
(44508242,	47,	11),

(44975872,	47,	9
),
(45124404,	47,	9
),
(46341250,	47,	17),

(47992460,	47,	13),

(50255297,	47,	13),

(54277909,	47,	12),

(55075253,	47,	2
),
(55481497,	47,	15),

(55920827,	47,	14),

(59394502,	47,	11),

(60555723,	47,	13),

(61496547,	47,	10),

(62998010,	47,	11),

(64445490,	47,	6
),
(65440089,	47,	2
),
(66080147,	47,	9
),
(72165244,	47,	7
),
(73317454,	47,	12),

(74288538,	47,	12),

(77026788,	47,	14),

(77271695,	47,	9
),
(78162009,	47,	10),

(78641051,	47,	6
),
(82567240,	47,	11),

(85700983,	47,	12),

(87657665,	47,	13),

(89132300,	47,	9
),
(92475083,	47,	18),

(13933301,	48,	12),

(16797391,	48,	15),

(18029580,	48,	14),

(23412027,	48,	4
),
(33583386,	48,	11),

(33809838,	48,	5
),
(35544401,	48,	4
),
(38867925,	48,	2
),
(39014661,	48,	4
),
(40177208,	48,	11),

(44508242,	48,	9
),
(44975872,	48,	9
),
(45124404,	48,	6
),
(46341250,	48,	10),

(47992460,	48,	11),

(50255297,	48,	6
),
(54277909,	48,	9
),
(55075253,	48,	3
),
(55481497,	48,	6
),
(55920827,	48,	13),

(59394502,	48,	4
),
(60555723,	48,	5
),
(61496547,	48,	5
),
(62998010,	48,	10),

(64445490,	48,	8
),
(65440089,	48,	6
),
(66080147,	48,	16),

(72165244,	48,	7
),
(73317454,	48,	8
),
(74288538,	48,	7
),
(77026788,	48,	15),

(77271695,	48,	6
),
(78162009,	48,	13),

(78641051,	48,	6
),
(82567240,	48,	5
),
(85700983,	48,	16),

(87657665,	48,	1
),
(89132300,	48,	4
),
(92475083,	48,	5
),
(11060460,	49,	3
),
(12676344,	49,	5
),
(13798907,	49,	7
),
(14857390,	49,	6
),
(14876495,	49,	10),
(15291264, 49,	6),
(15835420,	49,	6
),
(17358086,	49,	5
),
(18167729,	49,	0
),
(22735531,	49,	3
),
(31721186,	49,	3
),
(33551716,	49,	10),

(37864801,	49,	5
),
(39028666,	49,	5),
(39291233,	49,	3
),
(42119585,	49,	6
),
(44618350,	49,	0
),
(44809709,	49,	2
),
(47500359,	49,	6
),
(51067129,	49,	4
),
(53414159,	49,	5
),
(58498985,	49,	8
),
(59542319,	49,	10),

(60436435,	49,	4
),
(63239930,	49,	6
),
(67735490,	49,	8
),
(68243902,	49,	8
),
(70714030,	49,	2
),
(71582989,	49,	7
),
(82232362,	49,	10),

(86606105,	49,	4
),
(88571574,	49,	7
),
(92033729,	49,	4
),
(92343797,	49,	2
),
(92883827,	49,	4
),
(93501906,	49,	5
),
(95481005,	49,	5
),
(97792734,	49,	6
),
(99115530,	49,	10),

(11060460,	50,	11),
(12676344,	50,	7
),(13798907,	50,	16),
(14857390,	50,	10),
(14876495,	50,	13),
(15291264,	50,	5
),(15835420,	50,	16),
(17358086,	50,	12),
(18167729,	50,	16),
(22735531,	50,	5
),(31721186,	50,	14),
(33551716,	50,	10),
(37864801,	50,	12),
(39028666,	50,	12),
(39291233,	50,	12),
(42119585,	50,	16),
(44618350,	50,	9
),(44809709,	50,	12),
(47500359,	50,	5
),(51067129,	50,	19),
(53414159,	50,	17),
(58498985,	50,	19),
(59542319,	50,	15),
(60436435,	50,	11),
(63239930,	50,	7
),(67735490,	50,	17),
(68243902,	50,	10),
(70714030,	50,	9
),(71582989,	50,	17),
(82232362,	50,	12),
(86606105,	50,	9
),(88571574,	50,	16),
(92033729,	50,	6
),(92343797,	50,	9
),(92883827,	50,	16),
(93501906,	50,	19),
(95481005,	50,	13),
(97792734,	50,	11),
(99115530,	50,	9
),
(11060460,	51,	11),

(12676344,	51,	8
),
(13798907,	51,	9
),
(14857390,	51,	15),

(14876495,	51,	15),
(15291264,	51,	15),

(15835420,	51,	11),

17358086	51  20
(18167729,	51,	6
),
(22735531,	51,	15),

(31721186,	51,	8
),
(33551716,	51,	4
),
(37864801,	51,	7
),
(39028666,	51,	8),
(39291233, 51,	13),

(42119585,	51,	10),

(44618350,	51,	17),

(44809709,	51,	10),

(47500359,	51,	17),

(51067129,	51,	20),

(53414159,	51,	9
),
(58498985,	51,	19),

(59542319,	51,	10),

(60436435,	51,	17),

(63239930,	51,	7
),
(67735490,	51,	9
),
(68243902,	51,	7
),
(70714030,	51,	14),

(71582989,	51,	17),

(82232362,	51,	9
),
(86606105,	51,	12),

(88571574,	51,	15),

(92033729,	51,	12),

(92343797,	51,	13),

(92883827,	51,	13),

(93501906,	51,	12),

(95481005,	51,	20),

(97792734,	51,	13),

(99115530,	51,	20),

(11060460,	52,	0
),
(12676344,	52,	5
),
(13798907,	52,	12),

(14857390,	52,	16),

(14876495,	52,	12),
(15291264, 52,	6
),
(15835420,	52,	7
),
(17358086,	52,	9
),
(18167729,	52,	5
),
(22735531,	52,	16),

(31721186,	52,	13),

(33551716,	52,	2
),
(37864801,	52,	10),

(39028666,	52,	11),
(39291233,	52,	7
),
(42119585,	52,	10),

(44618350,	52,	3
),
(44809709,	52,	5
),
(47500359,	52,	8
),
(51067129,	52,	5
),
(53414159,	52,	6
),
(58498985,	52,	10),

(59542319,	52,	2
),
(60436435,	52,	4
),
(63239930,	52,	12),

(67735490,	52,	10),

(68243902,	52,	7
),
(70714030,	52,	10),

(71582989,	52,	9
),
(82232362,	52,	7
),
(86606105,	52,	2
),
(88571574,	52,	7
),
(92033729,	52,	9
),
(92343797,	52,	8
),
(92883827,	52,	9
),
(93501906,	52,	0
),
(95481005,	52,	9
),
(97792734,	52,	4
),
(99115530,	52,	4
),
(11060460,	53,	15),

(12676344,	53,	15),

(13798907,	53,	12),

(14857390,	53,	14),

(14876495,	53,	13),
(15291264, 53,	14),

(15835420,	53,	5
),
(17358086,	53,	13),

(18167729,	53,	13),

(22735531,	53,	12),

(31721186,	53,	15),

(33551716,	53,	6
),
(37864801,	53,	14),

(39028666,	53,	14),
(39291233,	53,	15),

(42119585,	53,	11),

(44618350,	53,	10),

(44809709,	53,	16),

(47500359,	53,	19),

(51067129,	53,	9
),
(53414159,	53,	13),

(58498985,	53,	13),

(59542319,	53,	7
),
(60436435,	53,	8
),
(63239930,	53,	11),

(67735490,	53,	18),

(68243902,	53,	17),

(70714030,	53,	10),

(71582989,	53,	16),

(82232362,	53,	11),

(86606105,	53,	10),

(88571574,	53,	15),

(92033729,	53,	14),

(92343797,	53,	11),

(92883827,	53,	16),

(93501906,	53,	11),

(95481005,	53,	18),

(97792734,	53,	10),

(99115530,	53,	11),

(11060460,	54,	5
),
(12676344,	54,	5
),
(13798907,	54,	9
),
(14857390,	54,	8
),
(14876495,	54,	10),
(15291264,	54,	7
),
(15835420,	54,	7
),
(17358086,	54,	2
),
(18167729,	54,	7
),
(22735531,	54,	10),

(31721186,	54,	10),

(33551716,	54,	2
),
(37864801,	54,	2
),
(39028666,	54,	10),
(39291233,	54,	8
),
(42119585,	54,	3
),
(44618350,	54,	3
),
(44809709,	54,	3
),
(47500359,	54,	0
),
(51067129,	54,	7
),
(53414159,	54,	0
),
(58498985,	54,	2
),
(59542319,	54,	5
),
(60436435,	54,	7
),
(63239930,	54,	4
),
(67735490,	54,	8
),
(68243902,	54,	10),

(70714030,	54,	6
),
(71582989,	54,	7
),
(82232362,	54,	5
),
(86606105,	54,	7
),
(88571574,	54,	5
),
(92033729,	54,	9
),
(92343797,	54,	7
),
(92883827,	54,	1
),
(93501906,	54,	6
),
(95481005,	54,	9
),
(97792734,	54,	3
),
(99115530,	54,	7
),
(11060460,	55,	12),

(12676344,	55,	7
),
(13798907,	55,	13),

(14857390,	55,	10),

(14876495,	55,	8
),
(15291264,	55,	11),

(15835420,	55,	11),

(17358086,	55,	13),

(18167729,	55,	10),

(22735531,	55,	16),

(31721186,	55,	3
),
(33551716,	55,	12),

(37864801,	55,	12),

(39028666,	55,	15),
(39291,233,	55,	8),
(42119585,	55,	10),

(44618350,	55,	6
),
(44809709,	55,	16),

(47500359,	55,	11),

(51067129,	55,	14),

(53414159,	55,	14),

(58498985,	55,	11),

(59542319,	55,	10),

(60436435,	55,	5
),
(63239930,	55,	13),

(67735490,	55,	16),

(68243902,	55,	13),

(70714030,	55,	7
),
(71582989,	55,	6
),
(82232362,	55,	9
),
(86606105,	55,	4
),
(88571574,	55,	15),

(92033729,	55,	11),

(92343797,	55,	10),

(92883827,	55,	10),

(93501906,	55,	8
),
(95481005,	55,	15),

(97792734,	55,	7
),
(99115530,	55,	14),

(11060460,	56,	9
),
(12676344,	56,	5
),
(13798907,	56,	7
),
(14857390,	56,	5
),
(14876495,	56,	9
),
(15291264,	56,	5
),
(15835420,	56,	3
),
(17358086,	56,	5
),
(18167729,	56,	14),

(22735531,	56,	10),

(31721186,	56,	8
),
(33551716,	56,	6
),
(37864801,	56,	12),

(39028666,	56,	8
),
(39291233,	56,	7
),
(42119585,	56,	7
),
(44618350,	56,	11),

(44809709,	56,	12),

(47500359,	56,	5
),
(51067129,	56,	7
),
(53414159,	56,	6
),
(58498985,	56,	10),

(59542319,	56,	7
),
(60436435,	56,	4
),
(63239930,	56,	1
),
(67735490,	56,	17),

(68243902,	56,	9
),
(70714030,	56,	12),

(71582989,	56,	3
),
(82232362,	56,	11),

(86606105,	56,	13),

(88571574,	56,	3
),
(92033729,	56,	10),

(92343797,	56,	8
),
(92883827,	56,	5
),
(93501906,	56,	10),

(95481005,	56,	4
),
(97792734,	56,	15),

(99115530,	56,	6
),
(11244206,	57,	0
),
(12057283,	57,	2
),
(13668883,	57,	8
),
(13684450,	57,	14),

(14493579,	57,	6
),
(17188037,	57,	12),

(19542698,	57,	10),

(24834676,	57,	15),

(26790179,	57,	6
),
(31193777,	57,	15),

(31568819,	57,	7
),
(33871863,	57,	14),

(36598030,	57,	3
),
(44005211,	57,	16),

(44008477,	57,	0
),
(47468588,	57,	3
),
(48126470,	57,	7
),
(50417103,	57,	14),

(51671643,	57,	9
),
(52220638,	57,	5
),
(59334127,	57,	6
),
(63887324,	57,	12),

(64578632,	57,	15),

(69181739,	57,	7
),
(74239452,	57,	6
),
(75119033,	57,	8
),
(77713039,	57,	15),

(77718435,	57,	10),

(79468224,	57,	9
),
(80712718,	57,	14),

(81512193,	57,	15),

(81753964,	57,	7
),
(89130287,	57,	13),

(90582251,	57,	12),

(93040696,	57,	7
),
(93220018,	57,	6
),
(94248610,	57,	13),

(96590182,	57,	9
),
(99597461,	57,	10),

(11244206,	58,	14),

(12057283,	58,	15),

(13668883,	58,	8
),
(13684450,	58,	12),

(14493579,	58,	8
),
(17188037,	58,	12),

(19542698,	58,	11),

(24834676,	58,	16),

(26790179,	58,	9
),
(31193777,	58,	16),

(31568819,	58,	20),

(33871863,	58,	11),

(36598030,	58,	10),

(44005211,	58,	10),

(44008477,	58,	10),

(47468588,	58,	10),

(48126470,	58,	6
),
(50417103,	58,	14),

(51671643,	58,	12),

(52220638,	58,	12),

(59334127,	58,	16),

(63887324,	58,	8
),
(64578632,	58,	14),

(69181739,	58,	8
),
(74239452,	58,	15),

(75119033,	58,	14),

(77713039,	58,	16),

(77718435,	58,	14),

(79468224,	58,	9
),
(80712718,	58,	11),

(81512193,	58,	14),

(81753964,	58,	16),

(89130287,	58,	12),

(90582251,	58,	8
),
(93040696,	58,	20),

(93220018,	58,	13),

(94248610,	58,	13),

(96590182,	58,	14),

(99597461,	58,	13),

(11244206,	59,	0
),
(12057283,	59,	4
),
(13668883,	59,	3
),
(13684450,	59,	4
),
(14493579,	59,	6
),
(17188037,	59,	8
),
(19542698,	59,	5
),
(24834676,	59,	4
),
(26790179,	59,	6
),
(31193777,	59,	6
),
(31568819,	59,	5
),
(33871863,	59,	10),

(36598030,	59,	2
),
(44005211,	59,	1
),
(44008477,	59,	8
),
(47468588,	59,	4
),
(48126470,	59,	2
),
(50417103,	59,	0
),
(51671643,	59,	6
),
(52220638,	59,	5
),
(59334127,	59,	8
),
(63887324,	59,	5
),
(64578632,	59,	4
),
(69181739,	59,	6
),
(74239452,	59,	6
),
(75119033,	59,	7
),
(77713039,	59,	3
),
(77718435,	59,	4
),
(79468224,	59,	2
),
(80712718,	59,	10),

(81512193,	59,	2
),
(81753964,	59,	1
),
(89130287,	59,	1
),
(90582251,	59,	3
),
(93040696,	59,	6
),
(93220018,	59,	9
),
(94248610,	59,	5
),
(96590182,	59,	3
),
(99597461,	59,	3
),
(11244206,	60,	2
),
(12057283,	60,	0
),
(13668883,	60,	3
),
(13684450,	60,	11),

(14493579,	60,	10),

(17188037,	60,	5
),
(19542698,	60,	15),

(24834676,	60,	8
),
(26790179,	60,	4
),
(31193777,	60,	8
),
(31568819,	60,	3
),
(33871863,	60,	9
),
(36598030,	60,	1
),
(44005211,	60,	8
),
(44008477,	60,	7
),
(47468588,	60,	10),

(48126470,	60,	12),

(50417103,	60,	4
),
(51671643,	60,	11),

(52220638,	60,	6
),
(59334127,	60,	8
),
(63887324,	60,	17),

(64578632,	60,	6
),
(69181739,	60,	4
),
(74239452,	60,	10),

(75119033,	60,	7
),
(77713039,	60,	11),

(77718435,	60,	1
),
(79468224,	60,	5
),
(80712718,	60,	11),

(81512193,	60,	6
),
(81753964,	60,	2
),
(89130287,	60,	1
),
(90582251,	60,	10),

(93040696,	60,	9
),
(93220018,	60,	8
),
(94248610,	60,	5
),
(96590182,	60,	6
),
(99597461,	60,	11),

(11244206,	61,	18),

(12057283,	61,	9
),
(13668883,	61,	16),

(13684450,	61,	15),

(14493579,	61,	17),

(17188037,	61,	14),

(19542698,	61,	17),

(24834676,	61,	17),

(26790179,	61,	15),

(31193777,	61,	14),

(31568819,	61,	7
),
(33871863,	61,	9
),
(36598030,	61,	8
),
(44005211,	61,	11),

(44008477,	61,	15),

(47468588,	61,	11),

(48126470,	61,	14),

(50417103,	61,	13),

(51671643,	61,	11),

(52220638,	61,	11),

(59334127,	61,	19),

(63887324,	61,	19),

(64578632,	61,	11),

(69181739,	61,	8
),
(74239452,	61,	13),

(75119033,	61,	6
),
(77713039,	61,	9
),
(77718435,	61,	11),

(79468224,	61,	15),

(80712718,	61,	18),

(81512193,	61,	11),

(81753964,	61,	13),

(89130287,	61,	17),

(90582251,	61,	12),

(93040696,	61,	15),

(93220018,	61,	15),

(94248610,	61,	8
),
(96590182,	61,	18),

(99597461,	61,	11),

(11244206,	62,	2
),
(12057283,	62,	7
),
(13668883,	62,	5
),
(13684450,	62,	6
),
(14493579,	62,	0
),
(17188037,	62,	0
),
(19542698,	62,	8
),
(24834676,	62,	4
),
(26790179,	62,	4
),
(31193777,	62,	2
),
(31568819,	62,	5
),
(33871863,	62,	5
),
(36598030,	62,	4
),
(44005211,	62,	5
),
(44008477,	62,	3
),
(47468588,	62,	6
),
(48126470,	62,	3
),
(50417103,	62,	8
),
(51671643,	62,	5
),
(52220638,	62,	6
),
(59334127,	62,	10),

(63887324,	62,	0
),
(64578632,	62,	8
),
(69181739,	62,	3
),
(74239452,	62,	3
),
(75119033,	62,	0
),
(77713039,	62,	5
),
(77718435,	62,	4
),
(79468224,	62,	10),

(80712718,	62,	2
),
(81512193,	62,	7
),
(81753964,	62,	0
),
(89130287,	62,	6
),
(90582251,	62,	5
),
(93040696,	62,	2
),
(93220018,	62,	10),

(94248610,	62,	0
),
(96590182,	62,	4
),
(99597461,	62,	4
),
(11244206,	63,	7
),
(12057283,	63,	11),

(13668883,	63,	10),

(13684450,	63,	13),

(14493579,	63,	8
),
(17188037,	63,	6
),
(19542698,	63,	16),

(24834676,	63,	1
),
(26790179,	63,	8
),
(31193777,	63,	6
),
(31568819,	63,	7
),
(33871863,	63,	7
),
(36598030,	63,	5
),
(44005211,	63,	5
),
(44008477,	63,	2
),
(47468588,	63,	5
),
(48126470,	63,	4
),
(50417103,	63,	4
),
(51671643,	63,	7
),
(52220638,	63,	11),

(59334127,	63,	11),

(63887324,	63,	4
),
(64578632,	63,	11),

(69181739,	63,	5
),
(74239452,	63,	2
),
(75119033,	63,	10),

(77713039,	63,	4
),
(77718435,	63,	7
),
(79468224,	63,	5
),
(80712718,	63,	9
),
(81512193,	63,	12),

(81753964,	63,	3
),
(89130287,	63,	4
),
(90582251,	63,	10),

(93040696,	63,	10),

(93220018,	63,	10),

(94248610,	63,	13),

(96590182,	63,	11),

(99597461,	63,	8
),
(11244206,	64,	6
),
(12057283,	64,	8
),
(13668883,	64,	13),

(13684450,	64,	17),

(14493579,	64,	9
),
(17188037,	64,	4
),
(19542698,	64,	8
),
(24834676,	64,	8
),
(26790179,	64,	12),

(31193777,	64,	13),

(31568819,	64,	14),

(33871863,	64,	12),

(36598030,	64,	5
),
(44005211,	64,	14),

(44008477,	64,	9
),
(47468588,	64,	12),

(48126470,	64,	9
),
(50417103,	64,	8
),
(51671643,	64,	0
),
(52220638,	64,	16),

(59334127,	64,	11),

(63887324,	64,	10),

(64578632,	64,	12),

(69181739,	64,	15),

(74239452,	64,	7
),
(75119033,	64,	7
),
(77713039,	64,	10),

(77718435,	64,	2
),
(79468224,	64,	12),

(80712718,	64,	11),

(81512193,	64,	9
),
(81753964,	64,	11),

(89130287,	64,	20),

(90582251,	64,	12),

(93040696,	64,	9
),
(93220018,	64,	11),

(94248610,	64,	6
),
(96590182,	64,	16),

(99597461,	64,	10),

(10998691,	65,	12),

(11304461,	65,	14),

(12505676,	65,	11),

(15974674,	65,	16),

(19137151,	65,	18),

(19867677,	65,	18),

(23607067,	65,	9
),
(23995642,	65,	10),

(28916456,	65,	9
),
(30187810,	65,	13),

(31282994,	65,	15),

(31628825,	65,	17),

(31852049,	65,	11),

(32033788,	65,	14),

(35365463,	65,	8
),
(35507115,	65,	13),

(35992111,	65,	19),

(42685896,	65,	16),

(42768632,	65,	15),

(43500959,	65,	9
),
(46844640,	65,	16),

(48563699,	65,	16),

(54679482,	65,	11),

(57467650,	65,	14),

(59916483,	65,	17),

(64398919,	65,	19),

(64530056,	65,	15),

(66921228,	65,	14),

(68529349,	65,	7
),
(68677240,	65,	14),

(71708814,	65,	17),

(80614518,	65,	18),

(81768602,	65,	18),

(84158312,	65,	17),

(85368583,	65,	8
),
(85632352,	65,	12),

(86872045,	65,	8
),
(90935543,	65,	12),

(91565702,	65,	13),

(10998691,	66,	1
),
(11304461,	66,	8
),
(12505676,	66,	8
),
(15974674,	66,	16),

(19137151,	66,	5
),
(19867677,	66,	7
),
(23607067,	66,	5
),
(23995642,	66,	4
),
(28916456,	66,	2
),
(30187810,	66,	10),

(31282994,	66,	9
),
(31628825,	66,	9
),
(31852049,	66,	11),

(32033788,	66,	9
),
(35365463,	66,	12),

(35507115,	66,	14),

(35992111,	66,	10),

(42685896,	66,	9
),
(42768632,	66,	8
),
(43500959,	66,	19),

(46844640,	66,	10),

(48563699,	66,	4
),
(54679482,	66,	0
),
(57467650,	66,	12),

(59916483,	66,	6
),
(64398919,	66,	7
),
(64530056,	66,	8
),
(66921228,	66,	6
),
(68529349,	66,	8
),
(68677240,	66,	11),

(71708814,	66,	12),

(80614518,	66,	2
),
(81768602,	66,	9
),
(84158312,	66,	14),

(85368583,	66,	7
),
(85632352,	66,	6
),
(86872045,	66,	6
),
(90935543,	66,	9
),
(91565702,	66,	8
),
(10998691,	67,	11),

(11304461,	67,	16),

(12505676,	67,	12),

(15974674,	67,	10),

(19137151,	67,	7
),
(19867677,	67,	17),

(23607067,	67,	6
),
(23995642,	67,	16),

(28916456,	67,	18),

(30187810,	67,	13),

(31282994,	67,	16),

(31628825,	67,	18),

(31852049,	67,	10),

(32033788,	67,	16),

(35365463,	67,	20),

(35507115,	67,	19),

(35992111,	67,	5
),
(42685896,	67,	16),

(42768632,	67,	7
),
(43500959,	67,	16),

(46844640,	67,	5
),
(48563699,	67,	9
),
(54679482,	67,	16),

(57467650,	67,	12),

(59916483,	67,	9
),
(64398919,	67,	20),

(64530056,	67,	15),

(66921228,	67,	11),

(68529349,	67,	16),

(68677240,	67,	13),

(71708814,	67,	18),

(80614518,	67,	17),

(81768602,	67,	14),

(84158312,	67,	10),

(85368583,	67,	15),

(85632352,	67,	17),

(86872045,	67,	11),

(90935543,	67,	11),

(91565702,	67,	14),

(10998691,	68,	14),

(11304461,	68,	10),

(12505676,	68,	20),

(15974674,	68,	14),

(19137151,	68,	20),

(19867677,	68,	16),

(23607067,	68,	16),

(23995642,	68,	8
),
(28916456,	68,	15),

(30187810,	68,	13),

(31282994,	68,	7
),
(31628825,	68,	8
),
(31852049,	68,	10),

(32033788,	68,	10),

(35365463,	68,	15),

(35507115,	68,	13),

(35992111,	68,	13),

(42685896,	68,	13),

(42768632,	68,	20),

(43500959,	68,	15),

(46844640,	68,	15),

(48563699,	68,	20),

(54679482,	68,	12),

(57467650,	68,	10),

(59916483,	68,	18),

(64398919,	68,	15),

(64530056,	68,	18),

(66921228,	68,	18),

(68529349,	68,	13),

(68677240,	68,	10),

(71708814,	68,	13),

(80614518,	68,	20),

(81768602,	68,	16),

(84158312,	68,	13),

(85368583,	68,	14),

(85632352,	68,	18),

(86872045,	68,	17),

(90935543,	68,	19),

(91565702,	68,	17),

(10998691,	69,	9
),
(11304461,	69,	10),

(12505676,	69,	10),

(15974674,	69,	9
),
(19137151,	69,	13),

(19867677,	69,	4
),
(23607067,	69,	9
),
(23995642,	69,	9
),
(28916456,	69,	4
),
(30187810,	69,	11),

(31282994,	69,	13),

(31628825,	69,	16),

(31852049,	69,	12),

(32033788,	69,	9
),
(35365463,	69,	11),

(35507115,	69,	3
),
(35992111,	69,	13),

(42685896,	69,	7
),
(42768632,	69,	5
),
(43500959,	69,	8
),
(46844640,	69,	15),

(48563699,	69,	10),

(54679482,	69,	8
),
(57467650,	69,	17),

(59916483,	69,	6
),
(64398919,	69,	10),

(64530056,	69,	0
),
(66921228,	69,	11),

(68529349,	69,	6
),
(68677240,	69,	11),

(71708814,	69,	12),

(80614518,	69,	11),

(81768602,	69,	9
),
(84158312,	69,	6
),
(85368583,	69,	8
),
(85632352,	69,	7
),
(86872045,	69,	10),

(90935543,	69,	8
),
(91565702,	69,	11),

(10998691,	70,	9
),
(11304461,	70,	9
),
(12505676,	70,	13),

(15974674,	70,	20),

(19137151,	70,	6
),
(19867677,	70,	13),

(23607067,	70,	6
),
(23995642,	70,	15),

(28916456,	70,	12),

(30187810,	70,	6
),
(31282994,	70,	16),

(31628825,	70,	9
),
(31852049,	70,	3
),
(32033788,	70,	12),

(35365463,	70,	8
),
(35507115,	70,	8
),
(35992111,	70,	0
),
(42685896,	70,	11),

(42768632,	70,	10),

(43500959,	70,	6
),
(46844640,	70,	8
),
(48563699,	70,	15),

(54679482,	70,	2
),
(57467650,	70,	5
),
(59916483,	70,	8
),
(64398919,	70,	10),

(64530056,	70,	6
),
(66921228,	70,	16),

(68529349,	70,	12),

(68677240,	70,	7
),
(71708814,	70,	11),

(80614518,	70,	8
),
(81768602,	70,	10),

(84158312,	70,	10),

(85368583,	70,	5
),
(85632352,	70,	6
),
(86872045,	70,	16),

(90935543,	70,	11),

(91565702,	70,	11),

(10998691,	71,	8
),
(11304461,	71,	1
),
(12505676,	71,	2
),
(15974674,	71,	3
),
(19137151,	71,	10),

(19867677,	71,	9
),
(23607067,	71,	3
),
(23995642,	71,	5
),
(28916456,	71,	8
),
(30187810,	71,	7
),
(31282994,	71,	7
),
(31628825,	71,	10),

(31852049,	71,	8
),
(32033788,	71,	9
),
(35365463,	71,	3
),
(35507115,	71,	8
),
(35992111,	71,	3
),
(42685896,	71,	0
),
(42768632,	71,	8
),
(43500959,	71,	7
),
(46844640,	71,	5
),
(48563699,	71,	4
),
(54679482,	71,	6
),
(57467650,	71,	2
),
(59916483,	71,	4
),
(64398919,	71,	4
),
(64530056,	71,	10),

(66921228,	71,	5
),
(68529349,	71,	5
),
(68677240,	71,	7
),
(71708814,	71,	5
),
(80614518,	71,	4
),
(81768602,	71,	10),

(84158312,	71,	7
),
(85368583,	71,	6
),
(85632352,	71,	8
),
(86872045,	71,	6
),
(90935543,	71,	5
),
(91565702,	71,	6
),
(10998691,	72,	19),

(11304461,	72,	9
),
(12505676,	72,	13),

(15974674,	72,	18),

(19137151,	72,	13),

(19867677,	72,	18),

(23607067,	72,	15),

(23995642,	72,	18),

(28916456,	72,	20),

(30187810,	72,	11),

(31282994,	72,	8
),
(31628825,	72,	13),

(31852049,	72,	12),

(32033788,	72,	11),

(35365463,	72,	12),

(35507115,	72,	14),

(35992111,	72,	18),

(42685896,	72,	17),

(42768632,	72,	13),

(43500959,	72,	7
),
(46844640,	72,	18),

(48563699,	72,	13),

(54679482,	72,	13),

(57467650,	72,	16),

(59916483,	72,	10),

(64398919,	72,	17),

(64530056,	72,	20),

(66921228,	72,	14),

(68529349,	72,	12),

(68677240,	72,	9
),
(71708814,	72,	9
),
(80614518,	72,	12),

(81768602,	72,	14),

(84158312,	72,	14),

(85368583,	72,	11),

(85632352,	72,	14),

(86872045,	72,	18),

(90935543,	72,	17),

(91565702,	72,	17),

(10534206,	73,	9
),
(20236412,	73,	14),

(20427756,	73,	12),

(21931678,	73,	16),

(22730658,	73,	14),

(22844995,	73,	13),

(24474176,	73,	11),

(27595348,	73,	10),

(27965307,	73,	15),

(28915481,	73(,	11),

,(291,722),
01,	73,	12),

(30157844,	73,	14),

(30589090,	73,	13),

(35563113,	73,	17),

(35733587,	73,	13),

(36969032,	73,	8
),
(37560862,	73,	8
),
(40384219,	73,	15),

(41609700,	73,	15),

(43320982,	73,	14),

(45814182,	73,	11),

(52238473,	73,	10),

(53104670,	73,	16),

(55810467,	73,	8
),
(56046099,	73,	10),

(63156760,	73,	6
),
(63217302,	73,	10),

(63246226,	73,	11),

(64973126,	73,	11),

(72751710,	73,	14),

(74447273,	73,	12),

(75640107,	73,	15),

(84633041,	73,	12),

(86264655,	73,	8
),
(86534235,	73,	6
),
(91750903,	73,	8
),
(95787979,	73,	11),

(96820901,	73,	15),

(97314565,	73,	15),

(10534206,	74,	8
),
(20236412,	74,	9
),
(20427756,	74,	6
),
(21931678,	74,	9
),
(22730658,	74,	8
),
(22844995,	74,	7
),
(24474176,	74,	5
),
(27595348,	74,	10),

(27965307,	74,	6
),
(28915481,	74,	4
),
(29172201,	74,	6
),
(30157844,	74,	6
),
(30589090,	74,	9
),
(35563113,	74,	4
),
(35733587,	74,	8
),
(36969032,	74,	8
),
(37560862,	74,	9
),
(40384219,	74,	9
),
(41609700,	74,	1
),
(43320982,	74,	3
),
(45814182,	74,	8
),
(52238473,	74,	5
),
(53104670,	74,	10),

(55810467,	74,	5
),
(56046099,	74,	3
),
(63156760,	74,	7
),
(63217302,	74,	10),

(63246226,	74,	10),

(64973126,	74,	2
),
(72751710,	74,	10),

(74447273,	74,	9
),
(75640107,	74,	6
),
(84633041,	74,	7
),
(86264655,	74,	8
),
(86534235,	74,	8
),
(91750903,	74,	10),

(95787979,	74,	4
),
(96820901,	74,	7
),
(97314565,	74,	5
),
(10534206,	75,	10),

(20236412,	75,	5
),
(20427756,	75,	9
),
(21931678,	75,	10),

(22730658,	75,	0
),
(22844995,	75,	14),

(24474176,	75,	3
),
(27595348,	75,	10),

(27965307,	75,	0
),
(28915481,	75,	5
),
(29172201,	75,	4
),
(30157844,	75,	12),

(30589090,	75,	8
),
(35563113,	75,	19),

(35733587,	75,	2
),
(36969032,	75,	10),

(37560862,	75,	11),

(40384219,	75,	12),

(41609700,	75,	6
),
(43320982,	75,	9
),
(45814182,	75,	7
),
(52238473,	75,	9
),
(53104670,	75,	7
),
(55810467,	75,	9
),
(56046099,	75,	0
),
(63156760,	75,	18),

(63217302,	75,	2
),
(63246226,	75,	13),

(64973126,	75,	8
),
(72751710,	75,	4
),
(74447273,	75,	10),

(75640107,	75,	11),

(84633041,	75,	8
),
(86264655,	75,	7
),
(86534235,	75,	6
),
(91750903,	75,	11),

(95787979,	75,	5
),
(96820901,	75,	8
),
(97314565,	75,	4
),
(10534206,	76,	10),

(20236412,	76,	12),

(20427756,	76,	10),

(21931678,	76,	11),

(22730658,	76,	17),

(22844995,	76,	12),

(24474176,	76,	14),

(27595348,	76,	8
),
(27965307,	76,	10),

(28915481,	76,	14),
(29172201,	76,	11),

(30157844,	76,	19),

(30589090,	76,	10),

(35563113,	76,	11),

(35733587,	76,	5
),
(36969032,	76,	14),

(37560862,	76,	18),

(40384219,	76,	13),

(41609700,	76,	16),

(43320982,	76,	10),

(45814182,	76,	14),

(52238473,	76,	13),

(53104670,	76,	18),

(55810467,	76,	12),

(56046099,	76,	8
),
(63156760,	76,	14),

(63217302,	76,	11),

(63246226,	76,	12),

(64973126,	76,	14),

(72751710,	76,	15),

(74447273,	76,	8
),
(75640107,	76,	9
),
(84633041,	76,	9
),
(86264655,	76,	5
),
(86534235,	76,	11),

(91750903,	76,	20),

(95787979,	76,	14),

(96820901,	76,	7
),
(97314565,	76,	7
),
(10534206,	77,	7
),
(20236412,	77,	4
),
(20427756,	77,	6
),
(21931678,	77,	0
),
(22730658,	77,	5
),
(22844995,	77,	4
),
(24474176,	77,	0
),
(27595348,	77,	0
),
(27965307,	77,	4
),
(28915481,	77,	4
),
(29172201,	77,	10),

(30157844,	77,	0
),
(30589090,	77,	4
),
(35563113,	77,	6
),
(35733587,	77,	4
),
(36969032,	77,	2
),
(37560862,	77,	8
),
(40384219,	77,	3
),
(41609700,	77,	3
),
(43320982,	77,	5
),
(45814182,	77,	6
),
(52238473,	77,	6
),
(53104670,	77,	3
),
(55810467,	77,	2
),
(56046099,	77,	1
),
(63156760,	77,	3
),
(63217302,	77,	10),

(63246226,	77,	4
),
(64973126,	77,	3
),
(72751710,	77,	1
),
(74447273,	77,	1
),
(75640107,	77,	2
),
(84633041,	77,	3
),
(86264655,	77,	10),

(86534235,	77,	5
),
(91750903,	77,	0
),
(95787979,	77,	1
),
(96820901,	77,	6
),
(97314565,	77,	10),

(10534206,	78,	18),

(20236412,	78,	8
),
(20427756,	78,	12),

(21931678,	78,	13),

(22730658,	78,	13),

(22844995,	78,	18),

(24474176,	78,	15),

(27595348,	78,	20),

(27965307,	78,	11),

(28915481,	78,	5),
(29172201,	78,	19),

(30157844,	78,	10),

(30589090,	78,	14),

(35563113,	78,	7
),
(35733587,	78,	10),

(36969032,	78,	16),

(37560862,	78,	10),

(40384219,	78,	11),

(41609700,	78,	10),

(43320982,	78,	11),

(45814182,	78,	13),

(52238473,	78,	10),

(53104670,	78,	17),

(55810467,	78,	7
),
(56046099,	78,	14),

(63156760,	78,	10),

(63217302,	78,	10),

(63246226,	78,	11),

(64973126,	78,	13),

(72751710,	78,	17),

(74447273,	78,	11),

(75640107,	78,	10),

(84633041,	78,	10),

(86264655,	78,	11),

(86534235,	78,	19),

(91750903,	78,	13),

(95787979,	78,	16),

(96820901,	78,	10),

(97314565,	78,	15),

(10534206,	79,	13),

(20236412,	79,	11),

(20427756,	79,	16),

(21931678,	79,	13),

(22730658,	79,	13),

(22844995,	79,	9
),
(24474176,	79,	13),

(27595348,	79,	6
),
(27965307,	79,	12),

(28915481,	79,	5
),
(29172201,	79,	7
),
(30157844,	79,	14),

(30589090,	79,	12),

(35563113,	79,	13),

(35733587,	79,	3
),
(36969032,	79,	4
),
(37560862,	79,	6
),
(40384219,	79,	14),

(41609700,	79,	13),

(43320982,	79,	9
),
(45814182,	79,	11),

(52238473,	79,	12),

(53104670,	79,	10),

(55810467,	79,	13),

(56046099,	79,	9
),
(63156760,	79,	14),

(63217302,	79,	5
),
(63246226,	79,	13),

(64973126,	79,	10),

(72751710,	79,	9
),
(74447273,	79,	5
),
(75640107,	79,	1
),
(84633041,	79,	13),

(86264655,	79,	7
),
(86534235,	79,	5
),
(91750903,	79,	11),

(95787979,	79,	14),

(96820901,	79,	15),

(97314565,	79,	4
),
(10534206,	80,	9
),
(20236412,	80,	7
),
(20427756,	80,	6
),
(21931678,	80,	0
),
(22730658,	80,	10),

(22844995,	80,	10),

(24474176,	80,	6
),
(27595348,	80,	5
),
(27965307,	80,	4
),
(28915481,	80,	4
),
(29172201,	80,	5
),
(30157844,	80,	6
),
(30589090,	80,	0
),
(35563113,	80,	3
),
(35733587,	80,	5
),
(36969032,	80,	0
),
(37560862,	80,	4
),
(40384219,	80,	6
),
(41609700,	80,	8
),
(43320982,	80,	5
),
(45814182,	80,	7
),
(52238473,	80,	7
),
(53104670,	80,	3
),
(55810467,	80,	7
),
(56046099,	80,	10),

(63156760,	80,	5
),
(63217302,	80,	5
),
(63246226,	80,	6
),
(64973126,	80,	4
),
(72751710,	80,	10),

(74447273,	80,	5
),
(75640107,	80,	10),

(84633041,	80,	4
),
(86264655,	80,	4
),
(86534235,	80,	5
),
(91750903,	80,	6
),
(95787979,	80,	1
),
(96820901,	80,	5
),
(97314565,	80,	9
),
(10281753,	81,	4),
(12332209,	81,	5),
(14627641,	81,	5),
(15710421,	81,	3),
(16659116,	81,	4),
(17123230,	81,	1),
(20885928,	81,	2),
(22715713,	81,	3),
(23166329,	81,	1),
(26047923,	81,	2),
(26487936,	81,	5),
(27162414,	81,	4),
(27204056,	81,	5),
(33937912,	81,	4),
(36065627,	81,	0),
(36354616,	81,	2),
(43246940,	81,	1),
(47791655,	81,	2),
(48743705,	81,	5),
(51572168,	81,	2),
(52567239,	81,	0),
(52794581,	81,	0),
(55549712,	81,	5),
(55813326,	81,	3),
(56462246,	81,	5),
(57253118,	81,	5),
(63899654,	81,	1),
(66407977,	81,	4),
(72936625,	81,	4),
(75692632,	81,	4),
(76662813,	81,	5),
(78445718,	81,	0),
(81965142,	81,	3),
(83201687,	81,	4),
(84667886,	81,	5),
(86461348,	81,	0),
(89715013,	81,	2),
(97467090,	81,	5),
(99904277,	81,	3),
(10281753,	82,	14),

(12332209,	82,	11),

(14627641,	82,	9
),
(15710421,	82,	12),

(16659116,	82,	8
),
(17123230,	82,	15),

(20885928,	82,	20),

(22715713,	82,	5
),
(23166329,	82,	13),

(26047923,	82,	16),

(26487936,	82,	10),

(27162414,	82,	12),

(27204056,	82,	9
),
(33937912,	82,	9
),
(36065627,	82,	5
),
(36354616,	82,	11),

(43246940,	82,	9
),
(47791655,	82,	16),

(48743705,	82,	10),

(51572168,	82,	7
),
(52567239,	82,	7
),
(52794581,	82,	6
),
(55549712,	82,	7
),
(55813326,	82,	6
),
(56462246,	82,	13),

(57253118,	82,	7
),
(63899654,	82,	14),

(66407977,	82,	16),

(72936625,	82,	14),

(75692632,	82,	9
),
(76662813,	82,	8
),
(78445718,	82,	11),

(81965142,	82,	6
),
(83201687,	82,	9
),
(84667886,	82,	20),

(86461348,	82,	14),

(89715013,	82,	17),

(97467090,	82,	15),

(99904277,	82,	14),

(10281753,	83,	12),

(12332209,	83,	7
),
(14627641,	83,	9
),
(15710421,	83,	4
),
(16659116,	83,	12),

(17123230,	83,	9
),
(20885928,	83,	6
),
(22715713,	83,	8
),
(23166329,	83,	7
),
(26047923,	83,	6
),
(26487936,	83,	8
),
(27162414,	83,	12),

(27204056,	83,	12),

(33937912,	83,	14),

(36065627,	83,	1
),
(36354616,	83,	0
),
(43246940,	83,	0
),
(47791655,	83,	13),

(48743705,	83,	7
),
(51572168,	83,	10),

(52567239,	83,	8
),
(52794581,	83,	12),

(55549712,	83,	10),

(55813326,	83,	13),

(56462246,	83,	10),

(57253118,	83,	4
),
(63899654,	83,	9
),
(66407977,	83,	1
),
(72936625,	83,	8
),
(75692632,	83,	6
),
(76662813,	83,	2
),
(78445718,	83,	11),

(81965142,	83,	11),

(83201687,	83,	9
),
(84667886,	83,	8
),
(86461348,	83,	5
),
(89715013,	83,	6
),
(97467090,	83,	15),

(99904277,	83,	8
),
(10281753,	84,	10),

(12332209,	84,	12),

(14627641,	84,	11),

(15710421,	84,	12),

(16659116,	84,	9
),
(17123230,	84,	5
),
(20885928,	84,	7
),
(22715713,	84,	4
),
(23166329,	84,	3
),
(26047923,	84,	6
),
(26487936,	84,	5
),
(27162414,	84,	12),

(27204056,	84,	9
),
(33937912,	84,	15),

(36065627,	84,	6
),
(36354616,	84,	14),

(43246940,	84,	7
),
(47791655,	84,	3
),
(48743705,	84,	6
),
(51572168,	84,	9
),
(52567239,	84,	4
),
(52794581,	84,	5
),
(55549712,	84,	3
),
(55813326,	84,	8
),
(56462246,	84,	9
),
(57253118,	84,	2
),
(63899654,	84,	8
),
(66407977,	84,	11),

(72936625,	84,	3
),
(75692632,	84,	0
),
(76662813,	84,	2
),
(78445718,	84,	10),

(81965142,	84,	10),

(83201687,	84,	8
),
(84667886,	84,	11),

(86461348,	84,	8
),
(89715013,	84,	6
),
(97467090,	84,	12),

(99904277,	84,	12),

(10281753,	85,	4),
(12332209,	85,	3),
(14627641,	85,	4),
(15710421,	85,	5),
(16659116,	85,	3),
(17123230,	85,	1),
(20885928,	85,	3),
(22715713,	85,	1),
(23166329,	85,	2),
(26047923,	85,	5),
(26487936,	85,	3),
(27162414,	85,	3),
(27204056,	85,	2),
(33937912,	85,	2),
(36065627,	85,	4),
(36354616,	85,	3),
(43246940,	85,	5),
(47791655,	85,	2),
(48743705,	85,	4),
(51572168,	85,	0),
(52567239,	85,	4),
(52794581,	85,	4),
(55549712,	85,	3),
(55813326,	85,	4),
(56462246,	85,	4),
(57253118,	85,	1),
(63899654,	85,	0),
(66407977,	85,	3),
(72936625,	85,	5),
(75692632,	85,	2),
(76662813,	85,	5),
(78445718,	85,	5),
(81965142,	85,	3),
(83201687,	85,	5),
(84667886,	85,	2),
(86461348,	85,	4),
(89715013,	85,	1),
(97467090,	85,	5),
(99904277,	85,	2),
(10281753,	86,	8
),
(12332209,	86,	11),

(14627641,	86,	12),

(15710421,	86,	7
),
(16659116,	86,	6
),
(17123230,	86,	19),

(20885928,	86,	10),

(22715713,	86,	19),

(23166329,	86,	11),

(26047923,	86,	9
),
(26487936,	86,	9
),
(27162414,	86,	8
),
(27204056,	86,	6
),
(33937912,	86,	12),

(36065627,	86,	14),

(36354616,	86,	12),

(43246940,	86,	12),

(47791655,	86,	9
),
(48743705,	86,	9
),
(51572168,	86,	11),

(52567239,	86,	15),

(52794581,	86,	9
),
(55549712,	86,	13),

(55813326,	86,	8
),
(56462246,	86,	10),

(57253118,	86,	6
),
(63899654,	86,	8
),
(66407977,	86,	12),

(72936625,	86,	8
),
(75692632,	86,	5
),
(76662813,	86,	20),

(78445718,	86,	9
),
(81965142,	86,	12),

(83201687,	86,	9
),
(84667886,	86,	6
),
(86461348,	86,	10),

(89715013,	86,	10),

(97467090,	86,	10),

(99904277,	86,	4
),
(10281753,	87,	9
),
(12332209,	87,	8
),
(14627641,	87,	12),

(15710421,	87,	4
),
(16659116,	87,	0
),
(17123230,	87,	12),

(20885928,	87,	4
),
(22715713,	87,	6
),
(23166329,	87,	11),

(26047923,	87,	5
),
(26487936,	87,	14),

(27162414,	87,	1
),
(27204056,	87,	8
),
(33937912,	87,	0
),
(36065627,	87,	2
),
(36354616,	87,	9
),
(43246940,	87,	9
),
(47791655,	87,	4
),
(48743705,	87,	6
),
(51572168,	87,	1
),
(52567239,	87,	10),

(52794581,	87,	5
),
(55549712,	87,	8
),
(55813326,	87,	7
),
(56462246,	87,	5
),
(57253118,	87,	1
),
(63899654,	87,	0
),
(66407977,	87,	15),

(72936625,	87,	10),

(75692632,	87,	1
),
(76662813,	87,	12),

(78445718,	87,	11),

(81965142,	87,	12),

(83201687,	87,	10),

(84667886,	87,	5
),
(86461348,	87,	5
),
(89715013,	87,	6
),
(97467090,	87,	4
),
(99904277,	87,	10),

(10281753,	88,	13),

(12332209,	88,	13),

(14627641,	88,	4
),
(15710421,	88,	7
),
(16659116,	88,	11),

(17123230,	88,	10),

(20885928,	88,	0
),
(22715713,	88,	6
),
(23166329,	88,	13),

(26047923,	88,	7
),
(26487936,	88,	12),

(27162414,	88,	8
),
(27204056,	88,	9
),
(33937912,	88,	10),

(36065627,	88,	8
),
(36354616,	88,	12),

(43246940,	88,	5
),
(47791655,	88,	6
),
(48743705,	88,	10),

(51572168,	88,	3
),
(52567239,	88,	14),

(52794581,	88,	6
),
(55549712,	88,	9
),
(55813326,	88,	5
),
(56462246,	88,	12),

(57253118,	88,	8
),
(63899654,	88,	7
),
(66407977,	88,	8
),
(72936625,	88,	5
),
(75692632,	88,	10),

(76662813,	88,	10),

(78445718,	88,	16),

(81965142,	88,	12),

(83201687,	88,	16),

(84667886,	88,	9
),
(86461348,	88,	7
),
(89715013,	88,	4
),
(97467090,	88,	8
),
(99904277,	88,	11),

(12695343,	89,	6
),
(15330035,	89,	4
),
(19611576,	89,	2
),
(22491150,	89,	0
),
(23144259,	89,	5
),
(24655905,	89,	0
),
(25179222,	89,	0
),
(26326420,	89,	8
),
(28827259,	89,	2
),
(29386219,	89,	2
),
(29557897,	89,	1
),
(30901477,	89,	9
),
(34457914,	89,	4
),
(34619084,	89,	4
),
(35183865,	89,	4
),
(39409116,	89,	4
),
(41083936,	89,	6
),
(42620373,	89,	0
),
(45241147,	89,	7
),
(46275969,	89,	0
),
(50649325,	89,	2
),
(53972238,	89,	3
),
(54954233,	89,	5
),
(56622972,	89,	0
),
(60594527,	89,	7
),
(61414047,	89,	10),

(66542703,	89,	10),

(66905564,	89,	8
),
(68727765,	89,	3
),
(71257664,	89,	7
),
(74709445,	89,	0
),
(76257107,	89,	6
),
(79360908,	89,	3
),
(79593813,	89,	4
),
(86510574,	89,	8
),
(86930808,	89,	5
),
(91074522,	89,	1
),
(91980591,	89,	1
),
(96116283,	89,	10),

(12695343,	90,	8
),
(15330035,	90,	12),

(19611576,	90,	10),

(22491150,	90,	16),

(23144259,	90,	16),

(24655905,	90,	14),

(25179222,	90,	10),

(26326420,	90,	16),

(28827259,	90,	6
),
(29386219,	90,	10),

(29557897,	90,	10),

(30901477,	90,	5
),
(34457914,	90,	7
),
(34619084,	90,	15),

(35183865,	90,	7
),
(39409116,	90,	11),

(41083936,	90,	7
),
(42620373,	90,	10),

(45241147,	90,	15),

(46275969,	90,	18),

(50649325,	90,	6
),
(53972238,	90,	8
),
(54954233,	90,	4
),
(56622972,	90,	12),

(60594527,	90,	9
),
(61414047,	90,	7
),
(66542703,	90,	13),

(66905564,	90,	13),

(68727765,	90,	13),

(71257664,	90,	14),

(74709445,	90,	7
),
(76257107,	90,	9
),
(79360908,	90,	6
),
(79593813,	90,	18),

(86510574,	90,	11),

(86930808,	90,	11),

(91074522,	90,	17),

(91980591,	90,	12),

(96116283,	90,	11),

(12695343,	91,	17),

(15330035,	91,	12),

(19611576,	91,	13),

(22491150,	91,	14),

(23144259,	91,	13),

(24655905,	91,	13),

(25179222,	91,	5
),
(26326420,	91,	18),

(28827259,	91,	11),

(29386219,	91,	10),

(29557897,	91,	12),

(30901477,	91,	12),

(34457914,	91,	16),

(34619084,	91,	11),

(35183865,	91,	12),

(39409116,	91,	12),

(41083936,	91,	10),

(42620373,	91,	8
),
(45241147,	91,	13),

(46275969,	91,	3
),
(50649325,	91,	18),

(53972238,	91,	12),

(54954233,	91,	15),

(56622972,	91,	14),

(60594527,	91,	13),

(61414047,	91,	12),

(66542703,	91,	10),

(66905564,	91,	11),

(68727765,	91,	14),

(71257664,	91,	7
),
(74709445,	91,	15),

(76257107,	91,	13),

(79360908,	91,	8
),
(79593813,	91,	20),

(86510574,	91,	13),

(86930808,	91,	10),

(91074522,	91,	14),

(91980591,	91,	15),

(96116283,	91,	13),

(12695343,	92,	3
),
(15330035,	92,	20),

(19611576,	92,	10),

(22491150,	92,	13),

(23144259,	92,	13),

(24655905,	92,	13),

(25179222,	92,	13),

(26326420,	92,	7
),
(28827259,	92,	4
),
(29386219,	92,	12),

(29557897,	92,	15),

(30901477,	92,	12),

(34457914,	92,	15),

(34619084,	92,	16),

(35183865,	92,	7
),
(39409116,	92,	13),

(41083936,	92,	11),

(42620373,	92,	9
),
(45241147,	92,	12),

(46275969,	92,	9
),
(50649325,	92,	7
),
(53972238,	92,	8
),
(54954233,	92,	7
),
(56622972,	92,	11),

(60594527,	92,	9
),
(61414047,	92,	6
),
(66542703,	92,	11),

(66905564,	92,	15),

(68727765,	92,	10),

(71257664,	92,	12),

(74709445,	92,	13),

(76257107,	92,	11),

(79360908,	92,	12),

(79593813,	92,	9
),
(86510574,	92,	16),

(86930808,	92,	7
),
(91074522,	92,	14),

(91980591,	92,	8
),
(96116283,	92,	11),

(12695343,	93,	4),
(15330035,	93,	5),
(19611576,	93,	4),
(22491150,	93,	1),
(23144259,	93,	3),
(24655905,	93,	4),
(25179222,	93,	3),
(26326420,	93,	4),
(28827259,	93,	5),
(29386219,	93,	5),
(29557897,	93,	5),
(30901477,	93,	3),
(34457914,	93,	4),
(34619084,	93,	4),
(35183865,	93,	5),
(39409116,	93,	4),
(41083936,	93,	5),
(42620373,	93,	3),
(45241147,	93,	4),
(46275969,	93,	1),
(50649325,	93,	2),
(53972238,	93,	1),
(54954233,	93,	1),
(56622972,	93,	5),
(60594527,	93,	5),
(61414047,	93,	5),
(66542703,	93,	3),
(66905564,	93,	5),
(68727765,	93,	4),
(71257664,	93,	5),
(74709445,	93,	2),
(76257107,	93,	5),
(79360908,	93,	5),
(79593813,	93,	3),
(86510574,	93,	5),
(86930808,	93,	4),
(91074522,	93,	1),
(91980591,	93,	5),
(96116283,	93,	5),
(12695343,	94,	11),

(15330035,	94,	13),

(19611576,	94,	8
),
(22491150,	94,	18),

(23144259,	94,	12),

(24655905,	94,	5
),
(25179222,	94,	11),

(26326420,	94,	10),

(28827259,	94,	0
),
(29386219,	94,	8
),
(29557897,	94,	7
),
(30901477,	94,	12),

(34457914,	94,	6
),
(34619084,	94,	12),

(35183865,	94,	11),

(39409116,	94,	9
),
(41083936,	94,	14),

(42620373,	94,	9
),
(45241147,	94,	12),

(46275969,	94,	11),

(50649325,	94,	13),

(53972238,	94,	9
),
(54954233,	94,	10),

(56622972,	94,	6
),
(60594527,	94,	5
),
(61414047,	94,	7
),
(66542703,	94,	11),

(66905564,	94,	6
),
(68727765,	94,	5
),
(71257664,	94,	14),

(74709445,	94,	11),

(76257107,	94,	20),

(79360908,	94,	18),

(79593813,	94,	9
),
(86510574,	94,	5
),
(86930808,	94,	13),

(91074522,	94,	12),

(91980591,	94,	9
),
(96116283,	94,	9
),
(12695343,	95,	5),
(15330035,	95,	5),
(19611576,	95,	5),
(22491150,	95,	4),
(23144259,	95,	5),
(24655905,	95,	5),
(25179222,	95,	5),
(26326420,	95,	5),
(28827259,	95,	5),
(29386219,	95,	2),
(29557897,	95,	4),
(30901477,	95,	5),
(34457914,	95,	4),
(34619084,	95,	5),
(35183865,	95,	4),
(39409116,	95,	5),
(41083936,	95,	5),
(42620373,	95,	2),
(45241147,	95,	3),
(46275969,	95,	5),
(50649325,	95,	5),
(53972238,	95,	5),
(54954233,	95,	5),
(56622972,	95,	5),
(60594527,	95,	1),
(61414047,	95,	5),
(66542703,	95,	4),
(66905564,	95,	5),
(68727765,	95,	5),
(71257664,	95,	4),
(74709445,	95,	5),
(76257107,	95,	4),
(79360908,	95,	5),
(79593813,	95,	5),
(86510574,	95,	2),
(86930808,	95,	5),
(91074522,	95,	4),
(91980591,	95,	3),
(96116283,	95,	5),
(12695343,	96,	10),

(15330035,	96,	11),

(19611576,	96,	4
),
(22491150,	96,	6
),
(23144259,	96,	7
),
(24655905,	96,	7
),
(25179222,	96,	9
),
(26326420,	96,	10),

(28827259,	96,	6
),
(29386219,	96,	7
),
(29557897,	96,	5
),
(30901477,	96,	11),

(34457914,	96,	8
),
(34619084,	96,	13),

(35183865,	96,	0
),
(39409116,	96,	9
),
(41083936,	96,	9
),
(42620373,	96,	12),

(45241147,	96,	10),

(46275969,	96,	12),

(50649325,	96,	9
),
(53972238,	96,	12),

(54954233,	96,	0
),
(56622972,	96,	9
),
(60594527,	96,	9
),
(61414047,	96,	8
),
(66542703,	96,	10),

(66905564,	96,	5
),
(68727765,	96,	10),

(71257664,	96,	12),

(74709445,	96,	11),

(76257107,	96,	6
),
(79360908,	96,	9
),
(79593813,	96,	10),

(86510574,	96,	9
),
(86930808,	96,	6
),
(91074522,	96,	4
),
(91980591,	96,	11),

(96116283,	96,	10),

(13933301,	97,	15),

(16797391,	97,	13),

(18029580,	97,	15),

(23412027,	97,	17),

(33583386,	97,	16),

(33809838,	97,	13),

(35544401,	97,	12),

(38867925,	97,	12),

(39014661,	97,	15),

(40177208,	97,	9
),
(44508242,	97,	20),

(44975872,	97,	20),

(45124404,	97,	6
),
(46341250,	97,	17),

(47992460,	97,	14),

(50255297,	97,	8
),
(54277909,	97,	4
),
(55075253,	97,	12),

(55481497,	97,	11),

(55920827,	97,	11),

(59394502,	97,	14),

(60555723,	97,	10),

(61496547,	97,	11),

(62998010,	97,	12),

(64445490,	97,	10),

(65440089,	97,	15),

(66080147,	97,	9
),
(72165244,	97,	13),

(73317454,	97,	14),

(74288538,	97,	8
),
(77026788,	97,	13),

(77271695,	97,	10),

(78162009,	97,	13),

(78641051,	97,	7
),
(82567240,	97,	16),

(85700983,	97,	15),

(87657665,	97,	12),

(89132300,	97,	14),

(92475083,	97,	4
),
(13933301,	98,	10),

(16797391,	98,	13),

(18029580,	98,	10),

(23412027,	98,	10),

(33583386,	98,	15),

(33809838,	98,	8
),
(35544401,	98,	16),

(38867925,	98,	13),

(39014661,	98,	7
),
(40177208,	98,	11),

(44508242,	98,	12),

(44975872,	98,	12),

(45124404,	98,	12),

(46341250,	98,	16),

(47992460,	98,	4
),
(50255297,	98,	14),

(54277909,	98,	6
),
(55075253,	98,	16),

(55481497,	98,	11),

(55920827,	98,	10),

(59394502,	98,	16),

(60555723,	98,	14),

(61496547,	98,	12),

(62998010,	98,	16),

(64445490,	98,	14),

(65440089,	98,	13),

(66080147,	98,	14),

(72165244,	98,	20),

(73317454,	98,	8
),
(74288538,	98,	13),

(77026788,	98,	2
),
(77271695,	98,	10),

(78162009,	98,	16),

(78641051,	98,	12),

(82567240,	98,	9
),
(85700983,	98,	4
),
(87657665,	98,	13),

(89132300,	98,	6
),
(92475083,	98,	10),

(13933301,	99,	13),

(16797391,	99,	9
),
(18029580,	99,	9
),
(23412027,	99,	14),

(33583386,	99,	17),

(33809838,	99,	11),

(35544401,	99,	7
),
(38867925,	99,	18),

(39014661,	99,	10),

(40177208,	99,	11),

(44508242,	99,	9
),
(44975872,	99,	15),

(45124404,	99,	7
),
(46341250,	99,	5
),
(47992460,	99,	11),

(50255297,	99,	5
),
(54277909,	99,	3
),
(55075253,	99,	11),

(55481497,	99,	14),

(55920827,	99,	12),

(59394502,	99,	6
),
(60555723,	99,	12),

(61496547,	99,	10),

(62998010,	99,	3
),
(64445490,	99,	7
),
(65440089,	99,	8
),
(66080147,	99,	6
),
(72165244,	99,	12),

(73317454,	99,	14),

(74288538,	99,	9
),
(77026788,	99,	5
),
(77271695,	99,	15),

(78162009,	99,	9
),
(78641051,	99,	3
),
(82567240,	99,	16),

(85700983,	99,	12),

(87657665,	99,	11),

(89132300,	99,	11),

(92475083,	99,	13),

(13933301,	100,	5),
(16797391,	100,	5),
(18029580,	100,	5),
(23412027,	100,	2),
(33583386,	100,	3),
(33809838,	100,	5),
(35544401,	100,	4),
(38867925,	100,	5),
(39014661,	100,	4),
(40177208,	100,	5),
(44508242,	100,	5),
(44975872,	100,	5),
(45124404,	100,	4),
(46341250,	100,	5),
(47992460,	100,	5),
(50255297,	100,	1),
(54277909,	100,	4),
(55075253,	100,	5),
(55481497,	100,	3),
(55920827,	100,	5),
(59394502,	100,	1),
(60555723,	100,	5),
(61496547,	100,	4),
(62998010,	100,	3),
(64445490,	100,	3),
(65440089,	100,	5),
(66080147,	100,	5),
(72165244,	100,	3),
(73317454,	100,	5),
(74288538,	100,	5),
(77026788,	100,	3),
(77271695,	100,	5),
(78162009,	100,	2),
(78641051,	100,	3),
(82567240,	100,	4),
(85700983,	100,	4),
(87657665,	100,	3),
(89132300,	100,	5),
(92475083,	100,	5),
(13933301,	101,	7
),
(16797391,	101,	11),

(18029580,	101,	11),

(23412027,	101,	2
),
(33583386,	101,	10),

(33809838,	101,	10),

(35544401,	101,	7
),
(38867925,	101,	19),

(39014661,	101,	4
),
(40177208,	101,	9
),
(44508242,	101,	11),

(44975872,	101,	5
),
(45124404,	101,	12),

(46341250,	101,	13),

(47992460,	101,	8
),
(50255297,	101,	15),

(54277909,	101,	5
),
(55075253,	101,	5
),
(55481497,	101,	18),

(55920827,	101,	10),

(59394502,	101,	11),

(60555723,	101,	10),

(61496547,	101,	13),

(62998010,	101,	5
),
(64445490,	101,	14),

(65440089,	101,	14),

(66080147,	101,	17),

(72165244,	101,	12),

(73317454,	101,	8
),
(74288538,	101,	6
),
(77026788,	101,	12),

(77271695,	101,	11),

(78162009,	101,	14),

(78641051,	101,	11),

(82567240,	101,	4
),
(85700983,	101,	16),

(87657665,	101,	18),

(89132300,	101,	9
),
(92475083,	101,	20),

(13933301,	102,	10),

(16797391,	102,	12),

(18029580,	102,	11),

(23412027,	102,	16),

(33583386,	102,	16),

(33809838,	102,	14),

(35544401,	102,	8
),
(38867925,	102,	7
),
(39014661,	102,	15),

(40177208,	102,	5
),
(44508242,	102,	13),

(44975872,	102,	12),

(45124404,	102,	17),

(46341250,	102,	15),

(47992460,	102,	14),

(50255297,	102,	9
),
(54277909,	102,	6
),
(55075253,	102,	12),

(55481497,	102,	13),

(55920827,	102,	1
),
(59394502,	102,	9
),
(60555723,	102,	10),

(61496547,	102,	12),

(62998010,	102,	1
),
(64445490,	102,	14),

(65440089,	102,	11),

(66080147,	102,	16),

(72165244,	102,	9
),
(73317454,	102,	0
),
(74288538,	102,	9
),
(77026788,	102,	7
),
(77271695,	102,	9
),
(78162009,	102,	19),

(78641051,	102,	15),

(82567240,	102,	13),

(85700983,	102,	9
),
(87657665,	102,	13),

(89132300,	102,	11),

(92475083,	102,	17),

(13933301,	103,	14),

(16797391,	103,	8
),
(18029580,	103,	4
),
(23412027,	103,	2
),
(33583386,	103,	7
),
(33809838,	103,	4
),
(35544401,	103,	3
),
(38867925,	103,	9
),
(39014661,	103,	3
),
(40177208,	103,	8
),
(44508242,	103,	13),

(44975872,	103,	9
),
(45124404,	103,	10),

(46341250,	103,	17),

(47992460,	103,	11),

(50255297,	103,	9
),
(54277909,	103,	8
),
(55075253,	103,	10),

(55481497,	103,	6
),
(55920827,	103,	7
),
(59394502,	103,	5
),
(60555723,	103,	10),

(61496547,	103,	6
),
(62998010,	103,	13),

(64445490,	103,	20),

(65440089,	103,	12),

(66080147,	103,	3
),
(72165244,	103,	5
),
(73317454,	103,	14),

(74288538,	103,	6
),
(77026788,	103,	10),

(77271695,	103,	14),

(78162009,	103,	8
),
(78641051,	103,	10),

(82567240,	103,	10),

(85700983,	103,	10),

(87657665,	103,	10),

(89132300,	103,	15),

(92475083,	103,	7
),
(13933301,	104,	5
),
(16797391,	104,	16),

(18029580,	104,	9
),
(23412027,	104,	6
),
(33583386,	104,	11),

(33809838,	104,	14),

(35544401,	104,	8
),
(38867925,	104,	11),

(39014661,	104,	15),

(40177208,	104,	13),

(44508242,	104,	10),

(44975872,	104,	7
),
(45124404,	104,	7
),
(46341250,	104,	15),

(47992460,	104,	6
),
(50255297,	104,	13),

(54277909,	104,	7
),
(55075253,	104,	6
),
(55481497,	104,	6
),
(55920827,	104,	17),

(59394502,	104,	12),

(60555723,	104,	12),

(61496547,	104,	11),

(62998010,	104,	9
),
(64445490,	104,	5
),
(65440089,	104,	9
),
(66080147,	104,	8
),
(72165244,	104,	8
),
(73317454,	104,	13),

(74288538,	104,	10),

(77026788,	104,	13),

(77271695,	104,	11),

(78162009,	104,	13),

(78641051,	104,	9
),
(82567240,	104,	8
),
(85700983,	104,	14),

(87657665,	104,	12),

(89132300,	104,	4
),
(92475083,	104,	10),

(11060460,	105,	19),

(12676344,	105,	11),

(13798907,	105,	20),

(14857390,	105,	20),

(14876495,	105,	11),

(15291264,	105,	17),

(15835420,	105,	16),

(17358086,	105,	12),

(18167729,	105,	17),

(22735531,	105,	10),

(31721186,	105,	12),

(33551716,	105,	20),

(37864801,	105,	7
),
(39028666,	105,	16),
(39291233,	105,	9
),
(42119585,	105,	16),

(44618350,	105,	14),

(44809709,	105,	13),

(47500359,	105,	12),

(51067129,	105,	5
),
(53414159,	105,	15),

(58498985,	105,	20),

(59542319,	105,	7
),
(60436435,	105,	7
),
(63239930,	105,	10),

(67735490,	105,	12),

(68243902,	105,	11),

(70714030,	105,	11),

(71582989,	105,	15),

(82232362,	105,	18),

(86606105,	105,	15),

(88571574,	105,	16),

(92033729,	105,	11),

(92343797,	105,	19),

(92883827,	105,	5
),
(93501906,	105,	9
),
(95481005,	105,	9
),
(97792734,	105,	12),

(99115530,	105,	15),

(11060460,	106,	12),

(12676344,	106,	11),

(13798907,	106,	6
),
(14857390,	106,	14),

(14876495,	106,	14),
(15291264,	106,	4
),
(15835420,	106,	15),

(17358086,	106,	13),

(18167729,	106,	17),

(22735531,	106,	7
),
(31721186,	106,	11),

(33551716,	106,	5
),
(37864801,	106,	13),

(39028666,	106,	13),
(39291233,	106,	6
),
(42119585,	106,	20),

(44618350,	106,	9
),
(44809709,	106,	9
),
(47500359,	106,	10),

(51067129,	106,	16),

(53414159,	106,	17),

(58498985,	106,	15),

(59542319,	106,	14),

(60436435,	106,	10),

(63239930,	106,	12),

(67735490,	106,	8
),
(68243902,	106,	5
),
(70714030,	106,	8
),
(71582989,	106,	4
),
(82232362,	106,	10),

(86606105,	106,	13),

(88571574,	106,	0
),
(92033729,	106,	10),

(92343797,	106,	10),

(92883827,	106,	10),

(93501906,	106,	11),

(95481005,	106,	4
),
(97792734,	106,	8
),
(99115530,	106,	15),

(11060460,	107,	6
),
(12676344,	107,	10),

(13798907,	107,	6
),
(14857390,	107,	6
),
(14876495,	107,	10),
(15291264,	107,	10),

(15835420,	107,	4
),
(17358086,	107,	10),

(18167729,	107,	1
),
(22735531,	107,	4
),
(31721186,	107,	8
),
(33551716,	107,	10),

(37864801,	107,	6
),
(39028666,	107,	2
),
(39291233,	107,	8
),
(42119585,	107,	5
),
(44618350,	107,	3
),
(44809709,	107,	10),

(47500359,	107,	10),

(51067129,	107,	5
),
(53414159,	107,	3
),
(58498985,	107,	5
),
(59542319,	107,	3
),
(60436435,	107,	4
),
(63239930,	107,	4
),
(67735490,	107,	9
),
(68243902,	107,	5
),
(70714030,	107,	5
),
(71582989,	107,	5
),
(82232362,	107,	7
),
(86606105,	107,	5
),
(88571574,	107,	7
),
(92033729,	107,	4
),
(92343797,	107,	10),

(92883827,	107,	6
),
(93501906,	107,	2
),
(95481005,	107,	4
),
(97792734,	107,	4
),
(99115530,	107,	6
),
(11060460,	108,	7
),
(12676344,	108,	14),

(13798907,	108,	0
),
(14857390,	108,	4
),
(14876495,	108,	10),

(15291264,	108,	8
),
(15835420,	108,	7
),
(17358086,	108,	13),

(18167729,	108,	6
),
(22735531,	108,	0
),
(31721186,	108,	8
),
(33551716,	108,	8
),
(37864801,	108,	8
),
(39028666,	108,	11),
(39291233,	108,	9
),
(42119585,	108,	10),

(44618350,	108,	11),

(44809709,	108,	5
),
(47500359,	108,	15),

(51067129,	108,	9
),
(53414159,	108,	4
),
(58498985,	108,	8
),
(59542319,	108,	0
),
(60436435,	108,	5
),
(63239930,	108,	5
),
(67735490,	108,	3
),
(68243902,	108,	2
),
(70714030,	108,	10),

(71582989,	108,	10),

(82232362,	108,	9
),
(86606105,	108,	14),

(88571574,	108,	9
),
(92033729,	108,	6
),
(92343797,	108,	8
),
(92883827,	108,	0
),
(93501906,	108,	11),

(95481005,	108,	9
),
(97792734,	108,	7
),
(99115530,	108,	1
),
(11060460,	109,	5
),
(12676344,	109,	3
),
(13798907,	109,	7
),
(14857390,	109,	9
),
(14876495,	109	8),
(15291264,	109,	10),

(15835420,	109,	8
),
(17358086,	109,	7
),
(18167729,	109,	7
),
(22735531,	109,	18),

(31721186,	109,	6
),
(33551716,	109,	14),

(37864801,	109,	6
),
(39028666,	109,	7
),
(39291233,	109,	7
),
(42119585,	109,	4
),
(44618350,	109,	14),

(44809709,	109,	6
),
(47500359,	109,	9
),
(51067129,	109,	6
),
(53414159,	109,	10),

(58498985,	109,	15),

(59542319,	109,	9
),
(60436435,	109,	5
),
(63239930,	109,	7
),
(67735490,	109,	11),

(68243902,	109,	0
),
(70714030,	109,	10),

(71582989,	109,	6
),
(82232362,	109,	9
),
(86606105,	109,	8
),
(88571574,	109,	10),

(92033729,	109,	10),

(92343797,	109,	12),

(92883827,	109,	10),

(93501906,	109,	10),

(95481005,	109,	8
),
(97792734,	109,	1
),
(99115530,	109,	13),

(11060460,	110,	8
),
(12676344,	110,	10),

(13798907,	110,	6
),
(14857390,	110,	7
),
(14876495,	110,	8),
(15291264,	110,	20),

(15835420,	110,	3
),
(17358086,	110,	5
),
(18167729,	110,	11),

(22735531,	110,	10),

(31721186,	110,	18),

(33551716,	110,	11),

(37864801,	110,	9
),
(39028666,	110,	9
),
(39291233,	110,	17),

(42119585,	110,	15),

(44618350,	110,	15),

(44809709,	110,	8
),
(47500359,	110,	13),

(51067129,	110,	9
),
(53414159,	110,	10),

(58498985,	110,	14),

(59542319,	110,	15),

(60436435,	110,	6
),
(63239930,	110,	11),

(67735490,	110,	8
),
(68243902,	110,	15),

(70714030,	110,	16),

(71582989,	110,	8
),
(82232362,	110,	4
),
(86606105,	110,	3
),
(88571574,	110,	12),

(92033729,	110,	6
),
(92343797,	110,	17),

(92883827,	110,	9
),
(93501906,	110,	9
),
(95481005,	110,	7
),
(97792734,	110,	20),

(99115530,	110,	14),

(11060460,	111,	12),

(12676344,	111,	13),

(13798907,	111,	14),

(14857390,	111,	9
),
(14876495,	111,	11),

(15291264, 111,	11),

(15835420,	111,	17),

(17358086,	111,	14),

(18167729,	111,	10),

(22735531,	111,	17),

(31721186,	111,	11),

(33551716,	111,	8
),
(37864801,	111,	7
),
(39028666,	111,	2),
(39291233,	111,	16),

(42119585,	111,	13),

(44618350,	111,	12),

(44809709,	111,	10),

(47500359,	111,	14),

(51067129,	111,	10),

(53414159,	111,	13),

(58498985,	111,	6
),
(59542319,	111,	15),

(60436435,	111,	15),

(63239930,	111,	9
),
(67735490,	111,	7
),
(68243902,	111,	16),

(70714030,	111,	12),

(71582989,	111,	7
),
(82232362,	111,	4
),
(86606105,	111,	16),

(88571574,	111,	11),

(92033729,	111,	12),

(92343797,	111,	5
),
(92883827,	111,	12),

(93501906,	111,	14),

(95481005,	111,	9
),
(97792734,	111,	4
),
(99115530,	111,	12),

(11060460,	112,	10),

(12676344,	112,	5
),
(13798907,	112,	9
),
(14857390,	112,	5
),
(14876495,	112,	10),
(15291264,	112,	12),

(15835420,	112,	13),

(17358086,	112,	6
),
(18167729,	112,	9
),
(22735531,	112,	6
),
(31721186,	112,	10),

(33551716,	112,	13),

(37864801,	112,	8
),
(39028666,	112,	5),
(39291233,	112,	2
),
(42119585,	112,	11),

(44618350,	112,	12),

(44809709,	112,	9
),
(47500359,	112,	15),

(51067129,	112,	20),

(53414159,	112,	7
),
(58498985,	112,	12),

(59542319,	112,	4
),
(60436435,	112,	16),

(63239930,	112,	7
),
(67735490,	112,	13),

(68243902,	112,	2
),
(70714030,	112,	0
),
(71582989,	112,	12),

(82232362,	112,	15),

(86606105,	112,	10),

(88571574,	112,	4
),
(92033729,	112,	10),

(92343797,	112,	10),

(92883827,	112,	8
),
(93501906,	112,	8
),
(95481005,	112,	12),

(97792734,	112,	6
),
(99115530,	112,	9
),
(11244206,	113,	13),

(12057283,	113,	15),

(13668883,	113,	10),

(13684450,	113,	2
),
(14493579,	113,	4
),
(17188037,	113,	20),

(19542698,	113,	10),

(24834676,	113,	11),

(26790179,	113,	8
),
(31193777,	113,	8
),
(31568819,	113,	15),

(33871863,	113,	10),

(36598030,	113,	11),

(44005211,	113,	15),

(44008477,	113,	15),

(47468588,	113,	11),

(48126470,	113,	10),

(50417103,	113,	9
),
(51671643,	113,	11),

(52220638,	113,	20),

(59334127,	113,	8
),
(63887324,	113,	10),

(64578632,	113,	16),

(69181739,	113,	11),

(74239452,	113,	14),

(75119033,	113,	12),

(77713039,	113,	17),

(77718435,	113,	13),

(79468224,	113,	14),

(80712718,	113,	0
),
(81512193,	113,	14),

(81753964,	113,	6
),
(89130287,	113,	12),

(90582251,	113,	12),

(93040696,	113,	12),

(93220018,	113,	15),

(94248610,	113,	18),

(96590182,	113,	13),

(99597461,	113,	6
),
(11244206,	114,	16),

(12057283,	114,	7
),
(13668883,	114,	15),

(13684450,	114,	20),

(14493579,	114,	10),

(17188037,	114,	17),

(19542698,	114,	19),

(24834676,	114,	12),

(26790179,	114,	12),

(31193777,	114,	15),

(31568819,	114,	8
),
(33871863,	114,	17),

(36598030,	114,	9
),
(44005211,	114,	8
),
(44008477,	114,	17),

(47468588,	114,	18),

(48126470,	114,	11),

(50417103,	114,	6
),
(51671643,	114,	17),

(52220638,	114,	6
),
(59334127,	114,	6
),
(63887324,	114,	16),

(64578632,	114,	9
),
(69181739,	114,	14),

(74239452,	114,	10),

(75119033,	114,	16),

(77713039,	114,	6
),
(77718435,	114,	12),

(79468224,	114,	9
),
(80712718,	114,	8
),
(81512193,	114,	16),

(81753964,	114,	10),

(89130287,	114,	11),

(90582251,	114,	8
),
(93040696,	114,	15),

(93220018,	114,	13),

(94248610,	114,	4
),
(96590182,	114,	6
),
(99597461,	114,	4
),
(11244206,	115,	4
),
(12057283,	115,	11),

(13668883,	115,	17),

(13684450,	115,	3
),
(14493579,	115,	14),

(17188037,	115,	5
),
(19542698,	115,	11),

(24834676,	115,	4
),
(26790179,	115,	7
),
(31193777,	115,	11),

(31568819,	115,	15),

(33871863,	115,	14),

(36598030,	115,	11),

(44005211,	115,	18),

(44008477,	115,	9
),
(47468588,	115,	9
),
(48126470,	115,	16),

(50417103,	115,	9
),
(51671643,	115,	15),

(52220638,	115,	8
),
(59334127,	115,	6
),
(63887324,	115,	9
),
(64578632,	115,	10),

(69181739,	115,	12),

(74239452,	115,	14),

(75119033,	115,	4
),
(77713039,	115,	3
),
(77718435,	115,	20),

(79468224,	115,	13),

(80712718,	115,	6
),
(81512193,	115,	16),

(81753964,	115,	9
),
(89130287,	115,	7
),
(90582251,	115,	15),

(93040696,	115,	6
),
(93220018,	115,	6
),
(94248610,	115,	13),

(96590182,	115,	14),

(99597461,	115,	11),

(11244206,	116,	1),
(12057283,	116,	5),
(13668883,	116,	5),
(13684450,	116,	5),
(14493579,	116,	3),
(17188037,	116,	5),
(19542698,	116,	4),
(24834676,	116,	1),
(26790179,	116,	1),
(31193777,	116,	4),
(31568819,	116,	5),
(33871863,	116,	5),
(36598030,	116,	2),
(44005211,	116,	5),
(44008477,	116,	4),
(47468588,	116,	3),
(48126470,	116,	4),
(50417103,	116,	4),
(51671643,	116,	4),
(52220638,	116,	5),
(59334127,	116,	5),
(63887324,	116,	3),
(64578632,	116,	3),
(69181739,	116,	5),
(74239452,	116,	5),
(75119033,	116,	5),
(77713039,	116,	4),
(77718435,	116,	3),
(79468224,	116,	3),
(80712718,	116,	5),
(81512193,	116,	5),
(81753964,	116,	0),
(89130287,	116,	5),
(90582251,	116,	5),
(93040696,	116,	3),
(93220018,	116,	4),
(94248610,	116,	5),
(96590182,	116,	4),
(99597461,	116,	5),
(11244206,	117,	9
),
(12057283,	117,	20),

(13668883,	117,	14),

(13684450,	117,	9
),
(14493579,	117,	16),

(17188037,	117,	18),

(19542698,	117,	11),

(24834676,	117,	10),

(26790179,	117,	16),

(31193777,	117,	16),

(31568819,	117,	16),

(33871863,	117,	15),

(36598030,	117,	15),

(44005211,	117,	8
),
(44008477,	117,	7
),
(47468588,	117,	18),

(48126470,	117,	13),

(50417103,	117,	4
),
(51671643,	117,	12),

(52220638,	117,	18),

(59334127,	117,	10),

(63887324,	117,	7
),
(64578632,	117,	9
),
(69181739,	117,	17),

(74239452,	117,	10),

(75119033,	117,	13),

(77713039,	117,	17),

(77718435,	117,	15),

(79468224,	117,	16),

(80712718,	117,	10),

(81512193,	117,	8
),
(81753964,	117,	12),

(89130287,	117,	20),

(90582251,	117,	12),

(93040696,	117,	16),

(93220018,	117,	11),

(94248610,	117,	8
),
(96590182,	117,	7
),
(99597461,	117,	10),

(11244206,	118,	12),

(12057283,	118,	9
),
(13668883,	118,	11),

(13684450,	118,	13),

(14493579,	118,	17),

(17188037,	118,	20),

(19542698,	118,	11),

(24834676,	118,	16),

(26790179,	118,	20),

(31193777,	118,	14),

(31568819,	118,	16),

(33871863,	118,	13),

(36598030,	118,	20),

(44005211,	118,	17),

(44008477,	118,	11),

(47468588,	118,	11),

(48126470,	118,	11),

(50417103,	118,	18),

(51671643,	118,	15),

(52220638,	118,	3
),
(59334127,	118,	11),

(63887324,	118,	6
),
(64578632,	118,	20),

(69181739,	118,	16),

(74239452,	118,	15),

(75119033,	118,	12),

(77713039,	118,	12),

(77718435,	118,	14),

(79468224,	118,	10),

(80712718,	118,	8
),
(81512193,	118,	13),

(81753964,	118,	14),

(89130287,	118,	11),

(90582251,	118,	11),

(93040696,	118,	10),

(93220018,	118,	17),

(94248610,	118,	14),

(96590182,	118,	20),

(99597461,	118,	8
),
(11244206,	119,	7
),
(12057283,	119,	12),

(13668883,	119,	5
),
(13684450,	119,	20),

(14493579,	119,	14),

(17188037,	119,	14),

(19542698,	119,	7
),
(24834676,	119,	12),

(26790179,	119,	12),

(31193777,	119,	13),

(31568819,	119,	13),

(33871863,	119,	16),

(36598030,	119,	16),

(44005211,	119,	11),

(44008477,	119,	12),

(47468588,	119,	16),

(48126470,	119,	8
),
(50417103,	119,	14),

(51671643,	119,	7
),
(52220638,	119,	11),

(59334127,	119,	8
),
(63887324,	119,	15),

(64578632,	119,	20),

(69181739,	119,	15),

(74239452,	119,	20),

(75119033,	119,	9
),
(77713039,	119,	9
),
(77718435,	119,	14),

(79468224,	119,	10),

(80712718,	119,	14),

(81512193,	119,	14),

(81753964,	119,	20),

(89130287,	119,	17),

(90582251,	119,	12),

(93040696,	119,	12),

(93220018,	119,	14),

(94248610,	119,	13),

(96590182,	119,	8
),
(99597461,	119,	15),

(11244206,	120,	8
),
(12057283,	120,	8
),
(13668883,	120,	9
),
(13684450,	120,	7
),
(14493579,	120,	6
),
(17188037,	120,	16),

(19542698,	120,	11),

(24834676,	120,	11),

(26790179,	120,	12),

(31193777,	120,	9
),
(31568819,	120,	6
),
(33871863,	120,	4
),
(36598030,	120,	8
),
(44005211,	120,	4
),
(44008477,	120,	7
),
(47468588,	120,	16),

(48126470,	120,	6
),
(50417103,	120,	7
),
(51671643,	120,	10),

(52220638,	120,	1
),
(59334127,	120,	9
),
(63887324,	120,	6
),
(64578632,	120,	4
),
(69181739,	120,	6
),
(74239452,	120,	8
),
(75119033,	120,	8
),
(77713039,	120,	9
),
(77718435,	120,	15),

(79468224,	120,	13),

(80712718,	120,	5
),
(81512193,	120,	14),

(81753964,	120,	4
),
(89130287,	120,	4
),
(90582251,	120,	8
),
(93040696,	120,	8
),
(93220018,	120,	11),

(94248610,	120,	4
),
(96590182,	120,	12),

(99597461,	120,	10),

(10998691,	121,	4),
(11304461,	121,	5),
(12505676,	121,	5),
(15974674,	121,	5),
(19137151,	121,	5),
(19867677,	121,	5),
(23607067,	121,	5),
(23995642,	121,	5),
(28916456,	121,	5),
(30187810,	121,	5),
(31282994,	121,	5),
(31628825,	121,	3),
(31852049,	121,	4),
(32033788,	121,	5),
(35365463,	121,	5),
(35507115,	121,	5),
(35992111,	121,	5),
(42685896,	121,	5),
(42768632,	121,	5),
(43500959,	121,	5),
(46844640,	121,	3),
(48563699,	121,	3),
(54679482,	121,	5),
(57467650,	121,	4),
(59916483,	121,	5),
(64398919,	121,	5),
(64530056,	121,	5),
(66921228,	121,	5),
(68529349,	121,	5),
(68677240,	121,	4),
(71708814,	121,	5),
(80614518,	121,	5),
(81768602,	121,	5),
(84158312,	121,	5),
(85368583,	121,	3),
(85632352,	121,	3),
(86872045,	121,	5),
(90935543,	121,	4),
(91565702,	121,	5),
(10998691,	122,	19),

(11304461,	122,	18),

(12505676,	122,	13),

(15974674,	122,	13),

(19137151,	122,	7
),
(19867677,	122,	17),

(23607067,	122,	11),

(23995642,	122,	13),

(28916456,	122,	13),

(30187810,	122,	12),

(31282994,	122,	8
),
(31628825,	122,	17),

(31852049,	122,	16),

(32033788,	122,	14),

(35365463,	122,	20),

(35507115,	122,	13),

(35992111,	122,	11),

(42685896,	122,	16),

(42768632,	122,	20),

(43500959,	122,	10),

(46844640,	122,	8
),
(48563699,	122,	16),

(54679482,	122,	18),

(57467650,	122,	10),

(59916483,	122,	18),

(64398919,	122,	19),

(64530056,	122,	20),

(66921228,	122,	15),

(68529349,	122,	13),

(68677240,	122,	13),

(71708814,	122,	7
),
(80614518,	122,	11),

(81768602,	122,	17),

(84158312,	122,	13),

(85368583,	122,	10),

(85632352,	122,	13),

(86872045,	122,	20),

(90935543,	122,	13),

(91565702,	122,	11),

(10998691,	123,	7
),
(11304461,	123,	10),

(12505676,	123,	15),

(15974674,	123,	11),

(19137151,	123,	2
),
(19867677,	123,	7
),
(23607067,	123,	6
),
(23995642,	123,	18),

(28916456,	123,	7
),
(30187810,	123,	7
),
(31282994,	123,	8
),
(31628825,	123,	9
),
(31852049,	123,	4
),
(32033788,	123,	8
),
(35365463,	123,	14),

(35507115,	123,	13),

(35992111,	123,	3
),
(42685896,	123,	6
),
(42768632,	123,	5
),
(43500959,	123,	10),

(46844640,	123,	7
),
(48563699,	123,	10),

(54679482,	123,	9
),
(57467650,	123,	9
),
(59916483,	123,	10),

(64398919,	123,	6
),
(64530056,	123,	4
),
(66921228,	123,	12),

(68529349,	123,	9
),
(68677240,	123,	9
),
(71708814,	123,	10),

(80614518,	123,	13),

(81768602,	123,	11),

(84158312,	123,	8
),
(85368583,	123,	6
),
(85632352,	123,	8
),
(86872045,	123,	14),

(90935543,	123,	12),

(91565702,	123,	7
),
(10998691,	124,	3
),
(11304461,	124,	2
),
(12505676,	124,	15),

(15974674,	124,	11),

(19137151,	124,	14),

(19867677,	124,	8
),
(23607067,	124,	8
),
(23995642,	124,	20),

(28916456,	124,	6
),
(30187810,	124,	11),

(31282994,	124,	15),

(31628825,	124,	6
),
(31852049,	124,	8
),
(32033788,	124,	16),

(35365463,	124,	4
),
(35507115,	124,	10),

(35992111,	124,	5
),
(42685896,	124,	14),

(42768632,	124,	10),

(43500959,	124,	16),

(46844640,	124,	12),

(48563699,	124,	12),

(54679482,	124,	15),

(57467650,	124,	8
),
(59916483,	124,	6
),
(64398919,	124,	12),

(64530056,	124,	3
),
(66921228,	124,	9
),
(68529349,	124,	13),

(68677240,	124,	13),

(71708814,	124,	8
),
(80614518,	124,	13),

(81768602,	124,	5
),
(84158312,	124,	12),

(85368583,	124,	3
),
(85632352,	124,	13),

(86872045,	124,	11),

(90935543,	124,	16),

(91565702,	124,	11),

(10998691,	125,	2
),
(11304461,	125,	1
),
(12505676,	125,	15),

(15974674,	125,	13),

(19137151,	125,	13),

(19867677,	125,	12),

(23607067,	125,	11),

(23995642,	125,	3
),
(28916456,	125,	4
),
(30187810,	125,	8
),
(31282994,	125,	12),

(31628825,	125,	15),

(31852049,	125,	13),

(32033788,	125,	16),

(35365463,	125,	14),

(35507115,	125,	14),

(35992111,	125,	12),

(42685896,	125,	10),

(42768632,	125,	13),

(43500959,	125,	16),

(46844640,	125,	12),

(48563699,	125,	9
),
(54679482,	125,	10),

(57467650,	125,	12),

(59916483,	125,	12),

(64398919,	125,	13),

(64530056,	125,	12),

(66921228,	125,	12),

(68529349,	125,	9
),
(68677240,	125,	9
),
(71708814,	125,	13),

(80614518,	125,	6
),
(81768602,	125,	7
),
(84158312,	125,	14),

(85368583,	125,	12),

(85632352,	125,	15),

(86872045,	125,	9
),
(90935543,	125,	6
),
(91565702,	125,	11),

(10998691,	126,	19),

(11304461,	126,	12),

(12505676,	126,	14),

(15974674,	126,	9
),
(19137151,	126,	11),

(19867677,	126,	16),

(23607067,	126,	14),

(23995642,	126,	15),

(28916456,	126,	19),

(30187810,	126,	11),

(31282994,	126,	11),

(31628825,	126,	14),

(31852049,	126,	15),

(32033788,	126,	15),

(35365463,	126,	12),

(35507115,	126,	14),

(35992111,	126,	14),

(42685896,	126,	12),

(42768632,	126,	12),

(43500959,	126,	14),

(46844640,	126,	15),

(48563699,	126,	12),

(54679482,	126,	15),

(57467650,	126,	4
),
(59916483,	126,	12),

(64398919,	126,	8
),
(64530056,	126,	12),

(66921228,	126,	19),

(68529349,	126,	11),

(68677240,	126,	16),

(71708814,	126,	9
),
(80614518,	126,	15),

(81768602,	126,	14),

(84158312,	126,	11),

(85368583,	126,	15),

(85632352,	126,	16),

(86872045,	126,	15),

(90935543,	126,	10),

(91565702,	126,	15),

(10998691,	127,	12),

(11304461,	127,	19),

(12505676,	127,	9
),
(15974674,	127,	15),

(19137151,	127,	15),

(19867677,	127,	16),

(23607067,	127,	16),

(23995642,	127,	12),

(28916456,	127,	12),

(30187810,	127,	11),

(31282994,	127,	8
),
(31628825,	127,	13),

(31852049,	127,	14),

(32033788,	127,	10),

(35365463,	127,	14),

(35507115,	127,	9
),
(35992111,	127,	6
),
(42685896,	127,	8
),
(42768632,	127,	20),

(43500959,	127,	10),

(46844640,	127,	17),

(48563699,	127,	13),

(54679482,	127,	12),

(57467650,	127,	17),

(59916483,	127,	16),

(64398919,	127,	10),

(64530056,	127,	14),

(66921228,	127,	16),

(68529349,	127,	12),

(68677240,	127,	15),

(71708814,	127,	12),

(80614518,	127,	15),

(81768602,	127,	14),

(84158312,	127,	13),

(85368583,	127,	7
),
(85632352,	127,	9
),
(86872045,	127,	17),

(90935543,	127,	8
),
(91565702,	127,	12),

(10998691,	128,	6
),
(11304461,	128,	10),

(12505676,	128,	7
),
(15974674,	128,	13),

(19137151,	128,	11),

(19867677,	128,	10),

(23607067,	128,	15),

(23995642,	128,	5
),
(28916456,	128,	7
),
(30187810,	128,	9
),
(31282994,	128,	13),

(31628825,	128,	0
),
(31852049,	128,	7
),
(32033788,	128,	8
),
(35365463,	128,	12),

(35507115,	128,	7
),
(35992111,	128,	9
),
(42685896,	128,	9
),
(42768632,	128,	7
),
(43500959,	128,	3
),
(46844640,	128,	10),

(48563699,	128,	9
),
(54679482,	128,	14),

(57467650,	128,	13),

(59916483,	128,	8
),
(64398919,	128,	10),

(64530056,	128,	9
),
(66921228,	128,	6
),
(68529349,	128,	11),

(68677240,	128,	6
),
(71708814,	128,	7
),
(80614518,	128,	7
),
(81768602,	128,	15),

(84158312,	128,	10),

(85368583,	128,	6
),
(85632352,	128,	10),

(86872045,	128,	9
),
(90935543,	128,	12),

(91565702,	128,	14),

(10534206,	129,	4
),
(20236412,	129,	9
),
(20427756,	129,	5
),
(21931678,	129,	4
),
(22730658,	129,	9
),
(22844995,	129,	13),

(24474176,	129,	8
),
(27595348,	129,	12),

(27965307,	129,	12),

(28915481,	129,	11),
(29172201,	129,	12),

(30157844,	129,	11),

(30589090,	129,	12),

(35563113,	129,	8
),
(35733587,	129,	12),

(36969032,	129,	16),

(37560862,	129,	0
),
(40384219,	129,	8
),
(41609700,	129,	7
),
(43320982,	129,	14),

(45814182,	129,	14),

(52238473,	129,	12),

(53104670,	129,	6
),
(55810467,	129,	1
),
(56046099,	129,	0
),
(63156760,	129,	5
),
(63217302,	129,	10),

(63246226,	129,	13),

(64973126,	129,	4
),
(72751710,	129,	6
),
(74447273,	129,	7
),
(75640107,	129,	6
),
(84633041,	129,	6
),
(86264655,	129,	18),

(86534235,	129,	3
),
(91750903,	129,	12),

(95787979,	129,	7
),
(96820901,	129,	12),

(97314565,	129,	9
),
(10534206,	130,	10),

(20236412,	130,	10),

(20427756,	130,	8
),
(21931678,	130,	5
),
(22730658,	130,	12),

(22844995,	130,	10),

(24474176,	130,	12),

(27595348,	130,	16),

(27965307,	130,	3
),
(28915481,	130,	11),
(29172201,	130,	11),

(30157844,	130,	10),

(30589090,	130,	14),

(35563113,	130,	10),

(35733587,	130,	6
),
(36969032,	130,	7
),
(37560862,	130,	14),

(40384219,	130,	18),

(41609700,	130,	14),

(43320982,	130,	17),

(45814182,	130,	18),

(52238473,	130,	9
),
(53104670,	130,	6
),
(55810467,	130,	11),

(56046099,	130,	4
),
(63156760,	130,	13),

(63217302,	130,	16),

(63246226,	130,	8
),
(64973126,	130,	10),

(72751710,	130,	6
),
(74447273,	130,	4
),
(75640107,	130,	19),

(84633041,	130,	11),

(86264655,	130,	14),

(86534235,	130,	15),

(91750903,	130,	8
),
(95787979,	130,	10),

(96820901,	130,	17),

(97314565,	130,	11),

(10534206,	131,	14),

(20236412,	131,	10),

(20427756,	131,	10),

(21931678,	131,	11),

(22730658,	131,	11),

(22844995,	131,	9
),
(24474176,	131,	8
),
(27595348,	131,	13),

(27965307,	131,	12),

(28915481,	131,	14),

(29172201,	131,	15),

(30157844,	131,	12),

(30589090,	131,	8
),
(35563113,	131,	10),

(35733587,	131,	14),

(36969032,	131,	12),

(37560862,	131,	9
),
(40384219,	131,	14),

(41609700,	131,	16),

(43320982,	131,	17),

(45814182,	131,	17),

(52238473,	131,	9
),
(53104670,	131,	13),

(55810467,	131,	8
),
(56046099,	131,	14),

(63156760,	131,	13),

(63217302,	131,	15),

(63246226,	131,	8
),
(64973126,	131,	17),

(72751710,	131,	19),

(74447273,	131,	14),

(75640107,	131,	18),

(84633041,	131,	14),

(86264655,	131,	16),

(86534235,	131,	11),

(91750903,	131,	11),

(95787979,	131,	14),

(96820901,	131,	9
),
(97314565,	131,	10),

(10534206,	132,	10),

(20236412,	132,	6
),
(20427756,	132,	7
),
(21931678,	132,	9
),
(22730658,	132,	7
),
(22844995,	132,	3
),
(24474176,	132,	2
),
(27595348,	132,	9
),
(27965307,	132,	3
),
(28915481,	132,	9
),
(29172201,	132,	2
),
(30157844,	132,	6
),
(30589090,	132,	7
),
(35563113,	132,	4
),
(35733587,	132,	8
),
(36969032,	132,	5
),
(37560862,	132,	10),

(40384219,	132,	6
),
(41609700,	132,	0
),
(43320982,	132,	10),

(45814182,	132,	3
),
(52238473,	132,	5
),
(53104670,	132,	5
),
(55810467,	132,	2
),
(56046099,	132,	3
),
(63156760,	132,	8
),
(63217302,	132,	3
),
(63246226,	132,	10),

(64973126,	132,	7
),
(72751710,	132,	7
),
(74447273,	132,	10),

(75640107,	132,	8
),
(84633041,	132,	8
),
(86264655,	132,	5
),
(86534235,	132,	7
),
(91750903,	132,	8
),
(95787979,	132,	9
),
(96820901,	132,	6
),
(97314565,	132,	2
),
(10534206,	133,	6
),
(20236412,	133,	4
),
(20427756,	133,	1
),
(21931678,	133,	9
),
(22730658,	133,	9
),
(22844995,	133,	8
),
(24474176,	133,	14),

(27595348,	133,	10),

(27965307,	133,	4
),
(28915481,	133,	10),

(29172201,	133,	7
),
(30157844,	133,	9
),
(30589090,	133,	5
),
(35563113,	133,	14),

(35733587,	133,	9
),
(36969032,	133,	15),

(37560862,	133,	7
),
(40384219,	133,	14),

(41609700,	133,	7
),
(43320982,	133,	14),

(45814182,	133,	10),

(52238473,	133,	17),

(53104670,	133,	12),

(55810467,	133,	8
),
(56046099,	133,	13),

(63156760,	133,	5
),
(63217302,	133,	13),

(63246226,	133,	10),

(64973126,	133,	11),

(72751710,	133,	16),

(74447273,	133,	14),

(75640107,	133,	12),

(84633041,	133,	9
),
(86264655,	133,	10),

(86534235,	133,	16),

(91750903,	133,	13),

(95787979,	133,	5
),
(96820901,	133,	14),

(97314565,	133,	12),

(10534206,	134,	1
),
(20236412,	134,	9
),
(20427756,	134,	6
),
(21931678,	134,	9
),
(22730658,	134,	3
),
(22844995,	134,	11),

(24474176,	134,	15),

(27595348,	134,	3
),
(27965307,	134,	7
),
(28915481,	134,	7
),
(29172201,	134,	13),

(30157844,	134,	9
),
(30589090,	134,	6
),
(35563113,	134,	6
),
(35733587,	134,	10),

(36969032,	134,	8
),
(37560862,	134,	14),

(40384219,	134,	0
),
(41609700,	134,	13),

(43320982,	134,	8
),
(45814182,	134,	13),

(52238473,	134,	6
),
(53104670,	134,	12),

(55810467,	134,	7
),
(56046099,	134,	9
),
(63156760,	134,	10),

(63217302,	134,	14),

(63246226,	134,	13),

(64973126,	134,	7
),
(72751710,	134,	10),

(74447273,	134,	7
),
(75640107,	134,	13),

(84633041,	134,	9
),
(86264655,	134,	6
),
(86534235,	134,	10),

(91750903,	134,	9
),
(95787979,	134,	7
),
(96820901,	134,	10),

(97314565,	134,	14),

(10534206,	135,	7
),
(20236412,	135,	11),

(20427756,	135,	5
),
(21931678,	135,	4
),
(22730658,	135,	4
),
(22844995,	135,	6
),
(24474176,	135,	9
),
(27595348,	135,	12),

(27965307,	135,	12),

(28915481,	135,	9
),
(29172201,	135,	5
),
(30157844,	135,	8
),
(30589090,	135,	15),

(35563113,	135,	7
),
(35733587,	135,	10),

(36969032,	135,	9
),
(37560862,	135,	10),

(40384219,	135,	10),

(41609700,	135,	11),

(43320982,	135,	6
),
(45814182,	135,	12),

(52238473,	135,	8
),
(53104670,	135,	3
),
(55810467,	135,	8
),
(56046099,	135,	8
),
(63156760,	135,	7
),
(63217302,	135,	13),

(63246226,	135,	12),

(64973126,	135,	11),

(72751710,	135,	8
),
(74447273,	135,	6
),
(75640107,	135,	19),

(84633041,	135,	10),

(86264655,	135,	20),

(86534235,	135,	14),

(91750903,	135,	8
),
(95787979,	135,	11),

(96820901,	135,	16),

(97314565,	135,	11),

(10534206,	136,	11),

(20236412,	136,	11),

(20427756,	136,	19),

(21931678,	136,	10),

(22730658,	136,	12),

(22844995,	136,	18),

(24474176,	136,	10),

(27595348,	136,	20),

(27965307,	136,	13),

(28915481,	136,	12),

(29172201,	136,	20),

(30157844,	136,	13),

(30589090,	136,	20),

(35563113,	136,	12),

(35733587,	136,	12),

(36969032,	136,	20),

(37560862,	136,	12),

(40384219,	136,	15),

(41609700,	136,	10),

(43320982,	136,	12),

(45814182,	136,	13),

(52238473,	136,	13),

(53104670,	136,	14),

(55810467,	136,	9
),
(56046099,	136,	18),

(63156760,	136,	20),

(63217302,	136,	13),

(63246226,	136,	16),

(64973126,	136,	14),

(72751710,	136,	16),

(74447273,	136,	7
),
(75640107,	136,	12),

(84633041,	136,	12),

(86264655,	136,	12),

(86534235,	136,	9
),
(91750903,	136,	15),

(95787979,	136,	18),

(96820901,	136,	20),

(97314565,	136,	18),

(10281753,	137,	14),

(12332209,	137,	9
),
(14627641,	137,	8
),
(15710421,	137,	17),

(16659116,	137,	11),

(17123230,	137,	14),

(20885928,	137,	10),

(22715713,	137,	14),

(23166329,	137,	10),

(26047923,	137,	15),

(26487936,	137,	8
),
(27162414,	137,	16),

(27204056,	137,	8
),
(33937912,	137,	9
),
(36065627,	137,	13),

(36354616,	137,	18),

(43246940,	137,	11),

(47791655,	137,	12),

(48743705,	137,	8
),
(51572168,	137,	9
),
(52567239,	137,	12),

(52794581,	137,	12),

(55549712,	137,	5
),
(55813326,	137,	6
),
(56462246,	137,	16),

(57253118,	137,	20),

(63899654,	137,	13),

(66407977,	137,	20),

(72936625,	137,	13),

(75692632,	137,	12),

(76662813,	137,	13),

(78445718,	137,	12),

(81965142,	137,	14),

(83201687,	137,	11),

(84667886,	137,	7
),
(86461348,	137,	9
),
(89715013,	137,	2
),
(97467090,	137,	10),

(99904277,	137,	20),

(10281753,	138,	4
),
(12332209,	138,	6
),
(14627641,	138,	7
),
(15710421,	138,	15),

(16659116,	138,	9
),
(17123230,	138,	11),

(20885928,	138,	9
),
(22715713,	138,	10),

(23166329,	138,	17),

(26047923,	138,	20),

(26487936,	138,	16),

(27162414,	138,	15),

(27204056,	138,	11),

(33937912,	138,	12),

(36065627,	138,	12),

(36354616,	138,	13),

(43246940,	138,	12),

(47791655,	138,	12),

(48743705,	138,	14),

(51572168,	138,	14),

(52567239,	138,	7
),
(52794581,	138,	6
),
(55549712,	138,	10),

(55813326,	138,	9
),
(56462246,	138,	5
),
(57253118,	138,	7
),
(63899654,	138,	7
),
(66407977,	138,	4
),
(72936625,	138,	7
),
(75692632,	138,	14),

(76662813,	138,	5
),
(78445718,	138,	4
),
(81965142,	138,	9
),
(83201687,	138,	5
),
(84667886,	138,	16),

(86461348,	138,	12),

(89715013,	138,	14),

(97467090,	138,	9
),
(99904277,	138,	4
),
(10281753,	139,	4
),
(12332209,	139,	7
),
(14627641,	139,	8
),
(15710421,	139,	7
),
(16659116,	139,	10),

(17123230,	139,	8
),
(20885928,	139,	8
),
(22715713,	139,	9
),
(23166329,	139,	8
),
(26047923,	139,	8
),
(26487936,	139,	9
),
(27162414,	139,	16),

(27204056,	139,	4
),
(33937912,	139,	7
),
(36065627,	139,	12),

(36354616,	139,	15),

(43246940,	139,	5
),
(47791655,	139,	11),

(48743705,	139,	6
),
(51572168,	139,	0
),
(52567239,	139,	16),

(52794581,	139,	14),

(55549712,	139,	2
),
(55813326,	139,	12),

(56462246,	139,	11),

(57253118,	139,	10),

(63899654,	139,	2
),
(66407977,	139,	14),

(72936625,	139,	4
),
(75692632,	139,	12),

(76662813,	139,	6
),
(78445718,	139,	6
),
(81965142,	139,	11),

(83201687,	139,	6
),
(84667886,	139,	10),

(86461348,	139,	15),

(89715013,	139,	9
),
(97467090,	139,	14),

(99904277,	139,	6
),
(10281753,	140,	7
),
(12332209,	140,	5
),
(14627641,	140,	0
),
(15710421,	140,	6
),
(16659116,	140,	7
),
(17123230,	140,	7
),
(20885928,	140,	7
),
(22715713,	140,	9
),
(23166329,	140,	3
),
(26047923,	140,	7
),
(26487936,	140,	9
),
(27162414,	140,	6
),
(27204056,	140,	8
),
(33937912,	140,	3
),
(36065627,	140,	10),

(36354616,	140,	10),

(43246940,	140,	3
),
(47791655,	140,	10),

(48743705,	140,	5
),
(51572168,	140,	6
),
(52567239,	140,	2
),
(52794581,	140,	5
),
(55549712,	140,	4
),
(55813326,	140,	6
),
(56462246,	140,	3
),
(57253118,	140,	4
),
(63899654,	140,	8
),
(66407977,	140,	10),

(72936625,	140,	8
),
(75692632,	140,	3
),
(76662813,	140,	5
),
(78445718,	140,	4
),
(81965142,	140,	10),

(83201687,	140,	2
),
(84667886,	140,	6
),
(86461348,	140,	10),

(89715013,	140,	4
),
(97467090,	140,	8
),
(99904277,	140,	10),

(10281753,	141,	7
),
(12332209,	141,	10),

(14627641,	141,	13),

(15710421,	141,	12),

(16659116,	141,	7
),
(17123230,	141,	8
),
(20885928,	141,	8
),
(22715713,	141,	14),

(23166329,	141,	6
),
(26047923,	141,	13),

(26487936,	141,	13),

(27162414,	141,	16),

(27204056,	141,	14),

(33937912,	141,	6
),
(36065627,	141,	1
),
(36354616,	141,	12),

(43246940,	141,	7
),
(47791655,	141,	10),

(48743705,	141,	11),

(51572168,	141,	11),

(52567239,	141,	4
),
(52794581,	141,	6
),
(55549712,	141,	6
),
(55813326,	141,	11),

(56462246,	141,	8
),
(57253118,	141,	5
),
(63899654,	141,	13),

(66407977,	141,	12),

(72936625,	141,	11),

(75692632,	141,	13),

(76662813,	141,	15),

(78445718,	141,	12),

(81965142,	141,	4
),
(83201687,	141,	13),

(84667886,	141,	11),

(86461348,	141,	17),

(89715013,	141,	16),

(97467090,	141,	6
),
(99904277,	141,	15),

(10281753,	142,	7
),
(12332209,	142,	3
),
(14627641,	142,	6
),
(15710421,	142,	9
),
(16659116,	142,	14),

(17123230,	142,	5
),
(20885928,	142,	9
),
(22715713,	142,	12),

(23166329,	142,	13),

(26047923,	142,	6
),
(26487936,	142,	14),

(27162414,	142,	15),

(27204056,	142,	13),

(33937912,	142,	16),

(36065627,	142,	13),

(36354616,	142,	4
),
(43246940,	142,	9
),
(47791655,	142,	14),

(48743705,	142,	14),

(51572168,	142,	12),

(52567239,	142,	11),

(52794581,	142,	20),

(55549712,	142,	20),

(55813326,	142,	7
),
(56462246,	142,	5
),
(57253118,	142,	11),

(63899654,	142,	18),

(66407977,	142,	12),

(72936625,	142,	15),

(75692632,	142,	16),

(76662813,	142,	10),

(78445718,	142,	15),

(81965142,	142,	6
),
(83201687,	142,	1
),
(84667886,	142,	15),

(86461348,	142,	8
),
(89715013,	142,	3
),
(97467090,	142,	5
),
(99904277,	142,	15),

(10281753,	143,	15),

(12332209,	143,	9
),
(14627641,	143,	4
),
(15710421,	143,	2
),
(16659116,	143,	13),

(17123230,	143,	7
),
(20885928,	143,	7
),
(22715713,	143,	6
),
(23166329,	143,	8
),
(26047923,	143,	12),

(26487936,	143,	11),

(27162414,	143,	13),

(27204056,	143,	17),

(33937912,	143,	7
),
(36065627,	143,	3
),
(36354616,	143,	13),

(43246940,	143,	5
),
(47791655,	143,	7
),
(48743705,	143,	9
),
(51572168,	143,	4
),
(52567239,	143,	4
),
(52794581,	143,	11),

(55549712,	143,	11),

(55813326,	143,	7
),
(56462246,	143,	9
),
(57253118,	143,	12),

(63899654,	143,	7
),
(66407977,	143,	6
),
(72936625,	143,	4
),
(75692632,	143,	11),

(76662813,	143,	11),

(78445718,	143,	10),

(81965142,	143,	6
),
(83201687,	143,	9
),
(84667886,	143,	8
),
(86461348,	143,	16),

(89715013,	143,	7
),
(97467090,	143,	8
),
(99904277,	143,	7
),
(10281753,	144,	10),

(12332209,	144,	7
),
(14627641,	144,	8
),
(15710421,	144,	12),

(16659116,	144,	16),

(17123230,	144,	15),

(20885928,	144,	15),

(22715713,	144,	3
),
(23166329,	144,	11),

(26047923,	144,	4
),
(26487936,	144,	9
),
(27162414,	144,	13),

(27204056,	144,	11),

(33937912,	144,	9
),
(36065627,	144,	18),

(36354616,	144,	4
),
(43246940,	144,	7
),
(47791655,	144,	13),

(48743705,	144,	7
),
(51572168,	144,	9
),
(52567239,	144,	16),

(52794581,	144,	18),

(55549712,	144,	10),

(55813326,	144,	11),

(56462246,	144,	13),

(57253118,	144,	14),

(63899654,	144,	10),

(66407977,	144,	10),

(72936625,	144,	10),

(75692632,	144,	9
),
(76662813,	144,	13),

(78445718,	144,	11),

(81965142,	144,	9
),
(83201687,	144,	9
),
(84667886,	144,	6
),
(86461348,	144,	8
),
(89715013,	144,	10),

(97467090,	144,	11),

(99904277,	144,	15),

(12695343,	145,	10),

(15330035,	145,	7
),
(19611576,	145,	14),

(22491150,	145,	12),

(23144259,	145,	7
),
(24655905,	145,	15),

(25179222,	145,	9
),
(26326420,	145,	12),

(28827259,	145,	8
),
(29386219,	145,	9
),
(29557897,	145,	3
),
(30901477,	145,	17),

(34457914,	145,	12),

(34619084,	145,	15),

(35183865,	145,	10),

(39409116,	145,	8
),
(41083936,	145,	15),

(42620373,	145,	0
),
(45241147,	145,	6
),
(46275969,	145,	7
),
(50649325,	145,	11),

(53972238,	145,	4
),
(54954233,	145,	9
),
(56622972,	145,	7
),
(60594527,	145,	4
),
(61414047,	145,	8
),
(66542703,	145,	10),

(66905564,	145,	13),

(68727765,	145,	3
),
(71257664,	145,	13),

(74709445,	145,	7
),
(76257107,	145,	16),

(79360908,	145,	13),

(79593813,	145,	14),

(86510574,	145,	0
),
(86930808,	145,	9
),
(91074522,	145,	14),

(91980591,	145,	8
),
(96116283,	145,	16),

(12695343,	146,	8
),
(15330035,	146,	9
),
(19611576,	146,	4
),
(22491150,	146,	1
),
(23144259,	146,	4
),
(24655905,	146,	4
),
(25179222,	146,	7
),
(26326420,	146,	8
),
(28827259,	146,	9
),
(29386219,	146,	7
),
(29557897,	146,	6
),
(30901477,	146,	7
),
(34457914,	146,	3
),
(34619084,	146,	10),

(35183865,	146,	8
),
(39409116,	146,	4
),
(41083936,	146,	8
),
(42620373,	146,	3
),
(45241147,	146,	6
),
(46275969,	146,	8
),
(50649325,	146,	9
),
(53972238,	146,	8
),
(54954233,	146,	8
),
(56622972,	146,	5
),
(60594527,	146,	0
),
(61414047,	146,	3
),
(66542703,	146,	6
),
(66905564,	146,	10),

(68727765,	146,	10),

(71257664,	146,	7
),
(74709445,	146,	7
),
(76257107,	146,	5
),
(79360908,	146,	5
),
(79593813,	146,	6
),
(86510574,	146,	8
),
(86930808,	146,	9
),
(91074522,	146,	5
),
(91980591,	146,	10),

(96116283,	146,	6
),
(12695343,	147,	5),
(15330035,	147,	2),
(19611576,	147,	4),
(22491150,	147,	2),
(23144259,	147,	3),
(24655905,	147,	5),
(25179222,	147,	5),
(26326420,	147,	4),
(28827259,	147,	5),
(29386219,	147,	5),
(29557897,	147,	3),
(30901477,	147,	1),
(34457914,	147,	4),
(34619084,	147,	5),
(35183865,	147,	3),
(39409116,	147,	3),
(41083936,	147,	2),
(42620373,	147,	1),
(45241147,	147,	3),
(46275969,	147,	3),
(50649325,	147,	2),
(53972238,	147,	2),
(54954233,	147,	2),
(56622972,	147,	4),
(60594527,	147,	2),
(61414047,	147,	5),
(66542703,	147,	5),
(66905564,	147,	3),
(68727765,	147,	0),
(71257664,	147,	4),
(74709445,	147,	2),
(76257107,	147,	5),
(79360908,	147,	1),
(79593813,	147,	4),
(86510574,	147,	5),
(86930808,	147,	4),
(91074522,	147,	2),
(91980591,	147,	4),
(96116283,	147,	3),
(12695343,	148,	6
),
(15330035,	148,	6
),
(19611576,	148,	9
),
(22491150,	148,	10),

(23144259,	148,	13),

(24655905,	148,	3
),
(25179222,	148,	6
),
(26326420,	148,	7
),
(28827259,	148,	15),

(29386219,	148,	8
),
(29557897,	148,	0
),
(30901477,	148,	8
),
(34457914,	148,	13),

(34619084,	148,	11),

(35183865,	148,	16),

(39409116,	148,	1
),
(41083936,	148,	5
),
(42620373,	148,	11),

(45241147,	148,	11),

(46275969,	148,	6
),
(50649325,	148,	4
),
(53972238,	148,	1
),
(54954233,	148,	12),

(56622972,	148,	12),

(60594527,	148,	12),

(61414047,	148,	7
),
(66542703,	148,	8
),
(66905564,	148,	7
),
(68727765,	148,	11),

(71257664,	148,	4
),
(74709445,	148,	12),

(76257107,	148,	7
),
(79360908,	148,	3
),
(79593813,	148,	9
),
(86510574,	148,	9
),
(86930808,	148,	5
),
(91074522,	148,	14),

(91980591,	148,	14),

(96116283,	148,	2
),
(12695343,	149,	10),

(15330035,	149,	6
),
(19611576,	149,	9
),
(22491150,	149,	8
),
(23144259,	149,	15),

(24655905,	149,	3
),
(25179222,	149,	13),

(26326420,	149,	6
),
(28827259,	149,	16),

(29386219,	149,	12),

(29557897,	149,	16),

(30901477,	149,	12),

(34457914,	149,	7
),
(34619084,	149,	12),

(35183865,	149,	10),

(39409116,	149,	6
),
(41083936,	149,	11),

(42620373,	149,	20),

(45241147,	149,	14),

(46275969,	149,	20),

(50649325,	149,	20),

(53972238,	149,	9
),
(54954233,	149,	9
),
(56622972,	149,	9
),
(60594527,	149,	18),

(61414047,	149,	9
),
(66542703,	149,	5
),
(66905564,	149,	14),

(68727765,	149,	7
),
(71257664,	149,	15),

(74709445,	149,	12),

(76257107,	149,	15),

(79360908,	149,	13),

(79593813,	149,	9
),
(86510574,	149,	17),

(86930808,	149,	8
),
(91074522,	149,	11),

(91980591,	149,	13),

(96116283,	149,	11),

(12695343,	150,	4
),
(15330035,	150,	15),

(19611576,	150,	14),

(22491150,	150,	6
),
(23144259,	150,	13),

(24655905,	150,	11),

(25179222,	150,	4
),
(26326420,	150,	11),

(28827259,	150,	12),

(29386219,	150,	0
),
(29557897,	150,	2
),
(30901477,	150,	9
),
(34457914,	150,	7
),
(34619084,	150,	13),

(35183865,	150,	7
),
(39409116,	150,	9
),
(41083936,	150,	5
),
(42620373,	150,	12),

(45241147,	150,	5
),
(46275969,	150,	5
),
(50649325,	150,	8
),
(53972238,	150,	7
),
(54954233,	150,	6
),
(56622972,	150,	8
),
(60594527,	150,	5
),
(61414047,	150,	4
),
(66542703,	150,	9
),
(66905564,	150,	12),

(68727765,	150,	15),

(71257664,	150,	8
),
(74709445,	150,	3
),
(76257107,	150,	3
),
(79360908,	150,	4
),
(79593813,	150,	5
),
(86510574,	150,	13),

(86930808,	150,	10),

(91074522,	150,	9
),
(91980591,	150,	9
),
(96116283,	150,	0
),
(12695343,	151,	11),

(15330035,	151,	9
),
(19611576,	151,	10),

(22491150,	151,	9
),
(23144259,	151,	14),

(24655905,	151,	6
),
(25179222,	151,	9
),
(26326420,	151,	5
),
(28827259,	151,	5
),
(29386219,	151,	9
),
(29557897,	151,	12),

(30901477,	151,	9
),
(34457914,	151,	8
),
(34619084,	151,	5
),
(35183865,	151,	11),

(39409116,	151,	12),

(41083936,	151,	10),

(42620373,	151,	18),

(45241147,	151,	9
),
(46275969,	151,	9
),
(50649325,	151,	16),

(53972238,	151,	17),

(54954233,	151,	13),

(56622972,	151,	8
),
(60594527,	151,	16),

(61414047,	151,	9
),
(66542703,	151,	9
),
(66905564,	151,	7
),
(68727765,	151,	11),

(71257664,	151,	15),

(74709445,	151,	6
),
(76257107,	151,	12),

(79360908,	151,	10),

(79593813,	151,	16),

(86510574,	151,	13),

(86930808,	151,	15),

(91074522,	151,	16),

(91980591,	151,	15),

(96116283,	151,	19),

(12695343,	152,	7
),
(15330035,	152,	10),

(19611576,	152,	8
),
(22491150,	152,	5
),
(23144259,	152,	10),

(24655905,	152,	5
),
(25179222,	152,	6
),
(26326420,	152,	3
),
(28827259,	152,	3
),
(29386219,	152,	7
),
(29557897,	152,	10),

(30901477,	152,	2
),
(34457914,	152,	9
),
(34619084,	152,	1
),
(35183865,	152,	5
),
(39409116,	152,	10),

(41083936,	152,	10),

(42620373,	152,	0
),
(45241147,	152,	7
),
(46275969,	152,	9
),
(50649325,	152,	5
),
(53972238,	152,	8
),
(54954233,	152,	4
),
(56622972,	152,	10),

(60594527,	152,	4
),
(61414047,	152,	10),

(66542703,	152,	9
),
(66905564,	152,	4
),
(68727765,	152,	9
),
(71257664,	152,	6
),
(74709445,	152,	7
),
(76257107,	152,	5
),
(79360908,	152,	10),

(79593813,	152,	9
),
(86510574,	152,	9
),
(86930808,	152,	10),

(91074522,	152,	6
),
(91980591,	152,	5
),
(96116283,	152,	7
),
(13933301,	153,	7
),
(16797391,	153,	3
),
(18029580,	153,	4
),
(23412027,	153,	7
),
(33583386,	153,	0
),
(33809838,	153,	11),

(35544401,	153,	0
),
(38867925,	153,	11),

(39014661,	153,	5
),
(40177208,	153,	4
),
(44508242,	153,	9
),
(44975872,	153,	13),

(45124404,	153,	13),

(46341250,	153,	11),

(47992460,	153,	7
),
(50255297,	153,	9
),
(54277909,	153,	13),

(55075253,	153,	9
),
(55481497,	153,	12),

(55920827,	153,	7
),
(59394502,	153,	5
),
(60555723,	153,	11),

(61496547,	153,	8
),
(62998010,	153,	8
),
(64445490,	153,	6
),
(65440089,	153,	11),

(66080147,	153,	11),

(72165244,	153,	9
),
(73317454,	153,	11),

(74288538,	153,	6
),
(77026788,	153,	7
),
(77271695,	153,	5
),
(78162009,	153,	3
),
(78641051,	153,	5
),
(82567240,	153,	11),

(85700983,	153,	12),

(87657665,	153,	2
),
(89132300,	153,	5
),
(92475083,	153,	11),

(13933301,	154,	5
),
(16797391,	154,	3
),
(18029580,	154,	6
),
(23412027,	154,	6
),
(33583386,	154,	8
),
(33809838,	154,	6
),
(35544401,	154,	1
),
(38867925,	154,	5
),
(39014661,	154,	10),

(40177208,	154,	6
),
(44508242,	154,	10),

(44975872,	154,	8
),
(45124404,	154,	10),

(46341250,	154,	8
),
(47992460,	154,	10),

(50255297,	154,	7
),
(54277909,	154,	7
),
(55075253,	154,	10),

(55481497,	154,	6
),
(55920827,	154,	6
),
(59394502,	154,	10),

(60555723,	154,	10),

(61496547,	154,	6
),
(62998010,	154,	5
),
(64445490,	154,	9
),
(65440089,	154,	5
),
(66080147,	154,	6
),
(72165244,	154,	10),

(73317454,	154,	6
),
(74288538,	154,	9
),
(77026788,	154,	7
),
(77271695,	154,	9
),
(78162009,	154,	7
),
(78641051,	154,	7
),
(82567240,	154,	10),

(85700983,	154,	10),

(87657665,	154,	3
),
(89132300,	154,	5
),
(92475083,	154,	4
),
(13933301,	155,	2),
(16797391,	155,	5),
(18029580,	155,	4),
(23412027,	155,	4),
(33583386,	155,	7),
(33809838,	155,	7),
(35544401,	155,	1),
(38867925,	155,	6),
(39014661,	155,	2),
(40177208,	155,	3),
(44508242,	155,	8),
(44975872,	155,	3),
(45124404,	155,	3),
(46341250,	155,	1),
(47992460,	155,	6),
(50255297,	155,	2),
(54277909,	155,	4),
(55075253,	155,	3),
(55481497,	155,	6),
(55920827,	155,	1),
(59394502,	155,	0),
(60555723,	155,	0),
(61496547,	155,	7),
(62998010,	155,	3),
(64445490,	155,	5),
(65440089,	155,	3),
(66080147,	155,	6),
(72165244,	155,	5),
(73317454,	155,	5),
(74288538,	155,	2),
(77026788,	155,	3),
(77271695,	155,	5),
(78162009,	155,	6),
(78641051,	155,	9),
(82567240,	155,	9),
(85700983,	155,	2),
(87657665,	155,	1),
(89132300,	155,	4),
(92475083,	155,	6),
(13933301,	156,	14),

(16797391,	156,	17),

(18029580,	156,	10),

(23412027,	156,	13),

(33583386,	156,	15),

(33809838,	156,	15),

(35544401,	156,	12),

(38867925,	156,	13),

(39014661,	156,	16),

(40177208,	156,	12),

(44508242,	156,	13),

(44975872,	156,	11),

(45124404,	156,	13),

(46341250,	156,	10),

(47992460,	156,	19),

(50255297,	156,	12),

(54277909,	156,	14),

(55075253,	156,	16),

(55481497,	156,	19),

(55920827,	156,	15),

(59394502,	156,	13),

(60555723,	156,	20),

(61496547,	156,	9
),
(62998010,	156,	15),

(64445490,	156,	17),

(65440089,	156,	13),

(66080147,	156,	20),

(72165244,	156,	9
),
(73317454,	156,	16),

(74288538,	156,	18),

(77026788,	156,	11),

(77271695,	156,	13),

(78162009,	156,	14),

(78641051,	156,	15),

(82567240,	156,	7
),
(85700983,	156,	6
),
(87657665,	156,	15),

(89132300,	156,	9
),
(92475083,	156,	11),

(13933301,	157,	10),

(16797391,	157,	7
),
(18029580,	157,	6
),
(23412027,	157,	8
),
(33583386,	157,	3
),
(33809838,	157,	7
),
(35544401,	157,	3
),
(38867925,	157,	8
),
(39014661,	157,	10),

(40177208,	157,	10),

(44508242,	157,	10),

(44975872,	157,	6
),
(45124404,	157,	8
),
(46341250,	157,	9
),
(47992460,	157,	8
),
(50255297,	157,	5
),
(54277909,	157,	6
),
(55075253,	157,	9
),
(55481497,	157,	9
),
(55920827,	157,	5
),
(59394502,	157,	6
),
(60555723,	157,	3
),
(61496547,	157,	10),

(62998010,	157,	6
),
(64445490,	157,	7
),
(65440089,	157,	2
),
(66080147,	157,	10),

(72165244,	157,	6
),
(73317454,	157,	6
),
(74288538,	157,	7
),
(77026788,	157,	3
),
(77271695,	157,	10),

(78162009,	157,	9
),
(78641051,	157,	9
),
(82567240,	157,	10),

(85700983,	157,	8
),
(87657665,	157,	8
),
(89132300,	157,	10),

(92475083,	157,	6
),
(13933301,	158,	13),

(16797391,	158,	20),

(18029580,	158,	14),

(23412027,	158,	12),

(33583386,	158,	12),

(33809838,	158,	9
),
(35544401,	158,	10),

(38867925,	158,	7
),
(39014661,	158,	7
),
(40177208,	158,	18),

(44508242,	158,	12),

(44975872,	158,	8
),
(45124404,	158,	11),

(46341250,	158,	16),

(47992460,	158,	14),

(50255297,	158,	12),

(54277909,	158,	10),

(55075253,	158,	8
),
(55481497,	158,	19),

(55920827,	158,	18),

(59394502,	158,	17),

(60555723,	158,	12),

(61496547,	158,	14),

(62998010,	158,	10),

(64445490,	158,	13),

(65440089,	158,	11),

(66080147,	158,	9
),
(72165244,	158,	14),

(73317454,	158,	14),

(74288538,	158,	6
),
(77026788,	158,	13),

(77271695,	158,	9
),
(78162009,	158,	10),

(78641051,	158,	15),

(82567240,	158,	14),

(85700983,	158,	5
),
(87657665,	158,	11),

(89132300,	158,	11),

(92475083,	158,	15),

(13933301,	159,	11),

(16797391,	159,	15),

(18029580,	159,	12),

(23412027,	159,	9
),
(33583386,	159,	15),

(33809838,	159,	17),

(35544401,	159,	0
),
(38867925,	159,	17),

(39014661,	159,	14),

(40177208,	159,	14),

(44508242,	159,	16),

(44975872,	159,	11),

(45124404,	159,	4
),
(46341250,	159,	18),

(47992460,	159,	14),

(50255297,	159,	16),

(54277909,	159,	20),

(55075253,	159,	16),

(55481497,	159,	20),

(55920827,	159,	19),

(59394502,	159,	11),

(60555723,	159,	18),

(61496547,	159,	13),

(62998010,	159,	6
),
(64445490,	159,	20),

(65440089,	159,	4
),
(66080147,	159,	12),

(72165244,	159,	12),

(73317454,	159,	20),

(74288538,	159,	12),

(77026788,	159,	16),

(77271695,	159,	17),

(78162009,	159,	10),

(78641051,	159,	12),

(82567240,	159,	20),

(85700983,	159,	15),

(87657665,	159,	20),

(89132300,	159,	15),

(92475083,	159,	15),

(13933301,	160,	10),

(16797391,	160,	10),

(18029580,	160,	12),

(23412027,	160,	5
),
(33583386,	160,	9
),
(33809838,	160,	5
),
(35544401,	160,	8
),
(38867925,	160,	11),

(39014661,	160,	6
),
(40177208,	160,	15),

(44508242,	160,	6
),
(44975872,	160,	9
),
(45124404,	160,	10),

(46341250,	160,	9
),
(47992460,	160,	4
),
(50255297,	160,	10),

(54277909,	160,	9
),
(55075253,	160,	9
),
(55481497,	160,	7
),
(55920827,	160,	9
),
(59394502,	160,	12),

(60555723,	160,	14),

(61496547,	160,	15),

(62998010,	160,	10),

(64445490,	160,	11),

(65440089,	160,	4
),
(66080147,	160,	7
),
(72165244,	160,	2
),
(73317454,	160,	12),

(74288538,	160,	5
),
(77026788,	160,	12),

(77271695,	160,	6
),
(78162009,	160,	9
),
(78641051,	160,	6
),
(82567240,	160,	7
),
(85700983,	160,	12),

(87657665,	160,	17),

(89132300,	160,	12),

(92475083,	160,	8
),
(11060460,	161,	12),

(12676344,	161,	9
),
(13798907,	161,	5
),
(14857390,	161,	11),

(14876495,	161,	9
),
(15291264,	161,	10),

(15835420,	161,	11),

(17358086,	161,	9
),
(18167729,	161,	9
),
(22735531,	161,	8
),
(31721186,	161,	8
),
(33551716,	161,	9
),
(37864801,	161,	7
),
(39028666,	161,	11),

(39291233,	161,	7
),
(42119585,	161,	5
),
(44618350,	161,	15),

(44809709,	161,	11),

(47500359,	161,	9
),
(51067129,	161,	9
),
(53414159,	161,	9
),
(58498985,	161,	9
),
(59542319,	161,	3
),
(60436435,	161,	10),

(63239930,	161,	9
),
(67735490,	161,	9
),
(68243902,	161,	6
),
(70714030,	161,	6
),
(71582989,	161,	15),

(82232362,	161,	7
),
(86606105,	161,	17),

(88571574,	161,	9
),
(92033729,	161,	9
),
(92343797,	161,	11),

(92883827,	161,	10),

(93501906,	161,	13),

(95481005,	161,	6
),
(97792734,	161,	12),

(99115530,	161,	7
),
(11060460,	162,	13),

(12676344,	162,	14),

(13798907,	162,	4
),
(14857390,	162,	17),

(14876495,	162,	8
),
(15291264,	162,	8
),
(15835420,	162,	5
),
(17358086,	162,	12),

(18167729,	162,	14),

(22735531,	162,	7
),
(31721186,	162,	8
),
(33551716,	162,	12),

(37864801,	162,	9
),
(39028666,	162,	13),
(39291233,	162,	4
),
(42119585,	162,	8
),
(44618350,	162,	11),

(44809709,	162,	12),

(47500359,	162,	11),

(51067129,	162,	13),

(53414159,	162,	14),

(58498985,	162,	5
),
(59542319,	162,	10),

(60436435,	162,	12),

(63239930,	162,	7
),
(67735490,	162,	8
),
(68243902,	162,	5
),
(70714030,	162,	12),

(71582989,	162,	8
),
(82232362,	162,	2
),
(86606105,	162,	16),

(88571574,	162,	16),

(92033729,	162,	12),

(92343797,	162,	7
),
(92883827,	162,	11),

(93501906,	162,	5
),
(95481005,	162,	11),

(97792734,	162,	6
),
(99115530,	162,	5
),
(11060460,	163,	6
),
(12676344,	163,	6
),
(13798907,	163,	6
),
(14857390,	163,	7
),
(14876495,	163,	7),
(15291264,	163,	8
),
(15835420,	163,	10),

(17358086,	163,	6
),
(18167729,	163,	7
),
(22735531,	163,	7
),
(31721186,	163,	9
),
(33551716,	163,	6
),
(37864801,	163,	0
),
(39028666,	163,	5
),
(39291233,	163,	12),

(42119585,	163,	3
),
(44618350,	163,	11),

(44809709,	163,	8
),
(47500359,	163,	4
),
(51067129,	163,	12),

(53414159,	163,	5
),
(58498985,	163,	10),

(59542319,	163,	10),

(60436435,	163,	1
),
(63239930,	163,	12),

(67735490,	163,	15),

(68243902,	163,	6
),
(70714030,	163,	6
),
(71582989,	163,	3
),
(82232362,	163,	5
),
(86606105,	163,	3
),
(88571574,	163,	10),

(92033729,	163,	10),

(92343797,	163,	12),

(92883827,	163,	8
),
(93501906,	163,	13),

(95481005,	163,	8
),
(97792734,	163,	10),

(99115530,	163,	5
),
(11060460,	164,	14),

(12676344,	164,	13),

(13798907,	164,	16),

(14857390,	164,	15),

(14876495,	164,	11),

(15291264,	164,	13),

(15835420,	164,	8
),
(17358086,	164,	15),

(18167729,	164,	14),

(22735531,	164,	15),

(31721186,	164,	6
),
(33551716,	164,	6
),
(37864801,	164,	12),

(39028666,	164,	20),
(39291233,	164,	7
),
(42119585,	164,	6
),
(44618350,	164,	19),

(44809709,	164,	20),

(47500359,	164,	11),

(51067129,	164,	14),

(53414159,	164,	20),

(58498985,	164,	13),

(59542319,	164,	14),

(60436435,	164,	20),

(63239930,	164,	17),

(67735490,	164,	19),

(68243902,	164,	14),

(70714030,	164,	14),

(71582989,	164,	20),

(82232362,	164,	8
),
(86606105,	164,	14),

(88571574,	164,	16),

(92033729,	164,	5
),
(92343797,	164,	15),

(92883827,	164,	12),

(93501906,	164,	11),

(95481005,	164,	18),

(97792734,	164,	19),

(99115530,	164,	15),

(11060460,	165,	3),
(12676344,	165,	5),
(13798907,	165,	4),
(14857390,	165,	3),
(14876495,	165,	4),
(15291264,	165,	5),
(15835420,	165,	5),
(17358086,	165,	4),
(18167729,	165,	4),
(22735531,	165,	5),
(31721186,	165,	5),
(33551716,	165,	5),
(37864801,	165,	3),
(39028666,	165,	4),
(39291233,	165,	5),
(42119585,	165,	4),
(44618350,	165,	5),
(44809709,	165,	5),
(47500359,	165,	5),
(51067129,	165,	5),
(53414159,	165,	5),
(58498985,	165,	5),
(59542319,	165,	5),
(60436435,	165,	1),
(63239930,	165,	5),
(67735490,	165,	4),
(68243902,	165,	5),
(70714030,	165,	4),
(71582989,	165,	5),
(82232362,	165,	3),
(86606105,	165,	3),
(88571574,	165,	5),
(92033729,	165,	0),
(92343797,	165,	2),
(92883827,	165,	4),
(93501906,	165,	5),
(95481005,	165,	3),
(97792734,	165,	3),
(99115530,	165,	5),
(11060460,	166,	8
),
(12676344,	166,	4
),
(13798907,	166,	3
),
(14857390,	166,	5
),
(14876495,	166,	3),
(15291264,	166,	3
),
(15835420,	166,	0
),
(17358086,	166,	10),

(18167729,	166,	5
),
(22735531,	166,	5
),
(31721186,	166,	8
),
(33551716,	166,	5
),
(37864801,	166,	10),

(39028666,	166,	4
),
(39291233,	166,	10),

(42119585,	166,	3
),
(44618350,	166,	9
),
(44809709,	166,	4
),
(47500359,	166,	8
),
(51067129,	166,	9
),
(53414159,	166,	8
),
(58498985,	166,	5
),
(59542319,	166,	5
),
(60436435,	166,	6
),
(63239930,	166,	2
),
(67735490,	166,	9
),
(68243902,	166,	5
),
(70714030,	166,	8
),
(71582989,	166,	9
),
(82232362,	166,	4
),
(86606105,	166,	4
),
(88571574,	166,	3
),
(92033729,	166,	5
),
(92343797,	166,	9
),
(92883827,	166,	3
),
(93501906,	166,	7
),
(95481005,	166,	10),

(97792734,	166,	9
),
(99115530,	166,	8
),
(11060460,	167,	2
),
(12676344,	167,	7
),
(13798907,	167,	14),

(14857390,	167,	14),

(14876495,	167,	13),

(15291264,	167,	16),

(15835420,	167,	15),

(17358086,	167,	11),

(18167729,	167,	15),

(22735531,	167,	6
),
(31721186,	167,	11),

(33551716,	167,	17),

(37864801,	167,	7
),
(39028666,	167,	13),
(39291233,	167,	11),

(42119585,	167,	17),

(44618350,	167,	6
),
(44809709,	167,	12),

(47500359,	167,	6
),
(51067129,	167,	14),

(53414159,	167,	8
),
(58498985,	167,	12),

(59542319,	167,	14),

(60436435,	167,	13),

(63239930,	167,	17),

(67735490,	167,	16),

(68243902,	167,	12),

(70714030,	167,	7
),
(71582989,	167,	14),

(82232362,	167,	9
),
(86606105,	167,	13),

(88571574,	167,	10),

(92033729,	167,	10),

(92343797,	167,	13),

(92883827,	167,	17),

(93501906,	167,	12),

(95481005,	167,	10),

(97792734,	167,	14),

(99115530,	167,	20),

(11060460,	168,	10),

(12676344,	168,	8
),
(13798907,	168,	10),

(14857390,	168,	15),

(14876495,	168,	13),
(15291264,	168,	15),

(15835420,	168,	9
),
(17358086,	168,	6
),
(18167729,	168,	15),

(22735531,	168,	10),

(31721186,	168,	3
),
(33551716,	168,	13),

(37864801,	168,	9
),
(39028666,	168,	6
),
(39291233,	168,	10),

(42119585,	168,	15),

(44618350,	168,	5
),
(44809709,	168,	6
),
(47500359,	168,	10),

(51067129,	168,	17),

(53414159,	168,	20),

(58498985,	168,	10),

(59542319,	168,	11),

(60436435,	168,	15),

(63239930,	168,	8
),
(67735490,	168,	7
),
(68243902,	168,	16),

(70714030,	168,	3
),
(71582989,	168,	19),

(82232362,	168,	8
),
(86606105,	168,	14),

(88571574,	168,	4
),
(92033729,	168,	14),

(92343797,	168,	5
),
(92883827,	168,	20),

(93501906,	168,	20),

(95481005,	168,	6
),
(97792734,	168,	12),

(99115530,	168,	14),

(11244206,	169,	12),

(12057283,	169,	16),

(13668883,	169,	17),

(13684450,	169,	17),

(14493579,	169,	11),

(17188037,	169,	9
),
(19542698,	169,	11),

(24834676,	169,	15),

(26790179,	169,	10),

(31193777,	169,	19),

(31568819,	169,	14),

(33871863,	169,	15),

(36598030,	169,	13),

(44005211,	169,	20),

(44008477,	169,	8
),
(47468588,	169,	15),

(48126470,	169,	15),

(50417103,	169,	13),

(51671643,	169,	15),

(52220638,	169,	15),

(59334127,	169,	15),

(63887324,	169,	14),

(64578632,	169,	18),

(69181739,	169,	17),

(74239452,	169,	18),

(75119033,	169,	16),

(77713039,	169,	16),

(77718435,	169,	9
),
(79468224,	169,	19),

(80712718,	169,	13),

(81512193,	169,	12),

(81753964,	169,	19),

(89130287,	169,	16),

(90582251,	169,	12),

(93040696,	169,	18),

(93220018,	169,	15),

(94248610,	169,	15),

(96590182,	169,	18),

(99597461,	169,	16),

(11244206,	170,	7
),
(12057283,	170,	14),

(13668883,	170,	12),

(13684450,	170,	6
),
(14493579,	170,	14),

(17188037,	170,	13),

(19542698,	170,	10),

(24834676,	170,	8
),
(26790179,	170,	13),

(31193777,	170,	4
),
(31568819,	170,	14),

(33871863,	170,	20),

(36598030,	170,	14),

(44005211,	170,	17),

(44008477,	170,	12),

(47468588,	170,	14),

(48126470,	170,	20),

(50417103,	170,	4
),
(51671643,	170,	8
),
(52220638,	170,	13),

(59334127,	170,	17),

(63887324,	170,	17),

(64578632,	170,	12),

(69181739,	170,	9
),
(74239452,	170,	17),

(75119033,	170,	9
),
(77713039,	170,	2
),
(77718435,	170,	17),

(79468224,	170,	12),

(80712718,	170,	12),

(81512193,	170,	14),

(81753964,	170,	13),

(89130287,	170,	15),

(90582251,	170,	14),

(93040696,	170,	17),

(93220018,	170,	9
),
(94248610,	170,	5
),
(96590182,	170,	13),

(99597461,	170,	13),

(11244206,	171,	13),

(12057283,	171,	18),

(13668883,	171,	19),

(13684450,	171,	8
),
(14493579,	171,	10),

(17188037,	171,	10),

(19542698,	171,	7
),
(24834676,	171,	13),

(26790179,	171,	8
),
(31193777,	171,	11),

(31568819,	171,	14),

(33871863,	171,	7
),
(36598030,	171,	11),

(44005211,	171,	11),

(44008477,	171,	13),

(47468588,	171,	14),

(48126470,	171,	17),

(50417103,	171,	17),

(51671643,	171,	9
),
(52220638,	171,	14),

(59334127,	171,	13),

(63887324,	171,	11),

(64578632,	171,	13),

(69181739,	171,	13),

(74239452,	171,	16),

(75119033,	171,	20),

(77713039,	171,	17),

(77718435,	171,	8
),
(79468224,	171,	13),

(80712718,	171,	13),

(81512193,	171,	10),

(81753964,	171,	18),

(89130287,	171,	10),

(90582251,	171,	9
),
(93040696,	171,	14),

(93220018,	171,	13),

(94248610,	171,	20),

(96590182,	171,	8
),
(99597461,	171,	19),

(11244206,	172,	20),

(12057283,	172,	14),

(13668883,	172,	1
),
(13684450,	172,	9
),
(14493579,	172,	12),

(17188037,	172,	11),

(19542698,	172,	12),

(24834676,	172,	6
),
(26790179,	172,	16),

(31193777,	172,	8
),
(31568819,	172,	6
),
(33871863,	172,	14),

(36598030,	172,	5
),
(44005211,	172,	0
),
(44008477,	172,	9
),
(47468588,	172,	3
),
(48126470,	172,	5
),
(50417103,	172,	4
),
(51671643,	172,	13),

(52220638,	172,	4
),
(59334127,	172,	17),

(63887324,	172,	5
),
(64578632,	172,	14),

(69181739,	172,	17),

(74239452,	172,	3
),
(75119033,	172,	9
),
(77713039,	172,	7
),
(77718435,	172,	7
),
(79468224,	172,	15),

(80712718,	172,	11),

(81512193,	172,	7
),
(81753964,	172,	8
),
(89130287,	172,	9
),
(90582251,	172,	14),

(93040696,	172,	11),

(93220018,	172,	14),

(94248610,	172,	12),

(96590182,	172,	6
),
(99597461,	172,	11),

(11244206,	173,	17),

(12057283,	173,	14),

(13668883,	173,	6
),
(13684450,	173,	10),

(14493579,	173,	9
),
(17188037,	173,	16),

(19542698,	173,	12),

(24834676,	173,	14),

(26790179,	173,	18),

(31193777,	173,	7
),
(31568819,	173,	19),

(33871863,	173,	10),

(36598030,	173,	10),

(44005211,	173,	18),

(44008477,	173,	20),

(47468588,	173,	10),

(48126470,	173,	15),

(50417103,	173,	17),

(51671643,	173,	8
),
(52220638,	173,	15),

(59334127,	173,	17),

(63887324,	173,	13),

(64578632,	173,	5
),
(69181739,	173,	11),

(74239452,	173,	15),

(75119033,	173,	19),

(77713039,	173,	16),

(77718435,	173,	15),

(79468224,	173,	8
),
(80712718,	173,	20),

(81512193,	173,	16),

(81753964,	173,	6
),
(89130287,	173,	7
),
(90582251,	173,	10),

(93040696,	173,	19),

(93220018,	173,	19),

(94248610,	173,	15),

(96590182,	173,	20),

(99597461,	173,	8
),
(11244206,	174,	5
),
(12057283,	174,	0
),
(13668883,	174,	7
),
(13684450,	174,	2
),
(14493579,	174,	4
),
(17188037,	174,	2
),
(19542698,	174,	3
),
(24834676,	174,	9
),
(26790179,	174,	0
),
(31193777,	174,	5
),
(31568819,	174,	7
),
(33871863,	174,	8
),
(36598030,	174,	4
),
(44005211,	174,	10),

(44008477,	174,	5
),
(47468588,	174,	6
),
(48126470,	174,	6
),
(50417103,	174,	4
),
(51671643,	174,	8
),
(52220638,	174,	1
),
(59334127,	174,	6
),
(63887324,	174,	6
),
(64578632,	174,	0
),
(69181739,	174,	5
),
(74239452,	174,	6
),
(75119033,	174,	4
),
(77713039,	174,	6
),
(77718435,	174,	3
),
(79468224,	174,	1
),
(80712718,	174,	5
),
(81512193,	174,	5
),
(81753964,	174,	2
),
(89130287,	174,	7
),
(90582251,	174,	4
),
(93040696,	174,	7
),
(93220018,	174,	3
),
(94248610,	174,	5
),
(96590182,	174,	9
),
(99597461,	174,	8
),
(11244206,	175,	13),

(12057283,	175,	14),

(13668883,	175,	9
),
(13684450,	175,	9
),
(14493579,	175,	9
),
(17188037,	175,	16),

(19542698,	175,	9
),
(24834676,	175,	11),

(26790179,	175,	6
),
(31193777,	175,	14),

(31568819,	175,	16),

(33871863,	175,	8
),
(36598030,	175,	8
),
(44005211,	175,	15),

(44008477,	175,	11),

(47468588,	175,	6
),
(48126470,	175,	9
),
(50417103,	175,	14),

(51671643,	175,	10),

(52220638,	175,	6
),
(59334127,	175,	14),

(63887324,	175,	7
),
(64578632,	175,	0
),
(69181739,	175,	8
),
(74239452,	175,	7
),
(75119033,	175,	7
),
(77713039,	175,	9
),
(77718435,	175,	9
),
(79468224,	175,	6
),
(80712718,	175,	7
),
(81512193,	175,	6
),
(81753964,	175,	20),

(89130287,	175,	13),

(90582251,	175,	12),

(93040696,	175,	4
),
(93220018,	175,	7
),
(94248610,	175,	15),

(96590182,	175,	11),

(99597461,	175,	2
),
(11244206,	176,	5
),
(12057283,	176,	12),

(13668883,	176,	12),

(13684450,	176,	15),

(14493579,	176,	11),

(17188037,	176,	7
),
(19542698,	176,	10),

(24834676,	176,	7
),
(26790179,	176,	8
),
(31193777,	176,	12),

(31568819,	176,	13),

(33871863,	176,	8
),
(36598030,	176,	4
),
(44005211,	176,	11),

(44008477,	176,	12),

(47468588,	176,	15),

(48126470,	176,	13),

(50417103,	176,	8
),
(51671643,	176,	7
),
(52220638,	176,	15),

(59334127,	176,	2
),
(63887324,	176,	6
),
(64578632,	176,	11),

(69181739,	176,	7
),
(74239452,	176,	5
),
(75119033,	176,	3
),
(77713039,	176,	15),

(77718435,	176,	10),

(79468224,	176,	9
),
(80712718,	176,	11),

(81512193,	176,	3
),
(81753964,	176,	15),

(89130287,	176,	7
),
(90582251,	176,	8
),
(93040696,	176,	3
),
(93220018,	176,	16),

(94248610,	176,	3
),
(96590182,	176,	12),

(99597461,	176,	8
),
(10998691,	177,	8
),
(11304461,	177,	8
),
(12505676,	177,	11),

(15974674,	177,	8
),
(19137151,	177,	9
),
(19867677,	177,	14),

(23607067,	177,	6
),
(23995642,	177,	12),

(28916456,	177,	12),

(30187810,	177,	8
),
(31282994,	177,	9
),
(31628825,	177,	8
),
(31852049,	177,	16),

(32033788,	177,	10),

(35365463,	177,	7
),
(35507115,	177,	8
),
(35992111,	177,	8
),
(42685896,	177,	11),

(42768632,	177,	12),

(43500959,	177,	11),

(46844640,	177,	7
),
(48563699,	177,	7
),
(54679482,	177,	13),

(57467650,	177,	13),

(59916483,	177,	13),

(64398919,	177,	9
),
(64530056,	177,	15),

(66921228,	177,	10),

(68529349,	177,	12),

(68677240,	177,	8
),
(71708814,	177,	3
),
(80614518,	177,	9
),
(81768602,	177,	13),

(84158312,	177,	8
),
(85368583,	177,	11),

(85632352,	177,	14),

(86872045,	177,	11),

(90935543,	177,	7
),
(91565702,	177,	13),

(10998691,	178,	14),

(11304461,	178,	9
),
(12505676,	178,	8
),
(15974674,	178,	18),

(19137151,	178,	8
),
(19867677,	178,	20),

(23607067,	178,	17),

(23995642,	178,	19),

(28916456,	178,	10),

(30187810,	178,	8
),
(31282994,	178,	19),

(31628825,	178,	13),

(31852049,	178,	12),

(32033788,	178,	18),

(35365463,	178,	16),

(35507115,	178,	18),

(35992111,	178,	16),

(42685896,	178,	4
),
(42768632,	178,	19),

(43500959,	178,	10),

(46844640,	178,	19),

(48563699,	178,	8
),
(54679482,	178,	11),

(57467650,	178,	13),

(59916483,	178,	7
),
(64398919,	178,	14),

(64530056,	178,	6
),
(66921228,	178,	10),

(68529349,	178,	11),

(68677240,	178,	18),

(71708814,	178,	10),

(80614518,	178,	5
),
(81768602,	178,	14),

(84158312,	178,	16),

(85368583,	178,	20),

(85632352,	178,	15),

(86872045,	178,	9
),
(90935543,	178,	13),

(91565702,	178,	10),

(10998691,	179,	9
),
(11304461,	179,	10),

(12505676,	179,	17),

(15974674,	179,	5
),
(19137151,	179,	0
),
(19867677,	179,	13),

(23607067,	179,	11),

(23995642,	179,	15),

(28916456,	179,	13),

(30187810,	179,	9
),
(31282994,	179,	16),

(31628825,	179,	13),

(31852049,	179,	16),

(32033788,	179,	11),

(35365463,	179,	10),

(35507115,	179,	6
),
(35992111,	179,	12),

(42685896,	179,	14),

(42768632,	179,	12),

(43500959,	179,	8
),
(46844640,	179,	11),

(48563699,	179,	15),

(54679482,	179,	13),

(57467650,	179,	14),

(59916483,	179,	5
),
(64398919,	179,	13),

(64530056,	179,	16),

(66921228,	179,	15),

(68529349,	179,	20),

(68677240,	179,	18),

(71708814,	179,	9
),
(80614518,	179,	10),

(81768602,	179,	10),

(84158312,	179,	8
),
(85368583,	179,	17),

(85632352,	179,	8
),
(86872045,	179,	17),

(90935543,	179,	14),

(91565702,	179,	14),

(10998691,	180,	17),

(11304461,	180,	15),

(12505676,	180,	8
),
(15974674,	180,	12),

(19137151,	180,	5
),
(19867677,	180,	10),

(23607067,	180,	14),

(23995642,	180,	14),

(28916456,	180,	13),

(30187810,	180,	11),

(31282994,	180,	11),

(31628825,	180,	2
),
(31852049,	180,	19),

(32033788,	180,	16),

(35365463,	180,	4
),
(35507115,	180,	12),

(35992111,	180,	15),

(42685896,	180,	17),

(42768632,	180,	10),

(43500959,	180,	10),

(46844640,	180,	17),

(48563699,	180,	14),

(54679482,	180,	12),

(57467650,	180,	13),

(59916483,	180,	14),

(64398919,	180,	20),

(64530056,	180,	11),

(66921228,	180,	15),

(68529349,	180,	12),

(68677240,	180,	13),

(71708814,	180,	19),

(80614518,	180,	12),

(81768602,	180,	15),

(84158312,	180,	11),

(85368583,	180,	10),

(85632352,	180,	11),

(86872045,	180,	13),

(90935543,	180,	11),

(91565702,	180,	8
),
(10998691,	181,	10),

(11304461,	181,	20),

(12505676,	181,	13),

(15974674,	181,	5
),
(19137151,	181,	7
),
(19867677,	181,	15),

(23607067,	181,	1
),
(23995642,	181,	10),

(28916456,	181,	11),

(30187810,	181,	16),

(31282994,	181,	13),

(31628825,	181,	13),

(31852049,	181,	8
),
(32033788,	181,	16),

(35365463,	181,	12),

(35507115,	181,	10),

(35992111,	181,	15),

(42685896,	181,	5
),
(42768632,	181,	10),

(43500959,	181,	12),

(46844640,	181,	8
),
(48563699,	181,	10),

(54679482,	181,	13),

(57467650,	181,	10),

(59916483,	181,	12),

(64398919,	181,	12),

(64530056,	181,	9
),
(66921228,	181,	14),

(68529349,	181,	12),

(68677240,	181,	10),

(71708814,	181,	17),

(80614518,	181,	7
),
(81768602,	181,	6
),
(84158312,	181,	15),

(85368583,	181,	8
),
(85632352,	181,	3
),
(86872045,	181,	14),

(90935543,	181,	13),

(91565702,	181,	15),

(10998691,	182,	16),

(11304461,	182,	15),

(12505676,	182,	12),

(15974674,	182,	15),

(19137151,	182,	13),

(19867677,	182,	15),

(23607067,	182,	12),

(23995642,	182,	7
),
(28916456,	182,	6
),
(30187810,	182,	13),

(31282994,	182,	5
),
(31628825,	182,	15),

(31852049,	182,	19),

(32033788,	182,	10),

(35365463,	182,	18),

(35507115,	182,	9
),
(35992111,	182,	15),

(42685896,	182,	15),

(42768632,	182,	7
),
(43500959,	182,	14),

(46844640,	182,	13),

(48563699,	182,	15),

(54679482,	182,	12),

(57467650,	182,	8
),
(59916483,	182,	19),

(64398919,	182,	17),

(64530056,	182,	11),

(66921228,	182,	15),

(68529349,	182,	12),

(68677240,	182,	13),

(71708814,	182,	20),

(80614518,	182,	15),

(81768602,	182,	13),

(84158312,	182,	16),

(85368583,	182,	10),

(85632352,	182,	11),

(86872045,	182,	14),

(90935543,	182,	10),

(91565702,	182,	13),

(10998691,	183,	7
),
(11304461,	183,	10),

(12505676,	183,	13),

(15974674,	183,	19),

(19137151,	183,	11),

(19867677,	183,	0
),
(23607067,	183,	4
),
(23995642,	183,	14),

(28916456,	183,	13),

(30187810,	183,	6
),
(31282994,	183,	10),

(31628825,	183,	9
),
(31852049,	183,	12),

(32033788,	183,	8
),
(35365463,	183,	11),

(35507115,	183,	13),

(35992111,	183,	14),

(42685896,	183,	11),

(42768632,	183,	10),

(43500959,	183,	11),

(46844640,	183,	0
),
(48563699,	183,	7
),
(54679482,	183,	8
),
(57467650,	183,	6
),
(59916483,	183,	8
),
(64398919,	183,	16),

(64530056,	183,	15),

(66921228,	183,	17),

(68529349,	183,	13),

(68677240,	183,	12),

(71708814,	183,	11),

(80614518,	183,	10),

(81768602,	183,	13),

(84158312,	183,	9
),
(85368583,	183,	10),

(85632352,	183,	14),

(86872045,	183,	9
),
(90935543,	183,	10),

(91565702,	183,	12),

(10998691,	184,	6
),
(11304461,	184,	4
),
(12505676,	184,	7
),
(15974674,	184,	8
),
(19137151,	184,	6
),
(19867677,	184,	8
),
(23607067,	184,	3
),
(23995642,	184,	3
),
(28916456,	184,	3
),
(30187810,	184,	3
),
(31282994,	184,	2
),
(31628825,	184,	0
),
(31852049,	184,	5
),
(32033788,	184,	2
),
(35365463,	184,	9
),
(35507115,	184,	6
),
(35992111,	184,	8
),
(42685896,	184,	3
),
(42768632,	184,	0
),
(43500959,	184,	3
),
(46844640,	184,	4
),
(48563699,	184,	2
),
(54679482,	184,	2
),
(57467650,	184,	7
),
(59916483,	184,	5
),
(64398919,	184,	7
),
(64530056,	184,	8
),
(66921228,	184,	10),

(68529349,	184,	5
),
(68677240,	184,	10),

(71708814,	184,	7
),
(80614518,	184,	0
),
(81768602,	184,	6
),
(84158312,	184,	2
),
(85368583,	184,	8
),
(85632352,	184,	8
),
(86872045,	184,	5
),
(90935543,	184,	4
),
(91565702,	184,	8
),
(10534206,	185,	6
),
(20236412,	185,	9
),
(20427756,	185,	3
),
(21931678,	185,	1
),
(22730658,	185,	2
),
(22844995,	185,	10),

(24474176,	185,	8
),
(27595348,	185,	10),

(27965307,	185,	10),

(28915481,	185,	12),
(29172201,	185,	4
),
(30157844,	185,	6
),
(30589090,	185,	11),

(35563113,	185,	12),

(35733587,	185,	4
),
(36969032,	185,	6
),
(37560862,	185,	12),

(40384219,	185,	8
),
(41609700,	185,	13),

(43320982,	185,	12),

(45814182,	185,	10),

(52238473,	185,	3
),
(53104670,	185,	8
),
(55810467,	185,	9
),
(56046099,	185,	11),

(63156760,	185,	16),

(63217302,	185,	8
),
(63246226,	185,	14),

(64973126,	185,	11),

(72751710,	185,	10),

(74447273,	185,	18),

(75640107,	185,	4
),
(84633041,	185,	8
),
(86264655,	185,	3
),
(86534235,	185,	5
),
(91750903,	185,	1
),
(95787979,	185,	7
),
(96820901,	185,	6
),
(97314565,	185,	7
),
(10534206,	186,	4),
(20236412,	186,	3),
(20427756,	186,	1),
(21931678,	186,	4),
(22730658,	186,	3),
(22844995,	186,	0),
(24474176,	186,	3),
(27595348,	186,	2),
(27965307,	186,	3),
(28915481,	186,	4),
(29172201,	186,	4),
(30157844,	186,	5),
(30589090,	186,	4),
(35563113,	186,	1),
(35733587,	186,	3),
(36969032,	186,	1),
(37560862,	186,	4),
(40384219,	186,	3),
(41609700,	186,	3),
(43320982,	186,	3),
(45814182,	186,	5),
(52238473,	186,	2),
(53104670,	186,	4),
(55810467,	186,	4),
(56046099,	186,	5),
(63156760,	186,	2),
(63217302,	186,	5),
(63246226,	186,	5),
(64973126,	186,	4),
(72751710,	186,	2),
(74447273,	186,	5),
(75640107,	186,	2),
(84633041,	186,	0),
(86264655,	186,	2),
(86534235,	186,	4),
(91750903,	186,	4),
(95787979,	186,	2),
(96820901,	186,	1),
(97314565,	186,	2),
(10534206,	187,	5
),
(20236412,	187,	6
),
(20427756,	187,	14),

(21931678,	187,	10),

(22730658,	187,	18),

(22844995,	187,	8
),
(24474176,	187,	13),

(27595348,	187,	14),

(27965307,	187,	8
),
(28915481,	187,	13),
(29172201,	187,	17),

(30157844,	187,	14),

(30589090,	187,	8
),
(35563113,	187,	13),

(35733587,	187,	15),

(36969032,	187,	12),

(37560862,	187,	4
),
(40384219,	187,	17),

(41609700,	187,	4
),
(43320982,	187,	17),

(45814182,	187,	7
),
(52238473,	187,	16),

(53104670,	187,	18),

(55810467,	187,	4
),
(56046099,	187,	11),

(63156760,	187,	13),

(63217302,	187,	9
),
(63246226,	187,	14),

(64973126,	187,	18),

(72751710,	187,	11),

(74447273,	187,	10),

(75640107,	187,	11),

(84633041,	187,	4
),
(86264655,	187,	5
),
(86534235,	187,	13),

(91750903,	187,	13),

(95787979,	187,	10),

(96820901,	187,	10),

(97314565,	187,	11),

(10534206,	188,	9
),
(20236412,	188,	3
),
(20427756,	188,	9
),
(21931678,	188,	7
),
(22730658,	188,	8
),
(22844995,	188,	6
),
(24474176,	188,	10),

(27595348,	188,	8
),
(27965307,	188,	6
),
(28915481,	188,	14),
(29172201,	188,	13),

(30157844,	188,	4
),
(30589090,	188,	4
),
(35563113,	188,	7
),
(35733587,	188,	10),

(36969032,	188,	2
),
(37560862,	188,	2
),
(40384219,	188,	5
),
(41609700,	188,	12),

(43320982,	188,	2
),
(45814182,	188,	7
),
(52238473,	188,	2
),
(53104670,	188,	7
),
(55810467,	188,	15),

(56046099,	188,	12),

(63156760,	188,	5
),
(63217302,	188,	13),

(63246226,	188,	6
),
(64973126,	188,	9
),
(72751710,	188,	14),

(74447273,	188,	8
),
(75640107,	188,	8
),
(84633041,	188,	7
),
(86264655,	188,	10),

(86534235,	188,	8
),
(91750903,	188,	3
),
(95787979,	188,	5
),
(96820901,	188,	14),

(97314565,	188,	3
),
(10534206,	189,	10),

(20236412,	189,	5
),
(20427756,	189,	15),

(21931678,	189,	9
),
(22730658,	189,	7
),
(22844995,	189,	16),

(24474176,	189,	16),

(27595348,	189,	16),

(27965307,	189,	10),

(28915481,	189,	12),
(29172201,	189,	9
),
(30157844,	189,	16),

(30589090,	189,	15),

(35563113,	189,	4
),
(35733587,	189,	17),

(36969032,	189,	15),

(37560862,	189,	14),

(40384219,	189,	16),

(41609700,	189,	11),

(43320982,	189,	17),

(45814182,	189,	15),

(52238473,	189,	16),

(53104670,	189,	9
),
(55810467,	189,	9
),
(56046099,	189,	10),

(63156760,	189,	17),

(63217302,	189,	14),

(63246226,	189,	8
),
(64973126,	189,	10),

(72751710,	189,	6
),
(74447273,	189,	10),

(75640107,	189,	7
),
(84633041,	189,	13),

(86264655,	189,	14),

(86534235,	189,	11),

(91750903,	189,	5
),
(95787979,	189,	14),

(96820901,	189,	10),

(97314565,	189,	10),

(10534206,	190,	8),
(20236412,	190,	6),
(20427756,	190,	4),
(21931678,	190,	4),
(22730658,	190,	9),
(22844995,	190,	0),
(24474176,	190,	3),
(27595348,	190,	4),
(27965307,	190,	6),
(28915481,	190,	0),
(29172201,	190,	3),
(30157844,	190,	8),
(30589090,	190,	5),
(35563113,	190,	3),
(35733587,	190,	5),
(36969032,	190,	8),
(37560862,	190,	6),
(40384219,	190,	2),
(41609700,	190,	4),
(43320982,	190,	5),
(45814182,	190,	5),
(52238473,	190,	4),
(53104670,	190,	9),
(55810467,	190,	5),
(56046099,	190,	3),
(63156760,	190,	1),
(63217302,	190,	5),
(63246226,	190,	7),
(64973126,	190,	7),
(72751710,	190,	3),
(74447273,	190,	3),
(75640107,	190,	2),
(84633041,	190,	3),
(86264655,	190,	7),
(86534235,	190,	2),
(91750903,	190,	7),
(95787979,	190,	7),
(96820901,	190,	4),
(97314565,	190,	4),
(10534206,	191,	7
),
(20236412,	191,	2
),
(20427756,	191,	4
),
(21931678,	191,	7
),
(22730658,	191,	6
),
(22844995,	191,	4
),
(24474176,	191,	0
),
(27595348,	191,	8
),
(27965307,	191,	8
),
(28915481,	19(1,	5
),
,(291,722),
01,	191,	10),

(30157844,	191,	9
),
(30589090,	191,	5
),
(35563113,	191,	3
),
(35733587,	191,	5
),
(36969032,	191,	2
),
(37560862,	191,	3
),
(40384219,	191,	6
),
(41609700,	191,	7
),
(43320982,	191,	7
),
(45814182,	191,	7
),
(52238473,	191,	8
),
(53104670,	191,	0
),
(55810467,	191,	10),

(56046099,	191,	5
),
(63156760,	191,	6
),
(63217302,	191,	7
),
(63246226,	191,	3
),
(64973126,	191,	0
),
(72751710,	191,	3
),
(74447273,	191,	6
),
(75640107,	191,	6
),
(84633041,	191,	6
),
(86264655,	191,	4
),
(86534235,	191,	10),

(91750903,	191,	1
),
(95787979,	191,	8
),
(96820901,	191,	4
),
(97314565,	191,	9
),
(10534206,	192, 5),
(20236412,	192, 5),
(20427756,	192, 2),
(21931678,	192, 5),
(22730658,	192, 4),
(22844995,	192, 4),
(24474176,	192, 5),
(27595348,	192, 2),
(27965307,	192, 5),
(28915481,	192, 3),
(29172201,	192, 5),
(30157844,	192, 5),
(30589090,	192, 5),
(35563113,	192, 5),
(35733587,	192, 5),
(36969032,	192, 3),
(37560862,	192, 4),
(40384219,	192, 3),
(41609700,	192, 3),
(43320982,	192, 5),
(45814182,	192, 5),
(52238473,	192, 5),
(53104670,	192, 5),
(55810467,	192, 3),
(56046099,	192, 5),
(63156760,	192, 5),
(63217302,	192, 5),
(63246226,	192, 5),
(64973126,	192, 5),
(72751710,	192, 5),
(74447273,	192, 5),
(75640107,	192, 4),
(84633041,	192, 5),
(86264655,	192, 5),
(86534235,	192, 5),
(91750903,	192, 5),
(95787979,	192, 2),
(96820901,	192, 5),
(97314565,	192, 2),
(10281753,	193,	4
),
(12332209,	193,	6
),
(14627641,	193,	7
),
(15710421,	193,	4
),
(16659116,	193,	2
),
(17123230,	193,	0
),
(20885928,	193,	2
),
(22715713,	193,	5
),
(23166329,	193,	6
),
(26047923,	193,	8
),
(26487936,	193,	6
),
(27162414,	193,	5
),
(27204056,	193,	4
),
(33937912,	193,	6
),
(36065627,	193,	2
),
(36354616,	193,	3
),
(43246940,	193,	5
),
(47791655,	193,	6
),
(48743705,	193,	7
),
(51572168,	193,	7
),
(52567239,	193,	3
),
(52794581,	193,	9
),
(55549712,	193,	10),

(55813326,	193,	1
),
(56462246,	193,	6
),
(57253118,	193,	4
),
(63899654,	193,	1
),
(66407977,	193,	8
),
(72936625,	193,	5
),
(75692632,	193,	2
),
(76662813,	193,	6
),
(78445718,	193,	4
),
(81965142,	193,	6
),
(83201687,	193,	2
),
(84667886,	193,	3
),
(86461348,	193,	3
),
(89715013,	193,	4
),
(97467090,	193,	10),

(99904277,	193,	2
),
(10281753,	194,	16),

(12332209,	194,	14),

(14627641,	194,	5
),
(15710421,	194,	8
),
(16659116,	194,	7
),
(17123230,	194,	14),

(20885928,	194,	9
),
(22715713,	194,	8
),
(23166329,	194,	13),

(26047923,	194,	11),

(26487936,	194,	15),

(27162414,	194,	9
),
(27204056,	194,	14),

(33937912,	194,	13),

(36065627,	194,	11),

(36354616,	194,	11),

(43246940,	194,	11),

(47791655,	194,	9
),
(48743705,	194,	12),

(51572168,	194,	10),

(52567239,	194,	5
),
(52794581,	194,	15),

(55549712,	194,	7
),
(55813326,	194,	8
),
(56462246,	194,	13),

(57253118,	194,	15),

(63899654,	194,	14),

(66407977,	194,	12),

(72936625,	194,	9
),
(75692632,	194,	9
),
(76662813,	194,	17),

(78445718,	194,	6
),
(81965142,	194,	11),

(83201687,	194,	12),

(84667886,	194,	12),

(86461348,	194,	11),

(89715013,	194,	13),

(97467090,	194,	12),

(99904277,	194,	14),

(10281753,	195,	3),
(12332209,	195,	5),
(14627641,	195,	3),
(15710421,	195,	4),
(16659116,	195,	4),
(17123230,	195,	5),
(20885928,	195,	5),
(22715713,	195,	4),
(23166329,	195,	4),
(26047923,	195,	3),
(26487936,	195,	3),
(27162414,	195,	4),
(27204056,	195,	1),
(33937912,	195,	5),
(36065627,	195,	5),
(36354616,	195,	5),
(43246940,	195,	3),
(47791655,	195,	1),
(48743705,	195,	1),
(51572168,	195,	2),
(52567239,	195,	4),
(52794581,	195,	5),
(55549712,	195,	5),
(55813326,	195,	5),
(56462246,	195,	2),
(57253118,	195,	3),
(63899654,	195,	2),
(66407977,	195,	1),
(72936625,	195,	5),
(75692632,	195,	1),
(76662813,	195,	2),
(78445718,	195,	3),
(81965142,	195,	5),
(83201687,	195,	4),
(84667886,	195,	5),
(86461348,	195,	3),
(89715013,	195,	1),
(97467090,	195,	3),
(99904277,	195,	3),
(10281753,	196,	10),

(12332209,	196,	15),

(14627641,	196,	20),

(15710421,	196,	14),

(16659116,	196,	16),

(17123230,	196,	12),

(20885928,	196,	18),

(22715713,	196,	4
),
(23166329,	196,	11),

(26047923,	196,	11),

(26487936,	196,	10),

(27162414,	196,	11),

(27204056,	196,	12),

(33937912,	196,	11),

(36065627,	196,	16),

(36354616,	196,	17),

(43246940,	196,	17),

(47791655,	196,	17),

(48743705,	196,	14),

(51572168,	196,	5
),
(52567239,	196,	8
),
(52794581,	196,	6
),
(55549712,	196,	17),

(55813326,	196,	10),

(56462246,	196,	19),

(57253118,	196,	15),

(63899654,	196,	13),

(66407977,	196,	20),

(72936625,	196,	13),

(75692632,	196,	20),

(76662813,	196,	19),

(78445718,	196,	13),

(81965142,	196,	14),

(83201687,	196,	9
),
(84667886,	196,	17),

(86461348,	196,	12),

(89715013,	196,	15),

(97467090,	196,	20),

(99904277,	196,	13),

(10281753,	197,	4),
(12332209,	197,	5),
(14627641,	197,	4),
(15710421,	197,	1),
(16659116,	197,	3),
(17123230,	197,	3),
(20885928,	197,	4),
(22715713,	197,	0),
(23166329,	197,	3),
(26047923,	197,	4),
(26487936,	197,	2),
(27162414,	197,	3),
(27204056,	197,	5),
(33937912,	197,	5),
(36065627,	197,	1),
(36354616,	197,	2),
(43246940,	197,	4),
(47791655,	197,	4),
(48743705,	197,	3),
(51572168,	197,	3),
(52567239,	197,	5),
(52794581,	197,	2),
(55549712,	197,	3),
(55813326,	197,	1),
(56462246,	197,	0),
(57253118,	197,	5),
(63899654,	197,	3),
(66407977,	197,	0),
(72936625,	197,	2),
(75692632,	197,	2),
(76662813,	197,	1),
(78445718,	197,	0),
(81965142,	197,	2),
(83201687,	197,	0),
(84667886,	197,	3),
(86461348,	197,	2),
(89715013,	197,	3),
(97467090,	197,	5),
(99904277,	197,	4),
(10281753,	198,	5),
(12332209,	198,	3),
(14627641,	198,	5),
(15710421,	198,	1),
(16659116,	198,	4),
(17123230,	198,	4),
(20885928,	198,	5),
(22715713,	198,	3),
(23166329,	198,	5),
(26047923,	198,	5),
(26487936,	198,	5),
(27162414,	198,	3),
(27204056,	198,	5),
(33937912,	198,	5),
(36065627,	198,	4),
(36354616,	198,	4),
(43246940,	198,	5),
(47791655,	198,	5),
(48743705,	198,	5),
(51572168,	198,	3),
(52567239,	198,	4),
(52794581,	198,	4),
(55549712,	198,	5),
(55813326,	198,	5),
(56462246,	198,	4),
(57253118,	198,	3),
(63899654,	198,	4),
(66407977,	198,	5),
(72936625,	198,	4),
(75692632,	198,	3),
(76662813,	198,	5),
(78445718,	198,	1),
(81965142,	198,	5),
(83201687,	198,	3),
(84667886,	198,	5),
(86461348,	198,	5),
(89715013,	198,	4),
(97467090,	198,	3),
(99904277,	198,	3),
(10281753,	199,	9
),
(12332209,	199,	20),

(14627641,	199,	7
),
(15710421,	199,	15),

(16659116,	199,	11),

(17123230,	199,	7
),
(20885928,	199,	11),

(22715713,	199,	16),

(23166329,	199,	7
),
(26047923,	199,	8
),
(26487936,	199,	12),

(27162414,	199,	13),

(27204056,	199,	9
),
(33937912,	199,	14),

(36065627,	199,	14),

(36354616,	199,	4
),
(43246940,	199,	9
),
(47791655,	199,	10),

(48743705,	199,	10),

(51572168,	199,	6
),
(52567239,	199,	14),

(52794581,	199,	14),

(55549712,	199,	11),

(55813326,	199,	3
),
(56462246,	199,	14),

(57253118,	199,	10),

(63899654,	199,	9
),
(66407977,	199,	9
),
(72936625,	199,	12),

(75692632,	199,	7
),
(76662813,	199,	10),

(78445718,	199,	8
),
(81965142,	199,	12),

(83201687,	199,	12),

(84667886,	199,	8
),
(86461348,	199,	14),

(89715013,	199,	8
),
(97467090,	199,	19),

(99904277,	199,	9
),
(10281753,	200,	4),
(12332209,	200,	1),
(14627641,	200,	6),
(15710421,	200,	1),
(16659116,	200,	2),
(17123230,	200,	0),
(20885928,	200,	7),
(22715713,	200,	0),
(23166329,	200,	0),
(26047923,	200,	6),
(26487936,	200,	4),
(27162414,	200,	0),
(27204056,	200,	0),
(33937912,	200,	6),
(36065627,	200,	8),
(36354616,	200,	2),
(43246940,	200,	2),
(47791655,	200,	6),
(48743705,	200,	4),
(51572168,	200,	0),
(52567239,	200,	2),
(52794581,	200,	4),
(55549712,	200,	6),
(55813326,	200,	2),
(56462246,	200,	6),
(57253118,	200,	4),
(63899654,	200,	7),
(66407977,	200,	5),
(72936625,	200,	3),
(75692632,	200,	7),
(76662813,	200,	4),
(78445718,	200,	5),
(81965142,	200,	9),
(83201687,	200,	0),
(84667886,	200,	5),
(86461348,	200,	4),
(89715013,	200,	4),
(97467090,	200,	4),
(99904277,	200,	6),
(12695343,	201,	10),

(15330035,	201,	15),

(19611576,	201,	9
),
(22491150,	201,	11),

(23144259,	201,	9
),
(24655905,	201,	15),

(25179222,	201,	7
),
(26326420,	201,	16),

(28827259,	201,	9
),
(29386219,	201,	10),

(29557897,	201,	9
),
(30901477,	201,	5
),
(34457914,	201,	10),

(34619084,	201,	5
),
(35183865,	201,	3
),
(39409116,	201,	13),

(41083936,	201,	17),

(42620373,	201,	11),

(45241147,	201,	8
),
(46275969,	201,	7
),
(50649325,	201,	17),

(53972238,	201,	6
),
(54954233,	201,	9
),
(56622972,	201,	8
),
(60594527,	201,	14),

(61414047,	201,	12),

(66542703,	201,	13),

(66905564,	201,	15),

(68727765,	201,	6
),
(71257664,	201,	10),

(74709445,	201,	12),

(76257107,	201,	11),

(79360908,	201,	12),

(79593813,	201,	18),

(86510574,	201,	11),

(86930808,	201,	7
),
(91074522,	201,	12),

(91980591,	201,	8
),
(96116283,	201,	5
),
(12695343,	202,	12),

(15330035,	202,	16),

(19611576,	202,	12),

(22491150,	202,	11),

(23144259,	202,	12),

(24655905,	202,	5
),
(25179222,	202,	19),

(26326420,	202,	10),

(28827259,	202,	9
),
(29386219,	202,	4
),
(29557897,	202,	9
),
(30901477,	202,	12),

(34457914,	202,	7
),
(34619084,	202,	15),

(35183865,	202,	13),

(39409116,	202,	7
),
(41083936,	202,	8
),
(42620373,	202,	11),

(45241147,	202,	7
),
(46275969,	202,	7
),
(50649325,	202,	9
),
(53972238,	202,	7
),
(54954233,	202,	10),

(56622972,	202,	11),

(60594527,	202,	5
),
(61414047,	202,	18),

(66542703,	202,	15),

(66905564,	202,	15),

(68727765,	202,	20),

(71257664,	202,	10),

(74709445,	202,	8
),
(76257107,	202,	12),

(79360908,	202,	1
),
(79593813,	202,	18),

(86510574,	202,	12),

(86930808,	202,	14),

(91074522,	202,	4
),
(91980591,	202,	7
),
(96116283,	202,	11),

(12695343,	203,	10),

(15330035,	203,	8
),
(19611576,	203,	18),

(22491150,	203,	3
),
(23144259,	203,	13),

(24655905,	203,	12),

(25179222,	203,	10),

(26326420,	203,	4
),
(28827259,	203,	12),

(29386219,	203,	15),

(29557897,	203,	7
),
(30901477,	203,	7
),
(34457914,	203,	9
),
(34619084,	203,	7
),
(35183865,	203,	6
),
(39409116,	203,	6
),
(41083936,	203,	3
),
(42620373,	203,	12),

(45241147,	203,	0
),
(46275969,	203,	12),

(50649325,	203,	5
),
(53972238,	203,	11),

(54954233,	203,	12),

(56622972,	203,	5
),
(60594527,	203,	6
),
(61414047,	203,	11),

(66542703,	203,	4
),
(66905564,	203,	9
),
(68727765,	203,	4
),
(71257664,	203,	14),

(74709445,	203,	10),

(76257107,	203,	13),

(79360908,	203,	7
),
(79593813,	203,	2
),
(86510574,	203,	11),

(86930808,	203,	14),

(91074522,	203,	6
),
(91980591,	203,	0
),
(96116283,	203,	3
),
(12695343,	204,	11),

(15330035,	204,	3
),
(19611576,	204,	15),

(22491150,	204,	11),

(23144259,	204,	15),

(24655905,	204,	6
),
(25179222,	204,	13),

(26326420,	204,	6
),
(28827259,	204,	13),

(29386219,	204,	10),

(29557897,	204,	14),

(30901477,	204,	16),

(34457914,	204,	10),

(34619084,	204,	6
),
(35183865,	204,	17),

(39409116,	204,	12),

(41083936,	204,	7
),
(42620373,	204,	8
),
(45241147,	204,	6
),
(46275969,	204,	6
),
(50649325,	204,	12),

(53972238,	204,	12),

(54954233,	204,	9
),
(56622972,	204,	19),

(60594527,	204,	4
),
(61414047,	204,	9
),
(66542703,	204,	11),

(66905564,	204,	7
),
(68727765,	204,	10),

(71257664,	204,	13),

(74709445,	204,	14),

(76257107,	204,	2
),
(79360908,	204,	4
),
(79593813,	204,	11),

(86510574,	204,	4
),
(86930808,	204,	8
),
(91074522,	204,	8
),
(91980591,	204,	7
),
(96116283,	204,	17),

(12695343,	205,	11),

(15330035,	205,	8
),
(19611576,	205,	12),

(22491150,	205,	10),

(23144259,	205,	12),

(24655905,	205,	7
),
(25179222,	205,	6
),
(26326420,	205,	6
),
(28827259,	205,	11),

(29386219,	205,	6
),
(29557897,	205,	9
),
(30901477,	205,	12),

(34457914,	205,	8
),
(34619084,	205,	9
),
(35183865,	205,	5
),
(39409116,	205,	0
),
(41083936,	205,	6
),
(42620373,	205,	17),

(45241147,	205,	7
),
(46275969,	205,	5
),
(50649325,	205,	12),

(53972238,	205,	13),

(54954233,	205,	8
),
(56622972,	205,	12),

(60594527,	205,	13),

(61414047,	205,	6
),
(66542703,	205,	8
),
(66905564,	205,	6
),
(68727765,	205,	14),

(71257664,	205,	1
),
(74709445,	205,	2
),
(76257107,	205,	7
),
(79360908,	205,	10),

(79593813,	205,	13),

(86510574,	205,	14),

(86930808,	205,	9
),
(91074522,	205,	13),

(91980591,	205,	11),

(96116283,	205,	13),

(12695343,	206,	4
),
(15330035,	206,	4
),
(19611576,	206,	5
),
(22491150,	206,	11),

(23144259,	206,	1
),
(24655905,	206,	4
),
(25179222,	206,	8
),
(26326420,	206,	6
),
(28827259,	206,	9
),
(29386219,	206,	8
),
(29557897,	206,	6
),
(30901477,	206,	7
),
(34457914,	206,	3
),
(34619084,	206,	9
),
(35183865,	206,	7
),
(39409116,	206,	6
),
(41083936,	206,	11),

(42620373,	206,	9
),
(45241147,	206,	3
),
(46275969,	206,	3
),
(50649325,	206,	9
),
(53972238,	206,	11),

(54954233,	206,	14),

(56622972,	206,	2
),
(60594527,	206,	8
),
(61414047,	206,	6
),
(66542703,	206,	0
),
(66905564,	206,	10),

(68727765,	206,	0
),
(71257664,	206,	13),

(74709445,	206,	4
),
(76257107,	206,	2
),
(79360908,	206,	4
),
(79593813,	206,	3
),
(86510574,	206,	8
),
(86930808,	206,	7
),
(91074522,	206,	7
),
(91980591,	206,	4
),
(96116283,	206,	13),

(12695343,	207,	8
),
(15330035,	207,	20),

(19611576,	207,	11),

(22491150,	207,	13),

(23144259,	207,	20),

(24655905,	207,	13),

(25179222,	207,	7
),
(26326420,	207,	19),

(28827259,	207,	7
),
(29386219,	207,	11),

(29557897,	207,	12),

(30901477,	207,	10),

(34457914,	207,	7
),
(34619084,	207,	10),

(35183865,	207,	15),

(39409116,	207,	13),

(41083936,	207,	6
),
(42620373,	207,	13),

(45241147,	207,	10),

(46275969,	207,	14),

(50649325,	207,	7
),
(53972238,	207,	11),

(54954233,	207,	20),

(56622972,	207,	10),

(60594527,	207,	16),

(61414047,	207,	8
),
(66542703,	207,	7
),
(66905564,	207,	6
),
(68727765,	207,	12),

(71257664,	207,	15),

(74709445,	207,	12),

(76257107,	207,	15),

(79360908,	207,	18),

(79593813,	207,	3
),
(86510574,	207,	12),

(86930808,	207,	8
),
(91074522,	207,	16),

(91980591,	207,	13),

(96116283,	207,	10),

(12695343,	208,	6
),
(15330035,	208,	9
),
(19611576,	208,	9
),
(22491150,	208,	9
),
(23144259,	208,	11),

(24655905,	208,	14),

(25179222,	208,	13),

(26326420,	208,	9
),
(28827259,	208,	11),

(29386219,	208,	18),

(29557897,	208,	6
),
(30901477,	208,	11),

(34457914,	208,	6
),
(34619084,	208,	10),

(35183865,	208,	2
),
(39409116,	208,	8
),
(41083936,	208,	8
),
(42620373,	208,	8
),
(45241147,	208,	14),

(46275969,	208,	11),

(50649325,	208,	8
),
(53972238,	208,	8
),
(54954233,	208,	10),

(56622972,	208,	9
),
(60594527,	208,	0
),
(61414047,	208,	3
),
(66542703,	208,	12),

(66905564,	208,	13),

(68727765,	208,	8
),
(71257664,	208,	10),

(74709445,	208,	7
),
(76257107,	208,	4
),
(79360908,	208,	6
),
(79593813,	208,	12),

(86510574,	208,	9
),
(86930808,	208,	7
),
(91074522,	208,	8
),
(91980591,	208,	10),

(96116283,	208,	10),

(13933301,	209,	18),

(16797391,	209,	11),

(18029580,	209,	14),

(23412027,	209,	9
),
(33583386,	209,	14),

(33809838,	209,	3
),
(35544401,	209,	20),

(38867925,	209,	15),

(39014661,	209,	13),

(40177208,	209,	18),

(44508242,	209,	8
),
(44975872,	209,	10),

(45124404,	209,	16),

(46341250,	209,	16),

(47992460,	209,	8
),
(50255297,	209,	17),

(54277909,	209,	19),

(55075253,	209,	12),

(55481497,	209,	13),

(55920827,	209,	13),

(59394502,	209,	17),

(60555723,	209,	16),

(61496547,	209,	12),

(62998010,	209,	9
),
(64445490,	209,	19),

(65440089,	209,	10),

(66080147,	209,	9
),
(72165244,	209,	16),

(73317454,	209,	16),

(74288538,	209,	9
),
(77026788,	209,	14),

(77271695,	209,	18),

(78162009,	209,	14),

(78641051,	209,	15),

(82567240,	209,	11),

(85700983,	209,	20),

(87657665,	209,	10),

(89132300,	209,	14),

(92475083,	209,	16),

(13933301,	210,	17),

(16797391,	210,	13),

(18029580,	210,	8
),
(23412027,	210,	20),

(33583386,	210,	10),

(33809838,	210,	10),

(35544401,	210,	10),

(38867925,	210,	10),

(39014661,	210,	8
),
(40177208,	210,	10),

(44508242,	210,	1
),
(44975872,	210,	9
),
(45124404,	210,	16),

(46341250,	210,	6
),
(47992460,	210,	8
),
(50255297,	210,	8
),
(54277909,	210,	0
),
(55075253,	210,	15),

(55481497,	210,	11),

(55920827,	210,	6
),
(59394502,	210,	13),

(60555723,	210,	13),

(61496547,	210,	8
),
(62998010,	210,	7
),
(64445490,	210,	11),

(65440089,	210,	12),

(66080147,	210,	15),

(72165244,	210,	12),

(73317454,	210,	16),

(74288538,	210,	15),

(77026788,	210,	7
),
(77271695,	210,	15),

(78162009,	210,	13),

(78641051,	210,	13),

(82567240,	210,	13),

(85700983,	210,	11),

(87657665,	210,	13),

(89132300,	210,	10),

(92475083,	210,	9
),
(13933301,	211,	13),

(16797391,	211,	16),

(18029580,	211,	6
),
(23412027,	211,	14),

(33583386,	211,	19),

(33809838,	211,	10),

(35544401,	211,	13),

(38867925,	211,	9
),
(39014661,	211,	17),

(40177208,	211,	20),

(44508242,	211,	15),

(44975872,	211,	12),

(45124404,	211,	18),

(46341250,	211,	20),

(47992460,	211,	11),

(50255297,	211,	13),

(54277909,	211,	20),

(55075253,	211,	15),

(55481497,	211,	11),

(55920827,	211,	14),

(59394502,	211,	17),

(60555723,	211,	10),

(61496547,	211,	12),

(62998010,	211,	20),

(64445490,	211,	19),

(65440089,	211,	9
),
(66080147,	211,	15),

(72165244,	211,	9
),
(73317454,	211,	14),

(74288538,	211,	11),

(77026788,	211,	17),

(77271695,	211,	13),

(78162009,	211,	14),

(78641051,	211,	17),

(82567240,	211,	18),

(85700983,	211,	18),

(87657665,	211,	19),

(89132300,	211,	11),

(92475083,	211,	10),

(13933301,	212,	9
),
(16797391,	212,	14),

(18029580,	212,	12),

(23412027,	212,	17),

(33583386,	212,	18),

(33809838,	212,	18),

(35544401,	212,	16),

(38867925,	212,	18),

(39014661,	212,	14),

(40177208,	212,	16),

(44508242,	212,	13),

(44975872,	212,	20),

(45124404,	212,	12),

(46341250,	212,	14),

(47992460,	212,	15),

(50255297,	212,	12),

(54277909,	212,	13),

(55075253,	212,	14),

(55481497,	212,	16),

(55920827,	212,	20),

(59394502,	212,	9
),
(60555723,	212,	10),

(61496547,	212,	12),

(62998010,	212,	13),

(64445490,	212,	18),

(65440089,	212,	13),

(66080147,	212,	15),

(72165244,	212,	9
),
(73317454,	212,	17),

(74288538,	212,	15),

(77026788,	212,	15),

(77271695,	212,	9
),
(78162009,	212,	9
),
(78641051,	212,	17),

(82567240,	212,	14),

(85700983,	212,	11),

(87657665,	212,	16),

(89132300,	212,	7
),
(92475083,	212,	20),

(13933301,	213,	10),

(16797391,	213,	9
),
(18029580,	213,	7
),
(23412027,	213,	8
),
(33583386,	213,	13),

(33809838,	213,	14),

(35544401,	213,	18),

(38867925,	213,	17),

(39014661,	213,	20),

(40177208,	213,	5
),
(44508242,	213,	6
),
(44975872,	213,	14),

(45124404,	213,	11),

(46341250,	213,	14),

(47992460,	213,	11),

(50255297,	213,	18),

(54277909,	213,	10),

(55075253,	213,	17),

(55481497,	213,	10),

(55920827,	213,	15),

(59394502,	213,	11),

(60555723,	213,	11),

(61496547,	213,	13),

(62998010,	213,	11),

(64445490,	213,	11),

(65440089,	213,	20),

(66080147,	213,	12),

(72165244,	213,	9
),
(73317454,	213,	16),

(74288538,	213,	16),

(77026788,	213,	11),

(77271695,	213,	12),

(78162009,	213,	11),

(78641051,	213,	15),

(82567240,	213,	16),

(85700983,	213,	13),

(87657665,	213,	18),

(89132300,	213,	15),

(92475083,	213,	11),

(13933301,	214,	10),

(16797391,	214,	12),

(18029580,	214,	12),

(23412027,	214,	15),

(33583386,	214,	18),

(33809838,	214,	3
),
(35544401,	214,	12),

(38867925,	214,	20),

(39014661,	214,	20),

(40177208,	214,	5
),
(44508242,	214,	4
),
(44975872,	214,	10),

(45124404,	214,	16),

(46341250,	214,	16),

(47992460,	214,	14),

(50255297,	214,	18),

(54277909,	214,	0
),
(55075253,	214,	6
),
(55481497,	214,	12),

(55920827,	214,	17),

(59394502,	214,	8
),
(60555723,	214,	12),

(61496547,	214,	10),

(62998010,	214,	7
),
(64445490,	214,	15),

(65440089,	214,	11),

(66080147,	214,	9
),
(72165244,	214,	0
),
(73317454,	214,	10),

(74288538,	214,	12),

(77026788,	214,	13),

(77271695,	214,	9
),
(78162009,	214,	4
),
(78641051,	214,	14),

(82567240,	214,	7
),
(85700983,	214,	8
),
(87657665,	214,	4
),
(89132300,	214,	14),

(92475083,	214,	9
),
(13933301,	215,	4),
(16797391,	215,	5),
(18029580,	215,	0),
(23412027,	215,	5),
(33583386,	215,	5),
(33809838,	215,	5),
(35544401,	215,	5),
(38867925,	215,	5),
(39014661,	215,	3),
(40177208,	215,	5),
(44508242,	215,	5),
(44975872,	215,	4),
(45124404,	215,	1),
(46341250,	215,	5),
(47992460,	215,	1),
(50255297,	215,	5),
(54277909,	215,	3),
(55075253,	215,	5),
(55481497,	215,	3),
(55920827,	215,	4),
(59394502,	215,	4),
(60555723,	215,	4),
(61496547,	215,	3),
(62998010,	215,	1),
(64445490,	215,	3),
(65440089,	215,	2),
(66080147,	215,	3),
(72165244,	215,	5),
(73317454,	215,	0),
(74288538,	215,	5),
(77026788,	215,	2),
(77271695,	215,	3),
(78162009,	215,	1),
(78641051,	215,	4),
(82567240,	215,	1),
(85700983,	215,	4),
(87657665,	215,	4),
(89132300,	215,	1),
(92475083,	215,	5),
(13933301,	216,	12),

(16797391,	216,	7
),
(18029580,	216,	15),

(23412027,	216,	10),

(33583386,	216,	13),

(33809838,	216,	10),

(35544401,	216,	6
),
(38867925,	216,	3
),
(39014661,	216,	10),

(40177208,	216,	6
),
(44508242,	216,	13),

(44975872,	216,	7
),
(45124404,	216,	9
),
(46341250,	216,	4
),
(47992460,	216,	11),

(50255297,	216,	7
),
(54277909,	216,	12),

(55075253,	216,	3
),
(55481497,	216,	8
),
(55920827,	216,	9
),
(59394502,	216,	11),

(60555723,	216,	7
),
(61496547,	216,	12),

(62998010,	216,	7
),
(64445490,	216,	11),

(65440089,	216,	20),

(66080147,	216,	6
),
(72165244,	216,	5
),
(73317454,	216,	7
),
(74288538,	216,	9
),
(77026788,	216,	6
),
(77271695,	216,	9
),
(78162009,	216,	6
),
(78641051,	216,	9
),
(82567240,	216,	10),

(85700983,	216,	16),

(87657665,	216,	14),

(89132300,	216,	4
),
(92475083,	216,	5
),
(11060460,	217,	16),

(12676344,	217,	17),

(13798907,	217,	16),

(14857390,	217,	13),

(14876495,	217,	10),
(15291264,	217,	13),

(15835420,	217,	12),

(17358086,	217,	13),

(18167729,	217,	13),

(22735531,	217,	13),

(31721186,	217,	16),

(33551716,	217,	18),

(37864801,	217,	5
),
(39028666,	217,	8
),
(39291233,	217,	20),

(42119585,	217,	7
),
(44618350,	217,	11),

(44809709,	217,	13),

(47500359,	217,	12),

(51067129,	217,	17),

(53414159,	217,	18),

(58498985,	217,	11),

(59542319,	217,	13),

(60436435,	217,	20),

(63239930,	217,	16),

(67735490,	217,	16),

(68243902,	217,	12),

(70714030,	217,	12),

(71582989,	217,	13),

(82232362,	217,	4
),
(86606105,	217,	18),

(88571574,	217,	11),

(92033729,	217,	5
),
(92343797,	217,	13),

(92883827,	217,	18),

(93501906,	217,	18),

(95481005,	217,	19),

(97792734,	217,	16),

(99115530,	217,	18),

(11060460,	218,	18),

(12676344,	218,	11),

(13798907,	218,	14),

(14857390,	218,	16),

(14876495,	218,	17),
(15291264,	218,	15),

(15835420,	218,	20),

(17358086,	218,	12),

(18167729,	218,	15),

(22735531,	218,	10),

(31721186,	218,	7
),
(33551716,	218,	18),

(37864801,	218,	13),

(39028666,	218,	9
),
(39291233,	218,	14),

(42119585,	218,	20),

(44618350,	218,	18),

(44809709,	218,	16),

(47500359,	218,	16),

(51067129,	218,	9
),
(53414159,	218,	18),

(58498985,	218,	13),

(59542319,	218,	11),

(60436435,	218,	10),

(63239930,	218,	8
),
(67735490,	218,	12),

(68243902,	218,	13),

(70714030,	218,	7
),
(71582989,	218,	11),

(82232362,	218,	11),

(86606105,	218,	12),

(88571574,	218,	13),

(92033729,	218,	11),

(92343797,	218,	6
),
(92883827,	218,	12),

(93501906,	218,	17),

(95481005,	218,	8
),
(97792734,	218,	15),

(99115530,	218,	11),

(11060460,	219,	12),

(12676344,	219,	6
),
(13798907,	219,	6
),
(14857390,	219,	12),

(14876495,	219,	17),
(15291264,	219,	0
),
(15835420,	219,	10),

(17358086,	219,	9
),
(18167729,	219,	13),

(22735531,	219,	10),

(31721186,	219,	11),

(33551716,	219,	10),

(37864801,	219,	18),

(39028666,	219,	12),
(39291233,	219,	4),
(42119585,	219,	13),

(44618350,	219,	17),

(44809709,	219,	16),

(47500359,	219,	3
),
(51067129,	219,	5
),
(53414159,	219,	6
),
(58498985,	219,	5
),
(59542319,	219,	8
),
(60436435,	219,	6
),
(63239930,	219,	7
),
(67735490,	219,	13),

(68243902,	219,	9
),
(70714030,	219,	14),

(71582989,	219,	14),

(82232362,	219,	13),

(86606105,	219,	15),

(88571574,	219,	5
),
(92033729,	219,	12),

(92343797,	219,	10),

(92883827,	219,	13),

(93501906,	219,	11),

(95481005,	219,	16),

(97792734,	219,	12),

(99115530,	219,	6
),
(11060460,	220,	17),

(12676344,	220,	11),

(13798907,	220,	11),

(14857390,	220,	7
),
(14876495,	220,	10),
(15291264,	220,	20),

(15835420,	220,	17),

(17358086,	220,	20),

(18167729,	220,	15),

(22735531,	220,	17),

(31721186,	220,	13),

(33551716,	220,	16),

(37864801,	220,	11),

(39028666,	220,	8),
(39291233,	220,	15),

(42119585,	220,	14),

(44618350,	220,	19),

(44809709,	220,	17),

(47500359,	220,	14),

(51067129,	220,	14),

(53414159,	220,	20),

(58498985,	220,	14),

(59542319,	220,	9
),
(60436435,	220,	13),

(63239930,	220,	12),

(67735490,	220,	9
),
(68243902,	220,	14),

(70714030,	220,	17),

(71582989,	220,	14),

(82232362,	220,	9
),
(86606105,	220,	10),

(88571574,	220,	12),

(92033729,	220,	17),

(92343797,	220,	17),

(92883827,	220,	20),

(93501906,	220,	10),

(95481005,	220,	14),

(97792734,	220,	15),

(99115530,	220,	13),

(11060460,	221,	11),

(12676344,	221,	14),

(13798907,	221,	19),

(14857390,	221,	12),

(14876495,	221,	18),

(15291264,	221,	16),

(15835420,	221,	8
),
(17358086,	221,	11),

(18167729,	221,	13),

(22735531,	221,	17),

(31721186,	221,	13),

(33551716,	221,	20),

(37864801,	221,	11),

(39028666,	221,	12),
(39291233,	221,	11),

(42119585,	221,	10),

(44618350,	221,	20),

(44809709,	221,	18),

(47500359,	221,	16),

(51067129,	221,	6
),
(53414159,	221,	17),

(58498985,	221,	18),

(59542319,	221,	18),

(60436435,	221,	13),

(63239930,	221,	13),

(67735490,	221,	20),

(68243902,	221,	13),

(70714030,	221,	13),

(71582989,	221,	10),

(82232362,	221,	18),

(86606105,	221,	12),

(88571574,	221,	13),

(92033729,	221,	18),

(92343797,	221,	13),

(92883827,	221,	17),

(93501906,	221,	13),

(95481005,	221,	18),

(97792734,	221,	17),

(99115530,	221,	18),

(11060460,	222,	10),

(12676344,	222,	7
),
(13798907,	222,	13),

(14857390,	222,	11),

(14876495,	222,	6),
(15291264,	222,	11),

(15835420,	222,	8
),
(17358086,	222,	10),

(18167729,	222,	12),

(22735531,	222,	15),

(31721186,	222,	16),

(33551716,	222,	10),

(37864801,	222,	15),

(39028666,	222,	10),
(39291233,	222,	11),

(42119585,	222,	13),

(44618350,	222,	9
),
(44809709,	222,	9
),
(47500359,	222,	8
),
(51067129,	222,	8
),
(53414159,	222,	8
),
(58498985,	222,	8
),
(59542319,	222,	4
),
(60436435,	222,	5
),
(63239930,	222,	10),

(67735490,	222,	8
),
(68243902,	222,	7
),
(70714030,	222,	5
),
(71582989,	222,	13),

(82232362,	222,	11),

(86606105,	222,	8
),
(88571574,	222,	8
),
(92033729,	222,	11),

(92343797,	222,	9
),
(92883827,	222,	10),

(93501906,	222,	2
),
(95481005,	222,	16),

(97792734,	222,	7
),
(99115530,	222,	2
),
(11060460,	223,	5),
(12676344,	223,	5),
(13798907,	223,	0),
(14857390,	223,	5),
(14876495,	223,	3),
(15291264,	223,	4),
(15835420,	223,	5),
(17358086,	223,	5),
(18167729,	223,	5),
(22735531,	223,	5),
(31721186,	223,	5),
(33551716,	223,	5),
(37864801,	223,	5),
(39028666,	223,	5),
(39291233,	223,	5),
(42119585,	223,	3),
(44618350,	223,	5),
(44809709,	223,	5),
(47500359,	223,	5),
(51067129,	223,	5),
(53414159,	223,	5),
(58498985,	223,	5),
(59542319,	223,	5),
(60436435,	223,	3),
(63239930,	223,	5),
(67735490,	223,	5),
(68243902,	223,	4),
(70714030,	223,	5),
(71582989,	223,	5),
(82232362,	223,	5),
(86606105,	223,	5),
(88571574,	223,	2),
(92033729,	223,	5),
(92343797,	223,	5),
(92883827,	223,	5),
(93501906,	223,	2),
(95481005,	223,	2),
(97792734,	223,	4),
(99115530,	223,	5),
(11060460,	224,	7
),
(12676344,	224,	20),

(13798907,	224,	9
),
(14857390,	224,	15),

(14876495,	224,	7
),
(15291264,	224,	17),

(15835420,	224,	13),

(17358086,	224,	11),

(18167729,	224,	10),

(22735531,	224,	3
),
(31721186,	224,	11),

(33551716,	224,	10),

(37864801,	224,	9
),
(39028666,	224,	16),

(39291233,	224,	8
),
(42119585,	224,	11),

(44618350,	224,	14),

(44809709,	224,	16),

(47500359,	224,	14),

(51067129,	224,	12),

(53414159,	224,	11),

(58498985,	224,	12),

(59542319,	224,	14),

(60436435,	224,	14),

(63239930,	224,	20),

(67735490,	224,	11),

(68243902,	224,	13),

(70714030,	224,	14),

(71582989,	224,	10),

(82232362,	224,	15),

(86606105,	224,	15),

(88571574,	224,	18),

(92033729,	224,	10),

(92343797,	224,	13),

(92883827,	224,	9
),
(93501906,	224,	12),

(95481005,	224,	18),

(97792734,	224,	16),

(99115530,	224,	17),

(11244206,	225,	10),

(12057283,	225,	15),

(13668883,	225,	11),

(13684450,	225,	19),

(14493579,	225,	6
),
(17188037,	225,	11),

(19542698,	225,	10),

(24834676,	225,	7
),
(26790179,	225,	15),

(31193777,	225,	16),

(31568819,	225,	12),

(33871863,	225,	11),

(36598030,	225,	12),

(44005211,	225,	16),

(44008477,	225,	12),

(47468588,	225,	19),

(48126470,	225,	13),

(50417103,	225,	7
),
(51671643,	225,	12),

(52220638,	225,	11),

(59334127,	225,	10),

(63887324,	225,	14),

(64578632,	225,	10),

(69181739,	225,	5
),
(74239452,	225,	12),

(75119033,	225,	9
),
(77713039,	225,	6
),
(77718435,	225,	12),

(79468224,	225,	12),

(80712718,	225,	9
),
(81512193,	225,	8
),
(81753964,	225,	6
),
(89130287,	225,	10),

(90582251,	225,	5
),
(93040696,	225,	7
),
(93220018,	225,	5
),
(94248610,	225,	13),

(96590182,	225,	3
),
(99597461,	225,	13),

(11244206,	226,	5
),
(12057283,	226,	12),

(13668883,	226,	14),

(13684450,	226,	9
),
(14493579,	226,	6
),
(17188037,	226,	10),

(19542698,	226,	7
),
(24834676,	226,	15),

(26790179,	226,	7
),
(31193777,	226,	11),

(31568819,	226,	8
),
(33871863,	226,	4
),
(36598030,	226,	13),

(44005211,	226,	11),

(44008477,	226,	8
),
(47468588,	226,	10),

(48126470,	226,	11),

(50417103,	226,	9
),
(51671643,	226,	15),

(52220638,	226,	11),

(59334127,	226,	16),

(63887324,	226,	9
),
(64578632,	226,	14),

(69181739,	226,	13),

(74239452,	226,	10),

(75119033,	226,	8
),
(77713039,	226,	15),

(77718435,	226,	8
),
(79468224,	226,	7
),
(80712718,	226,	14),

(81512193,	226,	8
),
(81753964,	226,	15),

(89130287,	226,	6
),
(90582251,	226,	14),

(93040696,	226,	6
),
(93220018,	226,	8
),
(94248610,	226,	8
),
(96590182,	226,	15),

(99597461,	226,	9
),
(11244206,	227,	6
),
(12057283,	227,	10),

(13668883,	227,	3
),
(13684450,	227,	0
),
(14493579,	227,	5
),
(17188037,	227,	9
),
(19542698,	227,	5
),
(24834676,	227,	10),

(26790179,	227,	5
),
(31193777,	227,	7
),
(31568819,	227,	5
),
(33871863,	227,	2
),
(36598030,	227,	11),

(44005211,	227,	9
),
(44008477,	227,	6
),
(47468588,	227,	12),

(48126470,	227,	9
),
(50417103,	227,	3
),
(51671643,	227,	5
),
(52220638,	227,	10),

(59334127,	227,	11),

(63887324,	227,	7
),
(64578632,	227,	11),

(69181739,	227,	12),

(74239452,	227,	14),

(75119033,	227,	14),

(77713039,	227,	13),

(77718435,	227,	9
),
(79468224,	227,	9
),
(80712718,	227,	11),

(81512193,	227,	5
),
(81753964,	227,	3
),
(89130287,	227,	8
),
(90582251,	227,	13),

(93040696,	227,	4
),
(93220018,	227,	10),

(94248610,	227,	9
),
(96590182,	227,	7
),
(99597461,	227,	7
),
(11244206,	228,	17),

(12057283,	228,	10),

(13668883,	228,	16),

(13684450,	228,	6
),
(14493579,	228,	12),

(17188037,	228,	11),

(19542698,	228,	7
),
(24834676,	228,	9
),
(26790179,	228,	15),

(31193777,	228,	15),

(31568819,	228,	8
),
(33871863,	228,	11),

(36598030,	228,	11),

(44005211,	228,	5
),
(44008477,	228,	11),

(47468588,	228,	10),

(48126470,	228,	10),

(50417103,	228,	15),

(51671643,	228,	18),

(52220638,	228,	9
),
(59334127,	228,	12),

(63887324,	228,	10),

(64578632,	228,	11),

(69181739,	228,	10),

(74239452,	228,	13),

(75119033,	228,	9
),
(77713039,	228,	9
),
(77718435,	228,	19),

(79468224,	228,	15),

(80712718,	228,	16),

(81512193,	228,	8
),
(81753964,	228,	16),

(89130287,	228,	10),

(90582251,	228,	15),

(93040696,	228,	10),

(93220018,	228,	10),

(94248610,	228,	11),

(96590182,	228,	11),

(99597461,	228,	10),

(11244206,	229,	10),

(12057283,	229,	10),

(13668883,	229,	2
),
(13684450,	229,	7
),
(14493579,	229,	7
),
(17188037,	229,	10),

(19542698,	229,	10),

(24834676,	229,	9
),
(26790179,	229,	3
),
(31193777,	229,	10),

(31568819,	229,	5
),
(33871863,	229,	9
),
(36598030,	229,	9
),
(44005211,	229,	8
),
(44008477,	229,	4
),
(47468588,	229,	6
),
(48126470,	229,	10),

(50417103,	229,	4
),
(51671643,	229,	6
),
(52220638,	229,	4
),
(59334127,	229,	10),

(63887324,	229,	3
),
(64578632,	229,	7
),
(69181739,	229,	9
),
(74239452,	229,	6
),
(75119033,	229,	10),

(77713039,	229,	6
),
(77718435,	229,	3
),
(79468224,	229,	4
),
(80712718,	229,	8
),
(81512193,	229,	10),

(81753964,	229,	6
),
(89130287,	229,	5
),
(90582251,	229,	9
),
(93040696,	229,	3
),
(93220018,	229,	6
),
(94248610,	229,	7
),
(96590182,	229,	8
),
(99597461,	229,	5
),
(11244206,	230,	12),

(12057283,	230,	14),

(13668883,	230,	5
),
(13684450,	230,	4
),
(14493579,	230,	11),

(17188037,	230,	3
),
(19542698,	230,	6
),
(24834676,	230,	16),

(26790179,	230,	13),

(31193777,	230,	13),

(31568819,	230,	14),

(33871863,	230,	11),

(36598030,	230,	13),

(44005211,	230,	10),

(44008477,	230,	17),

(47468588,	230,	18),

(48126470,	230,	6
),
(50417103,	230,	15),

(51671643,	230,	7
),
(52220638,	230,	7
),
(59334127,	230,	9
),
(63887324,	230,	12),

(64578632,	230,	5
),
(69181739,	230,	10),

(74239452,	230,	10),

(75119033,	230,	16),

(77713039,	230,	9
),
(77718435,	230,	13),

(79468224,	230,	17),

(80712718,	230,	11),

(81512193,	230,	8
),
(81753964,	230,	12),

(89130287,	230,	14),

(90582251,	230,	10),

(93040696,	230,	17),

(93220018,	230,	14),

(94248610,	230,	16),

(96590182,	230,	8
),
(99597461,	230,	11),

(11244206,	231,	1
),
(12057283,	231,	7
),
(13668883,	231,	20),

(13684450,	231,	16),

(14493579,	231,	2
),
(17188037,	231,	12),

(19542698,	231,	18),

(24834676,	231,	17),

(26790179,	231,	14),

(31193777,	231,	20),

(31568819,	231,	13),

(33871863,	231,	14),

(36598030,	231,	14),

(44005211,	231,	12),

(44008477,	231,	10),

(47468588,	231,	15),

(48126470,	231,	19),

(50417103,	231,	16),

(51671643,	231,	18),

(52220638,	231,	13),

(59334127,	231,	15),

(63887324,	231,	11),

(64578632,	231,	16),

(69181739,	231,	14),

(74239452,	231,	13),

(75119033,	231,	18),

(77713039,	231,	14),

(77718435,	231,	15),

(79468224,	231,	13),

(80712718,	231,	12),

(81512193,	231,	6
),
(81753964,	231,	9
),
(89130287,	231,	15),

(90582251,	231,	12),

(93040696,	231,	14),

(93220018,	231,	8
),
(94248610,	231,	13),

(96590182,	231,	10),

(99597461,	231,	9
),
(11244206,	232,	12),

(12057283,	232,	9
),
(13668883,	232,	7
),
(13684450,	232,	16),

(14493579,	232,	8
),
(17188037,	232,	6
),
(19542698,	232,	4
),
(24834676,	232,	15),

(26790179,	232,	11),

(31193777,	232,	2
),
(31568819,	232,	5
),
(33871863,	232,	11),

(36598030,	232,	16),

(44005211,	232,	6
),
(44008477,	232,	10),

(47468588,	232,	13),

(48126470,	232,	12),

(50417103,	232,	8
),
(51671643,	232,	6
),
(52220638,	232,	11),

(59334127,	232,	15),

(63887324,	232,	11),

(64578632,	232,	10),

(69181739,	232,	9
),
(74239452,	232,	15),

(75119033,	232,	6
),
(77713039,	232,	14),

(77718435,	232,	17),

(79468224,	232,	8
),
(80712718,	232,	15),

(81512193,	232,	7
),
(81753964,	232,	3
),
(89130287,	232,	14),

(90582251,	232,	15),

(93040696,	232,	12),

(93220018,	232,	14),

(94248610,	232,	5
),
(96590182,	232,	7
),
(99597461,	232,	4
),
(10998691,	233,	13),

(11304461,	233,	11),

(12505676,	233,	11),

(15974674,	233,	12),

(19137151,	233,	15),

(19867677,	233,	5
),
(23607067,	233,	12),

(23995642,	233,	15),

(28916456,	233,	18),

(30187810,	233,	18),

(31282994,	233,	3
),
(31628825,	233,	14),

(31852049,	233,	16),

(32033788,	233,	7
),
(35365463,	233,	9
),
(35507115,	233,	11),

(35992111,	233,	12),

(42685896,	233,	14),

(42768632,	233,	11),

(43500959,	233,	4
),
(46844640,	233,	8
),
(48563699,	233,	15),

(54679482,	233,	11),

(57467650,	233,	11),

(59916483,	233,	13),

(64398919,	233,	18),

(64530056,	233,	8
),
(66921228,	233,	10),

(68529349,	233,	9
),
(68677240,	233,	15),

(71708814,	233,	6
),
(80614518,	233,	11),

(81768602,	233,	7
),
(84158312,	233,	11),

(85368583,	233,	9
),
(85632352,	233,	9
),
(86872045,	233,	10),

(90935543,	233,	19),

(91565702,	233,	7
),
(10998691,	234,	5),
(11304461,	234,	4),
(12505676,	234,	5),
(15974674,	234,	3),
(19137151,	234,	5),
(19867677,	234,	4),
(23607067,	234,	3),
(23995642,	234,	2),
(28916456,	234,	1),
(30187810,	234,	0),
(31282994,	234,	2),
(31628825,	234,	5),
(31852049,	234,	5),
(32033788,	234,	2),
(35365463,	234,	3),
(35507115,	234,	5),
(35992111,	234,	5),
(42685896,	234,	0),
(42768632,	234,	4),
(43500959,	234,	4),
(46844640,	234,	1),
(48563699,	234,	5),
(54679482,	234,	5),
(57467650,	234,	2),
(59916483,	234,	5),
(64398919,	234,	5),
(64530056,	234,	2),
(66921228,	234,	1),
(68529349,	234,	0),
(68677240,	234,	2),
(71708814,	234,	5),
(80614518,	234,	5),
(81768602,	234,	5),
(84158312,	234,	4),
(85368583,	234,	1),
(85632352,	234,	4),
(86872045,	234,	5),
(90935543,	234,	2),
(91565702,	234,	3),
(10998691,	235,	10),

(11304461,	235,	7
),
(12505676,	235,	7
),
(15974674,	235,	6
),
(19137151,	235,	11),

(19867677,	235,	8
),
(23607067,	235,	12),

(23995642,	235,	9
),
(28916456,	235,	1
),
(30187810,	235,	1
),
(31282994,	235,	11),

(31628825,	235,	9
),
(31852049,	235,	11),

(32033788,	235,	8
),
(35365463,	235,	10),

(35507115,	235,	10),

(35992111,	235,	17),

(42685896,	235,	8
),
(42768632,	235,	9
),
(43500959,	235,	8
),
(46844640,	235,	10),

(48563699,	235,	10),

(54679482,	235,	5
),
(57467650,	235,	17),

(59916483,	235,	8
),
(64398919,	235,	5
),
(64530056,	235,	10),

(66921228,	235,	11),

(68529349,	235,	13),

(68677240,	235,	7
),
(71708814,	235,	6
),
(80614518,	235,	9
),
(81768602,	235,	3
),
(84158312,	235,	4
),
(85368583,	235,	10),

(85632352,	235,	3
),
(86872045,	235,	6
),
(90935543,	235,	12),

(91565702,	235,	0
),
(10998691,	236,	20),

(11304461,	236,	13),

(12505676,	236,	14),

(15974674,	236,	7
),
(19137151,	236,	11),

(19867677,	236,	10),

(23607067,	236,	10),

(23995642,	236,	10),

(28916456,	236,	8
),
(30187810,	236,	9
),
(31282994,	236,	12),

(31628825,	236,	10),

(31852049,	236,	5
),
(32033788,	236,	6
),
(35365463,	236,	10),

(35507115,	236,	13),

(35992111,	236,	12),

(42685896,	236,	7
),
(42768632,	236,	12),

(43500959,	236,	10),

(46844640,	236,	8
),
(48563699,	236,	10),

(54679482,	236,	8
),
(57467650,	236,	10),

(59916483,	236,	13),

(64398919,	236,	8
),
(64530056,	236,	9
),
(66921228,	236,	6
),
(68529349,	236,	6
),
(68677240,	236,	10),

(71708814,	236,	14),

(80614518,	236,	8
),
(81768602,	236,	7
),
(84158312,	236,	18),

(85368583,	236,	13),

(85632352,	236,	6
),
(86872045,	236,	7
),
(90935543,	236,	12),

(91565702,	236,	9
),
(10998691,	237,	16),

(11304461,	237,	6
),
(12505676,	237,	8
),
(15974674,	237,	9
),
(19137151,	237,	11),

(19867677,	237,	14),

(23607067,	237,	15),

(23995642,	237,	10),

(28916456,	237,	13),

(30187810,	237,	14),

(31282994,	237,	13),

(31628825,	237,	16),

(31852049,	237,	10),

(32033788,	237,	20),

(35365463,	237,	20),

(35507115,	237,	15),

(35992111,	237,	11),

(42685896,	237,	19),

(42768632,	237,	15),

(43500959,	237,	13),

(46844640,	237,	5
),
(48563699,	237,	14),

(54679482,	237,	14),

(57467650,	237,	15),

(59916483,	237,	15),

(64398919,	237,	13),

(64530056,	237,	14),

(66921228,	237,	5
),
(68529349,	237,	11),

(68677240,	237,	11),

(71708814,	237,	14),

(80614518,	237,	10),

(81768602,	237,	6
),
(84158312,	237,	9
),
(85368583,	237,	11),

(85632352,	237,	14),

(86872045,	237,	16),

(90935543,	237,	18),

(91565702,	237,	18),

(10998691,	238,	0
),
(11304461,	238,	11),

(12505676,	238,	6
),
(15974674,	238,	9
),
(19137151,	238,	16),

(19867677,	238,	9
),
(23607067,	238,	10),

(23995642,	238,	11),

(28916456,	238,	10),

(30187810,	238,	16),

(31282994,	238,	11),

(31628825,	238,	11),

(31852049,	238,	11),

(32033788,	238,	20),

(35365463,	238,	3
),
(35507115,	238,	11),

(35992111,	238,	14),

(42685896,	238,	6
),
(42768632,	238,	1
),
(43500959,	238,	10),

(46844640,	238,	11),

(48563699,	238,	15),

(54679482,	238,	6
),
(57467650,	238,	14),

(59916483,	238,	8
),
(64398919,	238,	8
),
(64530056,	238,	15),

(66921228,	238,	7
),
(68529349,	238,	9
),
(68677240,	238,	4
),
(71708814,	238,	14),

(80614518,	238,	12),

(81768602,	238,	7
),
(84158312,	238,	7
),
(85368583,	238,	6
),
(85632352,	238,	17),

(86872045,	238,	3
),
(90935543,	238,	10),

(91565702,	238,	11),

(10998691,	239,	13),

(11304461,	239,	11),

(12505676,	239,	15),

(15974674,	239,	18),

(19137151,	239,	15),

(19867677,	239,	6
),
(23607067,	239,	14),

(23995642,	239,	7
),
(28916456,	239,	11),

(30187810,	239,	12),

(31282994,	239,	14),

(31628825,	239,	15),

(31852049,	239,	7
),
(32033788,	239,	14),

(35365463,	239,	9
),
(35507115,	239,	14),

(35992111,	239,	5
),
(42685896,	239,	13),

(42768632,	239,	8
),
(43500959,	239,	13),

(46844640,	239,	14),

(48563699,	239,	12),

(54679482,	239,	11),

(57467650,	239,	12),

(59916483,	239,	14),

(64398919,	239,	10),

(64530056,	239,	10),

(66921228,	239,	12),

(68529349,	239,	7
),
(68677240,	239,	11),

(71708814,	239,	13),

(80614518,	239,	7
),
(81768602,	239,	10),

(84158312,	239,	6
),
(85368583,	239,	16),

(85632352,	239,	12),

(86872045,	239,	8
),
(90935543,	239,	11),

(91565702,	239,	11),

(10998691,	240,	9
),
(11304461,	240,	12),

(12505676,	240,	7
),
(15974674,	240,	4
),
(19137151,	240,	9
),
(19867677,	240,	12),

(23607067,	240,	8
),
(23995642,	240,	14),

(28916456,	240,	11),

(30187810,	240,	6
),
(31282994,	240,	3
),
(31628825,	240,	10),

(31852049,	240,	8
),
(32033788,	240,	6
),
(35365463,	240,	13),

(35507115,	240,	8
),
(35992111,	240,	7
),
(42685896,	240,	11),

(42768632,	240,	0
),
(43500959,	240,	0
),
(46844640,	240,	8
),
(48563699,	240,	7
),
(54679482,	240,	1
),
(57467650,	240,	2
),
(59916483,	240,	4
),
(64398919,	240,	9
),
(64530056,	240,	5
),
(66921228,	240,	8
),
(68529349,	240,	8
),
(68677240,	240,	3
),
(71708814,	240,	13),

(80614518,	240,	3
),
(81768602,	240,	10),

(84158312,	240,	3
),
(85368583,	240,	7
),
(85632352,	240,	8
),
(86872045,	240,	5
),
(90935543,	240,	11),

(91565702,	240,	3
),
(10534206,	241,	2
),
(20236412,	241,	14),

(20427756,	241,	0
),
(21931678,	241,	6
),
(22730658,	241,	8
),
(22844995,	241,	12),

(24474176,	241,	12),

(27595348,	241,	1
),
(27965307,	241,	4
),
(28915481,	241,	8
),
,(29172201,	241,	6
),
(30157844,	241,	5
),
(30589090,	241,	9
),
(35563113,	241,	15),

(35733587,	241,	9
),
(36969032,	241,	6
),
(37560862,	241,	9
),
(40384219,	241,	7
),
(41609700,	241,	6
),
(43320982,	241,	12),

(45814182,	241,	8
),
(52238473,	241,	6
),
(53104670,	241,	10),

(55810467,	241,	11),

(56046099,	241,	7
),
(63156760,	241,	5
),
(63217302,	241,	9
),
(63246226,	241,	15),

(64973126,	241,	3
),
(72751710,	241,	9
),
(74447273,	241,	12),

(75640107,	241,	8
),
(84633041,	241,	15),

(86264655,	241,	5
),
(86534235,	241,	7
),
(91750903,	241,	9
),
(95787979,	241,	12),

(96820901,	241,	7
),
(97314565,	241,	3
),
(10534206,	242,	12),

(20236412,	242,	12),

(20427756,	242,	10),

(21931678,	242,	11),

(22730658,	242,	12),

(22844995,	242,	10),

(24474176,	242,	10),

(27595348,	242,	7
),
(27965307,	242,	15),

(28915481,	242,	6
),
(29172201,	242,	11),

(30157844,	242,	16),

(30589090,	242,	1
),
(35563113,	242,	12),

(35733587,	242,	12),

(36969032,	242,	3
),
(37560862,	242,	12),

(40384219,	242,	15),

(41609700,	242,	9
),
(43320982,	242,	17),

(45814182,	242,	10),

(52238473,	242,	13),

(53104670,	242,	10),

(55810467,	242,	10),

(56046099,	242,	6
),
(63156760,	242,	10),

(63217302,	242,	14),

(63246226,	242,	12),

(64973126,	242,	12),

(72751710,	242,	10),

(74447273,	242,	13),

(75640107,	242,	9
),
(84633041,	242,	8
),
(86264655,	242,	3
),
(86534235,	242,	20),

(91750903,	242,	9
),
(95787979,	242,	9
),
(96820901,	242,	8
),
(97314565,	242,	2
),
(10534206,	243,	20),

(20236412,	243,	6
),
(20427756,	243,	20),

(21931678,	243,	9
),
(22730658,	243,	13),

(22844995,	243,	12),

(24474176,	243,	13),

(27595348,	243,	12),

(27965307,	243,	12),

(28915481,	243,	10),

(29172201,	243,	5
),
(30157844,	243,	14),

(30589090,	243,	7
),
(35563113,	243,	14),

(35733587,	243,	16),

(36969032,	243,	13),

(37560862,	243,	18),

(40384219,	243,	12),

(41609700,	243,	14),

(43320982,	243,	12),

(45814182,	243,	16),

(52238473,	243,	15),

(53104670,	243,	12),

(55810467,	243,	14),

(56046099,	243,	11),

(63156760,	243,	10),

(63217302,	243,	5
),
(63246226,	243,	18),

(64973126,	243,	10),

(72751710,	243,	11),

(74447273,	243,	10),

(75640107,	243,	14),

(84633041,	243,	11),

(86264655,	243,	12),

(86534235,	243,	6
),
(91750903,	243,	10),

(95787979,	243,	16),

(96820901,	243,	8
),
(97314565,	243,	16),

(10534206,	244,	12),

(20236412,	244,	11),

(20427756,	244,	8
),
(21931678,	244,	14),

(22730658,	244,	7
),
(22844995,	244,	11),

(24474176,	244,	6
),
(27595348,	244,	9
),
(27965307,	244,	14),

(28915481,	244,	17),
(29172201,	244,	8
),
(30157844,	244,	5
),
(30589090,	244,	9
),
(35563113,	244,	10),

(35733587,	244,	10),

(36969032,	244,	11),

(37560862,	244,	9
),
(40384219,	244,	13),

(41609700,	244,	6
),
(43320982,	244,	10),

(45814182,	244,	6
),
(52238473,	244,	6
),
(53104670,	244,	7
),
(55810467,	244,	9
),
(56046099,	244,	8
),
(63156760,	244,	2
),
(63217302,	244,	12),

(63246226,	244,	11),

(64973126,	244,	8
),
(72751710,	244,	15),

(74447273,	244,	8
),
(75640107,	244,	13),

(84633041,	244,	5
),
(86264655,	244,	11),

(86534235,	244,	1
),
(91750903,	244,	13),

(95787979,	244,	9
),
(96820901,	244,	10),

(97314565,	244,	0
),
(10534206,	245,	4
),
(20236412,	245,	8
),
(20427756,	245,	16),

(21931678,	245,	8
),
(22730658,	245,	15),

(22844995,	245,	0
),
(24474176,	245,	13),

(27595348,	245,	8
),
(27965307,	245,	1
),
(28915481,	245,	8
),
(29172201,	245,	4
),
(30157844,	245,	9
),
(30589090,	245,	8
),
(35563113,	245,	8
),
(35733587,	245,	15),

(36969032,	245,	15),

(37560862,	245,	2
),
(40384219,	245,	15),

(41609700,	245,	10),

(43320982,	245,	7
),
(45814182,	245,	13),

(52238473,	245,	5
),
(53104670,	245,	9
),
(55810467,	245,	13),

(56046099,	245,	7
),
(63156760,	245,	3
),
(63217302,	245,	17),

(63246226,	245,	15),

(64973126,	245,	12),

(72751710,	245,	8
),
(74447273,	245,	3
),
(75640107,	245,	9
),
(84633041,	245,	14),

(86264655,	245,	16),

(86534235,	245,	6
),
(91750903,	245,	16),

(95787979,	245,	11),

(96820901,	245,	16),

(97314565,	245,	9
),
(10534206,	246,	9
),
(20236412,	246,	11),

(20427756,	246,	7
),
(21931678,	246,	4
),
(22730658,	246,	6
),
(22844995,	246,	6
),
(24474176,	246,	8
),
(27595348,	246,	10),

(27965307,	246,	8
),
(28915481,	246,	8
),
(29172201,	246,	8
),
(30157844,	246,	10),

(30589090,	246,	8
),
(35563113,	246,	10),

(35733587,	246,	9
),
(36969032,	246,	10),

(37560862,	246,	10),

(40384219,	246,	8
),
(41609700,	246,	5
),
(43320982,	246,	13),

(45814182,	246,	4
),
(52238473,	246,	6
),
(53104670,	246,	9
),
(55810467,	246,	14),

(56046099,	246,	6
),
(63156760,	246,	5
),
(63217302,	246,	10),

(63246226,	246,	3
),
(64973126,	246,	8
),
(72751710,	246,	16),

(74447273,	246,	1
),
(75640107,	246,	6
),
(84633041,	246,	7
),
(86264655,	246,	17),

(86534235,	246,	3
),
(91750903,	246,	4
),
(95787979,	246,	14),

(96820901,	246,	10),

(97314565,	246,	4
),
(10534206,	247,	5
),
(20236412,	247,	15),

(20427756,	247,	6
),
(21931678,	247,	8
),
(22730658,	247,	6
),
(22844995,	247,	2
),
(24474176,	247,	9
),
(27595348,	247,	4
),
(27965307,	247,	13),

(28915481,	247,	16),

(29172201,	247,	8
),
(30157844,	247,	6
),
(30589090,	247,	7
),
(35563113,	247,	5
),
(35733587,	247,	13),

(36969032,	247,	10),

(37560862,	247,	5
),
(40384219,	247,	12),

(41609700,	247,	14),

(43320982,	247,	12),

(45814182,	247,	7
),
(52238473,	247,	10),

(53104670,	247,	7
),
(55810467,	247,	9
),
(56046099,	247,	9
),
(63156760,	247,	8
),
(63217302,	247,	14),

(63246226,	247,	18),

(64973126,	247,	7
),
(72751710,	247,	7
),
(74447273,	247,	10),

(75640107,	247,	4
),
(84633041,	247,	7
),
(86264655,	247,	5
),
(86534235,	247,	5
),
(91750903,	247,	10),

(95787979,	247,	12),

(96820901,	247,	12),

(97314565,	247,	0
),
(10534206,	248,	17),

(20236412,	248,	12),

(20427756,	248,	16),

(21931678,	248,	10),

(22730658,	248,	9
),
(22844995,	248,	14),

(24474176,	248,	10),

(27595348,	248,	9
),
(27965307,	248,	9
),
(28915481,	248,	16),

(29172201,	248,	11),

(30157844,	248,	20),

(30589090,	248,	13),

(35563113,	248,	11),

(35733587,	248,	14),

(36969032,	248,	12),

(37560862,	248,	10),

(40384219,	248,	14),

(41609700,	248,	16),

(43320982,	248,	12),

(45814182,	248,	8
),
(52238473,	248,	20),

(53104670,	248,	20),

(55810467,	248,	13),

(56046099,	248,	15),

(63156760,	248,	11),

(63217302,	248,	18),

(63246226,	248,	14),

(64973126,	248,	9
),
(72751710,	248,	18),

(74447273,	248,	13),

(75640107,	248,	20),

(84633041,	248,	15),

(86264655,	248,	17),

(86534235,	248,	16),

(91750903,	248,	14),

(95787979,	248,	15),

(96820901,	248,	9
),
(97314565,	248,	12),

(10281753,	249,	10),

(12332209,	249,	7
),
(14627641,	249,	11),

(15710421,	249,	1
),
(16659116,	249,	9
),
(17123230,	249,	8
),
(20885928,	249,	9
),
(22715713,	249,	5
),
(23166329,	249,	0
),
(26047923,	249,	7
),
(26487936,	249,	9
),
(27162414,	249,	10),

(27204056,	249,	4
),
(33937912,	249,	13),

(36065627,	249,	3
),
(36354616,	249,	7
),
(43246940,	249,	11),

(47791655,	249,	10),

(48743705,	249,	10),

(51572168,	249,	12),

(52567239,	249,	7
),
(52794581,	249,	15),

(55549712,	249,	11),

(55813326,	249,	10),

(56462246,	249,	6
),
(57253118,	249,	10),

(63899654,	249,	7
),
(66407977,	249,	4
),
(72936625,	249,	6
),
(75692632,	249,	8
),
(76662813,	249,	7
),
(78445718,	249,	0
),
(81965142,	249,	6
),
(83201687,	249,	10),

(84667886,	249,	6
),
(86461348,	249,	9
),
(89715013,	249,	4
),
(97467090,	249,	15),

(99904277,	249,	12),

(10281753,	250,	16),

(12332209,	250,	15),

(14627641,	250,	18),

(15710421,	250,	20),

(16659116,	250,	13),

(17123230,	250,	16),

(20885928,	250,	11),

(22715713,	250,	10),

(23166329,	250,	7
),
(26047923,	250,	14),

(26487936,	250,	15),

(27162414,	250,	12),

(27204056,	250,	14),

(33937912,	250,	11),

(36065627,	250,	20),

(36354616,	250,	19),

(43246940,	250,	14),

(47791655,	250,	20),

(48743705,	250,	20),

(51572168,	250,	19),

(52567239,	250,	20),

(52794581,	250,	20),

(55549712,	250,	11),

(55813326,	250,	10),

(56462246,	250,	10),

(57253118,	250,	12),

(63899654,	250,	20),

(66407977,	250,	11),

(72936625,	250,	16),

(75692632,	250,	9
),
(76662813,	250,	14),

(78445718,	250,	12),

(81965142,	250,	18),

(83201687,	250,	13),

(84667886,	250,	14),

(86461348,	250,	15),

(89715013,	250,	10),

(97467090,	250,	10),

(99904277,	250,	14),

(10281753,	251,	4
),
(12332209,	251,	7
),
(14627641,	251,	5
),
(15710421,	251,	9
),
(16659116,	251,	0
),
(17123230,	251,	5
),
(20885928,	251,	3
),
(22715713,	251,	3
),
(23166329,	251,	6
),
(26047923,	251,	4
),
(26487936,	251,	5
),
(27162414,	251,	2
),
(27204056,	251,	2
),
(33937912,	251,	10),

(36065627,	251,	6
),
(36354616,	251,	5
),
(43246940,	251,	6
),
(47791655,	251,	0
),
(48743705,	251,	9
),
(51572168,	251,	3
),
(52567239,	251,	1
),
(52794581,	251,	5
),
(55549712,	251,	6
),
(55813326,	251,	8
),
(56462246,	251,	4
),
(57253118,	251,	7
),
(63899654,	251,	2
),
(66407977,	251,	7
),
(72936625,	251,	3
),
(75692632,	251,	7
),
(76662813,	251,	3
),
(78445718,	251,	0
),
(81965142,	251,	4
),
(83201687,	251,	1
),
(84667886,	251,	1
),
(86461348,	251,	3
),
(89715013,	251,	8
),
(97467090,	251,	9
),
(99904277,	251,	7
),
(10281753,	252,	9
),
(12332209,	252,	6
),
(14627641,	252,	13),

(15710421,	252,	16),

(16659116,	252,	8
),
(17123230,	252,	15),

(20885928,	252,	10),

(22715713,	252,	7
),
(23166329,	252,	15),

(26047923,	252,	1
),
(26487936,	252,	7
),
(27162414,	252,	11),

(27204056,	252,	9
),
(33937912,	252,	10),

(36065627,	252,	10),

(36354616,	252,	6
),
(43246940,	252,	15),

(47791655,	252,	12),

(48743705,	252,	17),

(51572168,	252,	9
),
(52567239,	252,	12),

(52794581,	252,	11),

(55549712,	252,	16),

(55813326,	252,	19),

(56462246,	252,	6
),
(57253118,	252,	10),

(63899654,	252,	8
),
(66407977,	252,	15),

(72936625,	252,	10),

(75692632,	252,	12),

(76662813,	252,	9
),
(78445718,	252,	12),

(81965142,	252,	8
),
(83201687,	252,	18),

(84667886,	252,	7
),
(86461348,	252,	7
),
(89715013,	252,	14),

(97467090,	252,	15),

(99904277,	252,	14),

(10281753,	253,	13),

(12332209,	253,	15),

(14627641,	253,	13),

(15710421,	253,	19),

(16659116,	253,	17),

(17123230,	253,	9
),
(20885928,	253,	16),

(22715713,	253,	13),

(23166329,	253,	11),

(26047923,	253,	10),

(26487936,	253,	17),

(27162414,	253,	12),

(27204056,	253,	12),

(33937912,	253,	13),

(36065627,	253,	16),

(36354616,	253,	12),

(43246940,	253,	6
),
(47791655,	253,	14),

(48743705,	253,	17),

(51572168,	253,	8
),
(52567239,	253,	10),

(52794581,	253,	10),

(55549712,	253,	14),

(55813326,	253,	14),

(56462246,	253,	12),

(57253118,	253,	14),

(63899654,	253,	6
),
(66407977,	253,	18),

(72936625,	253,	12),

(75692632,	253,	10),

(76662813,	253,	12),

(78445718,	253,	9
),
(81965142,	253,	17),

(83201687,	253,	19),

(84667886,	253,	3
),
(86461348,	253,	11),

(89715013,	253,	6
),
(97467090,	253,	7
),
(99904277,	253,	4
),
(10281753,	254,	4
),
(12332209,	254,	7
),
(14627641,	254,	6
),
(15710421,	254,	8
),
(16659116,	254,	2
),
(17123230,	254,	1
),
(20885928,	254,	2
),
(22715713,	254,	6
),
(23166329,	254,	8
),
(26047923,	254,	7
),
(26487936,	254,	3
),
(27162414,	254,	1
),
(27204056,	254,	1
),
(33937912,	254,	6
),
(36065627,	254,	7
),
(36354616,	254,	4
),
(43246940,	254,	9
),
(47791655,	254,	7
),
(48743705,	254,	0
),
(51572168,	254,	0
),
(52567239,	254,	0
),
(52794581,	254,	8
),
(55549712,	254,	9
),
(55813326,	254,	2
),
(56462246,	254,	3
),
(57253118,	254,	8
),
(63899654,	254,	6
),
(66407977,	254,	0
),
(72936625,	254,	6
),
(75692632,	254,	10),

(76662813,	254,	2
),
(78445718,	254,	4
),
(81965142,	254,	5
),
(83201687,	254,	5
),
(84667886,	254,	7
),
(86461348,	254,	4
),
(89715013,	254,	6
),
(97467090,	254,	7
),
(99904277,	254,	4
),
(10281753,	255,	11),

(12332209,	255,	14),

(14627641,	255,	11),

(15710421,	255,	11),

(16659116,	255,	19),

(17123230,	255,	8
),
(20885928,	255,	11),

(22715713,	255,	12),

(23166329,	255,	8
),
(26047923,	255,	17),

(26487936,	255,	14),

(27162414,	255,	9
),
(27204056,	255,	14),

(33937912,	255,	11),

(36065627,	255,	18),

(36354616,	255,	13),

(43246940,	255,	9
),
(47791655,	255,	13),

(48743705,	255,	8
),
(51572168,	255,	16),

(52567239,	255,	11),

(52794581,	255,	16),

(55549712,	255,	13),

(55813326,	255,	11),

(56462246,	255,	8
),
(57253118,	255,	17),

(63899654,	255,	11),

(66407977,	255,	5
),
(72936625,	255,	11),

(75692632,	255,	8
),
(76662813,	255,	10),

(78445718,	255,	11),

(81965142,	255,	15),

(83201687,	255,	8
),
(84667886,	255,	12),

(86461348,	255,	17),

(89715013,	255,	13),

(97467090,	255,	7
),
(99904277,	255,	12),

(10281753,	256,	6
),
(12332209,	256,	9
),
(14627641,	256,	3
),
(15710421,	256,	0
),
(16659116,	256,	8
),
(17123230,	256,	14),

(20885928,	256,	14),

(22715713,	256,	6
),
(23166329,	256,	8
),
(26047923,	256,	8
),
(26487936,	256,	3
),
(27162414,	256,	8
),
(27204056,	256,	10),

(33937912,	256,	0
),
(36065627,	256,	2
),
(36354616,	256,	5
),
(43246940,	256,	0
),
(47791655,	256,	8
),
(48743705,	256,	1
),
(51572168,	256,	1
),
(52567239,	256,	3
),
(52794581,	256,	10),

(55549712,	256,	11),

(55813326,	256,	1
),
(56462246,	256,	16),

(57253118,	256,	4
),
(63899654,	256,	6
),
(66407977,	256,	18),

(72936625,	256,	16),

(75692632,	256,	17),

(76662813,	256,	8
),
(78445718,	256,	11),

(81965142,	256,	3
),
(83201687,	256,	13),

(84667886,	256,	11),

(86461348,	256,	14),

(89715013,	256,	5
),
(97467090,	256,	5
),
(99904277,	256,	6
),
(12695343,	257,	17),

(15330035,	257,	15),

(19611576,	257,	16),

(22491150,	257,	11),

(23144259,	257,	11),

(24655905,	257,	16),

(25179222,	257,	6
),
(26326420,	257,	16),

(28827259,	257,	12),

(29386219,	257,	12),

(29557897,	257,	9
),
(30901477,	257,	7
),
(34457914,	257,	12),

(34619084,	257,	3
),
(35183865,	257,	8
),
(39409116,	257,	9
),
(41083936,	257,	11),

(42620373,	257,	13),

(45241147,	257,	11),

(46275969,	257,	10),

(50649325,	257,	10),

(53972238,	257,	14),

(54954233,	257,	10),

(56622972,	257,	5
),
(60594527,	257,	6
),
(61414047,	257,	8
),
(66542703,	257,	10),

(66905564,	257,	15),

(68727765,	257,	12),

(71257664,	257,	13),

(74709445,	257,	6
),
(76257107,	257,	9
),
(79360908,	257,	12),

(79593813,	257,	9
),
(86510574,	257,	7
),
(86930808,	257,	10),

(91074522,	257,	11),

(91980591,	257,	13),

(96116283,	257,	13),

(12695343,	258,	5
),
(15330035,	258,	6
),
(19611576,	258,	11),

(22491150,	258,	14),

(23144259,	258,	5
),
(24655905,	258,	14),

(25179222,	258,	11),

(26326420,	258,	11),

(28827259,	258,	9
),
(29386219,	258,	10),

(29557897,	258,	14),

(30901477,	258,	12),

(34457914,	258,	13),

(34619084,	258,	6
),
(35183865,	258,	17),

(39409116,	258,	14),

(41083936,	258,	9
),
(42620373,	258,	4
),
(45241147,	258,	3
),
(46275969,	258,	12),

(50649325,	258,	14),

(53972238,	258,	8
),
(54954233,	258,	11),

(56622972,	258,	17),

(60594527,	258,	10),

(61414047,	258,	18),

(66542703,	258,	7
),
(66905564,	258,	5
),
(68727765,	258,	12),

(71257664,	258,	11),

(74709445,	258,	7
),
(76257107,	258,	6
),
(79360908,	258,	10),

(79593813,	258,	14),

(86510574,	258,	11),

(86930808,	258,	6
),
(91074522,	258,	9
),
(91980591,	258,	8
),
(96116283,	258,	8
),
(12695343,	259,	4
),
(15330035,	259,	0
),
(19611576,	259,	5
),
(22491150,	259,	0
),
(23144259,	259,	5
),
(24655905,	259,	2
),
(25179222,	259,	0
),
(26326420,	259,	3
),
(28827259,	259,	4
),
(29386219,	259,	0
),
(29557897,	259,	8
),
(30901477,	259,	4
),
(34457914,	259,	0
),
(34619084,	259,	10),

(35183865,	259,	4
),
(39409116,	259,	0
),
(41083936,	259,	0
),
(42620373,	259,	5
),
(45241147,	259,	2
),
(46275969,	259,	2
),
(50649325,	259,	7
),
(53972238,	259,	6
),
(54954233,	259,	8
),
(56622972,	259,	7
),
(60594527,	259,	5
),
(61414047,	259,	0
),
(66542703,	259,	3
),
(66905564,	259,	1
),
(68727765,	259,	1
),
(71257664,	259,	4
),
(74709445,	259,	0
),
(76257107,	259,	8
),
(79360908,	259,	0
),
(79593813,	259,	1
),
(86510574,	259,	8
),
(86930808,	259,	5
),
(91074522,	259,	2
),
(91980591,	259,	0
),
(96116283,	259,	0
),
(12695343,	260,	15),

(15330035,	260,	16),

(19611576,	260,	18),

(22491150,	260,	13),

(23144259,	260,	17),

(24655905,	260,	10),

(25179222,	260,	12),

(26326420,	260,	11),

(28827259,	260,	12),

(29386219,	260,	10),

(29557897,	260,	11),

(30901477,	260,	8
),
(34457914,	260,	15),

(34619084,	260,	12),

(35183865,	260,	19),

(39409116,	260,	9
),
(41083936,	260,	9
),
(42620373,	260,	14),

(45241147,	260,	13),

(46275969,	260,	14),

(50649325,	260,	18),

(53972238,	260,	18),

(54954233,	260,	17),

(56622972,	260,	14),

(60594527,	260,	15),

(61414047,	260,	11),

(66542703,	260,	17),

(66905564,	260,	11),

(68727765,	260,	15),

(71257664,	260,	17),

(74709445,	260,	16),

(76257107,	260,	11),

(79360908,	260,	9
),
(79593813,	260,	13),

(86510574,	260,	9
),
(86930808,	260,	10),

(91074522,	260,	17),

(91980591,	260,	13),

(96116283,	260,	18),

(12695343,	261,	13),

(15330035,	261,	9
),
(19611576,	261,	7
),
(22491150,	261,	10),

(23144259,	261,	13),

(24655905,	261,	9
),
(25179222,	261,	12),

(26326420,	261,	9
),
(28827259,	261,	7
),
(29386219,	261,	7
),
(29557897,	261,	14),

(30901477,	261,	8
),
(34457914,	261,	4
),
(34619084,	261,	13),

(35183865,	261,	15),

(39409116,	261,	12),

(41083936,	261,	9
),
(42620373,	261,	9
),
(45241147,	261,	16),

(46275969,	261,	13),

(50649325,	261,	9
),
(53972238,	261,	15),

(54954233,	261,	20),

(56622972,	261,	2
),
(60594527,	261,	6
),
(61414047,	261,	7
),
(66542703,	261,	20),

(66905564,	261,	9
),
(68727765,	261,	6
),
(71257664,	261,	12),

(74709445,	261,	11),

(76257107,	261,	8
),
(79360908,	261,	8
),
(79593813,	261,	3
),
(86510574,	261,	16),

(86930808,	261,	14),

(91074522,	261,	7
),
(91980591,	261,	15),

(96116283,	261,	9
),
(12695343,	262,	7
),
(15330035,	262,	11),

(19611576,	262,	11),

(22491150,	262,	8
),
(23144259,	262,	12),

(24655905,	262,	5
),
(25179222,	262,	20),

(26326420,	262,	7
),
(28827259,	262,	17),

(29386219,	262,	4
),
(29557897,	262,	8
),
(30901477,	262,	14),

(34457914,	262,	14),

(34619084,	262,	17),

(35183865,	262,	10),

(39409116,	262,	18),

(41083936,	262,	13),

(42620373,	262,	10),

(45241147,	262,	10),

(46275969,	262,	13),

(50649325,	262,	2
),
(53972238,	262,	15),

(54954233,	262,	8
),
(56622972,	262,	12),

(60594527,	262,	12),

(61414047,	262,	8
),
(66542703,	262,	18),

(66905564,	262,	9
),
(68727765,	262,	9
),
(71257664,	262,	8
),
(74709445,	262,	9
),
(76257107,	262,	10),

(79360908,	262,	10),

(79593813,	262,	6
),
(86510574,	262,	15),

(86930808,	262,	12),

(91074522,	262,	11),

(91980591,	262,	6
),
(96116283,	262,	7
),
(12695343,	263,	10),

(15330035,	263,	14),

(19611576,	263,	16),

(22491150,	263,	4
),
(23144259,	263,	8
),
(24655905,	263,	11),

(25179222,	263,	20),

(26326420,	263,	16),

(28827259,	263,	0
),
(29386219,	263,	15),

(29557897,	263,	15),

(30901477,	263,	16),

(34457914,	263,	15),

(34619084,	263,	10),

(35183865,	263,	15),

(39409116,	263,	14),

(41083936,	263,	14),

(42620373,	263,	13),

(45241147,	263,	17),

(46275969,	263,	18),

(50649325,	263,	11),

(53972238,	263,	8
),
(54954233,	263,	19),

(56622972,	263,	7
),
(60594527,	263,	19),

(61414047,	263,	20),

(66542703,	263,	13),

(66905564,	263,	10),

(68727765,	263,	13),

(71257664,	263,	15),

(74709445,	263,	12),

(76257107,	263,	16),

(79360908,	263,	15),

(79593813,	263,	14),

(86510574,	263,	20),

(86930808,	263,	11),

(91074522,	263,	16),

(91980591,	263,	11),

(96116283,	263,	12),

(12695343,	264,	19),

(15330035,	264,	18),

(19611576,	264,	16),

(22491150,	264,	12),

(23144259,	264,	13),

(24655905,	264,	4
),
(25179222,	264,	9
),
(26326420,	264,	12),

(28827259,	264,	16),

(29386219,	264,	11),

(29557897,	264,	20),

(30901477,	264,	7
),
(34457914,	264,	16),

(34619084,	264,	4
),
(35183865,	264,	3
),
(39409116,	264,	12),

(41083936,	264,	10),

(42620373,	264,	19),

(45241147,	264,	5
),
(46275969,	264,	14),

(50649325,	264,	13),

(53972238,	264,	16),

(54954233,	264,	17),

(56622972,	264,	14),

(60594527,	264,	20),

(61414047,	264,	13),

(66542703,	264,	20),

(66905564,	264,	7
),
(68727765,	264,	18),

(71257664,	264,	13),

(74709445,	264,	17),

(76257107,	264,	20),

(79360908,	264,	15),

(79593813,	264,	9
),
(86510574,	264,	16),

(86930808,	264,	17),

(91074522,	264,	18),

(91980591,	264,	13),

(96116283,	264,	8
),
(13933301,	265,	17),
(16797391,	265,	12),
(18029580,	265,	10),
(23412027,	265,	20),
(33583386,	265,	14),
(33809838,	265,	10),
(35544401,	265,	12),
(38867925,	265,	18),
(39014661,	265,	15),
(40177208,	265,	20),
(44508242,	265,	19),
(44975872,	265,	10),
(45124404,	265,	12),
(46341250,	265,	9
),(47992460,	265,	12),
(50255297,	265,	17),
(54277909,	265,	17),
(55075253,	265,	8
),(55481497,	265,	11),
(55920827,	265,	15),
(59394502,	265,	13),
(60555723,	265,	11),
(61496547,	265,	18),
(62998010,	265,	11),
(64445490,	265,	15),
(65440089,	265,	17),
(66080147,	265,	17),
(72165244,	265,	5
),(73317454,	265,	13),
(74288538,	265,	7
),(77026788,	265,	11),
(77271695,	265,	18),
(78162009,	265,	14),
(78641051,	265,	10),
(82567240,	265,	9
),(85700983,	265,	20),
(87657665,	265,	10),
(89132300,	265,	18),
(92475083,	265,	12),
(13933301,	266,	16),
(16797391,	266,	8
),(18029580,	266,	6
),(23412027,	266,	11),
(33583386,	266,	14),
(33809838,	266,	6
),(35544401,	266,	15),
(38867925,	266,	20),
(39014661,	266,	9
),(40177208,	266,	13),
(44508242,	266,	10),
(44975872,	266,	15),
(45124404,	266,	12),
(46341250,	266,	11),
(47992460,	266,	3
),(50255297,	266,	16),
(54277909,	266,	19),
(55075253,	266,	11),
(55481497,	266,	11),
(55920827,	266,	8
),(59394502,	266,	12),
(60555723,	266,	13),
(61496547,	266,	8
),(62998010,	266,	11),
(64445490,	266,	18),
(65440089,	266,	14),
(66080147,	266,	10),
(72165244,	266,	7
),(73317454,	266,	14),
(74288538,	266,	10),
(77026788,	266,	6
),(77271695,	266,	8
),(78162009,	266,	13),
(78641051,	266,	8
),(82567240,	266,	11),
(85700983,	266,	17),
(87657665,	266,	11),
(89132300,	266,	14),
(92475083,	266,	13),
(13933301,	267,	7
),
(16797391,	267,	4
),
(18029580,	267,	4
),
(23412027,	267,	10),

(33583386,	267,	7
),
(33809838,	267,	10),

(35544401,	267,	7
),
(38867925,	267,	7
),
(39014661,	267,	2
),
(40177208,	267,	9
),
(44508242,	267,	4
),
(44975872,	267,	3
),
(45124404,	267,	8
),
(46341250,	267,	7
),
(47992460,	267,	6
),
(50255297,	267,	3
),
(54277909,	267,	5
),
(55075253,	267,	10),

(55481497,	267,	5
),
(55920827,	267,	0
),
(59394502,	267,	4
),
(60555723,	267,	7
),
(61496547,	267,	8
),
(62998010,	267,	1
),
(64445490,	267,	5
),
(65440089,	267,	4
),
(66080147,	267,	3
),
(72165244,	267,	1
),
(73317454,	267,	9
),
(74288538,	267,	3
),
(77026788,	267,	4
),
(77271695,	267,	3
),
(78162009,	267,	6
),
(78641051,	267,	4
),
(82567240,	267,	5
),
(85700983,	267,	4
),
(87657665,	267,	5
),
(89132300,	267,	5
),
(92475083,	267,	2
),
(13933301,	268,	9
),
(16797391,	268,	4
),
(18029580,	268,	6
),
(23412027,	268,	9
),
(33583386,	268,	8
),
(33809838,	268,	6
),
(35544401,	268,	8
),
(38867925,	268,	5
),
(39014661,	268,	4
),
(40177208,	268,	7
),
(44508242,	268,	8
),
(44975872,	268,	10),

(45124404,	268,	8
),
(46341250,	268,	8
),
(47992460,	268,	8
),
(50255297,	268,	4
),
(54277909,	268,	6
),
(55075253,	268,	7
),
(55481497,	268,	9
),
(55920827,	268,	5
),
(59394502,	268,	7
),
(60555723,	268,	5
),
(61496547,	268,	3
),
(62998010,	268,	8
),
(64445490,	268,	6
),
(65440089,	268,	10),

(66080147,	268,	3
),
(72165244,	268,	4
),
(73317454,	268,	7
),
(74288538,	268,	3
),
(77026788,	268,	9
),
(77271695,	268,	9
),
(78162009,	268,	0
),
(78641051,	268,	0
),
(82567240,	268,	4
),
(85700983,	268,	4
),
(87657665,	268,	0
),
(89132300,	268,	1
),
(92475083,	268,	5
),
(13933301,	269,	1
),
(16797391,	269,	6
),
(18029580,	269,	7
),
(23412027,	269,	8
),
(33583386,	269,	7
),
(33809838,	269,	4
),
(35544401,	269,	2
),
(38867925,	269,	3
),
(39014661,	269,	5
),
(40177208,	269,	2
),
(44508242,	269,	9
),
(44975872,	269,	9
),
(45124404,	269,	9
),
(46341250,	269,	0
),
(47992460,	269,	2
),
(50255297,	269,	8
),
(54277909,	269,	4
),
(55075253,	269,	9
),
(55481497,	269,	0
),
(55920827,	269,	6
),
(59394502,	269,	5
),
(60555723,	269,	10),

(61496547,	269,	2
),
(62998010,	269,	6
),
(64445490,	269,	10),

(65440089,	269,	5
),
(66080147,	269,	4
),
(72165244,	269,	3
),
(73317454,	269,	3
),
(74288538,	269,	0
),
(77026788,	269,	7
),
(77271695,	269,	7
),
(78162009,	269,	7
),
(78641051,	269,	3
),
(82567240,	269,	10),

(85700983,	269,	3
),
(87657665,	269,	10),

(89132300,	269,	3
),
(92475083,	269,	2
),
(13933301,	270,	19),

(16797391,	270,	15),

(18029580,	270,	12),

(23412027,	270,	14),

(33583386,	270,	10),

(33809838,	270,	12),

(35544401,	270,	17),

(38867925,	270,	16),

(39014661,	270,	9
),
(40177208,	270,	20),

(44508242,	270,	10),

(44975872,	270,	16),

(45124404,	270,	10),

(46341250,	270,	8
),
(47992460,	270,	11),

(50255297,	270,	20),

(54277909,	270,	11),

(55075253,	270,	14),

(55481497,	270,	11),

(55920827,	270,	10),

(59394502,	270,	7
),
(60555723,	270,	14),

(61496547,	270,	9
),
(62998010,	270,	17),

(64445490,	270,	11),

(65440089,	270,	10),

(66080147,	270,	5
),
(72165244,	270,	11),

(73317454,	270,	15),

(74288538,	270,	13),

(77026788,	270,	12),

(77271695,	270,	14),

(78162009,	270,	9
),
(78641051,	270,	16),

(82567240,	270,	9
),
(85700983,	270,	6
),
(87657665,	270,	9
),
(89132300,	270,	14),

(92475083,	270,	13),

(13933301,	271,	9
),
(16797391,	271,	17),

(18029580,	271,	16),

(23412027,	271,	12),

(33583386,	271,	14),

(33809838,	271,	9
),
(35544401,	271,	16),

(38867925,	271,	18),

(39014661,	271,	14),

(40177208,	271,	4
),
(44508242,	271,	12),

(44975872,	271,	13),

(45124404,	271,	13),

(46341250,	271,	6
),
(47992460,	271,	17),

(50255297,	271,	11),

(54277909,	271,	11),

(55075253,	271,	16),

(55481497,	271,	17),

(55920827,	271,	12),

(59394502,	271,	18),

(60555723,	271,	12),

(61496547,	271,	8
),
(62998010,	271,	16),

(64445490,	271,	14),

(65440089,	271,	15),

(66080147,	271,	17),

(72165244,	271,	14),

(73317454,	271,	14),

(74288538,	271,	13),

(77026788,	271,	6
),
(77271695,	271,	6
),
(78162009,	271,	11),

(78641051,	271,	5
),
(82567240,	271,	16),

(85700983,	271,	15),

(87657665,	271,	7
),
(89132300,	271,	19),

(92475083,	271,	11),

(13933301,	272,	1
),
(16797391,	272,	2
),
(18029580,	272,	2
),
(23412027,	272,	1
),
(33583386,	272,	2
),
(33809838,	272,	5
),
(35544401,	272,	8
),
(38867925,	272,	7
),
(39014661,	272,	4
),
(40177208,	272,	4
),
(44508242,	272,	3
),
(44975872,	272,	7
),
(45124404,	272,	0
),
(46341250,	272,	4
),
(47992460,	272,	4
),
(50255297,	272,	6
),
(54277909,	272,	10),

(55075253,	272,	0
),
(55481497,	272,	3
),
(55920827,	272,	5
),
(59394502,	272,	1
),
(60555723,	272,	5
),
(61496547,	272,	2
),
(62998010,	272,	10),

(64445490,	272,	2
),
(65440089,	272,	7
),
(66080147,	272,	3
),
(72165244,	272,	10),

(73317454,	272,	10),

(74288538,	272,	9
),
(77026788,	272,	1
),
(77271695,	272,	6
),
(78162009,	272,	0
),
(78641051,	272,	0
),
(82567240,	272,	3
),
(85700983,	272,	10),

(87657665,	272,	2
),
(89132300,	272,	2
),
(92475083,	272,	6
),
(11060460,	273,	5),
(12676344,	273,	5),
(13798907,	273,	4),
(14857390,	273,	5),
(14876495,	273,	4),
(15291264,	273,	4),
(15835420,	273,	5),
(17358086,	273,	5),
(18167729,	273,	5),
(22735531,	273,	5),
(31721186,	273,	5),
(33551716,	273,	2),
(37864801,	273,	5),
(39028666,	273,	5),
(39291233,	273,	5),
(42119585,	273,	5),
(44618350,	273,	4),
(44809709,	273,	5),
(47500359,	273,	5),
(51067129,	273,	5),
(53414159,	273,	4),
(58498985,	273,	5),
(59542319,	273,	2),
(60436435,	273,	5),
(63239930,	273,	5),
(67735490,	273,	5),
(68243902,	273,	4),
(70714030,	273,	0),
(71582989,	273,	5),
(82232362,	273,	2),
(86606105,	273,	3),
(88571574,	273,	4),
(92033729,	273,	5),
(92343797,	273,	5),
(92883827,	273,	3),
(93501906,	273,	5),
(95481005,	273,	5),
(97792734,	273,	4),
(99115530,	273,	5),
(11060460,	274,	7
),
(12676344,	274,	8
),
(13798907,	274,	14),

(14857390,	274,	9
),
(14876495,	274,	11),

(15291264,	274,	10),

(15835420,	274,	8
),
(17358086,	274,	3
),
(18167729,	274,	7
),
(22735531,	274,	3
),
(31721186,	274,	8
),
(33551716,	274,	9
),
(37864801,	274,	3
),
(39028666,	274,	12),

(39291233,	274,	9
),
(42119585,	274,	3
),
(44618350,	274,	9
),
(44809709,	274,	3
),
(47500359,	274,	11),

(51067129,	274,	11),

(53414159,	274,	6
),
(58498985,	274,	6
),
(59542319,	274,	8
),
(60436435,	274,	6
),
(63239930,	274,	7
),
(67735490,	274,	7
),
(68243902,	274,	4
),
(70714030,	274,	7
),
(71582989,	274,	4
),
(82232362,	274,	6
),
(86606105,	274,	13),

(88571574,	274,	13),

(92033729,	274,	8
),
(92343797,	274,	17),

(92883827,	274,	13),

(93501906,	274,	8
),
(95481005,	274,	10),

(97792734,	274,	6
),
(99115530,	274,	5
),
(11060460,	275,	2
),
(12676344,	275,	13),

(13798907,	275,	5
),
(14857390,	275,	10),

(14876495,	275,	15),

(15291264,	275,	8
),
(15835420,	275,	9
),
(17358086,	275,	20),

(18167729,	275,	17),

(22735531,	275,	2
),
(31721186,	275,	5
),
(33551716,	275,	12),

(37864801,	275,	6
),
(39028666,	275,	9
),
(39291233,	275,	10),

(42119585,	275,	7
),
(44618350,	275,	19),

(44809709,	275,	13),

(47500359,	275,	12),

(51067129,	275,	13),

(53414159,	275,	9
),
(58498985,	275,	3
),
(59542319,	275,	4
),
(60436435,	275,	11),

(63239930,	275,	6
),
(67735490,	275,	11),

(68243902,	275,	7
),
(70714030,	275,	11),

(71582989,	275,	6
),
(82232362,	275,	8
),
(86606105,	275,	11),

(88571574,	275,	8
),
(92033729,	275,	15),

(92343797,	275,	10),

(92883827,	275,	11),

(93501906,	275,	10),

(95481005,	275,	15),

(97792734,	275,	4
),
(99115530,	275,	12),

(11060460,	276,	17),

(12676344,	276,	8
),
(13798907,	276,	13),

(14857390,	276,	16),

(14876495,	276,	9
),
(15291264,	276,	15),

(15835420,	276,	12),

(17358086,	276,	12),

(18167729,	276,	13),

(22735531,	276,	18),

(31721186,	276,	13),

(33551716,	276,	9
),
(37864801,	276,	15),

(39028666,	276,	13),

(39291233,	276,	8
),
(42119585,	276,	16),

(44618350,	276,	15),

(44809709,	276,	10),

(47500359,	276,	15),

(51067129,	276,	11),

(53414159,	276,	10),

(58498985,	276,	7
),
(59542319,	276,	6
),
(60436435,	276,	20),

(63239930,	276,	7
),
(67735490,	276,	10),

(68243902,	276,	11),

(70714030,	276,	17),

(71582989,	276,	16),

(82232362,	276,	15),

(86606105,	276,	19),

(88571574,	276,	17),

(92033729,	276,	11),

(92343797,	276,	20),

(92883827,	276,	18),

(93501906,	276,	11),

(95481005,	276,	13),

(97792734,	276,	12),

(99115530,	276,	14),

(11060460,	277,	5),
(12676344,	277,	5),
(13798907,	277,	5),
(14857390,	277,	4),
(14876495,	277,	5),
(15291264,	277,	5),
(15835420,	277,	5),
(17358086,	277,	5),
(18167729,	277,	5),
(22735531,	277,	5),
(31721186,	277,	4),
(33551716,	277,	5),
(37864801,	277,	3),
(39028666,	277,	4),
(39291233,	277,	5),
(42119585,	277,	5),
(44618350,	277,	5),
(44809709,	277,	3),
(47500359,	277,	5),
(51067129,	277,	5),
(53414159,	277,	5),
(58498985,	277,	3),
(59542319,	277,	4),
(60436435,	277,	5),
(63239930,	277,	3),
(67735490,	277,	5),
(68243902,	277,	3),
(70714030,	277,	4),
(71582989,	277,	5),
(82232362,	277,	3),
(86606105,	277,	5),
(88571574,	277,	5),
(92033729,	277,	1),
(92343797,	277,	4),
(92883827,	277,	5),
(93501906,	277,	5),
(95481005,	277,	5),
(97792734,	277,	5),
(99115530,	277,	3),
(11060460,	278,	8
),
(12676344,	278,	15),

(13798907,	278,	13),

(14857390,	278,	9
),
(14876495,	278,	6
),
(15291264,	278,	7
),
(15835420,	278,	13),

(17358086,	278,	10),

(18167729,	278,	9
),
(22735531,	278,	9
),
(31721186,	278,	17),

(33551716,	278,	12),

(37864801,	278,	5
),
(39028666,	278,	17),

(39291233,	278,	20),

(42119585,	278,	14),

(44618350,	278,	19),

(44809709,	278,	8
),
(47500359,	278,	13),

(51067129,	278,	14),

(53414159,	278,	14),

(58498985,	278,	12),

(59542319,	278,	16),

(60436435,	278,	12),

(63239930,	278,	12),

(67735490,	278,	14),

(68243902,	278,	12),

(70714030,	278,	3
),
(71582989,	278,	9
),
(82232362,	278,	8
),
(86606105,	278,	14),

(88571574,	278,	17),

(92033729,	278,	10),

(92343797,	278,	11),

(92883827,	278,	20),

(93501906,	278,	8
),
(95481005,	278,	13),

(97792734,	278,	14),

(99115530,	278,	7
),
(11060460,	279,	10),

(12676344,	279,	4
),
(13798907,	279,	7
),
(14857390,	279,	10),

(14876495,	279,	10),

(15291264,	279,	4
),
(15835420,	279,	4
),
(17358086,	279,	9
),
(18167729,	279,	6
),
(22735531,	279,	10),

(31721186,	279,	2
),
(33551716,	279,	10),

(37864801,	279,	4
),
(39028666,	279,	9
),
(39291233,	279,	2
),
(42119585,	279,	5
),
(44618350,	279,	2
),
(44809709,	279,	8
),
(47500359,	279,	5
),
(51067129,	279,	10),

(53414159,	279,	4
),
(58498985,	279,	5
),
(59542319,	279,	8
),
(60436435,	279,	6
),
(63239930,	279,	3
),
(67735490,	279,	6
),
(68243902,	279,	7
),
(70714030,	279,	9
),
(71582989,	279,	6
),
(82232362,	279,	4
),
(86606105,	279,	7
),
(88571574,	279,	5
),
(92033729,	279,	5
),
(92343797,	279,	3
),
(92883827,	279,	9
),
(93501906,	279,	8
),
(95481005,	279,	10),

(97792734,	279,	5
),
(99115530,	279,	9
),
(11060460,	280,	1
),
(12676344,	280,	9
),
(13798907,	280,	3
),
(14857390,	280,	13),

(14876495,	280,	8
),
(15291264,	280,	16),

(15835420,	280,	13),

(17358086,	280,	12),

(18167729,	280,	9
),
(22735531,	280,	7
),
(31721186,	280,	9
),
(33551716,	280,	6
),
(37864801,	280,	15),

(39028666,	280,	13),

(39291233,	280,	15),

(42119585,	280,	16),

(44618350,	280,	13),

(44809709,	280,	8
),
(47500359,	280,	12),

(51067129,	280,	9
),
(53414159,	280,	10),

(58498985,	280,	8
),
(59542319,	280,	7
),
(60436435,	280,	7
),
(63239930,	280,	9
),
(67735490,	280,	7
),
(68243902,	280,	8
),
(70714030,	280,	12),

(71582989,	280,	8
),
(82232362,	280,	8
),
(86606105,	280,	6
),
(88571574,	280,	8
),
(92033729,	280,	15),

(92343797,	280,	8
),
(92883827,	280,	6
),
(93501906,	280,	10),

(95481005,	280,	15),

(97792734,	280,	10),

(99115530,	280,	15),

(11244206,	281,	5),
(12057283,	281,	4),
(13668883,	281,	5),
(13684450,	281,	5),
(14493579,	281,	4),
(17188037,	281,	5),
(19542698,	281,	5),
(24834676,	281,	4),
(26790179,	281,	4),
(31193777,	281,	4),
(31568819,	281,	4),
(33871863,	281,	5),
(36598030,	281,	5),
(44005211,	281,	5),
(44008477,	281,	5),
(47468588,	281,	5),
(48126470,	281,	5),
(50417103,	281,	5),
(51671643,	281,	3),
(52220638,	281,	5),
(59334127,	281,	5),
(63887324,	281,	5),
(64578632,	281,	5),
(69181739,	281,	5),
(74239452,	281,	3),
(75119033,	281,	4),
(77713039,	281,	4),
(77718435,	281,	4),
(79468224,	281,	3),
(80712718,	281,	5),
(81512193,	281,	5),
(81753964,	281,	5),
(89130287,	281,	4),
(90582251,	281,	2),
(93040696,	281,	5),
(93220018,	281,	1),
(94248610,	281,	5),
(96590182,	281,	1),
(99597461,	281,	2),
(11244206,	282,	18),

(12057283,	282,	18),

(13668883,	282,	13),

(13684450,	282,	9
),
(14493579,	282,	11),

(17188037,	282,	20),

(19542698,	282,	16),

(24834676,	282,	14),

(26790179,	282,	14),

(31193777,	282,	12),

(31568819,	282,	13),

(33871863,	282,	18),

(36598030,	282,	14),

(44005211,	282,	5
),
(44008477,	282,	14),

(47468588,	282,	13),

(48126470,	282,	12),

(50417103,	282,	18),

(51671643,	282,	20),

(52220638,	282,	12),

(59334127,	282,	14),

(63887324,	282,	13),

(64578632,	282,	12),

(69181739,	282,	15),

(74239452,	282,	19),

(75119033,	282,	11),

(77713039,	282,	15),

(77718435,	282,	17),

(79468224,	282,	16),

(80712718,	282,	10),

(81512193,	282,	17),

(81753964,	282,	15),

(89130287,	282,	14),

(90582251,	282,	14),

(93040696,	282,	12),

(93220018,	282,	17),

(94248610,	282,	15),

(96590182,	282,	18),

(99597461,	282,	20),

(11244206,	283,	16),

(12057283,	283,	12),

(13668883,	283,	15),

(13684450,	283,	12),

(14493579,	283,	11),

(17188037,	283,	5
),
(19542698,	283,	8
),
(24834676,	283,	14),

(26790179,	283,	10),

(31193777,	283,	12),

(31568819,	283,	11),

(33871863,	283,	9
),
(36598030,	283,	16),

(44005211,	283,	4
),
(44008477,	283,	11),

(47468588,	283,	17),

(48126470,	283,	12),

(50417103,	283,	15),

(51671643,	283,	14),

(52220638,	283,	15),

(59334127,	283,	8
),
(63887324,	283,	15),

(64578632,	283,	16),

(69181739,	283,	16),

(74239452,	283,	20),

(75119033,	283,	14),

(77713039,	283,	12),

(77718435,	283,	9
),
(79468224,	283,	7
),
(80712718,	283,	12),

(81512193,	283,	18),

(81753964,	283,	11),

(89130287,	283,	10),

(90582251,	283,	12),

(93040696,	283,	15),

(93220018,	283,	11),

(94248610,	283,	15),

(96590182,	283,	8
),
(99597461,	283,	9
),
(11244206,	284,	7
),
(12057283,	284,	2
),
(13668883,	284,	8
),
(13684450,	284,	10),

(14493579,	284,	9
),
(17188037,	284,	6
),
(19542698,	284,	9
),
(24834676,	284,	6
),
(26790179,	284,	6
),
(31193777,	284,	10),

(31568819,	284,	4
),
(33871863,	284,	4
),
(36598030,	284,	3
),
(44005211,	284,	5
),
(44008477,	284,	10),

(47468588,	284,	6
),
(48126470,	284,	4
),
(50417103,	284,	6
),
(51671643,	284,	9
),
(52220638,	284,	6
),
(59334127,	284,	10),

(63887324,	284,	7
),
(64578632,	284,	8
),
(69181739,	284,	7
),
(74239452,	284,	9
),
(75119033,	284,	9
),
(77713039,	284,	10),

(77718435,	284,	5
),
(79468224,	284,	3
),
(80712718,	284,	10),

(81512193,	284,	7
),
(81753964,	284,	9
),
(89130287,	284,	10),

(90582251,	284,	10),

(93040696,	284,	6
),
(93220018,	284,	10),

(94248610,	284,	3
),
(96590182,	284,	8
),
(99597461,	284,	10),

(11244206,	285,	15),

(12057283,	285,	14),

(13668883,	285,	15),

(13684450,	285,	16),

(14493579,	285,	11),

(17188037,	285,	13),

(19542698,	285,	9
),
(24834676,	285,	15),

(26790179,	285,	15),

(31193777,	285,	14),

(31568819,	285,	5
),
(33871863,	285,	12),

(36598030,	285,	13),

(44005211,	285,	16),

(44008477,	285,	12),

(47468588,	285,	13),

(48126470,	285,	14),

(50417103,	285,	6
),
(51671643,	285,	14),

(52220638,	285,	11),

(59334127,	285,	12),

(63887324,	285,	11),

(64578632,	285,	11),

(69181739,	285,	13),

(74239452,	285,	12),

(75119033,	285,	11),

(77713039,	285,	18),

(77718435,	285,	7
),
(79468224,	285,	14),

(80712718,	285,	12),

(81512193,	285,	5
),
(81753964,	285,	7
),
(89130287,	285,	12),

(90582251,	285,	20),

(93040696,	285,	17),

(93220018,	285,	6
),
(94248610,	285,	20),

(96590182,	285,	11),

(99597461,	285,	13),

(11244206,	286,	5),
(12057283,	286,	5),
(13668883,	286,	5),
(13684450,	286,	1),
(14493579,	286,	5),
(17188037,	286,	2),
(19542698,	286,	5),
(24834676,	286,	5),
(26790179,	286,	2),
(31193777,	286,	5),
(31568819,	286,	4),
(33871863,	286,	5),
(36598030,	286,	5),
(44005211,	286,	5),
(44008477,	286,	4),
(47468588,	286,	3),
(48126470,	286,	3),
(50417103,	286,	5),
(51671643,	286,	5),
(52220638,	286,	5),
(59334127,	286,	5),
(63887324,	286,	5),
(64578632,	286,	5),
(69181739,	286,	3),
(74239452,	286,	5),
(75119033,	286,	1),
(77713039,	286,	5),
(77718435,	286,	5),
(79468224,	286,	4),
(80712718,	286,	5),
(81512193,	286,	4),
(81753964,	286,	5),
(89130287,	286,	4),
(90582251,	286,	5),
(93040696,	286,	4),
(93220018,	286,	4),
(94248610,	286,	3),
(96590182,	286,	5),
(99597461,	286,	5),
(11244206,	287,	17),

(12057283,	287,	14),

(13668883,	287,	15),

(13684450,	287,	13),

(14493579,	287,	10),

(17188037,	287,	10),

(19542698,	287,	13),

(24834676,	287,	7
),
(26790179,	287,	13),

(31193777,	287,	15),

(31568819,	287,	10),

(33871863,	287,	13),

(36598030,	287,	3
),
(44005211,	287,	18),

(44008477,	287,	10),

(47468588,	287,	15),

(48126470,	287,	8
),
(50417103,	287,	20),

(51671643,	287,	14),

(52220638,	287,	20),

(59334127,	287,	18),

(63887324,	287,	10),

(64578632,	287,	8
),
(69181739,	287,	12),

(74239452,	287,	18),

(75119033,	287,	12),

(77713039,	287,	7
),
(77718435,	287,	11),

(79468224,	287,	14),

(80712718,	287,	17),

(81512193,	287,	14),

(81753964,	287,	8
),
(89130287,	287,	17),

(90582251,	287,	6
),
(93040696,	287,	11),

(93220018,	287,	16),

(94248610,	287,	15),

(96590182,	287,	9
),
(99597461,	287,	10),

(11244206,	288,	10),

(12057283,	288,	12),

(13668883,	288,	12),

(13684450,	288,	15),

(14493579,	288,	7
),
(17188037,	288,	13),

(19542698,	288,	13),

(24834676,	288,	15),

(26790179,	288,	11),

(31193777,	288,	16),

(31568819,	288,	18),

(33871863,	288,	9
),
(36598030,	288,	7
),
(44005211,	288,	15),

(44008477,	288,	14),

(47468588,	288,	18),

(48126470,	288,	18),

(50417103,	288,	17),

(51671643,	288,	13),

(52220638,	288,	15),

(59334127,	288,	9
),
(63887324,	288,	15),

(64578632,	288,	14),

(69181739,	288,	6
),
(74239452,	288,	11),

(75119033,	288,	16),

(77713039,	288,	16),

(77718435,	288,	10),

(79468224,	288,	11),

(80712718,	288,	10),

(81512193,	288,	13),

(81753964,	288,	14),

(89130287,	288,	14),

(90582251,	288,	20),

(93040696,	288,	8
),
(93220018,	288,	13),

(94248610,	288,	7
),
(96590182,	288,	11),

(99597461,	288,	6
),
(10998691,	289,	14),

(11304461,	289,	7
),
(12505676,	289,	10),

(15974674,	289,	9
),
(19137151,	289,	3
),
(19867677,	289,	9
),
(23607067,	289,	7
),
(23995642,	289,	14),

(28916456,	289,	12),

(30187810,	289,	9
),
(31282994,	289,	12),

(31628825,	289,	6
),
(31852049,	289,	12),

(32033788,	289,	9
),
(35365463,	289,	10),

(35507115,	289,	14),

(35992111,	289,	11),

(42685896,	289,	15),

(42768632,	289,	1
),
(43500959,	289,	2
),
(46844640,	289,	17),

(48563699,	289,	12),

(54679482,	289,	4
),
(57467650,	289,	9
),
(59916483,	289,	9
),
(64398919,	289,	10),

(64530056,	289,	9
),
(66921228,	289,	16),

(68529349,	289,	8
),
(68677240,	289,	14),

(71708814,	289,	14),

(80614518,	289,	9
),
(81768602,	289,	13),

(84158312,	289,	6
),
(85368583,	289,	11),

(85632352,	289,	8
),
(86872045,	289,	15),

(90935543,	289,	12),

(91565702,	289,	8
),
(10998691,	290,	2
),
(11304461,	290,	3
),
(12505676,	290,	2
),
(15974674,	290,	0
),
(19137151,	290,	10),

(19867677,	290,	0
),
(23607067,	290,	3
),
(23995642,	290,	2
),
(28916456,	290,	7
),
(30187810,	290,	10),

(31282994,	290,	0
),
(31628825,	290,	5
),
(31852049,	290,	4
),
(32033788,	290,	3
),
(35365463,	290,	3
),
(35507115,	290,	2
),
(35992111,	290,	4
),
(42685896,	290,	6
),
(42768632,	290,	0
),
(43500959,	290,	3
),
(46844640,	290,	10),

(48563699,	290,	3
),
(54679482,	290,	7
),
(57467650,	290,	2
),
(59916483,	290,	4
),
(64398919,	290,	6
),
(64530056,	290,	5
),
(66921228,	290,	6
),
(68529349,	290,	5
),
(68677240,	290,	1
),
(71708814,	290,	4
),
(80614518,	290,	5
),
(81768602,	290,	3
),
(84158312,	290,	4
),
(85368583,	290,	2
),
(85632352,	290,	3
),
(86872045,	290,	9
),
(90935543,	290,	4
),
(91565702,	290,	3
),
(10998691,	291,	7
),
(11304461,	291,	12),

(12505676,	291,	16),

(15974674,	291,	7
),
(19137151,	291,	3
),
(19867677,	291,	13),

(23607067,	291,	13),

(23995642,	291,	19),

(28916456,	291,	8
),
(30187810,	291,	17),

(31282994,	291,	17),

(31628825,	291,	16),

(31852049,	291,	9
),
(32033788,	291,	13),

(35365463,	291,	15),

(35507115,	291,	12),

(35992111,	291,	13),

(42685896,	291,	10),

(42768632,	291,	10),

(43500959,	291,	14),

(46844640,	291,	11),

(48563699,	291,	7
),
(54679482,	291,	15),

(57467650,	291,	9
),
(59916483,	291,	8
),
(64398919,	291,	12),

(64530056,	291,	9
),
(66921228,	291,	13),

(68529349,	291,	15),

(68677240,	291,	8
),
(71708814,	291,	18),

(80614518,	291,	11),

(81768602,	291,	8
),
(84158312,	291,	10),

(85368583,	291,	13),

(85632352,	291,	14),

(86872045,	291,	12),

(90935543,	291,	12),

(91565702,	291,	10),

(10998691,	292,	16),

(11304461,	292,	5
),
(12505676,	292,	10),

(15974674,	292,	20),

(19137151,	292,	17),

(19867677,	292,	8
),
(23607067,	292,	13),

(23995642,	292,	6
),
(28916456,	292,	13),

(30187810,	292,	11),

(31282994,	292,	6
),
(31628825,	292,	12),

(31852049,	292,	6
),
(32033788,	292,	11),

(35365463,	292,	12),

(35507115,	292,	5
),
(35992111,	292,	11),

(42685896,	292,	9
),
(42768632,	292,	9
),
(43500959,	292,	7
),
(46844640,	292,	11),

(48563699,	292,	11),

(54679482,	292,	13),

(57467650,	292,	13),

(59916483,	292,	13),

(64398919,	292,	13),

(64530056,	292,	15),

(66921228,	292,	13),

(68529349,	292,	11),

(68677240,	292,	2
),
(71708814,	292,	10),

(80614518,	292,	14),

(81768602,	292,	9
),
(84158312,	292,	11),

(85368583,	292,	13),

(85632352,	292,	20),

(86872045,	292,	8
),
(90935543,	292,	7
),
(91565702,	292,	17),

(10998691,	293,	12),
(11304461,	293,	14),
(12505676,	293,	14),
(15974674,	293,	12),
(19137151,	293,	13),
(19867677,	293,	9
),(23607067,	293,	13),
(23995642,	293,	11),
(28916456,	293,	8
),(30187810,	293,	17),
(31282994,	293,	8
),(31628825,	293,	9
),(31852049,	293,	19),
(32033788,	293,	11),
(35365463,	293,	8
),(35507115,	293,	15),
(35992111,	293,	11),
(42685896,	293,	9
),(42768632,	293,	12),
(43500959,	293,	7
),(46844640,	293,	13),
(48563699,	293,	11),
(54679482,	293,	14),
(57467650,	293,	9
),(59916483,	293,	14),
(64398919,	293,	9
),(64530056,	293,	12),
(66921228,	293,	9
),(68529349,	293,	12),
(68677240,	293,	5
),(71708814,	293,	7
),(80614518,	293,	19),
(81768602,	293,	12),
(84158312,	293,	13),
(85368583,	293,	15),
(85632352,	293,	12),
(86872045,	293,	11),
(90935543,	293,	14),
(91565702,	293,	6
),
(10998691,	294,	15),

(11304461,	294,	16),

(12505676,	294,	11),

(15974674,	294,	8
),
(19137151,	294,	15),

(19867677,	294,	13),

(23607067,	294,	8
),
(23995642,	294,	17),

(28916456,	294,	14),

(30187810,	294,	11),

(31282994,	294,	5
),
(31628825,	294,	12),

(31852049,	294,	10),

(32033788,	294,	9
),
(35365463,	294,	14),

(35507115,	294,	12),

(35992111,	294,	20),

(42685896,	294,	14),

(42768632,	294,	12),

(43500959,	294,	11),

(46844640,	294,	11),

(48563699,	294,	10),

(54679482,	294,	12),

(57467650,	294,	7
),
(59916483,	294,	15),

(64398919,	294,	9
),
(64530056,	294,	13),

(66921228,	294,	12),

(68529349,	294,	8
),
(68677240,	294,	14),

(71708814,	294,	9
),
(80614518,	294,	10),

(81768602,	294,	8
),
(84158312,	294,	14),

(85368583,	294,	11),

(85632352,	294,	16),

(86872045,	294,	11),

(90935543,	294,	15),

(91565702,	294,	9
),
(10998691,	295,	6
),
(11304461,	295,	10),

(12505676,	295,	12),

(15974674,	295,	9
),
(19137151,	295,	14),

(19867677,	295,	12),

(23607067,	295,	12),

(23995642,	295,	4
),
(28916456,	295,	15),

(30187810,	295,	4
),
(31282994,	295,	10),

(31628825,	295,	15),

(31852049,	295,	14),

(32033788,	295,	12),

(35365463,	295,	9
),
(35507115,	295,	5
),
(35992111,	295,	13),

(42685896,	295,	7
),
(42768632,	295,	8
),
(43500959,	295,	7
),
(46844640,	295,	14),

(48563699,	295,	8
),
(54679482,	295,	7
),
(57467650,	295,	9
),
(59916483,	295,	11),

(64398919,	295,	11),

(64530056,	295,	15),

(66921228,	295,	10),

(68529349,	295,	11),

(68677240,	295,	15),

(71708814,	295,	13),

(80614518,	295,	0
),
(81768602,	295,	13),

(84158312,	295,	9
),
(85368583,	295,	9
),
(85632352,	295,	10),

(86872045,	295,	14),

(90935543,	295,	6
),
(91565702,	295,	16),

(10998691,	296,	11),

(11304461,	296,	12),

(12505676,	296,	9
),
(15974674,	296,	6
),
(19137151,	296,	17),

(19867677,	296,	5
),
(23607067,	296,	18),

(23995642,	296,	14),

(28916456,	296,	15),

(30187810,	296,	16),

(31282994,	296,	9
),
(31628825,	296,	14),

(31852049,	296,	12),

(32033788,	296,	15),

(35365463,	296,	5
),
(35507115,	296,	9
),
(35992111,	296,	16),

(42685896,	296,	13),

(42768632,	296,	20),

(43500959,	296,	15),

(46844640,	296,	9
),
(48563699,	296,	10),

(54679482,	296,	10),

(57467650,	296,	6
),
(59916483,	296,	13),

(64398919,	296,	16),

(64530056,	296,	11),

(66921228,	296,	12),

(68529349,	296,	4
),
(68677240,	296,	17),

(71708814,	296,	7
),
(80614518,	296,	8
),
(81768602,	296,	10),

(84158312,	296,	12),

(85368583,	296,	10),

(85632352,	296,	16),

(86872045,	296,	8
),
(90935543,	296,	9
),
(91565702,	296,	14),

(10534206,	297,	7
),
(20236412,	297,	18),

(20427756,	297,	14),

(21931678,	297,	10),

(22730658,	297,	11),

(22844995,	297,	15),

(24474176,	297,	13),

(27595348,	297,	15),

(27965307,	297,	15),

(28915481,	297,	13),

(29172201,	297,	10),

(30157844,	297,	14),

(30589090,	297,	11),

(35563113,	297,	15),

(35733587,	297,	9
),
(36969032,	297,	3
),
(37560862,	297,	15),

(40384219,	297,	7
),
(41609700,	297,	14),

(43320982,	297,	17),

(45814182,	297,	10),

(52238473,	297,	14),

(53104670,	297,	15),

(55810467,	297,	10),

(56046099,	297,	11),

(63156760,	297,	11),

(63217302,	297,	14),

(63246226,	297,	16),

(64973126,	297,	7
),
(72751710,	297,	7
),
(74447273,	297,	7
),
(75640107,	297,	14),

(84633041,	297,	11),

(86264655,	297,	5
),
(86534235,	297,	19),

(91750903,	297,	8
),
(95787979,	297,	12),

(96820901,	297,	15),

(97314565,	297,	12),

(10534206,	298,	7
),
(20236412,	298,	8
),
(20427756,	298,	9
),
(21931678,	298,	14),

(22730658,	298,	10),

(22844995,	298,	11),

(24474176,	298,	20),

(27595348,	298,	7
),
(27965307,	298,	5
),
(28915481,	298,	9
),
(29172201,	298,	11),

(30157844,	298,	5
),
(30589090,	298,	12),

(35563113,	298,	6
),
(35733587,	298,	0
),
(36969032,	298,	9
),
(37560862,	298,	13),

(40384219,	298,	6
),
(41609700,	298,	11),

(43320982,	298,	10),

(45814182,	298,	14),

(52238473,	298,	9
),
(53104670,	298,	12),

(55810467,	298,	15),

(56046099,	298,	7
),
(63156760,	298,	14),

(63217302,	298,	7
),
(63246226,	298,	6
),
(64973126,	298,	11),

(72751710,	298,	4
),
(74447273,	298,	7
),
(75640107,	298,	15),

(84633041,	298,	7
),
(86264655,	298,	4
),
(86534235,	298,	9
),
(91750903,	298,	14),

(95787979,	298,	12),

(96820901,	298,	5
),
(97314565,	298,	13),

(10534206,	299,	10),

(20236412,	299,	5
),
(20427756,	299,	12),

(21931678,	299,	14),

(22730658,	299,	10),

(22844995,	299,	13),

(24474176,	299,	10),

(27595348,	299,	18),

(27965307,	299,	11),

(28915481,	299,	17),

(29172201,	299,	12),

(30157844,	299,	13),

(30589090,	299,	10),

(35563113,	299,	8
),
(35733587,	299,	6
),
(36969032,	299,	15),

(37560862,	299,	7
),
(40384219,	299,	14),

(41609700,	299,	8
),
(43320982,	299,	20),

(45814182,	299,	14),

(52238473,	299,	14),

(53104670,	299,	11),

(55810467,	299,	19),

(56046099,	299,	14),

(63156760,	299,	6
),
(63217302,	299,	13),

(63246226,	299,	20),

(64973126,	299,	10),

(72751710,	299,	10),

(74447273,	299,	11),

(75640107,	299,	14),

(84633041,	299,	7
),
(86264655,	299,	8
),
(86534235,	299,	12),

(91750903,	299,	11),

(95787979,	299,	13),

(96820901,	299,	7
),
(97314565,	299,	9
),
(10534206,	300,	16),

(20236412,	300,	9
),
(20427756,	300,	13),

(21931678,	300,	15),

(22730658,	300,	14),

(22844995,	300,	14),

(24474176,	300,	17),

(27595348,	300,	13),

(27965307,	300,	14),

(28915481,	300,	15),

(29172201,	300,	9
),
(30157844,	300,	20),

(30589090,	300,	10),

(35563113,	300,	13),

(35733587,	300,	8
),
(36969032,	300,	16),

(37560862,	300,	20),

(40384219,	300,	11),

(41609700,	300,	14),

(43320982,	300,	20),

(45814182,	300,	10),

(52238473,	300,	16),

(53104670,	300,	13),

(55810467,	300,	19),

(56046099,	300,	13),

(63156760,	300,	19),

(63217302,	300,	14),

(63246226,	300,	15),

(64973126,	300,	9
),
(72751710,	300,	11),

(74447273,	300,	18),

(75640107,	300,	11),

(84633041,	300,	14),

(86264655,	300,	17),

(86534235,	300,	7
),
(91750903,	300,	10),

(95787979,	300,	8
),
(96820901,	300,	14),

(97314565,	300,	17),

(10534206,	301,	20),

(20236412,	301,	16),

(20427756,	301,	15),

(21931678,	301,	14),

(22730658,	301,	10),

(22844995,	301,	6
),
(24474176,	301,	15),

(27595348,	301,	20),

(27965307,	301,	13),

(28915481,	301,	12),

(29172201,	301,	10),

(30157844,	301,	18),

(30589090,	301,	11),

(35563113,	301,	20),

(35733587,	301,	20),

(36969032,	301,	7
),
(37560862,	301,	17),

(40384219,	301,	14),

(41609700,	301,	19),

(43320982,	301,	15),

(45814182,	301,	16),

(52238473,	301,	8
),
(53104670,	301,	9
),
(55810467,	301,	10),

(56046099,	301,	17),

(63156760,	301,	18),

(63217302,	301,	10),

(63246226,	301,	9
),
(64973126,	301,	15),

(72751710,	301,	18),

(74447273,	301,	13),

(75640107,	301,	11),

(84633041,	301,	15),

(86264655,	301,	15),

(86534235,	301,	9
),
(91750903,	301,	13),

(95787979,	301,	15),

(96820901,	301,	19),

(97314565,	301,	17),

(10534206,	302,	5
),(20236412,	302,	3
),(20427756,	302,	8
),(21931678,	302,	8
),(22730658,	302,	8
),(22844995,	302,	14),
(24474176,	302,	2
),(27595348,	302,	7
),(27965307,	302,	7
),(28915481,	302,	9
),(29172201,	302,	3
),(30157844,	302,	9
),(30589090,	302,	12),
(35563113,	302,	0
),(35733587,	302,	10),
(36969032,	302,	9
),(37560862,	302,	4
),(40384219,	302,	1
),(41609700,	302,	7
),(43320982,	302,	10),
(45814182,	302,	12),
(52238473,	302,	0
),(53104670,	302,	7
),(55810467,	302,	8
),(56046099,	302,	7
),(63156760,	302,	3
),(63217302,	302,	11),
(63246226,	302,	6
),(64973126,	302,	15),
(72751710,	302,	11),
(74447273,	302,	13),
(75640107,	302,	2
),(84633041,	302,	14),
(86264655,	302,	0
),(86534235,	302,	10),
(91750903,	302,	7
),(95787979,	302,	6
),(96820901,	302,	7
),(97314565,	302,	9
),
(10534206,	303,	7
),(20236412,	303,	10),
(20427756,	303,	6
),(21931678,	303,	8
),(22730658,	303,	2
),(22844995,	303,	4
),(24474176,	303,	1
),(27595348,	303,	6
),(27965307,	303,	4
),(28915481,	303,	10),
(29172201,	303,	3
),(30157844,	303,	4
),(30589090,	303,	7
),(35563113,	303,	5
),(35733587,	303,	4
),(36969032,	303,	10),
(37560862,	303,	5
),(40384219,	303,	8
),(41609700,	303,	0
),(43320982,	303,	8
),(45814182,	303,	10),
(52238473,	303,	1
),(53104670,	303,	5
),(55810467,	303,	8
),(56046099,	303,	8
),(63156760,	303,	0
),(63217302,	303,	5
),(63246226,	303,	9
),(64973126,	303,	0
),(72751710,	303,	4
),(74447273,	303,	6
),(75640107,	303,	5
),(84633041,	303,	10),
(86264655,	303,	5
),(86534235,	303,	3
),(91750903,	303,	5
),(95787979,	303,	8
),(96820901,	303,	3
),(97314565,	303,	4
),
(10534206,	304,	6
),(20236412,	304,	13),
(20427756,	304,	8
),(21931678,	304,	3
),(22730658,	304,	9
),(22844995,	304,	14),
(24474176,	304,	14),
(27595348,	304,	16),
(27965307,	304,	7
),(28915481,	304,	6
),(29172201,	304,	4
),(30157844,	304,	10),
(30589090,	304,	11),
(35563113,	304,	17),
(35733587,	304,	0
),(36969032,	304,	12),
(37560862,	304,	13),
(40384219,	304,	13),
(41609700,	304,	12),
(43320982,	304,	6
),(45814182,	304,	13),
(52238473,	304,	8
),(53104670,	304,	11),
(55810467,	304,	5
),(56046099,	304,	9
),(63156760,	304,	7
),(63217302,	304,	11),
(63246226,	304,	9
),(64973126,	304,	8
),(72751710,	304,	11),
(74447273,	304,	15),
(75640107,	304,	8
),(84633041,	304,	12),
(86264655,	304,	15),
(86534235,	304,	9
),(91750903,	304,	15),
(95787979,	304,	7
),(96820901,	304,	14),
(97314565,	304,	8
),
(10281753,	305,	13),
(12332209,	305,	11),
(14627641,	305,	11),
(15710421,	305,	9
),(16659116,	305,	20),
(17123230,	305,	8
),(20885928,	305,	9
),(22715713,	305,	9
),(23166329,	305,	4
),(26047923,	305,	15),
(26487936,	305,	12),
(27162414,	305,	15),
(27204056,	305,	15),
(33937912,	305,	9
),(36065627,	305,	9
),(36354616,	305,	15),
(43246940,	305,	6
),(47791655,	305,	14),
(48743705,	305,	7
),(51572168,	305,	11),
(52567239,	305,	11),
(52794581,	305,	17),
(55549712,	305,	8
),(55813326,	305,	7
),(56462246,	305,	17),
(57253118,	305,	7
),(63899654,	305,	8
),(66407977,	305,	14),
(72936625,	305,	13),
(75692632,	305,	13),
(76662813,	305,	9
),(78445718,	305,	9
),(81965142,	305,	12),
(83201687,	305,	15),
(84667886,	305,	14),
(86461348,	305,	12),
(89715013,	305,	8
),(97467090,	305,	13),
(99904277,	305,	10),
(10281753,	306,	11),
(12332209,	306,	12),
(14627641,	306,	14),
(15710421,	306,	5
),(16659116,	306,	10),
(17123230,	306,	5
),(20885928,	306,	18),
(22715713,	306,	11),
(23166329,	306,	16),
(26047923,	306,	12),
(26487936,	306,	11),
(27162414,	306,	14),
(27204056,	306,	11),
(33937912,	306,	12),
(36065627,	306,	8
),(36354616,	306,	16),
(43246940,	306,	15),
(47791655,	306,	8
),(48743705,	306,	9
),(51572168,	306,	15),
(52567239,	306,	8
),(52794581,	306,	3
),(55549712,	306,	13),
(55813326,	306,	9
),(56462246,	306,	3
),(57253118,	306,	14),
(63899654,	306,	9
),(66407977,	306,	7
),(72936625,	306,	2
),(75692632,	306,	10),
(76662813,	306,	10),
(78445718,	306,	12),
(81965142,	306,	12),
(83201687,	306,	10),
(84667886,	306,	7
),(86461348,	306,	13),
(89715013,	306,	15),
(97467090,	306,	18),
(99904277,	306,	5
),
(10281753,	307,	12),
(12332209,	307,	9
),(14627641,	307,	11),
(15710421,	307,	7
),(16659116,	307,	6
),(17123230,	307,	10),
(20885928,	307,	8
),(22715713,	307,	6
),(23166329,	307,	0
),(26047923,	307,	0
),(26487936,	307,	4
),(27162414,	307,	18),
(27204056,	307,	16),
(33937912,	307,	5
),(36065627,	307,	15),
(36354616,	307,	4
),(43246940,	307,	4
),(47791655,	307,	2
),(48743705,	307,	4
),(51572168,	307,	11),
(52567239,	307,	13),
(52794581,	307,	4
),(55549712,	307,	14),
(55813326,	307,	7
),(56462246,	307,	18),
(57253118,	307,	12),
(63899654,	307,	8
),(66407977,	307,	7
),(72936625,	307,	10),
(75692632,	307,	2
),(76662813,	307,	12),
(78445718,	307,	11),
(81965142,	307,	8
),(83201687,	307,	8
),(84667886,	307,	12),
(86461348,	307,	14),
(89715013,	307,	9
),(97467090,	307,	8
),(99904277,	307,	7
),
(10281753,	308,	10),
(12332209,	308,	10),
(14627641,	308,	13),
(15710421,	308,	11),
(16659116,	308,	15),
(17123230,	308,	10),
(20885928,	308,	11),
(22715713,	308,	12),
(23166329,	308,	12),
(26047923,	308,	8
),(26487936,	308,	11),
(27162414,	308,	9
),(27204056,	308,	15),
(33937912,	308,	4
),(36065627,	308,	10),
(36354616,	308,	12),
(43246940,	308,	12),
(47791655,	308,	10),
(48743705,	308,	11),
(51572168,	308,	12),
(52567239,	308,	12),
(52794581,	308,	11),
(55549712,	308,	13),
(55813326,	308,	11),
(56462246,	308,	17),
(57253118,	308,	13),
(63899654,	308,	16),
(66407977,	308,	14),
(72936625,	308,	10),
(75692632,	308,	13),
(76662813,	308,	14),
(78445718,	308,	18),
(81965142,	308,	15),
(83201687,	308,	16),
(84667886,	308,	20),
(86461348,	308,	11),
(89715013,	308,	15),
(97467090,	308,	15),
(99904277,	308,	11),
(10281753,	309,	18),
(12332209,	309,	17),
(14627641,	309,	19),
(15710421,	309,	14),
(16659116,	309,	13),
(17123230,	309,	15),
(20885928,	309,	7
),(22715713,	309,	12),
(23166329,	309,	15),
(26047923,	309,	15),
(26487936,	309,	10),
(27162414,	309,	16),
(27204056,	309,	14),
(33937912,	309,	18),
(36065627,	309,	16),
(36354616,	309,	8
),(43246940,	309,	16),
(47791655,	309,	15),
(48743705,	309,	20),
(51572168,	309,	12),
(52567239,	309,	9
),(52794581,	309,	11),
(55549712,	309,	10),
(55813326,	309,	8
),(56462246,	309,	11),
(57253118,	309,	9
),(63899654,	309,	20),
(66407977,	309,	11),
(72936625,	309,	13),
(75692632,	309,	15),
(76662813,	309,	13),
(78445718,	309,	13),
(81965142,	309,	13),
(83201687,	309,	6
),(84667886,	309,	13),
(86461348,	309,	14),
(89715013,	309,	10),
(97467090,	309,	8
),(99904277,	309,	19),
(10281753,	310,	8
),(12332209,	310,	7
),(14627641,	310,	3
),(15710421,	310,	5
),(16659116,	310,	10),
(17123230,	310,	5
),(20885928,	310,	2
),(22715713,	310,	6
),(23166329,	310,	0
),(26047923,	310,	4
),(26487936,	310,	2
),(27162414,	310,	3
),(27204056,	310,	4
),(33937912,	310,	2
),(36065627,	310,	8
),(36354616,	310,	5
),(43246940,	310,	9
),(47791655,	310,	0
),(48743705,	310,	4
),(51572168,	310,	0
),(52567239,	310,	7
),(52794581,	310,	7
),(55549712,	310,	2
),(55813326,	310,	7
),(56462246,	310,	3
),(57253118,	310,	8
),(63899654,	310,	8
),(66407977,	310,	0
),(72936625,	310,	4
),(75692632,	310,	7
),(76662813,	310,	7
),(78445718,	310,	4
),(81965142,	310,	5
),(83201687,	310,	2
),(84667886,	310,	1
),(86461348,	310,	3
),(89715013,	310,	7
),(97467090,	310,	2
),(99904277,	310,	4
),
(10281753,	311,	20),
(12332209,	311,	12),
(14627641,	311,	8
),(15710421,	311,	18),
(16659116,	311,	14),
(17123230,	311,	6
),(20885928,	311,	14),
(22715713,	311,	11),
(23166329,	311,	13),
(26047923,	311,	17),
(26487936,	311,	11),
(27162414,	311,	11),
(27204056,	311,	6
),(33937912,	311,	8
),(36065627,	311,	18),
(36354616,	311,	7
),(43246940,	311,	13),
(47791655,	311,	9
),(48743705,	311,	11),
(51572168,	311,	17),
(52567239,	311,	12),
(52794581,	311,	13),
(55549712,	311,	9
),(55813326,	311,	4
),(56462246,	311,	5
),(57253118,	311,	9
),(63899654,	311,	14),
(66407977,	311,	7
),(72936625,	311,	10),
(75692632,	311,	13),
(76662813,	311,	10),
(78445718,	311,	13),
(81965142,	311,	11),
(83201687,	311,	11),
(84667886,	311,	9
),(86461348,	311,	11),
(89715013,	311,	10),
(97467090,	311,	11),
(99904277,	311,	11),
(10281753,	312,	4),
(12332209,	312,	3),
(14627641,	312,	3),
(15710421,	312,	1),
(16659116,	312,	5),
(17123230,	312,	3),
(20885928,	312,	5),
(22715713,	312,	4),
(23166329,	312,	2),
(26047923,	312,	5),
(26487936,	312,	4),
(27162414,	312,	2),
(27204056,	312,	3),
(33937912,	312,	5),
(36065627,	312,	4),
(36354616,	312,	3),
(43246940,	312,	4),
(47791655,	312,	4),
(48743705,	312,	5),
(51572168,	312,	2),
(52567239,	312,	2),
(52794581,	312,	5),
(55549712,	312,	5),
(55813326,	312,	3),
(56462246,	312,	5),
(57253118,	312,	2),
(63899654,	312,	4),
(66407977,	312,	4),
(72936625,	312,	5),
(75692632,	312,	5),
(76662813,	312,	5),
(78445718,	312,	3),
(81965142,	312,	2),
(83201687,	312,	2),
(84667886,	312,	5),
(86461348,	312,	2),
(89715013,	312,	4),
(97467090,	312,	3),
(99904277,	312,	4),
(12695343,	313,	10),
(15330035,	313,	15),
(19611576,	313,	14),
(22491150,	313,	17),
(23144259,	313,	12),
(24655905,	313,	13),
(25179222,	313,	20),
(26326420,	313,	8
),(28827259,	313,	8
),(29386219,	313,	11),
(29557897,	313,	13),
(30901477,	313,	8
),(34457914,	313,	8
),(34619084,	313,	13),
(35183865,	313,	15),
(39409116,	313,	10),
(41083936,	313,	13),
(42620373,	313,	18),
(45241147,	313,	10),
(46275969,	313,	12),
(50649325,	313,	19),
(53972238,	313,	20),
(54954233,	313,	13),
(56622972,	313,	13),
(60594527,	313,	16),
(61414047,	313,	13),
(66542703,	313,	19),
(66905564,	313,	14),
(68727765,	313,	15),
(71257664,	313,	12),
(74709445,	313,	20),
(76257107,	313,	12),
(79360908,	313,	10),
(79593813,	313,	6
),(86510574,	313,	15),
(86930808,	313,	13),
(91074522,	313,	20),
(91980591,	313,	17),
(96116283,	313,	8
),
(12695343,	314,	14),
(15330035,	314,	18),
(19611576,	314,	12),
(22491150,	314,	12),
(23144259,	314,	14),
(24655905,	314,	10),
(25179222,	314,	8
),(26326420,	314,	8
),(28827259,	314,	4
),(29386219,	314,	6
),(29557897,	314,	8
),(30901477,	314,	19),
(34457914,	314,	14),
(34619084,	314,	12),
(35183865,	314,	10),
(39409116,	314,	12),
(41083936,	314,	6
),(42620373,	314,	11),
(45241147,	314,	16),
(46275969,	314,	4
),(50649325,	314,	8
),(53972238,	314,	15),
(54954233,	314,	12),
(56622972,	314,	9
),(60594527,	314,	13),
(61414047,	314,	13),
(66542703,	314,	11),
(66905564,	314,	8
),(68727765,	314,	6
),(71257664,	314,	10),
(74709445,	314,	11),
(76257107,	314,	12),
(79360908,	314,	18),
(79593813,	314,	11),
(86510574,	314,	13),
(86930808,	314,	14),
(91074522,	314,	16),
(91980591,	314,	11),
(96116283,	314,	6
),
(12695343,	315,	3),
(15330035,	315,	1),
(19611576,	315,	5),
(22491150,	315,	6),
(23144259,	315,	3),
(24655905,	315,	0),
(25179222,	315,	5),
(26326420,	315,	4),
(28827259,	315,	3),
(29386219,	315,	1),
(29557897,	315,	6),
(30901477,	315,	3),
(34457914,	315,	2),
(34619084,	315,	4),
(35183865,	315,	4),
(39409116,	315,	2),
(41083936,	315,	3),
(42620373,	315,	1),
(45241147,	315,	4),
(46275969,	315,	0),
(50649325,	315,	2),
(53972238,	315,	5),
(54954233,	315,	7),
(56622972,	315,	6),
(60594527,	315,	5),
(61414047,	315,	6),
(66542703,	315,	0),
(66905564,	315,	1),
(68727765,	315,	2),
(71257664,	315,	1),
(74709445,	315,	0),
(76257107,	315,	5),
(79360908,	315,	6),
(79593813,	315,	0),
(86510574,	315,	6),
(86930808,	315,	2),
(91074522,	315,	4),
(91980591,	315,	6),
(96116283,	315,	3),
(12695343,	316,	16),
(15330035,	316,	19),
(19611576,	316,	20),
(22491150,	316,	10),
(23144259,	316,	16),
(24655905,	316,	16),
(25179222,	316,	17),
(26326420,	316,	10),
(28827259,	316,	10),
(29386219,	316,	10),
(29557897,	316,	11),
(30901477,	316,	13),
(34457914,	316,	9
),(34619084,	316,	14),
(35183865,	316,	10),
(39409116,	316,	11),
(41083936,	316,	15),
(42620373,	316,	18),
(45241147,	316,	10),
(46275969,	316,	12),
(50649325,	316,	16),
(53972238,	316,	14),
(54954233,	316,	4
),(56622972,	316,	13),
(60594527,	316,	17),
(61414047,	316,	11),
(66542703,	316,	14),
(66905564,	316,	6
),(68727765,	316,	17),
(71257664,	316,	13),
(74709445,	316,	17),
(76257107,	316,	14),
(79360908,	316,	12),
(79593813,	316,	12),
(86510574,	316,	7
),(86930808,	316,	11),
(91074522,	316,	18),
(91980591,	316,	17),
(96116283,	316,	10),
(12695343,	317,	5
),(15330035,	317,	1
),(19611576,	317,	3
),(22491150,	317,	7
),(23144259,	317,	9
),(24655905,	317,	7
),(25179222,	317,	6
),(26326420,	317,	6
),(28827259,	317,	7
),(29386219,	317,	3
),(29557897,	317,	1
),(30901477,	317,	8
),(34457914,	317,	10),
(34619084,	317,	8
),(35183865,	317,	5
),(39409116,	317,	10),
(41083936,	317,	3
),(42620373,	317,	6
),(45241147,	317,	7
),(46275969,	317,	10),
(50649325,	317,	5
),(53972238,	317,	10),
(54954233,	317,	10),
(56622972,	317,	2
),(60594527,	317,	5
),(61414047,	317,	7
),(66542703,	317,	10),
(66905564,	317,	9
),(68727765,	317,	7
),(71257664,	317,	10),
(74709445,	317,	8
),(76257107,	317,	7
),(79360908,	317,	9
),(79593813,	317,	5
),(86510574,	317,	4
),(86930808,	317,	3
),(91074522,	317,	5
),(91980591,	317,	10),
(96116283,	317,	10),
(12695343,	318,	6
),(15330035,	318,	9
),(19611576,	318,	6
),(22491150,	318,	13),
(23144259,	318,	1
),(24655905,	318,	10),
(25179222,	318,	7
),(26326420,	318,	6
),(28827259,	318,	9
),(29386219,	318,	11),
(29557897,	318,	4
),(30901477,	318,	8
),(34457914,	318,	9
),(34619084,	318,	10),
(35183865,	318,	8
),(39409116,	318,	15),
(41083936,	318,	10),
(42620373,	318,	4
),(45241147,	318,	9
),(46275969,	318,	10),
(50649325,	318,	15),
(53972238,	318,	13),
(54954233,	318,	12),
(56622972,	318,	8
),(60594527,	318,	11),
(61414047,	318,	7
),(66542703,	318,	9
),(66905564,	318,	0
),(68727765,	318,	3
),(71257664,	318,	12),
(74709445,	318,	10),
(76257107,	318,	12),
(79360908,	318,	8
),(79593813,	318,	0
),(86510574,	318,	16),
(86930808,	318,	9
),(91074522,	318,	14),
(91980591,	318,	15),
(96116283,	318,	12),
(12695343,	319,	14),
(15330035,	319,	9
),(19611576,	319,	20),
(22491150,	319,	13),
(23144259,	319,	18),
(24655905,	319,	20),
(25179222,	319,	14),
(26326420,	319,	17),
(28827259,	319,	12),
(29386219,	319,	8
),(29557897,	319,	17),
(30901477,	319,	10),
(34457914,	319,	18),
(34619084,	319,	20),
(35183865,	319,	13),
(39409116,	319,	20),
(41083936,	319,	15),
(42620373,	319,	20),
(45241147,	319,	14),
(46275969,	319,	19),
(50649325,	319,	9
),(53972238,	319,	17),
(54954233,	319,	8
),(56622972,	319,	16),
(60594527,	319,	16),
(61414047,	319,	6
),(66542703,	319,	16),
(66905564,	319,	13),
(68727765,	319,	14),
(71257664,	319,	20),
(74709445,	319,	8
),(76257107,	319,	11),
(79360908,	319,	14),
(79593813,	319,	15),
(86510574,	319,	10),
(86930808,	319,	15),
(91074522,	319,	12),
(91980591,	319,	14),
(96116283,	319,	11),
(12695343,	320,	10),
(15330035,	320,	12),
(19611576,	320,	9
),(22491150,	320,	2
),(23144259,	320,	7
),(24655905,	320,	17),
(25179222,	320,	3
),(26326420,	320,	10),
(28827259,	320,	14),
(29386219,	320,	8
),(29557897,	320,	19),
(30901477,	320,	12),
(34457914,	320,	15),
(34619084,	320,	7
),(35183865,	320,	5
),(39409116,	320,	11),
(41083936,	320,	4
),(42620373,	320,	12),
(45241147,	320,	13),
(46275969,	320,	10),
(50649325,	320,	11),
(53972238,	320,	10),
(54954233,	320,	10),
(56622972,	320,	10),
(60594527,	320,	10),
(61414047,	320,	11),
(66542703,	320,	8
),(66905564,	320,	3
),(68727765,	320,	6
),(71257664,	320,	9
),(74709445,	320,	6
),(76257107,	320,	9
),(79360908,	320,	5
),(79593813,	320,	4
),(86510574,	320,	10),
(86930808,	320,	10),
(91074522,	320,	9
),(91980591,	320,	8
),(96116283,	320,	9
),
(13933301,	321,	3),
(16797391,	321,	0),
(18029580,	321,	5),
(23412027,	321,	1),
(33583386,	321,	4),
(33809838,	321,	5),
(35544401,	321,	4),
(38867925,	321,	5),
(39014661,	321,	2),
(40177208,	321,	5),
(44508242,	321,	5),
(44975872,	321,	4),
(45124404,	321,	5),
(46341250,	321,	2),
(47992460,	321,	4),
(50255297,	321,	5),
(54277909,	321,	2),
(55075253,	321,	3),
(55481497,	321,	5),
(55920827,	321,	4),
(59394502,	321,	5),
(60555723,	321,	1),
(61496547,	321,	5),
(62998010,	321,	2),
(64445490,	321,	3),
(65440089,	321,	2),
(66080147,	321,	2),
(72165244,	321,	3),
(73317454,	321,	3),
(74288538,	321,	5),
(77026788,	321,	4),
(77271695,	321,	5),
(78162009,	321,	2),
(78641051,	321,	5),
(82567240,	321,	1),
(85700983,	321,	0),
(87657665,	321,	2),
(89132300,	321,	5),
(92475083,	321,	4),
(13933301,	322,	8
),(16797391,	322,	5
),(18029580,	322,	13),
(23412027,	322,	9
),(33583386,	322,	4
),(33809838,	322,	18),
(35544401,	322,	11),
(38867925,	322,	17),
(39014661,	322,	7
),(40177208,	322,	9
),(44508242,	322,	8
),(44975872,	322,	12),
(45124404,	322,	10),
(46341250,	322,	11),
(47992460,	322,	5
),(50255297,	322,	6
),(54277909,	322,	12),
(55075253,	322,	5
),(55481497,	322,	3
),(55920827,	322,	10),
(59394502,	322,	9
),(60555723,	322,	13),
(61496547,	322,	5
),(62998010,	322,	5
),(64445490,	322,	14),
(65440089,	322,	10),
(66080147,	322,	11),
(72165244,	322,	9
),(73317454,	322,	8
),(74288538,	322,	10),
(77026788,	322,	7
),(77271695,	322,	12),
(78162009,	322,	13),
(78641051,	322,	10),
(82567240,	322,	11),
(85700983,	322,	14),
(87657665,	322,	15),
(89132300,	322,	12),
(92475083,	322,	3
),
(13933301,	323,	3
),(16797391,	323,	7
),(18029580,	323,	3
),(23412027,	323,	4
),(33583386,	323,	3
),(33809838,	323,	4
),(35544401,	323,	5
),(38867925,	323,	5
),(39014661,	323,	1
),(40177208,	323,	2
),(44508242,	323,	0
),(44975872,	323,	1
),(45124404,	323,	0
),(46341250,	323,	1
),(47992460,	323,	0
),(50255297,	323,	1
),(54277909,	323,	4
),(55075253,	323,	7
),(55481497,	323,	3
),(55920827,	323,	0
),(59394502,	323,	1
),(60555723,	323,	2
),(61496547,	323,	4
),(62998010,	323,	4
),(64445490,	323,	9
),(65440089,	323,	1
),(66080147,	323,	3
),(72165244,	323,	10),
(73317454,	323,	1
),(74288538,	323,	4
),(77026788,	323,	10),
(77271695,	323,	2
),(78162009,	323,	3
),(78641051,	323,	7
),(82567240,	323,	4
),(85700983,	323,	6
),(87657665,	323,	8
),(89132300,	323,	7
),(92475083,	323,	2
),
(13933301,	324,	11),
(16797391,	324,	10),
(18029580,	324,	13),
(23412027,	324,	8
),(33583386,	324,	10),
(33809838,	324,	10),
(35544401,	324,	7
),(38867925,	324,	18),
(39014661,	324,	16),
(40177208,	324,	14),
(44508242,	324,	8
),(44975872,	324,	13),
(45124404,	324,	18),
(46341250,	324,	17),
(47992460,	324,	13),
(50255297,	324,	14),
(54277909,	324,	13),
(55075253,	324,	5
),(55481497,	324,	10),
(55920827,	324,	11),
(59394502,	324,	6
),(60555723,	324,	13),
(61496547,	324,	7
),(62998010,	324,	12),
(64445490,	324,	6
),(65440089,	324,	12),
(66080147,	324,	15),
(72165244,	324,	5
),(73317454,	324,	11),
(74288538,	324,	12),
(77026788,	324,	15),
(77271695,	324,	18),
(78162009,	324,	4
),(78641051,	324,	14),
(82567240,	324,	9
),(85700983,	324,	9
),(87657665,	324,	12),
(89132300,	324,	3
),(92475083,	324,	8
),
(13933301,	325,	9
),(16797391,	325,	8
),(18029580,	325,	5
),(23412027,	325,	8
),(33583386,	325,	8
),(33809838,	325,	5
),(35544401,	325,	3
),(38867925,	325,	5
),(39014661,	325,	9
),(40177208,	325,	6
),(44508242,	325,	1
),(44975872,	325,	4
),(45124404,	325,	4
),(46341250,	325,	5
),(47992460,	325,	1
),(50255297,	325,	4
),(54277909,	325,	7
),(55075253,	325,	4
),(55481497,	325,	5
),(55920827,	325,	4
),(59394502,	325,	4
),(60555723,	325,	6
),(61496547,	325,	5
),(62998010,	325,	9
),(64445490,	325,	10),
(65440089,	325,	3
),(66080147,	325,	2
),(72165244,	325,	7
),(73317454,	325,	7
),(74288538,	325,	8
),(77026788,	325,	9
),(77271695,	325,	7
),(78162009,	325,	5
),(78641051,	325,	9
),(82567240,	325,	0
),(85700983,	325,	7
),(87657665,	325,	5
),(89132300,	325,	9
),(92475083,	325,	5
),
(13933301,	326,	2
),(16797391,	326,	6
),(18029580,	326,	12),
(23412027,	326,	7
),(33583386,	326,	7
),(33809838,	326,	8
),(35544401,	326,	9
),(38867925,	326,	11),
(39014661,	326,	11),
(40177208,	326,	5
),(44508242,	326,	0
),(44975872,	326,	5
),(45124404,	326,	3
),(46341250,	326,	16),
(47992460,	326,	10),
(50255297,	326,	12),
(54277909,	326,	6
),(55075253,	326,	3
),(55481497,	326,	9
),(55920827,	326,	8
),(59394502,	326,	8
),(60555723,	326,	1
),(61496547,	326,	17),
(62998010,	326,	6
),(64445490,	326,	5
),(65440089,	326,	10),
(66080147,	326,	6
),(72165244,	326,	0
),(73317454,	326,	9
),(74288538,	326,	15),
(77026788,	326,	16),
(77271695,	326,	8
),(78162009,	326,	5
),(78641051,	326,	7
),(82567240,	326,	9
),(85700983,	326,	13),
(87657665,	326,	7
),(89132300,	326,	10),
(92475083,	326,	12),
(13933301,	327,	5),
(16797391,	327,	5),
(18029580,	327,	3),
(23412027,	327,	4),
(33583386,	327,	0),
(33809838,	327,	4),
(35544401,	327,	2),
(38867925,	327,	3),
(39014661,	327,	3),
(40177208,	327,	2),
(44508242,	327,	4),
(44975872,	327,	2),
(45124404,	327,	4),
(46341250,	327,	5),
(47992460,	327,	5),
(50255297,	327,	2),
(54277909,	327,	3),
(55075253,	327,	5),
(55481497,	327,	2),
(55920827,	327,	0),
(59394502,	327,	4),
(60555723,	327,	5),
(61496547,	327,	2),
(62998010,	327,	3),
(64445490,	327,	3),
(65440089,	327,	3),
(66080147,	327,	2),
(72165244,	327,	5),
(73317454,	327,	5),
(74288538,	327,	0),
(77026788,	327,	2),
(77271695,	327,	4),
(78162009,	327,	5),
(78641051,	327,	5),
(82567240,	327,	5),
(85700983,	327,	5),
(87657665,	327,	2),
(89132300,	327,	5),
(92475083,	327,	2),
(13933301,	328,	13),
(16797391,	328,	11),
(18029580,	328,	9
),(23412027,	328,	6
),(33583386,	328,	7
),(33809838,	328,	8
),(35544401,	328,	0
),(38867925,	328,	6
),(39014661,	328,	3
),(40177208,	328,	9
),(44508242,	328,	3
),(44975872,	328,	7
),(45124404,	328,	14),
(46341250,	328,	8
),(47992460,	328,	6
),(50255297,	328,	7
),(54277909,	328,	8
),(55075253,	328,	8
),(55481497,	328,	4
),(55920827,	328,	9
),(59394502,	328,	4
),(60555723,	328,	7
),(61496547,	328,	12),
(62998010,	328,	8
),(64445490,	328,	11),
(65440089,	328,	15),
(66080147,	328,	14),
(72165244,	328,	8
),(73317454,	328,	3
),(74288538,	328,	9
),(77026788,	328,	5
),(77271695,	328,	11),
(78162009,	328,	18),
(78641051,	328,	0
),(82567240,	328,	12),
(85700983,	328,	18),
(87657665,	328,	7
),(89132300,	328,	8
),(92475083,	328,	1
),
(11060460,	329,	8
),(12676344,	329,	10),
(13798907,	329,	5
),(14857390,	329,	2
),(14876495,	329,	9
),15291264    329	7
(15835420,	329,	4
),(17358086,	329,	8
),(18167729,	329,	7
),(22735531,	329,	10),
(31721186,	329,	5
),(33551716,	329,	7
),(37864801,	329,	7
),(39028666,	329,	9
),39291233    329	4
(42119585,	329,	7
),(44618350,	329,	2
),(44809709,	329,	8
),(47500359,	329,	5
),(51067129,	329,	9
),(53414159,	329,	6
),(58498985,	329,	8
),(59542319,	329,	7
),(60436435,	329,	6
),(63239930,	329,	10),
(67735490,	329,	3
),(68243902,	329,	4
),(70714030,	329,	2
),(71582989,	329,	4
),(82232362,	329,	0
),(86606105,	329,	8
),(88571574,	329,	4
),(92033729,	329,	8
),(92343797,	329,	8
),(92883827,	329,	7
),(93501906,	329,	6
),(95481005,	329,	4
),(97792734,	329,	2
),(99115530,	329,	5
),
(11060460,	330,	10),
(12676344,	330,	13),
(13798907,	330,	19),
(14857390,	330,	12),
(14876495,	330,	16),
15291264    330	16
(15835420,	330,	18),
(17358086,	330,	8
),(18167729,	330,	16),
(22735531,	330,	13),
(31721186,	330,	14),
(33551716,	330,	7
),(37864801,	330,	9
),(39028666,	330,	17),
39291233    330	13
(42119585,	330,	5
),(44618350,	330,	14),
(44809709,	330,	15),
(47500359,	330,	14),
(51067129,	330,	20),
(53414159,	330,	6
),(58498985,	330,	15),
(59542319,	330,	13),
(60436435,	330,	14),
(63239930,	330,	16),
(67735490,	330,	10),
(68243902,	330,	15),
(70714030,	330,	12),
(71582989,	330,	11),
(82232362,	330,	20),
(86606105,	330,	12),
(88571574,	330,	10),
(92033729,	330,	18),
(92343797,	330,	13),
(92883827,	330,	12),
(93501906,	330,	5
),(95481005,	330,	17),
(97792734,	330,	14),
(99115530,	330,	15),
(11060460,	331,	11),

(12676344,	331,	11),

(13798907,	331,	9
),
(14857390,	331,	10),

(14876495,	331,	1
),
(15291264   , 331,	16),

(15835420,	331,	9
),
(17358086,	331,	13),

(18167729,	331,	12),

(22735531,	331,	11),

(31721186,	331,	12),

(33551716,	331,	7
),
(37864801,	331,	12),

(39028666,	331,	12),

(39291233   , 331,	9
),
(42119585,	331,	13),

(44618350,	331,	9
),
(44809709,	331,	7
),
(47500359,	331,	18),

(51067129,	331,	12),

(53414159,	331,	8
),
(58498985,	331,	6
),
(59542319,	331,	10),

(60436435,	331,	14),

(63239930,	331,	11),

(67735490,	331,	6
),
(68243902,	331,	9
),
(70714030,	331,	12),

(71582989,	331,	13),

(82232362,	331,	9
),
(86606105,	331,	10),

(88571574,	331,	11),

(92033729,	331,	7
),
(92343797,	331,	9
),
(92883827,	331,	15),

(93501906,	331,	14),

(95481005,	331,	12),

(97792734,	331,	9
),
(99115530,	331,	9
),
(11060460,	332,	3
),
(12676344,	332,	0
),
(13798907,	332,	9
),
(14857390,	332,	4
),
(14876495,	332,	3
),
15291264    332	3
(15835420,	332,	1
),
(17358086,	332,	7
),
(18167729,	332,	3
),
(22735531,	332,	6
),
(31721186,	332,	9
),
(33551716,	332,	3
),
(37864801,	332,	7
),
(39028666,	332,	3
),
(39291233,    332,	5),
(42119585,	332,	0
),
(44618350,	332,	5
),
(44809709,	332,	5
),
(47500359,	332,	10),

(51067129,	332,	3
),
(53414159,	332,	3
),
(58498985,	332,	7
),
(59542319,	332,	2
),
(60436435,	332,	3
),
(63239930,	332,	4
),
(67735490,	332,	3
),
(68243902,	332,	3
),
(70714030,	332,	4
),
(71582989,	332,	7
),
(82232362,	332,	10),

(86606105,	332,	4
),
(88571574,	332,	0
),
(92033729,	332,	1
),
(92343797,	332,	7
),
(92883827,	332,	5
),
(93501906,	332,	9
),
(95481005,	332,	4
),
(97792734,	332,	2
),
(99115530,	332,	3
),
(11060460,	333,	11),

(12676344,	333,	13),

(13798907,	333,	12),

(14857390,	333,	11),

(14876495,	333,	9
),
(15291264,    333,	11),
(15835420,	333,	15),

(17358086,	333,	13),

(18167729,	333,	15),

(22735531,	333,	5
),
(31721186,	333,	9
),
(33551716,	333,	8
),
(37864801,	333,	9
),
(39028666,	333,	12),

(39291233,    333,	9),
(42119585,	333,	8
),
(44618350,	333,	8
),
(44809709,	333,	6
),
(47500359,	333,	3
),
(51067129,	333,	10),

(53414159,	333,	5
),
(58498985,	333,	9
),
(59542319,	333,	13),

(60436435,	333,	11),

(63239930,	333,	18),

(67735490,	333,	1
),
(68243902,	333,	15),

(70714030,	333,	10),

(71582989,	333,	3
),
(82232362,	333,	14),

(86606105,	333,	13),

(88571574,	333,	13),

(92033729,	333,	10),

(92343797,	333,	13),

(92883827,	333,	4
),
(93501906,	333,	6
),
(95481005,	333,	16),

(97792734,	333,	7
),
(99115530,	333,	9
),
(11060460,	334,	6
),
(12676344,	334,	14),

(13798907,	334,	11),

(14857390,	334,	13),

(14876495,	334,	7
),
(15291264,    334,	20),
(15835420,	334,	2
),
(17358086,	334,	4
),
(18167729,	334,	5
),
(22735531,	334,	12),

(31721186,	334,	13),

(33551716,	334,	3
),
(37864801,	334,	10),

(39028666,	334,	12),

(39291233,	334,	8
),
(42119585,	334,	15),

(44618350,	334,	9
),
(44809709,	334,	7
),
(47500359,	334,	6
),
(51067129,	334,	15),

(53414159,	334,	14),

(58498985,	334,	7
),
(59542319,	334,	9
),
(60436435,	334,	10),

(63239930,	334,	4
),
(67735490,	334,	7
),
(68243902,	334,	6
),
(70714030,	334,	12),

(71582989,	334,	6
),
(82232362,	334,	10),

(86606105,	334,	10),

(88571574,	334,	8
),
(92033729,	334,	6
),
(92343797,	334,	6
),
(92883827,	334,	7
),
(93501906,	334,	6
),
(95481005,	334,	17),

(97792734,	334,	10),

(99115530,	334,	6
),
(11060460,	335,	5
),
(12676344,	335,	4
),
(13798907,	335,	5
),
(14857390,	335,	5
),
(14876495,	335,	9
),
(15291264,	335,	4
),
(15835420,	335,	14),

(17358086,	335,	16),

(18167729,	335,	5
),
(22735531,	335,	4
),
(31721186,	335,	10),

(33551716,	335,	10),

(37864801,	335,	6
),
(39028666,	335,	15),

(39291233,	335,	9
),
(42119585,	335,	8
),
(44618350,	335,	15),

(44809709,	335,	10),

(47500359,	335,	10),

(51067129,	335,	6
),
(53414159,	335,	1
),
(58498985,	335,	4
),
(59542319,	335,	13),

(60436435,	335,	10),

(63239930,	335,	8
),
(67735490,	335,	14),

(68243902,	335,	7
),
(70714030,	335,	3
),
(71582989,	335,	13),

(82232362,	335,	14),

(86606105,	335,	12),

(88571574,	335,	9
),
(92033729,	335,	8
),
(92343797,	335,	5
),
(92883827,	335,	12),

(93501906,	335,	9
),
(95481005,	335,	6
),
(97792734,	335,	3
),
(99115530,	335,	8
),
(11060460,	336,	14),

(12676344,	336,	7
),
(13798907,	336,	7
),
(14857390,	336,	7
),
(14876495,	336,	11),

(15291264,	336,	14),

(15835420,	336,	11),

(17358086,	336,	13),

(18167729,	336,	5
),
(22735531,	336,	15),

(31721186,	336,	5
),
(33551716,	336,	3
),
(37864801,	336,	15),

(39028666,	336,	8
),
(39291233,	336,	11),

(42119585,	336,	8
),
(44618350,	336,	5
),
(44809709,	336,	8
),
(47500359,	336,	9
),
(51067129,	336,	0
),
(53414159,	336,	12),

(58498985,	336,	0
),
(59542319,	336,	7
),
(60436435,	336,	10),

(63239930,	336,	17),

(67735490,	336,	3
),
(68243902,	336,	2
),
(70714030,	336,	13),

(71582989,	336,	10),

(82232362,	336,	14),

(86606105,	336,	9
),
(88571574,	336,	9
),
(92033729,	336,	5
),
(92343797,	336,	9
),
(92883827,	336,	4
),
(93501906,	336,	8
),
(95481005,	336,	10),

(97792734,	336,	2
),
(99115530,	336,	3
),
(99597461,	337,	20),
(99597461,	338,	20),
(99597461,	339,	20),
(99597461,	340,	20),
(99597461,	341,	20),
(99597461,	342,	20),
(99597461,	343,	20),
(99597461,	344,	20),
(99597461,	345,	20),
(99597461,	346,	20),
(99597461,	347,	20),
(99597461,	348,	20),
(99597461,	349,	20),
(99597461,	350,	20),
(99597461,	351,	20),
(99597461,	352,	20),
(99597461,	353,	20),
(99597461,	354,	20),
(99597461,	355,	20),
(99597461,	356,	20),
(99597461,	357,	20),
(99597461,	358,	20),
(99597461,	359,	20),
(99597461,	360,	20),
(99597461,	361,	20),
(99597461,	362,	20),
(99597461,	363,	20),
(99597461,	364,	20),
(99597461,	365,	20),
(99597461,	366,	20),
(99597461,	367,	20),
(99597461,	368,	20),
(99597461,	369,	20),
(99597461,	370,	20),
(99597461,	371,	20),
(99597461,	372,	20),
(99597461,	373,	20),
(99597461,	374,	20),
(99597461,	375,	20),
(99597461,	376,	20),
(99597461,	377,	20),
(99597461,	378,	20),
(99597461,	379,	20),
(99597461,	380,	20),
(99597461,	381,	20),
(99597461,	382,	20),
(99597461,	383,	20),
(99597461,	384,	20),
(99597461,	385,	20),
(99597461,	386,	20);*/


