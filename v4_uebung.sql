drop table Auto;

CREATE TABLE Auto (
 autonr INT NOT NULL,
 marke CHAR(20),
 vpreis DOUBLE(10,2),
 epreis DOUBLE(10,2),
 farbe CHAR(20),
 PRIMARY KEY (autonr)
);

alter table Auto MODIFY autonr INT AUTO_INCREMENT; 

ALTER TABLE Auto ADD laenge double(10,2); 

INSERT INTO Auto (marke, laenge) values ("Wartburg 353",3.80);
INSERT INTO Auto (marke, laenge) values ("Golf",3.60);

select * from auto;

create table vorbesitzer 