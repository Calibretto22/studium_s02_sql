DROP TABLE IF EXISTS Gehoerte;
DROP TABLE IF EXISTS Auto;
DROP TABLE IF EXISTS Vorbesitzer;

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
 
CREATE TABLE Vorbesitzer (
 vbnr INT NOT NULL AUTO_INCREMENT,
 name CHAR(200),
 PRIMARY KEY (vbnr));

INSERT INTO Vorbesitzer values (2,"Willy");
INSERT INTO Vorbesitzer values (3,"Flip");

SELECT * FROM Vorbesitzer;

CREATE TABLE Gehoerte (
 autonr INT,
 vbnr INT,
 ende DATE NOT NULL,
 beginn DATE, # 'yyyy.mm.dd'
 PRIMARY KEY (ende),
 FOREIGN KEY (autonr) REFERENCES Auto (autonr),
 FOREIGN KEY (vbnr) REFERENCES Vorbesitzer (vbnr));
 
INSERT INTO Gehoerte values (1,2,'1985.07.02','1985.07.02');

SELECT * FROM Gehoerte;