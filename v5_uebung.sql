# vorlesung5 übungsblatt 1

# aufgabe 1: ordnen sie die marke der fahrzeuge absteigend nach dem beim verkauf erzielten gewinn
select autonr, marke, vpreis-epreis Gewinn 
from auto 
order by Gewinn DESC;

# aufgabe 2: geben sie die marke der fahrzeuge aus, die maja oder willy besessen haben
select auto.marke, auto.autonr, vorbesitzer.name 
from auto, vorbesitzer, gehoerte
where name in ("Maja", "Willy") 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr;

# aufgabe 3: geben sie die marke der fahrzeuge und die posten der wartung der fahrzeuge aus, gruppiert nach der marke der fahrzeuge
select auto.marke, wartung.posten 
from auto, ist_in, wartung 
where auto.autonr = ist_in.autonr
and ist_in.wartnr = wartung.wartnr
group by auto.marke, wartung.posten; 

# aufgabe 4: für wie viel geld wurden bereits autos eingekauft 
select SUM(epreis) from auto;

# vorlesung5 übungsblatt 2
# aufgabe 1: geben sie absteigend sortiert, die vorbesitzer des fahrzeugs an, dessen bremmsscheiben gewechselt wurden
select auto.marke, gehoerte.vbnr, vorbesitzer.name 
from wartung, vorbesitzer, auto, ist_in, gehoerte 
where wartung.posten like "Bremsscheib%" 
and ist_in.wartnr = wartung.wartnr 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr
and ist_in.autonr = auto.autonr
order by vorbesitzer.name desc;

# aufgabe 2: geben sie die fahrzeuge gruppiert nach vorbesitzer an
select auto.*, vbnr from auto, vorbesitzer
group by vorbesitzer.vbnr;

# aufgabe 3: berechnen sie den durchschnittlichen gewinn beim verkauf eines fahrzeuges und benennen sie das ergebnis mit "durchschnittlicher gewinn / fahrzeug"
select sum(vpreis-epreis) / (select count(autonr) from auto) 'durchschnittlicher gewinn / fahrzeug' from auto ;

