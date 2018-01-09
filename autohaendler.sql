DROP TABLE IF EXISTS Gehoerte;
DROP TABLE IF EXISTS Ist_in;
DROP TABLE IF EXISTS Auto;
DROP TABLE IF EXISTS Wartung;
DROP TABLE IF EXISTS Vorbesitzer;

CREATE TABLE Auto (
	autonr INT NOT NULL,
	marke CHAR(20),
	vpreis DOUBLE(10,2),
	epreis DOUBLE(10,2),
	laenge DOUBLE(10,2),
	farbe CHAR(20),
	PRIMARY KEY (autonr))
	engine = InnoDB;

CREATE TABLE Vorbesitzer (
	vbnr INT NOT NULL,
	name CHAR(20),
	PRIMARY KEY (vbnr))
	engine = InnoDB;

CREATE TABLE Gehoerte (
	autonr INT NOT NULL,
	vbnr INT NOT NULL,
	beginn DATE,
	ende DATE NOT NULL,
	PRIMARY KEY (autonr, vbnr, ende),
	INDEX Auto_autonr(autonr),
	FOREIGN KEY (autonr) REFERENCES Auto (autonr),
	INDEX Vorbesitzer_vbnr(vbnr),
	FOREIGN KEY (vbnr) REFERENCES Vorbesitzer (vbnr))
	engine = InnoDB;

CREATE TABLE Wartung (
	wartnr INT NOT NULL,
	posten CHAR(20),
	preis DOUBLE(10,2),
	PRIMARY KEY (wartnr))
	engine = InnoDB;

CREATE TABLE Ist_in (
	autonr INT NOT NULL,
	wartnr INT NOT NULL,
	datum DATE,
	PRIMARY KEY (autonr, wartnr, datum),
	FOREIGN KEY (autonr) REFERENCES Auto (autonr),
	INDEX Wartung_wartnr (wartnr),
	FOREIGN KEY (wartnr) REFERENCES Wartung (wartnr))
	engine = InnoDB;

INSERT INTO Auto VALUES(1, "Wartburg 353", 300, 1.00, 3.80, "rot");
INSERT INTO Auto VALUES(2, "Golf 2CL", 3000, 2000.00, 3.70, "gold");
INSERT INTO Auto VALUES(3, "Renault 5GTR", 3500, 3000.00, 3.30, "blau");
INSERT INTO Auto VALUES(4, "Renault Twingo", 9000, 7500.00, 3.43, "gruen");
INSERT INTO Auto VALUES(5, "Seat Ibiza CLX", 8000, 4000, 3.70, "rot");
INSERT INTO Auto VALUES(6, "Fiat Marea", 12000, 8000, 4.20, "gruen");
INSERT INTO Auto VALUES(7, "Porsche Cayenne", 45000, 30000, 3.90,"schwarz");
INSERT INTO Auto VALUES(8, "VW Kaefer", 1500, 950, 3.35, "rot");

INSERT INTO Vorbesitzer VALUES(1, "Maja");
INSERT INTO Vorbesitzer VALUES(2, "Willy");
INSERT INTO Vorbesitzer VALUES(3, "Flip");
INSERT INTO Vorbesitzer VALUES(4, "Alexander");

INSERT INTO Gehoerte VALUES (1, 2, "1985-07-02", "1987-05-09");
INSERT INTO Gehoerte VALUES (2, 2, "1986-05-10", "1995-08-25");
INSERT INTO Gehoerte VALUES (3, 3, "1991-04-23", "2003-03-24");
INSERT INTO Gehoerte VALUES (4, 3, "1995-06-09", "2003-08-14");
INSERT INTO Gehoerte VALUES (1, 4, "1987-05-09", "2003-09-05");
INSERT INTO Gehoerte VALUES (2, 1, "1995-08-25", "2003-07-12");
INSERT INTO Gehoerte VALUES (5, 1, "2003-07-13", "2005-01-01");
INSERT INTO Gehoerte VALUES (6, 1, "2005-01-01", "2005-07-24");
INSERT INTO Gehoerte VALUES (7, 2, "1995-08-26", "1995-08-27");
INSERT INTO Gehoerte VALUES (8, 3, "2003-07-25", "2006-07-12");

INSERT INTO Wartung VALUES  (1, "Tube Silikon", 2.95);
INSERT INTO Wartung VALUES  (2, "Bremsscheiben", 200);
INSERT INTO Wartung VALUES  (3, "Motoroel", 20);
INSERT INTO Wartung VALUES  (4, "Zylinderkopfdichtung", 78.36);
INSERT INTO Wartung VALUES  (5, "Airbag", 600);

INSERT INTO Ist_in VALUES (1,1,"2003-09-06");
INSERT INTO Ist_in VALUES (2,2,"2003-07-14");
INSERT INTO Ist_in VALUES (3,3,"2003-03-26");
INSERT INTO Ist_in VALUES (3,4,"2003-03-26");
INSERT INTO Ist_in VALUES (4,5,"2003-09-10");
