-- Obavezni domaci zadatak SQL
-- Jugoslav Jeftenic

-- 1. Za svaki predmet prikazati naziv predmeta i ukupan fond casova.
SELECT nazp, SUM(p.fond) FROM predaje p, predmet pr WHERE p.spr = pr.spr GROUP BY pr.spr;
-- 2. Za svakog nastavnika prikazati ukupan broj predmeta koji predaje.
SELECT CONCAT(imen, ' ', prezn) Nastavnik, COUNT(spr) 'broj predmeta' FROM predaje p, nastavnik n WHERE p.idn = n.idn GROUP BY n.idn;
-- 3. Prikazati nazive predmeta koje predaje tri nastavnika.
SELECT nazp, COUNT(idn) 'predaje nastavnika' FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY nazp HAVING COUNT(idn) = 3;
-- 4. Prikazati nazive predmete koji imaju najveci fond casova od svih predmeta.
SELECT p.nazp FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY p.nazp HAVING SUM(pr.fond) >= ALL (SELECT SUM(fond) FROM predaje GROUP BY spr);
-- 5. Za svaku katedru prikazati IDK, NAZK u ukupan broj nastavnika koji joj pripada.
SELECT k.idk, nazk, COUNT(imen) 'ima nastavnika' FROM katedra k, nastavnik n WHERE k.idk = n.idk GROUP BY k.idk;
-- 6. Prikazati nazive predmeta koje predaje vise od dva nastavnika.
SELECT nazp, COUNT(idn) 'predaje nastavnika' FROM predmet p, predaje pr WHERE p.spr = pr.spr GROUP BY nazp HAVING COUNT(idn) > 2;
