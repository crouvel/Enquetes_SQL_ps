CREATE TABLE IF NOT EXISTS etat (
    code_etat VARCHAR(10) PRIMARY KEY,
    nom_etat VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS personne (
    id_personne BIGSERIAL PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    prenom VARCHAR(200) NOT NULL,
    date_naissance DATE
);

CREATE TABLE IF NOT EXISTS nationalite (
    personne BIGINT REFERENCES personne NOT NULL,
    etat VARCHAR(10) REFERENCES etat NOT NULL,
    UNIQUE(personne, etat)
);

CREATE TABLE IF NOT EXISTS carte_sim (
    numero CHAR(10) PRIMARY KEY NOT NULL,
    proprietaire BIGINT REFERENCES personne
);

CREATE TABLE IF NOT EXISTS antenne (
    id_antenne SERIAL PRIMARY KEY,
    latitude float(24) NOT NULL,
    longitude float(24) NOT NULL,
    rue CHAR(200),
    code_postal integer
);

CREATE TABLE IF NOT EXISTS session (
    id_session SERIAL PRIMARY KEY,
    sim CHAR(10) REFERENCES carte_sim NOT NULL,
    antenne INTEGER REFERENCES antenne NOT NULL,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sms (
    envoyeur INTEGER REFERENCES session NOT NULL,
    receveur INTEGER REFERENCES session NOT NULL,
    date TIMESTAMP,
    contenu VARCHAR(450)
);

CREATE TABLE IF NOT EXISTS appel (
    envoyeur INTEGER REFERENCES session NOT NULL,
    receveur INTEGER REFERENCES session NOT NULL,
    date_debut TIMESTAMP,
    date_fin TIMESTAMP
);

CREATE OR REPLACE FUNCTION distance(lat1 float, lon1 float, lat2 float, lon2 float)
RETURNS float AS $dist$
    DECLARE
        dist float = 0;
        radlat1 float;
        radlat2 float;
        theta float;
        radtheta float;
    BEGIN
        IF lat1 = lat2 OR lon1 = lon2
            THEN RETURN dist;
        ELSE
            radlat1 = pi() * lat1 / 180;
            radlat2 = pi() * lat2 / 180;
            theta = lon1 - lon2;
            radtheta = pi() * theta / 180;
            dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta);

            IF dist > 1 THEN dist = 1; END IF;

            dist = acos(dist);
            dist = dist * 180 / pi();
            dist = dist * 60 * 1.853159616;

            RETURN dist;
        END IF;
    END;
$dist$ LANGUAGE plpgsql;


INSERT INTO personne VALUES (145545455466, 'Sop', 'Alain','1969-03-16');
INSERT INTO personne VALUES (965894420252, 'Honnete', 'Camille','1988-03-16');
INSERT INTO personne VALUES (58994556677, 'Silencieux', 'Jean','1995-02-13');
INSERT INTO personne VALUES (55698455236, 'Oussama', 'Mohamed','1987-08-28');
INSERT INTO personne VALUES (14588796613, 'Martel', 'Elise','2001-05-01');
INSERT INTO personne VALUES (445789123664, 'Chateau', 'Pierre','1990-12-13');
INSERT INTO personne VALUES (145789651230, 'France', 'Lisa','1978-10-13');
INSERT INTO personne VALUES (458755695213, 'Sylvestre', 'Alexandre','2006-01-20');
INSERT INTO personne VALUES (11478956963, 'Rubio', 'Marjorie','1982-08-01');
INSERT INTO personne VALUES (98745125636, 'Roussel', 'Caroline','1998-08-13');
INSERT INTO personne VALUES (124785000236, 'Coupable', 'Marise','1986-06-06');
INSERT INTO personne VALUES (145893201278, 'Garcia', 'Sylvia','2000-11-17');
INSERT INTO personne VALUES (154785210369, 'Lopez', 'Bernard','1955-06-13');
INSERT INTO personne VALUES (452563557, 'Falcone', 'Giovanni','1975-05-18');
INSERT INTO personne VALUES (458788963447, 'Nguyen', 'Quentin','1993-08-29');
INSERT INTO personne VALUES (778964122336, 'Diaye', 'Mamadou','1994-05-22');
INSERT INTO personne VALUES (689120000014, 'Finale', 'Noemie','1998-10-14');
INSERT INTO personne VALUES (600004875964, 'Carpentier', 'Elisa','2002-07-01');
INSERT INTO personne VALUES (445879652136, 'Jacques', 'Pierre','1984-01-26');
INSERT INTO personne VALUES (1125487996412, 'Elevage', 'Sabine','1987-02-04');
INSERT INTO personne VALUES (111258740369, 'Suspecte', 'Justine','1995-01-31');
INSERT INTO personne VALUES (112547896521, 'Marchand', 'Vivienne','1975-05-05');
INSERT INTO personne VALUES (555879412563, 'Jones', 'Alice','1971-09-08');
INSERT INTO personne VALUES (125487589652, 'Stanford', 'Kevin','1989-02-02');
INSERT INTO personne VALUES (999955556663, 'Mechant', 'Sandra','1989-01-17');
INSERT INTO personne VALUES (416148336405, 'Lerbizard', 'Richard','1995-10-13');
INSERT INTO personne VALUES (555558887778, 'Perret', 'William','1990-07-07');
INSERT INTO personne VALUES (555100000236, 'Martin', 'Divine','2011-10-31');
INSERT INTO personne VALUES (000145789663, 'Grand', 'Appoline','1995-04-30');
INSERT INTO personne VALUES (114587966322, 'Choix', 'Alexia','1980-03-03');
INSERT INTO personne VALUES (445877899663, 'Thomas', 'Cecile','1974-01-25');
INSERT INTO personne VALUES (416155666687, 'Esteban', 'Clara','1985-10-17');
INSERT INTO personne VALUES (000011222366, 'Montaigne', 'Clovis','1974-05-18');
INSERT INTO personne VALUES (222558899999, 'Jalouse', 'Jessica','2004-05-05');
INSERT INTO personne VALUES (014587996311, 'Gomez', 'Sylvain','1998-04-23');
INSERT INTO personne VALUES (201458796635, 'Ndole', 'Sebastien','1990-07-13');
INSERT INTO personne VALUES (112548889663, 'Combat', 'Amaury','1992-01-08');
INSERT INTO personne VALUES (777777777777, 'Pittaya', 'Louisa','1995-10-13');
INSERT INTO personne VALUES (555555555555, 'Vicieux', 'Jean','1980-02-18');
INSERT INTO personne VALUES (444444444445, 'Albert', 'Leo','2001-02-05');
INSERT INTO personne VALUES (445555555555, 'Perruche', 'Marine','1982-01-01');
INSERT INTO personne VALUES (666699999999, 'Sanmartin', 'Laura','1995-10-13');
INSERT INTO personne VALUES (989898989898, 'Trudeau', 'Pascal','1968-03-15');
INSERT INTO personne VALUES (224785669931, 'Gonzalez', 'Patricia','1985-06-06');
INSERT INTO personne VALUES (555555547189, 'Munoz', 'Esteban','1997-07-08');
INSERT INTO personne VALUES (200000000002, 'Altaz', 'Sabine','1979-02-06');
INSERT INTO personne VALUES (100000444400, 'Carmel', 'Sophie','1987-01-07');


INSERT INTO carte_sim VALUES (0645236585,965894420252);
INSERT INTO carte_sim VALUES (0652448565,416148336405);
INSERT INTO carte_sim VALUES (0653214785,445555555555);
INSERT INTO carte_sim VALUES (0741415689,445555555555);
INSERT INTO carte_sim VALUES (0686442699,445555555555);
INSERT INTO carte_sim VALUES (0788841458);
INSERT INTO carte_sim VALUES (0762418963);
INSERT INTO carte_sim VALUES (0666854172,112548889663);
INSERT INTO carte_sim VALUES (0695953204,111258740369);
INSERT INTO carte_sim VALUES (0584129654,112548889663);
INSERT INTO carte_sim VALUES (0778985226,145545455466);
INSERT INTO carte_sim VALUES (0109095841,458755695213);
INSERT INTO carte_sim VALUES (0168681414,458755695213);
INSERT INTO carte_sim VALUES (0788787896);
INSERT INTO carte_sim VALUES (0777777777);
INSERT INTO carte_sim VALUES (0655898974,114587966322);
INSERT INTO carte_sim VALUES (0641741478,778964122336);
INSERT INTO carte_sim VALUES (0774747474,689120000014);
INSERT INTO carte_sim VALUES (0666202140,555555555555);
INSERT INTO carte_sim VALUES (0612454563,999955556663);
INSERT INTO carte_sim VALUES (0658412578);
INSERT INTO carte_sim VALUES (0752630101,125487589652);
INSERT INTO carte_sim VALUES (0789415623,55698455236);
INSERT INTO carte_sim VALUES (0707995284);
INSERT INTO carte_sim VALUES (0714201456);
INSERT INTO carte_sim VALUES (0785232323,55698455236);
INSERT INTO carte_sim VALUES (0660989852,55698455236);
INSERT INTO carte_sim VALUES (0725251478);
INSERT INTO carte_sim VALUES (0682145296);
INSERT INTO carte_sim VALUES (0641785236);
INSERT INTO carte_sim VALUES (0678965412,125487589652);
INSERT INTO carte_sim VALUES (0605640623,154785210369);
INSERT INTO carte_sim VALUES (0685857474,989898989898);
INSERT INTO carte_sim VALUES (0612458963,999955556663);
INSERT INTO carte_sim VALUES (0612479620,154785210369);
INSERT INTO carte_sim VALUES (0700004123);
INSERT INTO carte_sim VALUES (0756565656,201458796635);
INSERT INTO carte_sim VALUES (0600023547,201458796635);
INSERT INTO carte_sim VALUES (0658457855,145545455466);
INSERT INTO carte_sim VALUES (0663452563,200000000002);
INSERT INTO carte_sim VALUES (0678968777,224785669931);
INSERT INTO carte_sim VALUES (0645456565,200000000002);
INSERT INTO carte_sim VALUES (0623534522);
INSERT INTO carte_sim VALUES (0741417896);
INSERT INTO carte_sim VALUES (0621047853);
INSERT INTO carte_sim VALUES (0745126314);
INSERT INTO carte_sim VALUES (0785968596);
INSERT INTO carte_sim VALUES (0700232369);
INSERT INTO carte_sim VALUES (0741415263);
INSERT INTO carte_sim VALUES (0630126060);
INSERT INTO carte_sim VALUES (0654789632);
INSERT INTO carte_sim VALUES (0645126345);
INSERT INTO carte_sim VALUES (0652364896,000011222366);
INSERT INTO carte_sim VALUES (0645236963,000011222366);
INSERT INTO carte_sim VALUES (0621213211,000011222366);
INSERT INTO carte_sim VALUES (0669632147,000011222366);
INSERT INTO carte_sim VALUES (0745899458);


INSERT INTO antenne VALUES (1601, 40.5008, 3.8001, 'Justice', 34000);
INSERT INTO antenne VALUES (1602, 41.9637, 3.8002, 'Castelnau', 34000);
INSERT INTO antenne VALUES (1603, 42.0007, 3.8100, 'Chateau', 34000);
INSERT INTO antenne VALUES (1604, 41.6003, 3.89556, 'Albert 1er', 34000);
INSERT INTO antenne VALUES (2318, 38.6003, 3.89556, 'Via Domitia', 34000);
INSERT INTO antenne VALUES (1606, 40.6003, 3.89556, 'Comte', 34000);
INSERT INTO antenne VALUES (1607, 37.6003, 3.89556, 'Charles Beaudelaire', 34000);
INSERT INTO antenne VALUES (2329, 43.6003, 3.89556, 'Germaine Tillion',34000);
INSERT INTO antenne VALUES (2330, 43.6003, 3.89556, 'Michel Trocme', 34000);
INSERT INTO antenne VALUES (2331, 43.6003, 3.89556, 'Albert Dubout', 34000);
INSERT INTO antenne VALUES (2332, 43.6003, 3.89556, 'Pont-Trinquat', 34000);
INSERT INTO antenne VALUES (2333, 43.6003, 3.89556, 'Mathieur Laurens', 34000);
INSERT INTO antenne VALUES (2334, 43.6003, 3.89556, 'Font de Lattes', 34000);
INSERT INTO antenne VALUES (2335, 43.6003, 3.89556, 'Chemin des Barques', 34000);
INSERT INTO antenne VALUES (2336, 43.6003, 3.89556, 'Jacques Cartier', 34000);
INSERT INTO antenne VALUES (2337, 46.6003, 3.89556, 'Avenue des droits de lhomme', 34000);
INSERT INTO antenne VALUES (2338, 4.6003, 3.89556, 'Allée du Tiers Etat', 34000);
INSERT INTO antenne VALUES (2339, 43.6003, 3.89556, 'Floreal', 34000);
INSERT INTO antenne VALUES (2340, 43.6003, 3.89556, 'Rue de la Rauze', 34000);
INSERT INTO antenne VALUES (2341, 43.6003, 3.89556, 'Georges Freche', 34000);
INSERT INTO antenne VALUES (2342, 43.6003, 3.89556, 'Font de la Banquiere', 34000);
INSERT INTO antenne VALUES (2343, 43.6003, 3.89556, 'Av de l Agau', 34000);
INSERT INTO antenne VALUES (2344, 43.6003, 3.89556, 'Platanes', 34000);
INSERT INTO antenne VALUES (2345, 43.6003, 3.89556, 'Mer-Raymond Dugrand', 34000);
INSERT INTO antenne VALUES (2346, 43.6003, 3.89556, 'Claude Levi-Strauss', 34000);
INSERT INTO antenne VALUES (2347, 43.6003, 3.89556, 'Jay Dee', 34000);
INSERT INTO antenne VALUES (2348, 43.6003, 3.89556, 'Ray Charles', 34000);
INSERT INTO antenne VALUES (2349, 43.6003, 3.89556, 'Nina Simone', 34000);
INSERT INTO antenne VALUES (2350, 43.6003, 3.89556, 'Etang de l or', 34000);
INSERT INTO antenne VALUES (2351, 43.6003, 3.89556, 'Etang de Vic', 34000);
INSERT INTO antenne VALUES (2352, 43.6003, 3.89556, 'Centrayrargues', 34000);
INSERT INTO antenne VALUES (2353, 43.6003, 3.89556, 'Acolytes', 34000);
INSERT INTO antenne VALUES (2354, 43.6003, 3.89556, 'Aconiers', 34000);
INSERT INTO antenne VALUES (2355, 43.6003, 3.89556, 'Origan', 34000);
INSERT INTO antenne VALUES (2356, 43.6003, 3.89556, 'Muscaris', 34000);
INSERT INTO antenne VALUES (2357, 43.6003, 3.89556, 'Tourmalines', 34000);
INSERT INTO antenne VALUES (2358, 43.5004, 3.89556, 'Geode', 34000);
INSERT INTO antenne VALUES (2359, 43.5004, 3.89556, 'Emeraudes', 34000);
INSERT INTO antenne VALUES (2360, 43.5004, 3.89556, 'Gabares', 34000);
INSERT INTO antenne VALUES (2361, 43.5004, 3.89556, 'Pensées', 34000);
INSERT INTO antenne VALUES (2362, 43.5004, 3.89556, 'Don Bosco', 34000);
INSERT INTO antenne VALUES (2363, 43.5004, 3.89556, 'Pont Juvenal', 34000);
INSERT INTO antenne VALUES (2364, 43.5004, 3.89556, 'Laffite', 34000);
INSERT INTO antenne VALUES (2365, 43.5004, 3.89556, 'Oran', 34000);
INSERT INTO antenne VALUES (2366, 43.5004, 3.89556, 'Suez', 34000);
INSERT INTO antenne VALUES (2367, 43.5005, 3.89556, 'Charles Perrault', 34000);
INSERT INTO antenne VALUES (2368, 43.5005, 3.89556, 'Moulin des 7 Cans', 34000);
INSERT INTO antenne VALUES (2369, 43.5003, 3.89556, 'Pastels', 34000);
INSERT INTO antenne VALUES (2370, 43.5002, 3.89556, 'Galata', 34000);
INSERT INTO antenne VALUES (2371, 43.5002, 3.89556, 'Rue de Chio', 34000);
INSERT INTO antenne VALUES (2372, 43.5002, 3.89556, 'Frimaire', 34000);
INSERT INTO antenne VALUES (2373, 43.5001, 3.89556, 'Nivose', 34000);
INSERT INTO antenne VALUES (2374, 43.5001, 3.89556, 'Brumaire', 34000);
INSERT INTO antenne VALUES (2375, 43.5001, 3.89556, 'Messidor', 34000);
INSERT INTO antenne VALUES (2376, 43.5001, 3.89556, 'Jean Zuccarelli', 34000);
INSERT INTO antenne VALUES (3978, 43.5288, 3.9308, 'Saint-Pierre', 34250);
INSERT INTO antenne VALUES (3979, 43.5288, 3.9308, 'Palavas', 34250);
INSERT INTO antenne VALUES (3980, 43.5288, 3.9308, 'Michelet', 34250);
INSERT INTO antenne VALUES (3981, 43.5288, 3.9308, 'De la mer', 34250);
INSERT INTO antenne VALUES (3982, 43.5288, 3.9308, 'Eiffel', 34250);
INSERT INTO antenne VALUES (3983, 43.5288, 3.9308, 'Jacques Prevert', 34250);
INSERT INTO antenne VALUES (3984, 43.5288, 3.9308, 'Saint Michel', 34250);
INSERT INTO antenne VALUES (3985, 43.5288, 3.9308, 'Combes', 34250);
INSERT INTO antenne VALUES (3986, 43.5288, 3.9308, 'Lilas', 34250);
INSERT INTO antenne VALUES (3987, 43.5288, 3.9308, 'De Carnon', 34250);
INSERT INTO antenne VALUES (3988, 43.5288, 3.9308, 'Etoile', 34250);
INSERT INTO antenne VALUES (3989, 43.5288, 3.9308, 'Albert Dubout', 34250);


INSERT INTO session VALUES (53700, 0658457855, 1601, '2022-01-30 20:17:06', '2022-06-27 20:35:12');
INSERT INTO session VALUES (53701, 0741415689, 1601, '2022-05-18 23:15:20', '2022-05-18 23:23:00');
INSERT INTO session VALUES (53702, 0658457855, 1601, '2022-01-30 20:17:06', '2022-06-27 20:35:12');
INSERT INTO session VALUES (53703, 0600023547, 1606, '2022-5-02 10:05:00', '2022-05-02 10:24:01');
INSERT INTO session VALUES (53704, 0600023547, 1606, '2022-07-08 05:00:40', '2022-07-08 05:50:00');
INSERT INTO session VALUES (53705, 0741415689, 2318, '2022-08-03 17:35:00', '2022-08-03 18:09:47');
INSERT INTO session VALUES (53706, 0785968596, 2329, '2022-01-23 02:07:01', '2022-01-23 02:36:19');
INSERT INTO session VALUES (53707, 0700004123, 2318, '2022-05-04 14:00:20', '2022-05-04 15:01:11');
INSERT INTO session VALUES (53708, 0700004123, 2329, '2022-02-03 13:27:02', '2022-02-03 13:56:07');
INSERT INTO session VALUES (53709, 0686442699, 2329, '2022-10-12 17:05:58', '2022-06-27 17:08:59');
INSERT INTO session VALUES (53710, 0168681414, 2318, '2022-02-07 06:06:08', '2022-02-07 06:33:49');
INSERT INTO session VALUES (53711, 0777777777, 2329, '2022-06-06 15:35:40', '2022-06-06 16:41:47');
INSERT INTO session VALUES (53712, 0168681414, 2329, '2022-06-06 15:35:40', '2022-06-06 16:41:47');
INSERT INTO session VALUES (53713, 0777777777, 2318, '2022-07-09 18:35:23', '2022-07-09 18:46:59');
INSERT INTO session VALUES (53714, 0741415689, 2318, '2022-05-18 23:15:20', '2022-05-18 23:23:00');
INSERT INTO session VALUES (53715, 0785968596, 2329, '2022-02-19 12:12:15', '2022-06-27 12:20:11');
INSERT INTO session VALUES (53716, 0741415689, 2329, '2022-02-28 07:04:18', '2022-06-27 08:55:47');
INSERT INTO session VALUES (53734, 0745899458, 2331, '2022-06-27 06:02:00', '2022-06-27 06:12:00');
INSERT INTO session VALUES (53717, 0695953204, 2329, '2022-02-28 07:04:18', '2022-06-27 08:55:47');
INSERT INTO session VALUES (53718, 0621047853, 2329, '2022-07-09 18:35:23', '2022-07-09 18:46:59');
INSERT INTO session VALUES (53719, 0621047853, 1607, '2022-02-04 12:05:09', '2022-06-27 12:15:58');
INSERT INTO session VALUES (53720, 0612479620, 2329, '2022-03-03 08:05:40', '2022-03-03 08:32:47');
INSERT INTO session VALUES (53721, 0612479620, 1607, '2022-10-26 13:05:05', '2022-06-27 13:17:48');
INSERT INTO session VALUES (53722, 0658457855, 2329, '2022-12-21 09:06:24', '2022-12-21 09:45:07');
INSERT INTO session VALUES (53723, 0695953204, 1601, '2022-11-23 14:14:07', '2022-06-27 14:22:09');
INSERT INTO session VALUES (53724, 0695953204, 1606, '2022-10-12 17:05:58', '2022-06-27 17:08:59');
INSERT INTO session VALUES (53725, 0621047853, 2329, '2022-06-06 05:08:09', '2022-06-27 05:21:45');
INSERT INTO session VALUES (53726, 0621047853, 2329, '2022-03-03 08:05:40', '2022-03-03 08:32:47');
INSERT INTO session VALUES (53727, 0658457855, 1607, '2022-10-26 13:05:05', '2022-06-27 13:17:48');
INSERT INTO session VALUES (53728, 0741417896, 1607, '2022-06-28 02:02:03', '2022-06-27 02:32:31');
INSERT INTO session VALUES (53729, 0741417896, 1607, '2022-09-17 09:17:40', '2022-06-27 09:28:41');
INSERT INTO session VALUES (53730, 0741417896, 1607, '2022-06-06 05:08:09', '2022-06-27 05:21:45');
INSERT INTO session VALUES (53735, 0623534522, 2330, '2022-06-27 06:02:44', '2022-06-27 06:11:02');
INSERT INTO session VALUES (53600, 0752630101, 1607, '2022-01-01 10:28:50', '2022-06-27 11:08:15');
INSERT INTO session VALUES (53601, 0752630101, 1607, '2022-11-12 15:10:17', '2022-06-27 15:11:47');
INSERT INTO session VALUES (53602, 0621213211, 2318, '2022-09-17 01:23:26', '2022-06-27 01:30:58');
INSERT INTO session VALUES (53603, 0621213211, 2318, '2022-02-19 12:12:15', '2022-06-27 12:20:11');
INSERT INTO session VALUES (53604, 0756565656, 1606, '2022-07-25 09:35:40', '2022-07-25 09:55:47');
INSERT INTO session VALUES (53605, 0630126060, 2329, '2022-06-27 12:30:00', '2022-06-27 12:33:03');
INSERT INTO session VALUES (53606, 0658412578, 2329, '2022-04-08 04:55:13', '2022-04-08 14:26:57');
INSERT INTO session VALUES (53607, 0658412578, 2329, '2022-11-08 17:00:12', '2022-11-08 17:03:03');
INSERT INTO session VALUES (53760, 0645236585, 2329, '2022-06-27 09:35:40', '2022-06-27 09:55:47');
INSERT INTO session VALUES (53758, 0652448565, 3989, '2022-06-27 12:05:09', '2022-06-27 12:15:58');
INSERT INTO session VALUES (53761, 0652448565, 2329, '2022-06-27 12:30:00', '2022-06-27 12:33:03');
INSERT INTO session VALUES (53759, 0778985226, 2329, '2022-06-27 09:35:40', '2022-06-27 09:55:47');
INSERT INTO session VALUES (53608, 0600023547, 1601, '2022-11-12 15:10:17', '2022-06-27 15:11:47');
INSERT INTO session VALUES (53609, 0695953204, 2329, '2022-09-17 09:17:40', '2022-06-27 09:28:41');
INSERT INTO session VALUES (53610, 0109095841, 1606, '2022-06-28 02:02:03', '2022-06-27 02:32:31');
INSERT INTO session VALUES (53611, 0788787896, 1606, '2022-12-21 09:06:24', '2022-12-21 09:45:07');
INSERT INTO session VALUES (53612, 0762418963, 2329, '2022-02-02 01:46:53', '2022-06-27 02:30:17');
INSERT INTO session VALUES (53613, 0762418963, 1604, '2022-09-17 01:23:26', '2022-06-27 01:30:58');
INSERT INTO session VALUES (53614, 0666854172, 1604, '2022-11-23 14:14:07', '2022-06-27 14:22:09');
INSERT INTO session VALUES (53615, 0788841458, 1607, '2022-07-05 15:55:01', '2022-07-05 16:02:00');
INSERT INTO session VALUES (53616, 0788787896, 1601, '2022-04-08 04:55:13', '2022-04-08 14:26:57');
INSERT INTO session VALUES (53617, 0788787896, 1607, '2022-01-01 10:28:50', '2022-06-27 11:08:15');
INSERT INTO session VALUES (53618, 0584129654, 1607, '2022-02-02 01:46:53', '2022-06-27 02:30:17');
INSERT INTO session VALUES (53619, 0700232369, 2329, '2022-11-08 17:00:12', '2022-11-08 17:03:03');
INSERT INTO session VALUES (53620, 0788787896, 1607,  '2022-09-09 05:23:45', '2022-09-09 06:00:47');
INSERT INTO session VALUES (53621, 0788787896, 2329, '2022-07-05 15:55:01', '2022-07-05 16:02:00');
INSERT INTO session VALUES (53622, 0700232369, 1604,  '2022-09-09 05:23:45', '2022-09-09 06:00:47');
INSERT INTO session VALUES (53623, 0700232369, 1604,  '2022-02-24 07:42:00', '2022-02-24 08:03:01');
INSERT INTO session VALUES (53624, 0584129654, 1604, '2022-05-07 07:27:58', '2022-05-07 08:01:19');
INSERT INTO session VALUES (53625, 0788787896, 2329, '2022-05-07 07:27:58', '2022-05-07 08:01:19');
INSERT INTO session VALUES (53626, 0660989852, 1601,  '2022-02-24 07:42:00', '2022-02-24 08:03:01');


INSERT INTO appel VALUES (53625,53624, '2022-05-07 07:27:58', '2022-05-07 08:01:19');
INSERT INTO appel VALUES (53620,53622, '2022-09-09 05:23:45', '2022-09-09 06:00:47');
INSERT INTO appel VALUES (53626,53623, '2022-02-24 07:42:00', '2022-02-24 08:03:01');
INSERT INTO appel VALUES (53621,53615, '2022-07-05 15:55:01', '2022-07-05 16:02:00');
INSERT INTO appel VALUES (53611,53722, '2022-12-21 09:06:24', '2022-12-21 09:45:07');
INSERT INTO appel VALUES (53761,53605, '2022-06-27 12:30:00', '2022-06-27 12:33:03');
INSERT INTO appel VALUES (53619,53607, '2022-11-08 17:00:12', '2022-11-08 17:03:03');
INSERT INTO appel VALUES (53701,53714, '2022-05-18 23:15:20', '2022-05-18 23:23:00');
INSERT INTO appel VALUES (53618,53612, '2022-02-02 01:46:53', '2022-06-27 02:30:17');
INSERT INTO appel VALUES (53709,53724, '2022-10-12 17:05:58', '2022-06-27 17:08:59');
INSERT INTO appel VALUES (53614,53723, '2022-11-23 14:14:07', '2022-06-27 14:22:09');
INSERT INTO appel VALUES (53721,53727, '2022-10-26 13:05:05', '2022-06-27 13:17:48');
INSERT INTO appel VALUES (53617,53600, '2022-01-01 10:28:50', '2022-06-27 11:08:15');
INSERT INTO appel VALUES (53717,53716, '2022-02-28 07:04:18', '2022-06-27 08:55:47');
INSERT INTO appel VALUES (53602,53613, '2022-09-17 01:23:26', '2022-06-27 01:30:58');
INSERT INTO appel VALUES (53730,53725, '2022-06-06 05:08:09', '2022-06-27 05:21:45');
INSERT INTO appel VALUES (53610,53728, '2022-06-28 02:02:03', '2022-06-27 02:32:31');
INSERT INTO appel VALUES (53700,53702, '2022-01-30 20:17:06', '2022-06-27 20:35:12');
INSERT INTO appel VALUES (53603,53715, '2022-02-19 12:12:15', '2022-06-27 12:20:11');
INSERT INTO appel VALUES (53719,53758, '2022-02-04 12:05:09', '2022-06-27 12:15:58');
INSERT INTO appel VALUES (53608,53601, '2022-11-12 15:10:17', '2022-06-27 15:11:47');
INSERT INTO appel VALUES (53729,53609, '2022-09-17 09:17:40', '2022-06-27 09:28:41');
INSERT INTO appel VALUES (53759,53760, '2022-06-27 09:35:40', '2022-06-27 09:55:47');
INSERT INTO appel VALUES (53711,53712, '2022-06-06 15:35:40', '2022-06-06 16:41:47');
INSERT INTO appel VALUES (53713,53718, '2022-07-09 18:35:23', '2022-07-09 18:46:59');



INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Bonjour, comment allez-vous ajd ?');
INSERT INTO sms VALUES (53726, 53720, '2022-06-27 06:02:00', 'Salut Isabelle, je vais bien mieux, j ai reussi a dormir cette nuit ...');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Je suis contente pour vous!');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Vous ne faites plus de cauchemard ?');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je n arrive pas a accepter mon acte ...');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je merite que l on me traite de coupable');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:02:00', 'Bonjour c’est le bon numero ?');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Ecoutez ..., Vous n etes pas un MEURTIER, loin de la !');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Personne ne vous soupconne, et vous suivez correctement toutes vos seances');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Tout se passera bien ici');
INSERT INTO sms VALUES (53735, 53734,'2022-06-27 06:02:44', 'Oui c’est moi. Rassure-moi tu me contactes bien avec le numero temporaire la ?');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je vous fais confiance...');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'On se rejoint ce soir apres minuit, au meme endroit ?');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'Oui, rien n a change dans le plan, tachez seulement a etre plus discret');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'J y serai');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:03:35', 'Oui ne vous en faites pas');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je vous souhaite une bonne soiree');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Vous me manquez enormement');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je ne savais plus comment faire');
INSERT INTO sms VALUES (53726, 53720, '2022-03-03 08:05:40', 'Je ne vous remiercierai jamais assez...');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:05:40', 'En parlant de gratitude, j aurai une faveur que je voudrais que vous m accordiez');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:03:50', 'Je ne vais pas utiliser mon vrai numero quand meme');
INSERT INTO sms VALUES (53720, 53726, '2022-03-03 08:32:47', 'A demain ...');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Reunion de crise. Demain. Sans faute.');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Il y a enormement de points a reprendre');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Il y a eu beaucoup de negligence');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:10', 'C’etait dur de rajouter une deuxieme carte sim dans mon telephone');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je ne peux pas aller dans les details. Mais l heure est grave ...');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Bjr. Faites moi un resume bref svp');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Que je sache qui secouer et cmt regler le probleme en question');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je ne sais pas qui est exactement responsable, c est bien le soucis');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:50', 'Mais ca marche bien');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Les espaces ne sont pas isoles, nous entendons tout');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je ne sais meme pas si les personnes en charge ont termine leur corvees');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je suis tres decue');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:59', 'J’ai pose la charge');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Et je pese mes motes');
INSERT INTO sms VALUES (53735, 53734,'2022-06-27 06:05:45', 'Ou ca ?');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Comment en sommes-nous arrives la ?');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Je suis dans l incomprehension totale ...');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je pense avoir une idee ...');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Meme si le but est de ne pas simplement blamer qqn');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Mais de trouver des solutions, afin que cela ne se reproduise pas');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:06:00', 'Sous la voiture que vous m’aviez montre');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Vous avez toute mon attention,');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Je vous ecoute');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Au sein des membres et de ceux qui ont commandite l operation');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'De gros problemes de communication ont ete constates');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Du cote des chefs d equipe, et de moi-meme');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:07:00', 'On se retrouve a quelle heure a Palavas pour faire le debrief avec tout le
monde ?');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'OK. Et quels sont les autres problemes ?');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'D une part, les clients n ont ete prevenus de rien');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Ce qui a compromis enormement la confiance qu ils avaient a la reussite du projet');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'C est tres problematique');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Pouvons-nous trouver une solution efficace sur le long terme ?');
INSERT into sms VALUES (53735, 53734,'2022-06-27 06:08:45', 'A 8h30 precisement');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Tout ca est en cours de discussion');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Nous souhaitons premediter un coup');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Quelque chose qui marquera les esprits');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Ceci m interesse ... Dites moi-en plus');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:10:00', 'Ok. A tout à l’heure');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Ce qui est sur, c est que ce sera en relation avec l equipe de Igor');
INSERT into sms VALUES (53735, 53734,'2022-06-27 06:11:02', 'Ne soit pas en retard');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Car nous aurons besoin de gros bras ...');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Pour le reste, je vous en parlerai en detail dans un contexte plus discret');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Si vous le souhaitez, rencontrons-nous a la meme adresse que la derniere fois ...');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Sans problemes.');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 04:55:13', 'Quand et a quelle heure ?');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:12:00', 'Je serai la un peu plus tot');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 04:55:13', 'Je preferais dans la nuit pour ne pas attirer l attention');
INSERT INTO sms VALUES (53616, 53606, '2022-04-08 14:26:57', 'Je vous tiens au courant dans la soiree ... A toute a l heure ...');
INSERT INTO sms VALUES (53606, 53616, '2022-04-08 14:26:57', 'Bien. A toute a l heure.');