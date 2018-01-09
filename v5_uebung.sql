# vorlesung5 übungsblatt 1

# aufgabe 1: ordnen sie die marke der fahrzeuge absteigend nach dem beim verkauf erzielten gewinn
select autonr, marke, vpreis-epreis gewinn 
from auto 
order by gewinn DESC;

# aufgabe 2: geben sie die marke der fahrzeuge aus, die maja oder willy besessen haben
select distinct auto.marke, auto.autonr, vorbesitzer.name 
from auto, vorbesitzer, gehoerte
where vorbesitzer.name = "Maja" 
or vorbesitzer.name = "Willy" 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr;

# aufgabe 3: geben sie die marke der fahrzeuge und die posten der wartung der fahrzeuge aus, gruppiert nach der marke der fahrzeuge
select auto.marke, wartung.posten 
from auto, ist_in, wartung 
where auto.autonr = ist_in.autonr
and ist_in.wartnr = wartung.wartnr
group by auto.marke; 

# aufgabe 4: für wie viel geld wurden bereits autos eingekauft 
select SUM(epreis) from auto;

# vorlesung5 übungsblatt 1
# aufgabe 1: geben sie absteigend sortiert, die vorbesitzer des fahrzeugs an, dessen bremmsscheiben gewechselt wurden
select distinct auto.marke, gehoerte.vbnr, vorbesitzer.name 
from wartung, vorbesitzer, auto, ist_in, gehoerte 
where wartung.posten = "Bremsscheiben" 
and ist_in.wartnr = wartung.wartnr 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr
order by vorbesitzer.name desc;

