CREATE SCHEMA projekti;
USE projekti;

CREATE TABLE radnik (
	Mbr integer NOT NULL,
    Ime varchar(20) NOT NULL,
    Prz varchar(25) NOT NULL,
    Sef integer,
    Plt decimal(10, 2),
    Pre decimal(6, 2),
    God date NOT NULL,
    CONSTRAINT radnik_PK PRIMARY KEY (Mbr),
    CONSTRAINT radnik_FK FOREIGN KEY (Sef) REFERENCES radnik (Mbr),
    CONSTRAINT radnik_CH CHECK (Plt > 500)
);

CREATE TABLE projekat (
	Spr integer NOT NULL,
    Ruk integer NOT NULL,
    Nap varchar(50),
    Nar varchar(50),
    CONSTRAINT projekat_PK PRIMARY KEY (Spr),
    CONSTRAINT projekat_FK FOREIGN KEY (Ruk) REFERENCES radnik (Mbr),
    CONSTRAINT projekat_UK UNIQUE (Nap)
);

CREATE TABLE radproj (
	Spr integer NOT NULL,
    Mbr integer NOT NULL,
    Brc integer NOT NULL,
    CONSTRAINT radproj_PK PRIMARY KEY (Spr, Mbr),
    CONSTRAINT radproj_rad_FK FOREIGN KEY (Mbr) REFERENCES radnik (Mbr),
    CONSTRAINT radproj_prj_FK FOREIGN KEY (Spr) REFERENCES projekat (Spr)
);

INSERT INTO radnik VALUES (10, 'Pera', 'Peric', NULL, 10000.00, 100.00, '1987/01/01');
INSERT INTO projekat VALUES (10, 100, 'Projekat jacanja sistema osiguranja depozita','Evropska banka za obnovu i razvoj');
INSERT INTO radproj VALUES (30, 50, 5);

INSERT INTO radnik (mbr, ime, prz, plt, sef, god) VALUES (201, 'Ana', 'Jovic', 30000, null, '1971-08-18');
INSERT INTO projekat (spr, nap, ruk) VALUES (90, 'P1', 201);
INSERT INTO radproj (mbr, spr, brc) VALUES (201, 90, 5);
DELETE FROM radproj WHERE mbr = 201;
DELETE FROM projekat WHERE spr = 90;
DELETE FROM radnik WHERE mbr = 201;
UPDATE radnik SET plt = plt * 1.2 WHERE mbr = 201;

SELECT mbr, ime, prz, plt FROM radnik WHERE plt > 25000;
SELECT mbr, ime, prz, plt, plt * 12 FROM radnik;
SELECT mbr, ime, prz, plt FROM radnik WHERE sef IS NULL;

SELECT mbr, ime, prz, plt FROM radnik WHERE plt BETWEEN 20000 AND 24000;
SELECT ime, prz, god FROM radnik WHERE god BETWEEN '1973/01/01' AND '1980/12/31';
SELECT ime, prz, god FROM radnik WHERE god NOT BETWEEN '1973/01/01' AND '1980/12/31';
SELECT mbr, ime, prz FROM radnik WHERE prz LIKE 'M%';
SELECT mbr, ime, prz FROM radnik WHERE ime NOT LIKE 'A%';
SELECT mbr, ime, prz FROM radnik WHERE ime LIKE '_A%';
SELECT DISTINCT mbr FROM radproj WHERE spr in (10, 20, 30);
SELECT DISTINCT mbr FROM radproj WHERE spr = 10 OR brc IN (2, 4, 6);
SELECT mbr, ime, prz FROM radnik WHERE ime IN ('Ana', 'Sanja');
SELECT mbr, ime, prz FROM radnik WHERE ime NOT IN ('Ana', 'Sanja');

SELECT * FROM radnik WHERE sef IS NOT NULL ORDER BY prz;
SELECT mbr, ime, prz, plt Plata FROM radnik ORDER BY Plata DESC;
SELECT mbr, ime, prz, plt * 1.17 Plata FROM radnik;

SELECT mbr, plt + NULL FROM radnik;
SELECT mbr, plt + pre FROM radnik;
SELECT mbr, plt + IFNULL(pre, 0) FROM radnik;

SELECT COUNT(DISTINCT sef) FROM radnik;
SELECT MIN(plt), MAX(plt) FROM radnik;
SELECT COUNT(mbr), SUM(plt) FROM radnik;
SELECT COUNT(*) 'Broj radnika', ROUND(AVG(plt), 2) 'Prosecna plata', SUM(plt * 12) 'Godisnja plata' FROM radnik;

SELECT mbr, ime, prz, plt FROM radnik WHERE plt > (SELECT AVG(plt) FROM radnik) ORDER BY plt;
SELECT ime, prz FROM radnik WHERE mbr in (SELECT mbr FROM radproj WHERE spr = 30);
SELECT mbr, ime, prz FROM radnik WHERE mbr IN (SELECT mbr FROM radproj WHERE spr = 10) AND mbr NOT IN (SELECT mbr FROM radproj WHERE spr = 30);
SELECT ime, prz, god FROM radnik WHERE god = (SELECT MIN(god) FROM radnik);
SELECT ime, prz, god FROM radnik WHERE god <= ALL (SELECT god FROM radnik);
SELECT ime, prz FROM radnik;
SELECT ime, prz FROM radnik WHERE mbr != (SELECT ruk FROM projekat WHERE spr = 10);
SELECT spr, nap FROM projekat WHERE spr IN (SELECT spr FROM radproj WHERE mbr IN (SELECT mbr FROM radproj WHERE spr = 10)) ORDER BY spr;

SELECT r.mbr, prz, ime, plt, brc FROM radnik r, radproj rp WHERE r.mbr = rp.mbr;
SELECT r.mbr, prz, ime, plt, brc FROM radnik r, radproj rp WHERE r.mbr = rp.mbr AND rp.spr = 10;
SELECT r.mbr, prz, ime, nap, brc FROM radproj rp, radnik r, projekat p WHERE r.mbr = rp.mbr AND rp.spr = p.spr ORDER BY r.mbr, p.spr;
SELECT DISTINCT mbr, prz, ime, plt FROM radnik, projekat WHERE mbr = ruk;

SELECT r.mbr, r.ime, r.prz, r.plt, CONCAT(r1.ime, ' ', r1.prz) Sef FROM radnik r, radnik r1 WHERE r.sef = r1.mbr;
SELECT r.mbr, r.ime, r.prz, r.plt FROM radnik r, radnik r1 WHERE r.plt > r1.plt AND r1.mbr = 180 ORDER BY r.plt;
