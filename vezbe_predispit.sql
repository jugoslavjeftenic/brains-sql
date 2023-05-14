-- 1. Prikazati sve dobavljace (NAZD) koji u svom nazivu imaju slovo e sortirane u opadajućem redosledu naziva dobavljača.
SELECT nazd FROM dobavljac WHERE nazd LIKE '%E%' ORDER BY nazd DESC;

-- 2. Prikazati sve delove (NAZDEO) koji još nisu nabavljani.
SELECT d.iddeo, nazdeo, kol FROM deo d LEFT JOIN nabavka n ON d.iddeo = n.iddeo WHERE kol IS NULL;

-- 3. Prikazati projekte (IDP, NAZP) za koje se dobavlja deo sa nazivom sraf.
SELECT p.idp, nazp FROM projekti p, nabavka n, deo d WHERE d.iddeo = n.iddeo AND p.idp = n.idp AND nazdeo = 'sraf';

-- 4. Prikazati sva mesta dobavljaca za koja je broj dobavljaca veći od jedan.
SELECT mesd FROM dobavljac GROUP BY mesd HAVING COUNT(NAZD) > 1;

-- 5. Smanjiti cenu svih delova za 300 din. Za delove koji nisu imali cenu staviti da je pocetna cena = 500.
UPDATE deo SET cena = IFNULL(cena - 300, 500);

-- 6. Kreirati pogled PogledDeo koji ce za svaki postojeći projekat prikazati (idp, nazp) kao i ukupnu količinu svih delova koji su nabavljeni za taj projekat, bez obzira na vrstu delova.
CREATE OR REPLACE VIEW PogledDeo (idp, nazp, kolicina) AS SELECT p.idp, nazp, SUM(kol) FROM projekti p, nabavka n WHERE p.idp = n.idp GROUP BY p.idp;

-- 7. Za delove koji su nabavljani prikazati IDDEO, NAZDEO i koliko su puta ukupno nabavljeni. Prikazati samo one ciji je ukupni broj puta veci od 2.
SELECT n.iddeo, nazdeo, kol FROM deo d, nabavka n WHERE d.iddeo = n.iddeo GROUP BY n.iddeo HAVING COUNT(kol) > 2;

-- 8. Kreirati pogled UkupnoKom koji ce za svaki deo prikazati naziv (nazdeo) i cenu (cena) kao i ukupan broj nabavljenih komada (kolicinu) na svim projektima.
CREATE OR REPLACE VIEW UkupnoKom (nazdeo, cena, kolicina) AS SELECT nazdeo, cena, SUM(kol) FROM deo d LEFT JOIN nabavka n ON d.iddeo = n.iddeo GROUP BY d.iddeo;

-- 9. Povecati cenu delova, koji u svom nazivu imaju slovo c na bilo kojoj poziciji, za 400 din. Za delove koji nemaju cenu staviti da je početna cena nula.
UPDATE deo SET cena = IFNULL(cena + 400, 0) WHERE nazdeo LIKE '%C%';
