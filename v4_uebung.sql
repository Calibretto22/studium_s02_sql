DROP TABLE IF EXISTS  Auto;

CREATE TABLE Auto (
 autonr INT NOT NULL,
 marke CHAR(20),
 vpreis DOUBLE(10,2),
 epreis DOUBLE(10,2),
 farbe CHAR(20),
 PRIMARY KEY (autonr)
);

ALTER TABLE Auto MODIFY autonr INT AUTO_INCREMENT; 

ALTER TABLE Auto ADD laenge double(10,2); 

INSERT INTO Auto (marke, laenge) values ("Wartburg 353",3.80);
INSERT INTO Auto (marke, laenge) values ("Golf",3.60);

SELECT * FROM auto;

DROP TABLE IF EXISTS Vorbesitzer;
 
CREATE TABLE Vorbesitzer (
 vbnr INT NOT NULL AUTO_INCREMENT,
 name CHAR(200),
 PRIMARY KEY (vbnr));

INSERT INTO Vorbesitzer values (2,"Willy");
INSERT INTO Vorbesitzer values (3,"Flip");

SELECT * FROM Vorbesitzer;

CREATE TABLE Gehoerte (
 ende DATE NOT NULL,
 beginn DATE,
 vbnr INT,
 autonr INT,
 PRIMARY KEY (ende));