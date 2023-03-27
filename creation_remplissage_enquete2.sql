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
INSERT INTO personne VALUES (845258699, 'Morvillo', 'Francesca','1973-03-11');
INSERT INTO personne VALUES (452563557, 'Falcone', 'Giovanni','1975-05-18');
INSERT INTO personne VALUES (416148336405, 'Oussama', 'Lairbizar','1995-10-13');


INSERT INTO carte_sim VALUES (0658457855,145545455466);
INSERT INTO carte_sim VALUES (0778985226,145545455466);
INSERT INTO carte_sim VALUES (0645236585,965894420252);
INSERT INTO carte_sim VALUES (0652448565,416148336405);
INSERT INTO carte_sim VALUES (0623534522);
INSERT INTO carte_sim VALUES (0745899458);


INSERT INTO antenne VALUES (2329, 43.6003, 3.89556, 'Chemin Du Moulares',34000);
INSERT INTO antenne VALUES (2330, 43.6003, 3.89556, 'Michel Trocme', 34000);
INSERT INTO antenne VALUES (2331, 43.6003, 3.89556, 'Comte de Melgueil', 34000);
INSERT INTO antenne VALUES (3956, 43.5288, 3.9308, 'Saint-Pierre', 34250);


INSERT INTO session VALUES (53734, 0745899458, 2331, '2022-06-27 06:02:00', '2022-06-27 06:12:00');
INSERT INTO session VALUES (53735, 0623534522, 2330, '2022-06-27 06:02:44', '2022-06-27 06:11:02');
INSERT INTO session VALUES (53758, 0652448565, 3956, '2022-06-27 13:42:44', '2022-06-27 14:05:02');
INSERT INTO session VALUES (53761, 0652448565, 2329, '2022-06-27 05:30:44', '2022-06-27 05:42:02');
INSERT INTO session VALUES (53759, 0778985226, 2329, '2022-06-27 09:35:40', '2022-06-27 09:55:47');
INSERT INTO session VALUES (53760, 0645236585, 2329, '2022-06-27 09:35:40', '2022-06-27 09:55:47');

INSERT INTO appel VALUES (53759,53760, '2022-06-27 09:35:40', '2022-06-27 09:55:47');


INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:02:00', 'Bonjour c’est le bon numero ?');
INSERT INTO sms VALUES (53735, 53734,'2022-06-27 06:02:44', 'Oui c’est moi. Rassure-moi tu me contactes bien avec le numero temporaire la ?');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:03:35', 'Oui ne vous en faites pas');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:03:50', 'Je ne vais pas utiliser mon vrai numero quand meme');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:10', 'C’etait dur de rajouter une deuxieme carte sim dans mon telephone');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:50', 'Mais ca marche bien');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:04:59', 'J’ai pose la charge');
INSERT INTO sms VALUES (53735, 53734,'2022-06-27 06:05:45', 'Ou ca ?');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:06:00', 'Sous la voiture que vous m’aviez montre');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:07:00', 'On se retrouve a quelle heure a Palavas pour faire le debrief avec tout le
monde ?');
INSERT into sms VALUES (53735, 53734,'2022-06-27 06:08:45', 'A 8h30 precisement');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:10:00', 'Ok. A tout à l’heure');
INSERT into sms VALUES (53735, 53734,'2022-06-27 06:11:02', 'Ne soit pas en retard');
INSERT INTO sms VALUES (53734, 53735, '2022-06-27 06:12:00', 'Je serai la un peu plus tot');


