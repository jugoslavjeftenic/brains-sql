USE db_school;

SELECT * FROM korisnik;
SELECT * FROM administrator;
SELECT * FROM nastavnik;
SELECT * FROM roditelj;
SELECT * FROM ucenik;
SELECT * FROM predmet;
SELECT * FROM predaje;
SELECT * FROM dnevnik;

SELECT * FROM korisnik_sequence;
DELETE FROM korisnik;
UPDATE korisnik_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM administrator_sequence;
DELETE FROM administrator;
UPDATE administrator_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM nastavnik_sequence;
DELETE FROM nastavnik;
UPDATE nastavnik_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM roditelj_sequence;
DELETE FROM roditelj;
UPDATE roditelj_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM ucenik_sequence;
DELETE FROM ucenik;
UPDATE ucenik_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM predmet_sequence;
DELETE FROM predmet;
UPDATE predmet_sequence SET next_val = 1 WHERE next_val > 1;

ALTER TABLE parent DROP FOREIGN KEY FK40d33gedwgtajqqnj0vjcv3p0;
DROP TABLE predmet;
DROP TABLE predaje;
DROP TABLE dnevnik;

INSERT INTO `db_school_diary`.`osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `version`) VALUES ('1', '1234567890123', 'Jugoslav', 'Jeftenić', '0');
INSERT INTO `db_school_diary`.`osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `version`) VALUES ('2', '1234567890123', 'Marko', 'Marković', '0');
INSERT INTO `db_school_diary`.`osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `version`) VALUES ('3', '1234567890123', 'Petar', 'Petrović', '0');
INSERT INTO `db_school_diary`.`osoba` (`osoba_id`, `jmbg`, `ime`, `prezime`, `version`) VALUES ('4', '1234567890123', 'Perica', 'Petrović', '0');

INSERT INTO `db_school_diary`.`administrator` (`administrator_id`, `korisnik`, `lozinka`, `osoba_id`, `uloga`, `version`) VALUES ('1', 'bomba', '{bcrypt}$2a$10$eJI/iLQvwJYzs15YrQEtGuXZ9HnmfZ1woBQJsEGUAr2wtkTMsqRMK', '1', 'ADMINISTRATOR', '0');
INSERT INTO `db_school_diary`.`nastavnik` (`nastavnik_id`, `korisnik`, `lozinka`, `osoba_id`, `uloga`, `version`) VALUES ('1', 'mare', '{bcrypt}$2a$10$eJI/iLQvwJYzs15YrQEtGuXZ9HnmfZ1woBQJsEGUAr2wtkTMsqRMK', '2', 'NASTAVNIK', '0');
INSERT INTO `db_school_diary`.`nastavnik` (`nastavnik_id`, `korisnik`, `lozinka`, `osoba_id`, `uloga`, `version`) VALUES ('2', 'bomba', '{bcrypt}$2a$10$eJI/iLQvwJYzs15YrQEtGuXZ9HnmfZ1woBQJsEGUAr2wtkTMsqRMK', '1', 'NASTAVNIK', '0');
INSERT INTO `db_school_diary`.`roditelj` (`roditelj_id`, `korisnik`, `lozinka`, `eposta`, `osoba_id`, `uloga`, `version`) VALUES ('1', 'pera', '{bcrypt}$2a$10$eJI/iLQvwJYzs15YrQEtGuXZ9HnmfZ1woBQJsEGUAr2wtkTMsqRMK', 'pera@ikt.rs', '3', 'RODITELJ', '0');
INSERT INTO `db_school_diary`.`ucenik` (`ucenik_id`, `korisnik`, `lozinka`, `osoba_id`, `uloga`, `version`) VALUES ('1', 'perica', '{bcrypt}$2a$10$eJI/iLQvwJYzs15YrQEtGuXZ9HnmfZ1woBQJsEGUAr2wtkTMsqRMK', '4', 'UCENIK', '0');
