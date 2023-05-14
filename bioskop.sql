CREATE SCHEMA bioskop;
USE bioskop;

CREATE TABLE zanr (
	IDZ varchar(10) NOT NULL,
	NAZIVZ varchar(30) NOT NULL,
	CONSTRAINT zanr_PK PRIMARY KEY (IDZ)
);

CREATE TABLE bioskop (
	IDB varchar(10) NOT NULL,
	NAZIVB varchar(30) NOT NULL,
	MESTOB varchar(30) NOT NULL,
	CONSTRAINT bioskop_PK PRIMARY KEY (IDB)
);

CREATE TABLE film (
	IDF varchar(10) NOT NULL,
	NAZIVF varchar(35) NOT NULL,
    VREME integer NOT NULL,
	IDZ varchar(10) NOT NULL,
	CONSTRAINT film_PK PRIMARY KEY (IDF),
	CONSTRAINT film_zanr_FK FOREIGN KEY (IDZ) REFERENCES zanr (IDZ)
);

CREATE TABLE prikazuje (
	IDB varchar(10) NOT NULL,
	IDF varchar(10) NOT NULL,
	BROJPROJ integer NOT NULL,
	CONSTRAINT prikazuje_PK PRIMARY KEY (IDB, IDF),
	CONSTRAINT prikazuje_bioskop_FK FOREIGN KEY (IDB) REFERENCES bioskop (IDB),
	CONSTRAINT prikazuje_film_FK FOREIGN KEY (IDF) REFERENCES film (IDF)
);