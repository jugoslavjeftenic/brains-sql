-- 1. Prikazati nazive bioskopa koji u svom nazivu sadrže slovo A na drugom mestu i mesta u kojima se nalaze, sortirane po nazivu bioskopa u opadajućem redosledu.
SELECT nazivb, mestob FROM bioskop WHERE nazivb LIKE '_A%' ORDER BY nazivb DESC;

-- 2. Prikazati nazive filmova i nazive njihovih žanrova za sve filmove koji imaju dužinu trajanja veću od 95 minuta.
SELECT nazivf, nazivz FROM film f, zanr z WHERE f.idz = z.idz AND vreme > 95;

-- 3. Filmovima čije vreme trajanja je manje od 90 minuta povećati dućinu trajanja za dva minuta.
UPDATE film SET vreme = vreme + 2 WHERE vreme < 90;

-- 4. Prikazati bioskope (IDB, NAZIVB) koji prikazuju film sa nazivom Krug.
SELECT b.idb, nazivb FROM bioskop b, prikazuje p, film f WHERE b.idb = p.idb AND p.idf = f.idf AND nazivf = 'Krug';

-- 5. Prikazati naziv filma (filmova) koji imaju najduže trajanje.
SELECT nazivf FROM film WHERE vreme = (SELECT MAX(vreme) FROM film);

-- 6.  Prikazati mesta u kojima se nalazi više od jednog bioskopa.
SELECT mestob FROM bioskop GROUP BY mestob HAVING COUNT(idb) > 1;

-- 7.  Kreirati pogled Pogled_prikazuje koji za svaki bioskop prikazati idb, naziv bioskopa i ukupan broj različitih filmova koji se prikazuju. Za bioskope koji ne prikazuju nijedan film, prikazati da je broj 0 (nula).
CREATE OR REPLACE VIEW Pogled_prikazuje (idb, nazivb, ukupno) AS SELECT b.idb, nazivb, IFNULL(COUNT(idf), 0) FROM bioskop b LEFT JOIN prikazuje p ON b.idb = p.idb GROUP BY b.idb;
