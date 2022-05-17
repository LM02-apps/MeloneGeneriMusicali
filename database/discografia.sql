DROP DATABASE IF EXISTS discografica;

CREATE DATABASE discografica;

USE discografica;

CREATE TABLE IF NOT EXISTS gruppo(
	id_gruppo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_gruppo VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS album(
	id_album INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	titolo_album VARCHAR(128) NOT NULL,
    data_pubblicazione DATE NOT NULL,
    durata_album TIME NOT NULL CHECK(durata_album > 0),
    id_gruppo INT NOT NULL REFERENCES gruppo(id_gruppo)
);

CREATE TABLE IF NOT EXISTS musicista(
	id_artista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_artista VARCHAR(128) NOT NULL,
    id_gruppo INT NOT NULL REFERENCES gruppo(id_gruppo)
);

CREATE TABLE IF NOT EXISTS brano(
	id_brano INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_brano VARCHAR(128) NOT NULL,
    durata_brano TIME NOT NULL CHECK(durata_brano > 0),
    id_album INT NOT NULL REFERENCES album(id_album)
);

INSERT INTO gruppo(id_gruppo, nome_gruppo) VALUES (1, "Muse");
INSERT INTO gruppo(id_gruppo, nome_gruppo) VALUES (2, "Slipknot");

INSERT INTO album(id_album, titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES (1, "Origin of Symmetry", "2001-06-18", "00:51:27.0", 1);
INSERT INTO album(id_album, titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES (2, "The Resistance", "2011-09-11", "00:54:14.0",1 );
INSERT INTO album(id_album, titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES (3, "We Are Not Your Kind", "2019-08-09", "01:03:26.0", 2);

INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (1, "Matthew James Bellamy", 1);
INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (2, "Dominic James Howard", 1);
INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (3, "Christopher Anthony Wolstenholme", 1);
INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (4, "Corey Taylor", 2);
INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (5, "Paul Gray", 2);
INSERT INTO musicista(id_artista, nome_artista, id_gruppo) VALUES (6, "Joey Jordison", 2);

INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (1, "New Born", "00:06:03", 1);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (2, "Darkshines", "00:04:47", 1);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (3, "Megalomania", "00:04:38", 1);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (4, "Uprising", "00:05:05", 2);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (5, "Undiscolesed Desires", "00:03:56", 2);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (6, "MK Ultra", "00:04:06", 2);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (7, "Unsainted", "00:04:20", 3);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (8, "Solway Firth", "00:05:56", 3);
INSERT INTO brano(id_brano, nome_brano, durata_brano, id_album) VALUES (9, "Nero Forte", "00:05:15", 3);


#Aggiungere Brano
