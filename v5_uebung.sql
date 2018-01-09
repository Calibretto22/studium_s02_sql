select autonr, marke, vpreis-epreis gewinn 
from auto 
order by gewinn DESC;

select distinct auto.marke, auto.autonr, vorbesitzer.name 
from auto, vorbesitzer, gehoerte
where vorbesitzer.name = "Maja" 
or vorbesitzer.name = "Willy" 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr;

select auto.marke, wartung.posten 
from auto, ist_in, wartung 
where auto.autonr = ist_in.autonr
and ist_in.wartnr = wartung.wartnr
group by auto.marke; 

select SUM(epreis) from auto;

select distinct auto.marke, gehoerte.vbnr, vorbesitzer.name 
from wartung, vorbesitzer, auto, ist_in, gehoerte 
where wartung.posten = "Bremsscheiben" 
and ist_in.wartnr = wartung.wartnr 
and vorbesitzer.vbnr = gehoerte.vbnr 
and gehoerte.autonr = auto.autonr
order by vorbesitzer.name desc;

