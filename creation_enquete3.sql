CREATE TABLE IF NOT EXISTS pays (
    code_pays VARCHAR(10) PRIMARY KEY,
    libelle VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS ville (
    id_ville SERIAL PRIMARY KEY,
    libelle VARCHAR(500) NOT NULL,
    code_postal VARCHAR(10) NOT NULL,
	pays VARCHAR(10) REFERENCES pays NOT NULL
);

CREATE TABLE IF NOT EXISTS adresse(
    id_adresse SERIAL PRIMARY KEY,
	numero INTEGER NOT NULL,
    voie VARCHAR(100) NOT NULL,
    ville INTEGER REFERENCES ville NOT NULL
);

CREATE TYPE sexe AS ENUM('Homme','Femme');

CREATE TABLE IF NOT EXISTS client (
    id_client VARCHAR(50) PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    sexe_client sexe NOT NULL,
    date_naissance DATE NOT NULL,
    date_inscription TIMESTAMP NOT NULL,
    num_tel VARCHAR(10),
    email VARCHAR(50),
	ville_naissance INTEGER REFERENCES ville NOT NULL,
	domicile INTEGER REFERENCES adresse NOT NULL
);

CREATE TABLE IF NOT EXISTS agence (
    code_agence VARCHAR(20) PRIMARY KEY,
	adresse INTEGER REFERENCES adresse NOT NULL
);

CREATE TABLE IF NOT EXISTS type_compte (
    nom_type VARCHAR(50) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS compte (
    id_compte VARCHAR(20) PRIMARY KEY,
    solde NUMERIC,
    IBAN VARCHAR(27) NOT NULL,
	type_compte VARCHAR(50) REFERENCES type_compte NOT NULL,
    agence VARCHAR(50) REFERENCES agence NOT NULL
);

CREATE TABLE IF NOT EXISTS titulaire (
    compte VARCHAR(20) REFERENCES compte NOT NULL,
    client VARCHAR(50) REFERENCES client NOT NULL,
    UNIQUE (compte, client)
);

CREATE TABLE IF NOT EXISTS carte_bancaire (
    num_carte VARCHAR(16) PRIMARY KEY,
    date_expiration DATE NOT NULL,
	compte VARCHAR(20) REFERENCES compte NOT NULL
);

CREATE TABLE IF NOT EXISTS operation (
    id_operation VARCHAR(50) PRIMARY KEY,
    montant NUMERIC NOT NULL,
    date_heure DATE NOT NULL,
	compte VARCHAR(20) REFERENCES compte NOT NULL,
    carte_bancaire VARCHAR(16) REFERENCES carte_bancaire NOT NULL
);

CREATE TABLE IF NOT EXISTS distributeur (
    id_distributeur VARCHAR(50) PRIMARY KEY,
    adresse INTEGER REFERENCES adresse NOT NULL
);

CREATE TABLE IF NOT EXISTS retrait_depot (
    distributeur VARCHAR(50) REFERENCES distributeur NOT NULL
) INHERITS (operation);

CREATE TABLE IF NOT EXISTS type_operation (
    nom_type_operation VARCHAR(100) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS operation_tiers (
    IBAN_tiers VARCHAR(27) NOT NULL,
    BIC_tiers VARCHAR(11) NOT NULL,
	type_operation VARCHAR(100) REFERENCES type_operation NOT NULL
) INHERITS (operation);

INSERT INTO pays VALUES (1,'France');
INSERT INTO pays VALUES (2,'Espagne');
INSERT INTO pays VALUES (3,'Suisse');

INSERT INTO ville VALUES (1,'Montpellier',34000,1);
INSERT INTO ville VALUES (2,'Paris',75000,1);
INSERT INTO ville VALUES (3,'Nimes',30000,1);
INSERT INTO ville VALUES (4,'Marseille',13000,1);
INSERT INTO ville VALUES (5,'Lyon',69000,1);
INSERT INTO ville VALUES (6,'Madrid',28000,2);
INSERT INTO ville VALUES (7,'Geneve',1200,3);
INSERT INTO ville VALUES (8,'Carcassonne',11000,1);

INSERT INTO adresse VALUES (1, 15,'Moulares',1);
INSERT INTO adresse VALUES (2, 8,'Victor Hugo',1);
INSERT INTO adresse VALUES (3, 2,'Marais',2);
INSERT INTO adresse VALUES (4, 71,'Franklin Roosevelt',5);
INSERT INTO adresse VALUES (5, 1,'Justice',1);
INSERT INTO adresse VALUES (6, 36,'Gambetta',4);
INSERT INTO adresse VALUES (7, 21,'St Pierre',4);
INSERT INTO adresse VALUES (8, 17,'Raspail',8);

INSERT INTO client VALUES (852741963, 'Mercier', 'Marc', 'Homme', '1995-03-16', '2010-03-16' , 0652418973, 'marc.mercier@gmail.com', 1, 1);
INSERT INTO client VALUES (100589675, 'Jones', 'Chloe', 'Femme', '1985-03-16', '2014-08-31' , 0745862359, 'joness.mrs@yahoo.co.uk', 7, 7);
INSERT INTO client VALUES (100589569, 'Siemens', 'Charlotte', 'Femme', '1992-02-17', '2009-11-29' , 0652314879, 'charlotte.siemens@gmail.com', 6, 8);

INSERT INTO agence VALUES (1684, 2);
INSERT INTO agence VALUES (3005, 5);
INSERT INTO agence VALUES (4500, 6);
INSERT INTO agence VALUES (5002, 3);
--INSERT INTO agence VALUES (1684, 2);
--INSERT INTO agence VALUES (1684, 2);
--INSERT INTO agence VALUES (1684, 2);

INSERT INTO type_compte VALUES ('epargne');
INSERT INTO type_compte VALUES ('courant');
INSERT INTO type_compte VALUES ('compte-titre');
--INSERT INTO type_compte VALUES ('a termes');

INSERT INTO compte VALUES (972,  500, 'FR7630001007941234567890185','epargne', 1684);
INSERT INTO compte VALUES (5023,  0, 'FR1420041010050500013M02606','courant', 3005);
INSERT INTO compte VALUES (6984,  150, 'FR7614410000011234567890163','courant', 4500);
INSERT INTO compte VALUES (301,  10000, 'FR8642559000011234567890121','compte-titre', 5002);
INSERT INTO compte VALUES (499,  0, 'FR3547899002166654697524896','compte-titre', 5002);
INSERT INTO compte VALUES (6869,  0, 'FR5584123660023894478516973','epargne', 5002);


INSERT INTO titulaire VALUES (972, 852741963);
INSERT INTO titulaire VALUES (5023, 100589675);
INSERT INTO titulaire VALUES (499, 100589675);
INSERT INTO titulaire VALUES (6869, 100589675);

INSERT INTO carte_bancaire VALUES (4624748233249080, '2025-03-16',972);
INSERT INTO carte_bancaire VALUES (5000551000000400, '2024-05-05',5023);
INSERT INTO carte_bancaire VALUES (4917480000000070, '2023-09-16',6984);
INSERT INTO carte_bancaire VALUES (4150560000000010, '2027-06-04',301);

INSERT INTO type_operation VALUES ('Tiers');
INSERT INTO type_operation VALUES ('Depot/retrait');


INSERT INTO operation_tiers VALUES (6468465341, 3000, '2022-08-08 10:05:00',972,4917480000000070, 'FR7614410000011234567890163', 'MMCPFRBP', 'Tiers');
INSERT INTO operation_tiers VALUES (3514971489, 3000, '2022-08-08 08:59:00',972,4150560000000010, 'FR8642559000011234567890121', 'TXLUFRPW', 'Tiers' );
INSERT INTO operation_tiers VALUES (8849417893, 7200, '2022-08-08 07:42:56', 972, 5000551000000400, 'FR1420041010050500013M02606', 'CMCIFRPP', 'Tiers');