DROP DATABASE IF EXISTS discografica;

CREATE DATABASE discografica;

USE discografica;

CREATE TABLE IF NOT EXISTS generi(
	id_genere INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_genere VARCHAR(128) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS sottogeneri(
	id_sottogenere INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_sottogenere VARCHAR(128) NOT NULL,
    id_genere INT NOT NULL REFERENCES generi(id_genere)
    );


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
    id_album INT NOT NULL REFERENCES album(id_album),
    id_sottogenere INT NOT NULL REFERENCES sottogeneri(id_sottogenere)
);


INSERT INTO generi(nome_genere) VALUES ("Genere Popolare");
INSERT INTO generi(nome_genere) VALUES ("Genere classico");

INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Avanguardia", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Blues", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Elettronica", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Folk", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Jazz", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("New Age", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Rap", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Rock", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Metal", 1);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Musica da camera", 2);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Concerto", 2);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Opera", 2);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Sinfonia", 2);
INSERT INTO sottogeneri(nome_sottogenere, id_genere) VALUES("Musica corale", 2);


INSERT INTO gruppo(nome_gruppo) VALUES ("Muse");
INSERT INTO gruppo(nome_gruppo) VALUES ("Slipknot");
INSERT INTO gruppo(nome_gruppo) VALUES ("Camellia");

INSERT INTO album(titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES ("Origin of Symmetry", "2001-06-18", "00:51:27.0", 1);
INSERT INTO album(titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES ("The Resistance", "2011-09-11", "00:54:14.0",1 );
INSERT INTO album(titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES ("We Are Not Your Kind", "2019-08-09", "01:03:26.0", 2);
INSERT INTO album(titolo_album, data_pubblicazione, durata_album, id_gruppo) VALUES ("Blackmagik Blazing", "2019-08-19", "00:59:45.0",3);

INSERT INTO musicista( nome_artista, id_gruppo) VALUES ("Matthew James Bellamy", 1);
INSERT INTO musicista( nome_artista, id_gruppo) VALUES ("Dominic James Howard", 1);
INSERT INTO musicista(nome_artista, id_gruppo) VALUES ("Christopher Anthony Wolstenholme", 1);
INSERT INTO musicista(nome_artista, id_gruppo) VALUES ("Corey Taylor", 2);
INSERT INTO musicista(nome_artista, id_gruppo) VALUES ("Paul Gray", 2);
INSERT INTO musicista(nome_artista, id_gruppo) VALUES ("Joey Jordison", 2);

INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("New Born", "00:06:03",8,1);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Darkshines", "00:04:47",8,1);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Megalomania", "00:04:38",8,1);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Uprising", "00:05:05",8,2);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Undiscolesed Desires", "00:03:56",8,2);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("MK Ultra", "00:04:06",8,2);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Unsainted", "00:04:20", 9 , 3);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Solway Firth", "00:05:56", 9 , 3);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("Nero Forte", "00:05:15", 9, 3);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("BLACK - RAY", "00:04:38",3,4);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("BRACE FOR FRICKING IMPACT", "00:04:24",3,4);
INSERT INTO brano(nome_brano, durata_brano, id_sottogenere, id_album) VALUES ("[BLEED BLOOD]", "00:04:19",3,4);


#Aggiungere Brano
