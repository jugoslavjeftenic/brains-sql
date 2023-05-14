CREATE SCHEMA katedre;
USE katedre;

CREATE TABLE katedra (
	IDK varchar(10) NOT NULL,
    NAZK varchar(30) NOT NULL,
    CONSTRAINT katedra_PK PRIMARY KEY (IDK)
);

CREATE TABLE nastavnik (
	IDN varchar(10) NOT NULL,
    IMEN varchar(30) NOT NULL,
    PREZN varchar(30) NOT NULL,
    ZVANJE varchar(30) NOT NULL,
    IDK varchar(10),
    CONSTRAINT nastavnik_PK PRIMARY KEY (IDN),
    CONSTRAINT nastavnik_FK FOREIGN KEY (IDK) REFERENCES katedra (IDK)
);

CREATE TABLE predmet (
	SPR varchar(10) NOT NULL,
    NAZP varchar(35) NOT NULL,
    SEM integer,
    CONSTRAINT predmet_PK PRIMARY KEY (SPR)
);

CREATE TABLE predaje (
	IDN varchar(10) NOT NULL,
    SPR varchar(10) NOT NULL,
    FOND integer NOT NULL,
    CONSTRAINT predaje_PK PRIMARY KEY (IDN, SPR),
    CONSTRAINT predaje_nastavnik_FK FOREIGN KEY (IDN) REFERENCES nastavnik (IDN),
    CONSTRAINT predaje_predmet_FK FOREIGN KEY (SPR) REFERENCES predmet (SPR)
);

INSERT INTO katedra VALUES ('K1', 'Analiza');
INSERT INTO nastavnik VALUES ('N1', 'Sava', 'Savic', 'Docent', 'K1');
INSERT INTO predmet VALUES ('P1', 'Analiza 1', 1);
INSERT INTO predaje VALUES ('N1', 'P1', 3);

SELECT * FROM katedra;
SELECT * FROM nastavnik;
SELECT * FROM predaje;
SELECT * FROM predmet;

SELECT nazk FROM katedra ORDER BY nazk DESC;
SELECT CONCAT(imen, ' ', prezn) 'Ime i prezime' FROM nastavnik WHERE zvanje = 'Asistent' ORDER BY prezn;
SELECT COUNT(sem) 'Ukupno predmeta na semestru 1' FROM predmet WHERE sem = 1;
SELECT spr, nazp FROM predmet WHERE nazp LIKE '%e%';
INSERT INTO katedra VALUES ('K5', 'Automatika');
SELECT p.idn, imen, prezn, SUM(fond) Fond, ROUND(AVG(fond), 2) 'Pros. br. casova' FROM predaje p, nastavnik n WHERE p.idn = 'N1' AND p.idn = n.idn;
SELECT idn, imen, prezn FROM nastavnik n, katedra k WHERE idn IN (SELECT idn FROM predaje p, predmet pr WHERE p.spr = pr.spr AND pr.sem = 1) AND k.nazk = 'Algebra' AND n.idk = k.idk;
SELECT nazk FROM katedra WHERE idk NOT IN (SELECT idk FROM nastavnik);
SELECT DISTINCT sem FROM predmet WHERE sem > 0 ORDER BY sem DESC;
UPDATE nastavnik SET idk = 'K2' WHERE imen LIKE 'M%';

-- Obavezni domaci zadatak SQL
-- 1. Za svaki predmet prikazati naziv predmeta i ukupan fond časova.
SELECT nazp, SUM(p.fond) FROM predaje p, predmet pr WHERE p.spr = pr.spr GROUP BY pr.spr;
-- 2. Za svakog nastavnika prikazati ukupan broj predmeta koji predaje.
SELECT CONCAT(imen, ' ', prezn) Nastavnik, COUNT(spr) 'broj predmeta' FROM predaje p, nastavnik n WHERE p.idn = n.idn GROUP BY n.idn;
-- 3. Prikazati nazive predmeta koje predaje tri nastavnika.
SELECT nazp, COUNT(idn) 'predaje nastavnika' FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY nazp HAVING COUNT(idn) = 3;
-- 4. Prikazati nazive predmete koji imaju najveći fond časova od svih predmeta.
SELECT p.nazp FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY p.nazp HAVING SUM(pr.fond) >= ALL (SELECT SUM(fond) FROM predaje GROUP BY spr);
-- 5. Za svaku katedru prikazati IDK, NAZK u ukupan broj nastavnika koji joj pripada.
SELECT k.idk, nazk, COUNT(imen) 'ima nastavnika' FROM katedra k, nastavnik n WHERE k.idk = n.idk GROUP BY k.idk;
-- 6. Prikazati nazive predmeta koje predaje više od dva nastavnika.
SELECT nazp, COUNT(idn) 'predaje nastavnika' FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY nazp HAVING COUNT(idn) > 2;

-- Probni test
-- 1. Predmet Informacioni sistemi premestiti u prvi semestar.
UPDATE predmet SET sem = 1 WHERE spr = 'P5';
-- 2. Prikazati nazive predmeta koji se predaju u prvom semestru i koji na drugom mestu u nazivu imaju slovo N sortirane u opadajucem redosledu.
SELECT nazp FROM predmet WHERE sem = 1 AND nazp LIKE '_N%' ORDER BY nazp DESC;
-- 3. Prikazati imena i prezimena nastavnika koji predaju predmet Baze podataka.
SELECT imen, prezn FROM nastavnik n, predaje p WHERE n.idn = p.idn AND spr = 'P4';
-- 4. Prikazati imena i prezimena nastavnika koji drze nastavu u prvom semestru. Ukoliko nastavnik drzi vise predemta u prvom semestru ne treba ponavljati njegovo ime vise puta.
SELECT DISTINCT imen, prezn FROM nastavnik n, predaje pr, predmet p WHERE n.idn = pr.idn AND pr.spr = p.spr AND sem = 1;
-- 5. Prikazati nazive predmeta koje predaje vise od dva nastavnika.
SELECT nazp FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY pr.spr HAVING COUNT(idn) > 2;
-- 6. Kreirati pogled Pogled_predaje koji ce za svakog nastavnika (ime i prezime) prikazati ukupan fond casova. Za nastavnike koji ne predaju nijedan predmet prikazti da je fond casova nula.
CREATE OR REPLACE VIEW Pogled_predaje (ime, prezime, fond) AS SELECT imen, prezn, IFNULL(SUM(fond), 0) FROM nastavnik n LEFT JOIN predaje p ON n.idn = p.idn GROUP BY n.idn;

