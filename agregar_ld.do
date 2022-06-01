cd "D:\Universidad\Teorías de la Distribución y la Desigualdad\Caso Puno"

use sumaria-2004.dta,clear

forvalue j=2005/2017{
append using sumaria-`j'.dta
}

/*
use "sumaria-2004.dta", clear
append using sumaria-2017.dta

gen defes=ld
gen estrato1=estrato

gen dept=substr(ubigeo,1,2)
destring(dept), generate(id)

gen prov=substr(ubigeo,1,4)
destring(prov), generate(idpro)


sort defes ubigeo
sort ubigeo estrato1


sort idpro estrato1

edit aÑo id idpro ubigeo estrato1 ld defes



drop prov
drop idpro

*/



* defes = deflactor espacial

*1
replace defes = .81580621 if ubigeo=="010101" & estrato1==4
replace defes = .75004041 if ubigeo=="010110" & estrato1==8
replace defes = .75004041 if ubigeo=="010111" & estrato1==6
replace defes = .75004041 if ubigeo=="010114" & estrato1==7
replace defes = .75004041 if ubigeo=="010114" & estrato1==8
replace defes = .75004041 if ubigeo=="010120" & estrato1==6
replace defes = .75004041 if ubigeo=="010120" & estrato1==8
replace defes = .80923676 if ubigeo=="010201" & estrato1==4
replace defes = .8315478 if ubigeo=="010201" & estrato1==7
replace defes = .8315478 if ubigeo=="010202" & estrato1==7
replace defes = .8315478 if ubigeo=="010203" & estrato1==7
replace defes = .8315478 if ubigeo=="010205" & estrato1==7
replace defes = .80923676 if ubigeo=="010312" & estrato1==5
replace defes = .8315478 if ubigeo=="010312" & estrato1==8
replace defes = .8315478 if ubigeo=="010401" & estrato1==7
replace defes = .8315478 if ubigeo=="010402" & estrato1==7
replace defes = .80923676 if ubigeo=="010403" & estrato1==5
replace defes = .8315478 if ubigeo=="010403" & estrato1==6
replace defes = .8315478 if ubigeo=="010403" & estrato1==8
replace defes = .81580621 if ubigeo=="010501" & estrato1==5
replace defes = .75004041 if ubigeo=="010503" & estrato1==7
replace defes = .75004041 if ubigeo=="010504" & estrato1==7
replace defes = .81580621 if ubigeo=="010509" & estrato1==5
replace defes = .75004041 if ubigeo=="010509" & estrato1==7
replace defes = .75004041 if ubigeo=="010510" & estrato1==6
replace defes = .75004041 if ubigeo=="010513" & estrato1==8
replace defes = .75004041 if ubigeo=="010521" & estrato1==6
replace defes = .75004041 if ubigeo=="010521" & estrato1==8
replace defes = .75004041 if ubigeo=="010523" & estrato1==8
replace defes = .8315478 if ubigeo=="010602" & estrato1==7
replace defes = .8315478 if ubigeo=="010603" & estrato1==6
replace defes = .8315478 if ubigeo=="010604" & estrato1==6
replace defes = .8315478 if ubigeo=="010604" & estrato1==7
replace defes = .8315478 if ubigeo=="010604" & estrato1==8
replace defes = .8315478 if ubigeo=="010607" & estrato1==7
replace defes = .8315478 if ubigeo=="010611" & estrato1==8
replace defes = .80923676 if ubigeo=="010701" & estrato1==4
replace defes = .8315478 if ubigeo=="010701" & estrato1==7
replace defes = .80923676 if ubigeo=="010702" & estrato1==5
replace defes = .8315478 if ubigeo=="010702" & estrato1==7
replace defes = .8315478 if ubigeo=="010703" & estrato1==7
replace defes = .8315478 if idpro==107 & estrato1==7
replace defes = .8315478 if idpro==107 & estrato1==8
replace defes = .8315478 if ubigeo=="010707" & estrato1==6
replace defes = .8315478 if ubigeo=="010705" & estrato1==6


*2
replace defes = .75694716 if idpro==201 & estrato1==2
replace defes = .75313884 if idpro==201 & estrato1==6
replace defes = .75313884 if idpro==201 & estrato1==7
replace defes = .75313884 if idpro==201 & estrato1==8
replace defes = .75313884 if idpro==203 & estrato1==6
replace defes = .75313884 if idpro==203 & estrato1==7
replace defes = .75313884 if idpro==203 & estrato1==8
replace defes = .75313884 if idpro==204 & estrato1==7
replace defes = .75694716 if idpro==204 & estrato1==5
replace defes = .75313884 if idpro==204 & estrato1==8
replace defes = .75313884 if idpro==205 & estrato1==6
replace defes = .75313884 if idpro==205 & estrato1==7
replace defes = .75313884 if idpro==205 & estrato1==8
replace defes = .75694716 if idpro==206 & estrato1==5
replace defes = .75313884 if idpro==206 & estrato1==7
replace defes = .75313884 if idpro==207 & estrato1==7

replace defes = .85583431 if idpro==208 & estrato1==4
replace defes = .89085555 if idpro==208 & estrato1==7
replace defes = .89085555 if idpro==208 & estrato1==8

replace defes = .75313884 if idpro==210 & estrato1==6
replace defes = .75313884 if idpro==210 & estrato1==7

replace defes = .85583431 if idpro==211 & estrato1==5
replace defes = .75313884 if ubigeo=="021102" & estrato1==8
replace defes = .75313884 if idpro==212 & estrato1==6
replace defes = .75313884 if idpro==212 & estrato1==7
replace defes = .75313884 if idpro==213 & estrato1==7
replace defes = .75313884 if idpro==215 & estrato1==7

replace defes = .75694716 if idpro==216 & estrato1==5
replace defes = .75694716 if idpro==216 & estrato1==5
replace defes = .75313884 if idpro==216 & estrato1==7
replace defes = .75313884 if idpro==216 & estrato1==8
replace defes = .85583431 if idpro==218 & estrato1==2
replace defes = .85583431 if idpro==218 & estrato1==5
replace defes = .85583431 if idpro==218 & estrato1==7
replace defes = .75313884 if ubigeo=="021802" & estrato1==7

replace defes = .85583431 if ubigeo=="021805" & estrato1==7
replace defes = .75313884 if ubigeo=="021903" & estrato1==8
replace defes = .75313884 if ubigeo=="021907" & estrato1==7
replace defes = .75313884 if ubigeo=="021910" & estrato1==8
replace defes = .75313884 if idpro==220 & estrato1==7
replace defes = .75694716 if idpro==220 & estrato1==5


*3

replace defes = .81303 if id==3 & estrato1==3
replace defes = .81303 if id==3 & estrato1==4
replace defes = .81303 if id==3 & estrato1==5
replace defes = .73304796 if id==3 & estrato1==6
replace defes = .73304796 if id==3 & estrato1==7
replace defes = .73304796 if id==3 & estrato1==8


*4

replace defes = .81303 if ubigeo=="040101" & estrato1==1
replace defes = .81303 if ubigeo=="040102" & estrato1==1
replace defes = .81303 if ubigeo=="040103" & estrato1==1
replace defes = .81303 if ubigeo=="040104" & estrato1==1
replace defes = .81303 if ubigeo=="040107" & estrato1==1

replace defes = .85403317 if ubigeo=="040108" & estrato1==5
replace defes = .86793548 if ubigeo=="040108" & estrato1==7

replace defes = .81303 if ubigeo=="040109" & estrato1==1
replace defes = .81303 if ubigeo=="040110" & estrato1==1
replace defes = .81303 if ubigeo=="040112" & estrato1==1
replace defes = .81303 if ubigeo=="040116" & estrato1==1
replace defes = .81303 if ubigeo=="040117" & estrato1==1
replace defes = .85403317 if ubigeo=="040121" & estrato1==5
replace defes = .81303 if ubigeo=="040122" & estrato1==1
replace defes = .81303 if ubigeo=="040123" & estrato1==1
replace defes = .81303 if ubigeo=="040124" & estrato1==5
replace defes = .81303 if ubigeo=="040126" & estrato1==1
replace defes = .81303 if ubigeo=="040126" & estrato1==4
replace defes = .81303 if ubigeo=="040128" & estrato1==4
replace defes = .81303 if ubigeo=="040129" & estrato1==1
replace defes = .85403317 if ubigeo=="040201" & estrato1==4
replace defes = .85403317 if ubigeo=="040204" & estrato1==4
replace defes = .73304796 if ubigeo=="040119" & estrato1==7
replace defes = .73304796 if ubigeo=="040121" & estrato1==8
replace defes = .86793548 if ubigeo=="040205" & estrato1==8
replace defes = .86793548 if ubigeo=="040206" & estrato1==6
replace defes = .86793548 if ubigeo=="040206" & estrato1==8
replace defes = .85403317 if ubigeo=="040208" & estrato1==4

replace defes = .86793548 if ubigeo=="040208" & estrato1==7
replace defes = .86793548 if ubigeo=="040302" & estrato1==7
replace defes = .85403317 if ubigeo=="040303" & estrato1==5
replace defes = .86793548 if ubigeo=="040306" & estrato1==8
replace defes = .73304796 if ubigeo=="040401" & estrato1==7
replace defes = .73304796 if ubigeo=="040406" & estrato1==8
replace defes = .81303 if ubigeo=="040410" & estrato1==5
replace defes = .73304796 if ubigeo=="040410" & estrato1==7
replace defes = .73304796 if ubigeo=="040410" & estrato1==8
replace defes = .73304796 if ubigeo=="040504" & estrato1==7
replace defes = .73304796 if ubigeo=="040506" & estrato1==6
replace defes = .73304796 if ubigeo=="040517" & estrato1==6
replace defes = .73304796 if ubigeo=="040519" & estrato1==8
replace defes = .81303 if ubigeo=="040520" & estrato1==5
replace defes = .73304796 if ubigeo=="040520" & estrato1==7
replace defes = .73304796 if ubigeo=="040603" & estrato1==7
replace defes = .73304796 if ubigeo=="040603" & estrato1==4
replace defes = .85403317 if ubigeo=="040701" & estrato1==4
replace defes = .86793548 if ubigeo=="040702" & estrato1==8
replace defes = .73304796 if ubigeo=="040801" & estrato1==8
replace defes = .73304796 if ubigeo=="040803" & estrato1==6
replace defes = .73304796 if ubigeo=="040807" & estrato1==7


*5
replace defes = .75694716 if id==5 & estrato1==2
replace defes = .75313884 if id==5 & estrato1==7
replace defes = .75313884 if id==5 & estrato1==8
replace defes = .75313884 if id==5 & estrato1==6
replace defes = .75313884 if id==5 & estrato1==5
replace defes = .75694716 if id==5 & estrato1==4
	
replace defes = .80923676 if ubigeo=="050407" & estrato1==5
replace defes = .8315478 if ubigeo=="050407" & estrato1==7
replace defes = .8315478 if ubigeo=="050407" & estrato1==8
replace defes = .80923676 if ubigeo=="050408" & estrato1==5
replace defes = .8315478 if ubigeo=="050408" & estrato1==7
replace defes = .8315478 if ubigeo=="050408" & estrato1==8
replace defes = .8315478 if ubigeo=="050409" & estrato1==7

replace defes = .75694716 if ubigeo=="050502" & estrato1==5
replace defes = .80923676 if ubigeo=="050503" & estrato1==5
replace defes = .8315478 if ubigeo=="050503" & estrato1==7
replace defes = .80923676 if ubigeo=="050507" & estrato1==5
replace defes = .75694716 if ubigeo=="050508" & estrato1==5
replace defes = .80923676 if ubigeo=="050509" & estrato1==5
replace defes = .8315478 if ubigeo=="050509" & estrato1==7
replace defes = .75694716 if ubigeo=="050601" & estrato1==5
replace defes = .75694716 if ubigeo=="050602" & estrato1==5
replace defes = .75694716 if ubigeo=="050604" & estrato1==5
replace defes = .75694716 if ubigeo=="050701" & estrato1==5
replace defes = .75694716 if ubigeo=="050801" & estrato1==5
replace defes = .75694716 if ubigeo=="051001" & estrato1==5
replace defes = .75694716 if ubigeo=="051005" & estrato1==5
replace defes = .75694716 if ubigeo=="051010" & estrato1==5
replace defes = .75694716 if ubigeo=="051011" & estrato1==5


*6
replace defes = .81580621 if idpro==601 & estrato1==2
replace defes = .75004041 if idpro==601 & estrato1==7
replace defes = .75004041 if idpro==601 & estrato1==8
replace defes = .81580621 if idpro==602 & estrato1==5
replace defes = .75004041 if idpro==602 & estrato1==7
replace defes = .75004041 if idpro==602 & estrato1==8
replace defes = .75004041 if idpro==603 & estrato1==7
replace defes = .75004041 if idpro==603 & estrato1==8
replace defes = .75004041 if idpro==603 & estrato1==6
replace defes = .81580621 if idpro==604 & estrato1==5
replace defes = .75004041 if idpro==604 & estrato1==7
replace defes = .75004041 if idpro==604 & estrato1==8
replace defes = .8315478 if ubigeo=="060405" & estrato1==8
replace defes = .75004041 if idpro==604 & estrato1==6
replace defes = .75004041 if idpro==605 & estrato1==7
replace defes = .75004041 if ubigeo=="060601" & estrato1==7
replace defes = .75004041 if ubigeo=="060607" & estrato1==7
replace defes = .75004041 if ubigeo=="060612" & estrato1==7
replace defes = .75004041 if ubigeo=="060613" & estrato1==7
replace defes = .75004041 if ubigeo=="060613" & estrato1==8
replace defes = .81580621 if ubigeo=="060701" & estrato1==5
replace defes = .75004041 if ubigeo=="060701" & estrato1==7
replace defes = .75004041 if ubigeo=="060701" & estrato1==8
replace defes = .75004041 if ubigeo=="060703" & estrato1==7
replace defes = .80923676 if id==6 & estrato1==3
replace defes = .8315478 if ubigeo=="060801" & estrato1==7
replace defes = .8315478 if ubigeo=="060801" & estrato1==8
replace defes = .8315478 if ubigeo=="060807" & estrato1==7
replace defes = .81580621 if ubigeo=="060808" & estrato1==5
replace defes = .8315478 if ubigeo=="060808" & estrato1==7
replace defes = .8315478 if ubigeo=="060811" & estrato1==7
replace defes = .8315478 if ubigeo=="060812" & estrato1==7
replace defes = .80923676 if ubigeo=="060901" & estrato1==5
replace defes = .8315478 if ubigeo=="060901" & estrato1==7
replace defes = .8315478 if ubigeo=="060902" & estrato1==7
replace defes = .8315478 if ubigeo=="060903" & estrato1==7
replace defes = .8315478 if ubigeo=="060904" & estrato1==7
replace defes = .8315478 if ubigeo=="060906" & estrato1==7
replace defes = .75004041 if ubigeo=="061001" & estrato1==7
replace defes = .75004041 if ubigeo=="061006" & estrato1==7
replace defes = .75004041 if ubigeo=="061007" & estrato1==7
replace defes = .75004041 if ubigeo=="061103" & estrato1==7
replace defes = .75004041 if ubigeo=="061107" & estrato1==7
replace defes = .75004041 if ubigeo=="061109" & estrato1==7
replace defes = .75004041 if ubigeo=="061202" & estrato1==7
replace defes = .81580621 if ubigeo=="061301" & estrato1==5
replace defes = .75004041 if ubigeo=="061310" & estrato1==7
replace defes = .75004041 if ubigeo=="061311" & estrato1==7
replace defes = .75004041 if ubigeo=="061311" & estrato1==8
replace defes = .75004041 if ubigeo=="060809" & estrato1==7
replace defes = .8315478 if ubigeo=="060906" & estrato1==6
replace defes = .8315478 if ubigeo=="060906" & estrato1==8
replace defes = .75004041 if ubigeo=="061102" & estrato1==6
replace defes = .75004041 if ubigeo=="061102" & estrato1==8
replace defes = .75004041 if ubigeo=="060105" & estrato1==6
replace defes = .8315478 if ubigeo=="060607" & estrato1==7




*7
replace defes = 1 if id==7

*8

replace defes = .81303 if id==8 & estrato1==2
replace defes = .73304796 if id==8 & estrato1==7
replace defes = .81303 if id==8 & estrato1==5
replace defes = .73304796 if id==8 & estrato1==6
replace defes = .73304796 if id==8 & estrato1==8
replace defes = .81303 if id==8 & estrato1==4
replace defes = .80923676 if ubigeo=="080901" & estrato1==4
replace defes = .80923676 if ubigeo=="080901" & estrato1==5
replace defes = .80923676 if ubigeo=="080902" & estrato1==5
replace defes = .8315478 if ubigeo=="080902" & estrato1==7
replace defes = .8315478 if ubigeo=="080902" & estrato1==8
replace defes = .8315478 if ubigeo=="080904" & estrato1==7
replace defes = .8315478 if ubigeo=="080905" & estrato1==7
replace defes = .8315478 if ubigeo=="080905" & estrato1==8
replace defes = .8315478 if ubigeo=="080906" & estrato1==6
replace defes = .8315478 if ubigeo=="080906" & estrato1==7
replace defes = .80923676 if ubigeo=="080907" & estrato1==5
replace defes = .8315478 if ubigeo=="080907" & estrato1==7
replace defes = .8315478 if ubigeo=="080907" & estrato1==7
replace defes = .80923676 if ubigeo=="080910" & estrato1==5
replace defes = .8315478 if ubigeo=="080910" & estrato1==7
replace defes = .8315478 if ubigeo=="080910" & estrato1==8
replace defes = .8315478 if ubigeo=="081106" & estrato1==7
replace defes = .8315478 if ubigeo=="081203" & estrato1==7

*9

replace defes = .75694716 if id==9 & estrato1==4
replace defes = .75313884 if id==9 & estrato1==6
replace defes = .75313884 if id==9 & estrato1==7
replace defes = .75313884 if id==9 & estrato1==8
replace defes = .75694716 if id==9 & estrato1==5

*10

replace defes = .75694716 if id==10 & estrato1==2
replace defes = .75313884 if id==10 & estrato1==7
replace defes = .75313884 if id==10 & estrato1==8
replace defes = .75694716 if id==10 & estrato1==5
replace defes = .75313884 if id==10 & estrato1==6
replace defes = .80923676 if id==10 & estrato1==4

*11

replace defes = .85583431 if id==11 & estrato1==2
replace defes = .89085555 if id==11 & estrato1==7
replace defes = .85583431 if id==11 & estrato1==4
replace defes = .89085555 if id==11 & estrato1==6
replace defes = .85583431 if id==11 & estrato1==5

*12

replace defes = .75694716 if id==12 & estrato1==2
replace defes = .75313884 if id==12 & estrato1==7
replace defes = .75694716 if id==12 & estrato1==5
replace defes = .75313884 if id==12 & estrato1==8
replace defes = .75313884 if id==12 & estrato1==6

replace defes = .8315478 if ubigeo=="120301" & estrato1==7
replace defes = .8315478 if ubigeo=="120301" & estrato1==8
replace defes = .8315478 if ubigeo=="120302" & estrato1==7
replace defes = .8315478 if ubigeo=="120302" & estrato1==8
replace defes = .8315478 if ubigeo=="120303" & estrato1==7
replace defes = .8315478 if ubigeo=="120304" & estrato1==7
replace defes = .80923676 if ubigeo=="120305" & estrato1==5
replace defes = .8315478 if ubigeo=="120601" & estrato1==7
replace defes = .8315478 if ubigeo=="120601" & estrato1==8
replace defes = .8315478 if ubigeo=="120602" & estrato1==7
replace defes = .8315478 if ubigeo=="120607" & estrato1==6
replace defes = .8315478 if ubigeo=="120607" & estrato1==7
replace defes = .8315478 if ubigeo=="120607" & estrato1==8
replace defes = .8315478 if ubigeo=="120699" & estrato1==7
replace defes = .80923676 if ubigeo=="120699" & estrato1==5
replace defes = .8315478 if ubigeo=="120699" & estrato1==8
replace defes = .75694716 if ubigeo=="120701" & estrato1==4
replace defes = .75694716 if ubigeo=="120801" & estrato1==4
replace defes = .8315478 if ubigeo=="120301" & estrato1==5
replace defes = .8315478 if ubigeo=="120303" & estrato1==5
replace defes = .75694716 if ubigeo=="120401" & estrato1==4

*13

replace defes = .79460567 if id==13 & estrato1==1
replace defes = .79460567 if id==13 & estrato1==4
replace defes = .81202608 if id==13 & estrato1==7
replace defes = .79460567 if id==13 & estrato1==5
replace defes = .75004041 if id==13 & estrato1==8
replace defes = .81202608 if ubigeo=="130402" & estrato1==8
replace defes = .81202608 if ubigeo=="130501" & estrato1==5
replace defes = .75004041 if ubigeo=="130501" & estrato1==7
replace defes = .75004041 if ubigeo=="130502" & estrato1==7
replace defes = .75004041 if ubigeo=="130503" & estrato1==7
replace defes = .75004041 if ubigeo=="130504" & estrato1==7
replace defes = .81580621 if ubigeo=="130601" & estrato1==5
replace defes = .75004041 if ubigeo=="130601" & estrato1==7
replace defes = .75004041 if ubigeo=="130604" & estrato1==7
replace defes = .75004041 if ubigeo=="130608" & estrato1==7
replace defes = .75004041 if ubigeo=="130611" & estrato1==7
replace defes = .81580621 if ubigeo=="130613" & estrato1==5
replace defes = .81580621 if ubigeo=="130614" & estrato1==5
replace defes = .75004041 if ubigeo=="130614" & estrato1==7
replace defes = .75004041 if ubigeo=="130614" & estrato1==7
replace defes = .81202608 if ubigeo=="130703" & estrato1==8
replace defes = .81580621 if ubigeo=="130801" & estrato1==5
replace defes = .75004041 if ubigeo=="130801" & estrato1==7
replace defes = .75004041 if ubigeo=="130802" & estrato1==7
replace defes = .75004041 if ubigeo=="130804" & estrato1==7
replace defes = .75004041 if ubigeo=="130806" & estrato1==7
replace defes = .75004041 if ubigeo=="130808" & estrato1==5
replace defes = .75004041 if ubigeo=="130809" & estrato1==7
replace defes = .75004041 if ubigeo=="130812" & estrato1==7
replace defes = .75004041 if ubigeo=="130813" & estrato1==7
replace defes = .81580621 if ubigeo=="130901" & estrato1==4
replace defes = .75004041 if ubigeo=="130901" & estrato1==7
replace defes = .75004041 if ubigeo=="130902" & estrato1==7
replace defes = .75004041 if ubigeo=="130903" & estrato1==7
replace defes = .75004041 if ubigeo=="130905" & estrato1==7
replace defes = .75004041 if ubigeo=="130906" & estrato1==7
replace defes = .75004041 if ubigeo=="130907" & estrato1==7
replace defes = .75004041 if ubigeo=="130908" & estrato1==7
replace defes = .75004041 if ubigeo=="131001" & estrato1==7

replace defes = ld if id==13 & estrato1==5

replace defes = .75004041 if ubigeo=="131002" & estrato1==7
replace defes = .75004041 if ubigeo=="131006" & estrato1==7
replace defes = .75004041 if ubigeo=="131008" & estrato1==7
replace defes = .75004041 if ubigeo=="131103" & estrato1==7
replace defes = .75004041 if ubigeo=="131104" & estrato1==7
replace defes = .81202608 if ubigeo=="131201" & estrato1==8
replace defes = .75004041 if ubigeo=="130108" & estrato1==6
replace defes = .79460567 if ubigeo=="130202" & estrato1==5

replace defes = .79460567 if ubigeo=="130401" & estrato1==3
replace defes = .75004041 if ubigeo=="130301" & estrato1==5

replace defes = .81580621 if ubigeo=="130601" & estrato1==5
replace defes = .75004041 if ubigeo=="130608" & estrato1==6
replace defes = .79460567 if ubigeo=="130705" & estrato1==5
replace defes = .75004041 if ubigeo=="130902" & estrato1==5
replace defes = .75004041 if ubigeo=="130905" & estrato1==6
replace defes = .75004041 if ubigeo=="131002" & estrato1==6



*14

replace defes = .79460567 if id==14 & estrato1==2
replace defes = .81202608 if id==14 & estrato1==6
replace defes = .79460567 if id==14 & estrato1==5
replace defes = .81202608 if id==14 & estrato1==6
replace defes = .81202608 if id==14 & estrato1==7
replace defes = .81202608 if id==14 & estrato1==8
replace defes = .79460567 if id==14 & estrato1==4


*15

replace defes = ld if id==15
replace defes = 1 if idpro==1501
replace defes = .85583431 if id==15 & estrato1==3
replace defes = .85583431 if id==15 & estrato1==3

replace defes = 1 if idpro==1501 & estrato==1
replace defes = .85583431 if ubigeo=="150202" & estrato1==4
replace defes = .85583431 if ubigeo=="150204" & estrato1==3

replace defes = .85583431 if id==15 & estrato1==3
replace defes = .89085555 if ubigeo=="150601" & estrato1==7
replace defes = .85583431 if ubigeo=="150603" & estrato1==5
replace defes = .85583431 if ubigeo=="150605" & estrato1==4
replace defes = .85583431 if ubigeo=="150611" & estrato1==8
replace defes = .89085555 if ubigeo=="150201" & estrato1==7
replace defes = .89085555 if ubigeo=="150204" & estrato1==7
replace defes = .75313884 if ubigeo=="150303" & estrato1==8
replace defes = .75313884 if ubigeo=="150304" & estrato1==7
replace defes = .75694716 if ubigeo=="150401" & estrato1==5
replace defes = .75313884 if ubigeo=="150405" & estrato1==6
replace defes = .75313884 if ubigeo=="150406" & estrato1==8
replace defes = .89085555 if ubigeo=="150501" & estrato1==7
replace defes = .89085555 if ubigeo=="150502" & estrato1==8
replace defes = .85583431 if ubigeo=="150505" & estrato1==5
replace defes = .89085555 if ubigeo=="150503" & estrato1==6
replace defes = .89085555 if ubigeo=="150510" & estrato1==7
replace defes = .89085555 if ubigeo=="150513" & estrato1==7
replace defes = .89085555 if ubigeo=="150514" & estrato1==8
replace defes = .75313884 if ubigeo=="150611" & estrato1==8
replace defes = .75313884 if ubigeo=="150702" & estrato1==7
replace defes = .75694716 if ubigeo=="150708" & estrato1==5
replace defes = .75694716 if ubigeo=="150728" & estrato1==5
replace defes = .85583431 if id==15 & estrato1==2
replace defes = .75313884 if ubigeo=="150801" & estrato1==7
replace defes = .89085555 if ubigeo=="150811" & estrato1==7
replace defes = .89085555 if ubigeo=="150812" & estrato1==7
replace defes = .75313884 if ubigeo=="150902" & estrato1==6
replace defes = .75313884 if ubigeo=="151004" & estrato1==6
replace defes = .75313884 if ubigeo=="151009" & estrato1==8
replace defes = .75313884 if ubigeo=="151022" & estrato1==8
replace defes = .75313884 if ubigeo=="151030" & estrato1==8

*16

replace defes = .924496 if id==16 & estrato1==2
replace defes = .95415074 if id==16 & estrato1==7
replace defes = .95415074 if id==16 & estrato1==8
replace defes = .95415074 if id==16 & estrato1==6
replace defes = .924496 if id==16 & estrato1==4
replace defes = .924496 if id==16 & estrato1==5



*17
replace defes = .924496 if ubigeo=="170101" & estrato1==4

replace defes = .95415074 if ubigeo=="170101" & estrato1==7
replace defes = .95415074 if ubigeo=="170101" & estrato1==8
replace defes = .924496 if ubigeo=="170102" & estrato1==6
replace defes = .95415074 if ubigeo=="170102" & estrato1==7
replace defes = .95415074 if ubigeo=="170102" & estrato1==8
replace defes = .924496 if ubigeo=="170103" & estrato1==5
replace defes = .95415074 if ubigeo=="170103" & estrato1==8
replace defes = .924496 if ubigeo=="170104" & estrato1==6
replace defes = .95415074 if ubigeo=="170104" & estrato1==8
replace defes = .95415074 if ubigeo=="170104" & estrato1==6
replace defes = .95415074 if ubigeo=="170201" & estrato1==6
replace defes = .95415074 if ubigeo=="170203" & estrato1==6
replace defes = .95415074 if ubigeo=="170203" & estrato1==8
replace defes = .924496 if ubigeo=="170204" & estrato1==5
replace defes = .95415074 if ubigeo=="170204" & estrato1==8
replace defes = .924496 if ubigeo=="170302" & estrato1==5
replace defes = .95415074 if ubigeo=="170302" & estrato1==8
replace defes = .95415074 if ubigeo=="170303" & estrato1==8
replace defes = .95415074 if ubigeo=="170303" & estrato1==6
replace defes = .85403317 if ubigeo=="180101" & estrato1==3


*18

replace defes=.85403317 if ubigeo=="180101" & estrato1==3
replace defes=.86793548 if ubigeo=="180101" & estrato1==7
replace defes=.86793548 if ubigeo=="180101" & estrato1==8
replace defes=.81303 if ubigeo=="180102" & estrato1==5
replace defes=.73304796 if ubigeo=="180102" & estrato1==8
replace defes=.85403317 if ubigeo=="180104" & estrato1==3
replace defes=.81303 if ubigeo=="180106" & estrato1==5
replace defes=.73304796 if ubigeo=="180106" & estrato1==8
replace defes=.73304796 if ubigeo=="180201" & estrato1==6
replace defes=.73304796 if ubigeo=="180201" & estrato1==7
replace defes=.73304796 if ubigeo=="180202" 
replace defes=.73304796 if ubigeo=="180203"
replace defes=.73304796 if ubigeo=="180204" 
replace defes=.73304796 if ubigeo=="180205" 
replace defes=.73304796 if ubigeo=="180206" 
replace defes=.73304796 if ubigeo=="180207" 
replace defes=.73304796 if ubigeo=="180208" 
replace defes=.73304796 if ubigeo=="180209" 
replace defes=.73304796 if ubigeo=="180210" 
replace defes=.73304796 if ubigeo=="180211"
replace defes=.85403317 if ubigeo=="180301" & estrato1==3
replace defes=.85403317 if ubigeo=="180303" 
replace defes=.73304796 if ubigeo=="180301" & estrato1==8
replace defes=.81303 if ubigeo=="180201" & estrato1==5




*19
replace defes = .75694716 if ubigeo=="190101" & estrato1==3
replace defes = .75313884 if ubigeo=="190102" & estrato1==7
replace defes = .75694716 if ubigeo=="190103" & estrato1==5
replace defes = .75694716 if ubigeo=="190104" & estrato1==5
replace defes = .75313884 if ubigeo=="190104" & estrato1==7
replace defes = .75694716 if ubigeo=="190105" & estrato1==8
replace defes = .75694716 if ubigeo=="190107" & estrato1==5
replace defes = .75313884 if ubigeo=="190107" & estrato1==7
replace defes = .75313884 if ubigeo=="190108" & estrato1==7
replace defes = .75694716 if ubigeo=="190109" & estrato1==3
replace defes = .75313884 if ubigeo=="190109" & estrato1==7
replace defes = .75694716 if ubigeo=="190110" & estrato1==7
replace defes = .75694716 if ubigeo=="190111" & estrato1==5
replace defes = .75694716 if ubigeo=="190112" & estrato1==5
replace defes = .75694716 if ubigeo=="190112" & estrato1==7
replace defes = .75694716 if ubigeo=="190113" & estrato1==3
replace defes = .75694716 if ubigeo=="190201" & estrato1==5
replace defes = .75313884 if ubigeo=="190201" & estrato1==7
replace defes = .75694716 if ubigeo=="190202" & estrato1==5
replace defes = .75694716 if ubigeo=="190205" & estrato1==6
replace defes = .75694716 if ubigeo=="190206" & estrato1==5
replace defes = .75313884 if ubigeo=="190206" & estrato1==7
replace defes = .75694716 if ubigeo=="190206" & estrato1==8
replace defes = .80923676 if ubigeo=="190208" & estrato1==7
replace defes = .8315478 if ubigeo=="190301" & estrato1==7
replace defes = .75313884 if ubigeo=="190302" & estrato1==7
replace defes = .8315478 if ubigeo=="190303" & estrato1==7
replace defes = .8315478 if ubigeo=="190304" & estrato1==7
replace defes = .8315478 if ubigeo=="190305" & estrato1==7
replace defes = .80923676 if ubigeo=="190306" & estrato1==5
replace defes = .8315478 if ubigeo=="190306" & estrato1==7
replace defes = .80923676 if ubigeo=="190307" & estrato1==5
replace defes = .8315478 if ubigeo=="190307" & estrato1==7
replace defes = .8315478 if ubigeo=="190307" & estrato1==8

*20

replace defes = .79460567 if ubigeo=="200101" & estrato1==2
replace defes = .81202608 if ubigeo=="200101" & estrato1==8
replace defes = .79460567 if ubigeo=="200104" & estrato1==2
replace defes = .79460567 if ubigeo=="200105" & estrato1==3
replace defes = .79460567 if ubigeo=="200109" & estrato1==4
replace defes = .79460567 if ubigeo=="200109" & estrato1==6
replace defes = .79460567 if ubigeo=="200110" & estrato1==4
replace defes = .81202608 if ubigeo=="200111" & estrato1==7
replace defes = .81202608 if ubigeo=="200111" & estrato1==8
replace defes = .79460567 if ubigeo=="200114" & estrato1==4
replace defes = .81202608 if ubigeo=="200114" & estrato1==7
replace defes = .81202608 if ubigeo=="200114" & estrato1==8
replace defes = .81580621  if ubigeo=="200201" & estrato1==5
replace defes = .75004041  if ubigeo=="200201" & estrato1==7
replace defes = .81202608  if ubigeo=="200202" & estrato1==7
replace defes = .81202608  if ubigeo=="200205" & estrato1==7
replace defes = .75004041  if ubigeo=="200205" & estrato1==8
replace defes = .75004041  if ubigeo=="200206" & estrato1==7
replace defes = .81202608 if ubigeo=="200206" & estrato1==8
replace defes = .81202608 if ubigeo=="200208" & estrato1==8
replace defes = .75004041  if ubigeo=="200301" & estrato1==7
replace defes = .81202608  if ubigeo=="200302" & estrato1==7
replace defes = .75004041  if ubigeo=="200304" & estrato1==7
replace defes = .75004041  if ubigeo=="200304" & estrato1==8
replace defes = .75004041  if ubigeo=="200308" & estrato1==7
replace defes = .79460567  if ubigeo=="200401" & estrato1==3
replace defes = .81202608  if ubigeo=="200401" & estrato1==7
replace defes = .79460567  if ubigeo=="200401" & estrato1==8
replace defes = .75004041  if ubigeo=="200402" & estrato1==8
replace defes = .75004041  if ubigeo=="200403" & estrato1==6
replace defes = .75004041  if ubigeo=="200403" & estrato1==7
replace defes = .81202608  if ubigeo=="200404" & estrato1==7
replace defes = .81202608  if ubigeo=="200409" & estrato1==6
replace defes = .81202608  if ubigeo=="200410" & estrato1==7
replace defes = .79460567  if ubigeo=="200501" & estrato1==3
replace defes = .79460567  if ubigeo=="200505" & estrato1==5
replace defes = .79460567  if ubigeo=="200601" & estrato1==2
replace defes = .81202608  if ubigeo=="200601" & estrato1==7
replace defes = .79460567  if ubigeo=="200601" & estrato1==8
replace defes = .79460567  if ubigeo=="200602" & estrato1==2
replace defes = .81202608  if ubigeo=="200603" & estrato1==5
replace defes = .79460567  if ubigeo=="200604" & estrato1==8
replace defes = .79460567  if ubigeo=="200607" & estrato1==4
replace defes = .79460567  if ubigeo=="200701" & estrato1==3
replace defes = .79460567  if ubigeo=="200703" & estrato1==5
replace defes = .79460567  if ubigeo=="200801" & estrato1==8
replace defes = .79460567  if ubigeo=="200803" & estrato1==5


*21
replace defes = .73304796 if id==21 & estrato1==8
replace defes = .73304796 if id==21 & estrato1==7
replace defes = .73304796 if id==21 & estrato1==6
replace defes = .81303 if id==21 & estrato1==5
replace defes = .81303 if id==21 & estrato1==4
replace defes = .81303 if id==21 & estrato1==2

*22
replace defes = .8315478 if id==22 & estrato1==8
replace defes = .8315478 if id==22 & estrato1==7
replace defes = .8315478 if id==22 & estrato1==6
replace defes = .80923676 if id==22 & estrato1==5
replace defes = .80923676 if id==22 & estrato1==4
replace defes = .80923676 if id==22 & estrato1==3

*23
replace defes = .73304796 if ubigeo=="230408" & estrato1==6
replace defes = .73304796 if ubigeo=="230407" & estrato1==6
replace defes = .73304796 if ubigeo=="230406" & estrato1==6
replace defes = .73304796 if ubigeo=="230201" & estrato1==7
replace defes = .85403317 if id==23 & estrato1==2
replace defes = .73304796 if idpro==2304 & estrato1==6
replace defes = .86793548 if ubigeo=="230103" & estrato1==7
replace defes = .86793548 if ubigeo=="230103" & estrato1==6
replace defes = .86793548 if ubigeo=="230103" & estrato1==8
replace defes = .86793548 if ubigeo=="230105" & estrato1==6
replace defes = .86793548 if ubigeo=="230105" & estrato1==8
replace defes = .73304796 if ubigeo=="230106" & estrato1==8
replace defes = .73304796 if ubigeo=="230107" & estrato1==7

replace defes = .86793548 if ubigeo=="230109" & estrato1==5
replace defes = .86793548 if ubigeo=="230109" & estrato1==7
replace defes = .86793548 if ubigeo=="230101" & estrato1==7



*24
replace defes = .81202608 if id == 24 & estrato1==8
replace defes = .81202608 if id == 24 & estrato1==7
replace defes = .81202608 if id == 24 & estrato1==6
replace defes = .79460567 if id == 24 & estrato1==5
replace defes = .79460567 if id == 24 & estrato1==3
replace defes = .79460567 if id == 24 & estrato1==2



*25
replace defes = .95415074 if id == 25 & estrato1==8
replace defes = .95415074 if id == 25 & estrato1==7
replace defes = .95415074 if id == 25 & estrato1==6
replace defes = .924496 if id == 25 & estrato1==5
replace defes = .924496 if id == 25 & estrato1==2




**Resto


/*

sort defes ubigeo estrato1
sort ubigeo estrato1
edit aÑo id idpro ubigeo estrato1 ld defes nuevo comp

sort comp ubigeo estrato1
edit aÑo id idpro ubigeo estrato1 ld defes comp



*/

replace defes = .75004041 if ubigeo=="010101" & estrato1==7
replace defes = .75004041 if ubigeo=="010109" & estrato1==6
replace defes = .75004041 if ubigeo=="010109" & estrato1==7
replace defes = .75004041 if ubigeo=="010109" & estrato1==8

replace defes = .75004041 if ubigeo=="010110" & estrato1==6
replace defes = .75004041 if ubigeo=="010113" & estrato1==6

replace defes = .80923676 if ubigeo=="010202" & estrato1==5
replace defes = .8315478 if ubigeo=="010203" & estrato1==6
replace defes = .8315478 if ubigeo=="010204" & estrato1==7
replace defes = .8315478 if ubigeo=="010205" & estrato1==8

replace defes = .75004041 if ubigeo=="010305" & estrato1==6
replace defes = .81580621 if ubigeo=="010306" & estrato1==5
replace defes = .75004041 if ubigeo=="010306" & estrato1==8
replace defes = .8315478 if ubigeo=="010309" & estrato1==6
replace defes = .8315478 if ubigeo=="010310" & estrato1==6
replace defes = .8315478 if ubigeo=="010310" & estrato1==8
replace defes = .8315478 if ubigeo=="010312" & estrato1==7

replace defes = .8315478 if ubigeo=="010401" & estrato1==8
replace defes = .75004041 if ubigeo=="010502" & estrato1==7
replace defes = .75004041 if ubigeo=="010502" & estrato1==8
replace defes = .75004041 if ubigeo=="010503" & estrato1==6
replace defes = .75004041 if ubigeo=="010504" & estrato1==6
replace defes = .75004041 if ubigeo=="010505" & estrato1==6
replace defes = .75004041 if ubigeo=="010506" & estrato1==8
replace defes = .75004041 if ubigeo=="010514" & estrato1==8
replace defes = .75004041 if ubigeo=="010515" & estrato1==6
replace defes = .75004041 if ubigeo=="010515" & estrato1==8
replace defes = .75004041 if ubigeo=="010516" & estrato1==8
replace defes = .75004041 if ubigeo=="010519" & estrato1==7
replace defes = .75004041 if ubigeo=="010521" & estrato1==7
replace defes = .75004041 if ubigeo=="010522" & estrato1==6
replace defes = .80923676 if ubigeo=="010601" & estrato1==5
replace defes = .8315478 if ubigeo=="010601" & estrato1==7
replace defes = .8315478 if ubigeo=="010601" & estrato1==8
replace defes = .8315478 if ubigeo=="010605" & estrato1==6
replace defes = .8315478 if ubigeo=="010606" & estrato1==8
replace defes = .8315478 if ubigeo=="010609" & estrato1==6
replace defes = .8315478 if ubigeo=="010609" & estrato1==7
replace defes = .8315478 if ubigeo=="010609" & estrato1==8
replace defes = .80923676 if ubigeo=="010703" & estrato1==5
replace defes = .8315478 if ubigeo=="010704" & estrato1==6




replace defes = .75694716 if ubigeo=="020101" & estrato1==3
replace defes = .75694716 if ubigeo=="020105" & estrato1==3
replace defes = .75694716 if ubigeo=="020108" & estrato1==5
replace defes = .75313884 if ubigeo=="020401" & estrato1==6
replace defes = .75694716 if ubigeo=="020508" & estrato1==5
replace defes = .75313884 if ubigeo=="020603" & estrato1==8
replace defes = .75313884 if ubigeo=="020701" & estrato1==8
replace defes = .89085555 if ubigeo=="020803" & estrato1==6
replace defes = .75694716 if ubigeo=="021001" & estrato1==5
replace defes = .75313884 if ubigeo=="021003" & estrato1==8
replace defes = .89085555 if ubigeo=="021103" & estrato1==6
replace defes = .75694716 if ubigeo=="021201" & estrato1==5
replace defes = .75313884 if ubigeo=="021301" & estrato1==8
replace defes = .75313884 if ubigeo=="021402" & estrato1==6
replace defes = .89085555 if ubigeo=="021405" & estrato1==7
replace defes = .75313884 if ubigeo=="021501" & estrato1==8
replace defes = .75313884 if ubigeo=="021511" & estrato1==6
replace defes = .75313884 if ubigeo=="021701" & estrato1==7
replace defes = .75313884 if ubigeo=="021703" & estrato1==6
replace defes = .75313884 if ubigeo=="021709" & estrato1==8
replace defes = .75313884 if ubigeo=="021802" & estrato1==6
replace defes = .75313884 if ubigeo=="021906" & estrato1==6
replace defes = .75313884 if ubigeo=="021906" & estrato1==7
replace defes = .75313884 if ubigeo=="021908" & estrato1==8
replace defes = .75313884 if ubigeo=="021909" & estrato1==7
replace defes = .75313884 if ubigeo=="021909" & estrato1==8
replace defes = .75313884 if ubigeo=="022001" & estrato1==8
replace defes = .75313884 if ubigeo=="022002" & estrato1==8



replace defes = .73304796 if ubigeo=="040105" & estrato1==7
replace defes = .73304796 if ubigeo=="040105" & estrato1==8
replace defes = .73304796 if ubigeo=="040106" & estrato1==6
replace defes = .86793548 if ubigeo=="040118" & estrato1==8
replace defes = .86793548 if ubigeo=="040121" & estrato1==7
replace defes = .86793548 if ubigeo=="040124" & estrato1==7
replace defes = .81303 if ubigeo=="040128" & estrato1==5
replace defes = .85403317 if ubigeo=="040202" & estrato1==4
replace defes = .86793548 if ubigeo=="040204" & estrato1==7
replace defes = .85403317 if ubigeo=="040205" & estrato1==5
replace defes = .85403317 if ubigeo=="040206" & estrato1==5
replace defes = .73304796 if ubigeo=="040306" & estrato1==6
replace defes = .86793548 if ubigeo=="040308" & estrato1==6
replace defes = .86793548 if ubigeo=="040308" & estrato1==7
replace defes = .73304796 if ubigeo=="040309" & estrato1==8
replace defes = .86793548 if ubigeo=="040311" & estrato1==6
replace defes = .86793548 if ubigeo=="040313" & estrato1==8
replace defes = .73304796 if ubigeo=="040401" & estrato1==8
replace defes = .73304796 if ubigeo=="040406" & estrato1==6
replace defes = .73304796 if ubigeo=="040412" & estrato1==6
replace defes = .85403317 if ubigeo=="040413" & estrato1==5
replace defes = .81303 if ubigeo=="040501" & estrato1==5
replace defes = .81303 if ubigeo=="040505" & estrato1==5
replace defes = .73304796 if ubigeo=="040507" & estrato1==6
replace defes = .73304796 if ubigeo=="040508" & estrato1==7
replace defes = .73304796 if ubigeo=="040509" & estrato1==6
replace defes = .73304796 if ubigeo=="040516" & estrato1==8
replace defes = .81303 if ubigeo=="040520" & estrato1==4
replace defes = .81303 if ubigeo=="040601" & estrato1==5
replace defes = .73304796 if ubigeo=="040604" & estrato1==7
replace defes = .73304796 if ubigeo=="040605" & estrato1==6
replace defes = .73304796 if ubigeo=="040605" & estrato1==7
replace defes = .73304796 if ubigeo=="040606" & estrato1==7
replace defes = .73304796 if ubigeo=="040607" & estrato1==8
replace defes = .73304796 if ubigeo=="040608" & estrato1==8
replace defes = .85403317 if ubigeo=="040704" & estrato1==5
replace defes = .86793548 if ubigeo=="040705" & estrato1==6
replace defes = .85403317 if ubigeo=="040706" & estrato1==5
replace defes = .73304796 if ubigeo=="040805" & estrato1==6
replace defes = .73304796 if ubigeo=="040805" & estrato1==7
replace defes = .73304796 if ubigeo=="040806" & estrato1==8
replace defes = .73304796 if ubigeo=="040806" & estrato1==8

replace defes = .81580621 if ubigeo=="060301" & estrato1==5
replace defes = .75004041 if ubigeo=="060507" & estrato1==6
replace defes = .81580621 if ubigeo=="060601" & estrato1==5
replace defes = .75004041 if ubigeo=="060601" & estrato1==8
replace defes = .75004041 if ubigeo=="060602" & estrato1==7
replace defes = .75004041 if ubigeo=="060608" & estrato1==8
replace defes = .75004041 if ubigeo=="060609" & estrato1==7
replace defes = .8315478 if ubigeo=="060610" & estrato1==6
replace defes = .75004041 if ubigeo=="060611" & estrato1==7
replace defes = .75004041 if ubigeo=="060614" & estrato1==7
replace defes = .75004041 if ubigeo=="060702" & estrato1==8
replace defes = .75004041 if ubigeo=="060703" & estrato1==8
replace defes = .8315478 if ubigeo=="060802" & estrato1==7
replace defes = .8315478 if ubigeo=="060802" & estrato1==8
replace defes = .8315478 if ubigeo=="060804" & estrato1==6
replace defes = .8315478 if ubigeo=="060805" & estrato1==7
replace defes = .8315478 if ubigeo=="060807" & estrato1==8
replace defes = .75004041 if ubigeo=="060810" & estrato1==6
replace defes = .8315478 if ubigeo=="060905" & estrato1==8
replace defes = .75004041 if ubigeo=="060907" & estrato1==7
replace defes = .75004041 if ubigeo=="061003" & estrato1==7
replace defes = .75004041 if ubigeo=="061004" & estrato1==7
replace defes = .75004041 if ubigeo=="061007" & estrato1==8
replace defes = .75004041 if ubigeo=="061101" & estrato1==7
replace defes = .75004041 if ubigeo=="061109" & estrato1==8
replace defes = .75004041 if ubigeo=="061111" & estrato1==8
replace defes = .75004041 if ubigeo=="061113" & estrato1==7
replace defes = .75004041 if ubigeo=="061201" & estrato1==7
replace defes = .75004041 if ubigeo=="061301" & estrato1==7
replace defes = .75004041 if ubigeo=="061302" & estrato1==6
replace defes = .75004041 if ubigeo=="061303" & estrato1==6
replace defes = .75004041 if ubigeo=="061306" & estrato1==7
replace defes = .75004041 if ubigeo=="061307" & estrato1==7

replace defes = .89085555 if ubigeo=="110103" & estrato1==8
replace defes = .89085555 if ubigeo=="110104" & estrato1==8
replace defes = .89085555 if ubigeo=="110105" & estrato1==8
replace defes = .89085555 if ubigeo=="110109" & estrato1==8
replace defes = .89085555 if ubigeo=="110110" & estrato1==8
replace defes = .89085555 if ubigeo=="110111" & estrato1==8
replace defes = .89085555 if ubigeo=="110204" & estrato1==8
replace defes = .89085555 if ubigeo=="110205" & estrato1==8
replace defes = .75313884 if ubigeo=="110208" & estrato1==8
replace defes = .89085555 if ubigeo=="110211" & estrato1==8
replace defes = .89085555 if ubigeo=="110301" & estrato1==8
replace defes = .89085555 if ubigeo=="110305" & estrato1==8
replace defes = .89085555 if ubigeo=="110404" & estrato1==8
replace defes = .85583431 if ubigeo=="110501" & estrato1==3
replace defes = .89085555 if ubigeo=="110502" & estrato1==8
replace defes = .89085555 if ubigeo=="110503" & estrato1==8
replace defes = .85583431 if ubigeo=="110506" & estrato1==3
replace defes = .85583431 if ubigeo=="110507" & estrato1==3
replace defes = .85583431 if ubigeo=="110508" & estrato1==3



replace defes = .80923676 if ubigeo=="120302" & estrato1==4
replace defes = .80923676 if ubigeo=="120601" & estrato1==4


replace defes = .79460567 if ubigeo=="130109" & estrato1==5
replace defes = .81202608 if ubigeo=="130110" & estrato1==6
replace defes = .79460567 if ubigeo=="130206" & estrato1==5
replace defes = .75004041 if ubigeo=="130301" & estrato1==6
replace defes = .79460567 if ubigeo=="130402" & estrato1==5
replace defes = .79460567 if ubigeo=="130604" & estrato1==6
replace defes = .79460567 if ubigeo=="130701" & estrato1==5
replace defes = .81580621 if ubigeo=="131001" & estrato1==5
replace defes = .75004041 if ubigeo=="131004" & estrato1==6
replace defes = .79460567 if ubigeo=="131202" & estrato1==5


replace defes = .85583431 if ubigeo=="150203" & estrato1==4
replace defes = .75694716 if ubigeo=="150301" & estrato1==5
replace defes = .75313884 if ubigeo=="150302" & estrato1==6
replace defes = .75313884 if ubigeo=="150305" & estrato1==7
replace defes = .75313884 if ubigeo=="150402" & estrato1==7
replace defes = .89085555 if ubigeo=="150502" & estrato1==7
replace defes = .89085555 if ubigeo=="150503" & estrato1==8
replace defes = .89085555 if ubigeo=="150504" & estrato1==7
replace defes = .89085555 if ubigeo=="150509" & estrato1==7
replace defes = .85583431 if ubigeo=="150512" & estrato1==5
replace defes = .75313884 if ubigeo=="150603" & estrato1==6
replace defes = .89085555 if ubigeo=="150604" & estrato1==7
replace defes = .89085555 if ubigeo=="150605" & estrato1==7
replace defes = .89085555 if ubigeo=="150606" & estrato1==7
replace defes = .75313884 if ubigeo=="150708" & estrato1==6
replace defes = .75313884 if ubigeo=="150708" & estrato1==7
replace defes = .75694716 if ubigeo=="150714" & estrato1==5
replace defes = .75313884 if ubigeo=="150717" & estrato1==6
replace defes = .75313884 if ubigeo=="150718" & estrato1==6
replace defes = .75313884 if ubigeo=="150723" & estrato1==7
replace defes = .75313884 if ubigeo=="150723" & estrato1==8
replace defes = .75313884 if ubigeo=="150727" & estrato1==6
replace defes = .75313884 if ubigeo=="150802" & estrato1==8
replace defes = .75313884 if ubigeo=="150804" & estrato1==6
replace defes = .89085555 if ubigeo=="150806" & estrato1==7
replace defes = .75313884 if ubigeo=="150808" & estrato1==6
replace defes = .85583431 if ubigeo=="150811" & estrato1==5
replace defes = .89085555 if ubigeo=="150812" & estrato1==8
replace defes = .75694716 if ubigeo=="150901" & estrato1==5
replace defes = .75313884 if ubigeo=="151014" & estrato1==8
replace defes = .75313884 if ubigeo=="151017" & estrato1==6
replace defes = .75313884 if ubigeo=="151022" & estrato1==6
replace defes = .75313884 if ubigeo=="151023" & estrato1==6
replace defes = .75313884 if ubigeo=="151030" & estrato1==6

replace defes = .95415074 if ubigeo=="170103" & estrato1==7
replace defes = .95415074 if ubigeo=="170104" & estrato1==7
replace defes = .95415074 if ubigeo=="170201" & estrato1==8
replace defes = .95415074 if ubigeo=="170202" & estrato1==6
replace defes = .95415074 if ubigeo=="170301" & estrato1==6


replace defes = .95415074 if ubigeo=="180103" & estrato1==6
replace defes = .95415074 if ubigeo=="180104" & estrato1==8
replace defes = .81303 if ubigeo=="180105" & estrato1==5
replace defes = .73304796 if ubigeo=="180106" & estrato1==7
replace defes = .73304796 if ubigeo=="180106" & estrato1==7


replace defes = .75313884 if ubigeo=="1910103" & estrato1==7
replace defes = .75313884 if ubigeo=="1910105" & estrato1==7
replace defes = .75313884 if ubigeo=="1910110" & estrato1==6
replace defes = .75313884 if ubigeo=="1910110" & estrato1==8
replace defes = .75313884 if ubigeo=="1910112" & estrato1==8
replace defes = .75313884 if ubigeo=="1910202" & estrato1==6
replace defes = .75313884 if ubigeo=="1910202" & estrato1==7
replace defes = .75313884 if ubigeo=="1910202" & estrato1==8
replace defes = .75313884 if ubigeo=="1910204" & estrato1==6
replace defes = .75313884 if ubigeo=="1910208" & estrato1==6
replace defes = .80923676 if ubigeo=="1910301" & estrato1==5
replace defes = .8315478 if ubigeo=="1910303" & estrato1==8
replace defes = .8315478 if ubigeo=="1910305" & estrato1==8


replace defes = .81202608 if ubigeo=="200101" & estrato1==7
replace defes = .79460567 if ubigeo=="200111" & estrato1==5
replace defes = .75004041 if ubigeo=="200201" & estrato1==8
replace defes = .75004041 if ubigeo=="200204" & estrato1==7
replace defes = .81202608 if ubigeo=="200207" & estrato1==7
replace defes = .81202608 if ubigeo=="200208" & estrato1==7
replace defes = .81202608 if ubigeo=="200209" & estrato1==7
replace defes = .81580621 if ubigeo=="200301" & estrato1==5
replace defes = .75004041 if ubigeo=="200301" & estrato1==8
replace defes = .75004041 if ubigeo=="200303" & estrato1==7
replace defes = .81202608 if ubigeo=="200305" & estrato1==6
replace defes = .81202608 if ubigeo=="200306" & estrato1==7
replace defes = .81202608 if ubigeo=="200306" & estrato1==8
replace defes = .75004041 if ubigeo=="200308" & estrato1==8
replace defes = .79460567 if ubigeo=="200406" & estrato1==5
replace defes = .81202608 if ubigeo=="200409" & estrato1==7
replace defes = .79460567 if ubigeo=="200502" & estrato1==5
replace defes = .81202608 if ubigeo=="200505" & estrato1==7
replace defes = .81202608 if ubigeo=="200505" & estrato1==8
replace defes = .81202608 if ubigeo=="200604" & estrato1==7
replace defes = .81202608 if ubigeo=="200704" & estrato1==6
replace defes = .79460567 if ubigeo=="200801" & estrato1==4
replace defes = .81202608 if ubigeo=="200803" & estrato1==8


replace defes = .80923676 if ubigeo=="220901" & estrato1==2
replace defes = .80923676 if ubigeo=="220909" & estrato1==2
replace defes = .80923676 if ubigeo=="220910" & estrato1==2


replace defes = .86793548 if ubigeo=="230105" & estrato1==7
replace defes = .73304796 if ubigeo=="230106" & estrato1==6
replace defes = .73304796 if ubigeo=="230106" & estrato1==7
replace defes = .86793548 if ubigeo=="230108" & estrato1==8
replace defes = .86793548 if ubigeo=="230109" & estrato1==6
replace defes = .86793548 if ubigeo=="230110" & estrato1==8
replace defes = .81303 if ubigeo=="230201" & estrato1==5
replace defes = .73304796 if ubigeo=="230201" & estrato1==6
replace defes = .73304796 if ubigeo=="230201" & estrato1==8
replace defes = .73304796 if ubigeo=="230202" & estrato1==6
replace defes = .73304796 if ubigeo=="230202" & estrato1==7
replace defes = .73304796 if ubigeo=="230203" & estrato1==6
replace defes = .73304796 if ubigeo=="230203" & estrato1==7
replace defes = .73304796 if ubigeo=="230204" & estrato1==6
replace defes = .73304796 if ubigeo=="230205" & estrato1==6
replace defes = .73304796 if ubigeo=="230206" & estrato1==6
replace defes = .86793548 if ubigeo=="230301" & estrato1==6
replace defes = .86793548 if ubigeo=="230301" & estrato1==7
replace defes = .81303 if ubigeo=="230302" & estrato1==5
replace defes = .73304796 if ubigeo=="230302" & estrato1==8
replace defes = .86793548 if ubigeo=="230303" & estrato1==6
replace defes = .86793548 if ubigeo=="230303" & estrato1==7
replace defes = .81303 if ubigeo=="230401" & estrato1==5
replace defes = .73304796 if ubigeo=="230401" & estrato1==7
replace defes = .73304796 if ubigeo=="230402" & estrato1==8



replace defes = .75004041 if ubigeo=="010503" & estrato1==8
replace defes = .75313884 if ubigeo=="021501" & estrato1==6
replace defes = .73304796 if ubigeo=="040811" & estrato1==6
replace defes = .75004041 if ubigeo=="061306" & estrato1==8
replace defes = .89085555 if ubigeo=="110114" & estrato1==8
replace defes = .75313884 if ubigeo=="110209" & estrato1==8
replace defes = .75004041 if ubigeo=="130606" & estrato1==6
replace defes = .75004041 if ubigeo=="130606" & estrato1==7
replace defes = .89085555 if ubigeo=="150203" & estrato1==7
replace defes = .85583431 if ubigeo=="150509" & estrato1==4
replace defes = .75313884 if ubigeo=="150603" & estrato1==8
replace defes = .75313884 if ubigeo=="150901" & estrato1==7
replace defes = .95415074 if ubigeo=="170201" & estrato1==7
replace defes = .95415074 if ubigeo=="170202" & estrato1==8
replace defes = .75313884 if ubigeo=="190103" & estrato1==7
replace defes = .75694716 if ubigeo=="190105" & estrato1==7
replace defes = .75313884 if ubigeo=="190110" & estrato1==6
replace defes = .75313884 if ubigeo=="190110" & estrato1==8
replace defes = .75313884 if ubigeo=="190112" & estrato1==8
replace defes = .75313884 if ubigeo=="190202" & estrato1==6
replace defes = .75313884 if ubigeo=="190202" & estrato1==7
replace defes = .75313884 if ubigeo=="190202" & estrato1==8
replace defes = .75313884 if ubigeo=="190204" & estrato1==6
replace defes = .75313884 if ubigeo=="190204" & estrato1==8
replace defes = .75313884 if ubigeo=="190208" & estrato1==6
replace defes = .80923676 if ubigeo=="190301" & estrato1==5
replace defes = .8315478 if ubigeo=="190303" & estrato1==6
replace defes = .8315478 if ubigeo=="190303" & estrato1==8
replace defes = .8315478 if ubigeo=="190305" & estrato1==8
replace defes = .81202608 if ubigeo=="200406" & estrato1==8
replace defes = .86793548 if ubigeo=="230109" & estrato1==8
replace defes = .79460567 if ubigeo=="200506" & estrato1==5


*arreglar ld diferente a defes


/*

g nuevo=ld
replace nuevo=defes if ld == .
g comp = 1 if nuevo == defes

sort ubigeo estrato1
sort defes ubigeo estrato1
sort comp ubigeo estrato1
edit aÑo id idpro ubigeo estrato1 ld defes nuevo comp


drop nuevo
drop comp

*/


replace defes = .89085555 if ubigeo=="021801" & estrato1==7
replace defes = .75313884 if ubigeo=="021804" & estrato1==7
replace defes = .89085555 if ubigeo=="021805" & estrato1==7

replace defes = ld if ubigeo=="040520" & estrato1==4
replace defes = .81303 if ubigeo=="040520" & estrato1==4 & ld==.

replace defes = .75694716 if ubigeo=="050108" & estrato1==5
replace defes = .75694716 if ubigeo=="050202" & estrato1==5
replace defes = .75694716 if ubigeo=="050301" & estrato1==5
replace defes = .75694716 if ubigeo=="050501" & estrato1==5
replace defes = .8315478 if ubigeo=="050507" & estrato1==7
replace defes = .75694716 if ubigeo=="050705" & estrato1==5
replace defes = .75694716 if ubigeo=="051101" & estrato1==5
replace defes = .8315478 if ubigeo=="060405" & estrato1==6
replace defes = .8120261 if ubigeo=="060505" & estrato1==7
replace defes = .7500404 if ubigeo=="060607" & estrato1==7
replace defes = .8315478 if ubigeo=="080901" & estrato1==7
replace defes = .8315478 if ubigeo=="100601" & estrato1==7
replace defes = .8315478 if ubigeo=="100602" & estrato1==6
replace defes = .8315478 if ubigeo=="100602" & estrato1==7
replace defes = .8315478 if ubigeo=="100603" & estrato1==7
replace defes = .80923676 if ubigeo=="100604" & estrato1==5
replace defes = .8315478 if ubigeo=="100604" & estrato1==7
replace defes = .8315478 if ubigeo=="100604" & estrato1==8
replace defes = .8315478 if ubigeo=="100605" & estrato1==6
replace defes = .8315478 if ubigeo=="100605" & estrato1==7
replace defes = .8315478 if ubigeo=="100606" & estrato1==6
replace defes = .8315478 if ubigeo=="100606" & estrato1==7
replace defes = .8315478 if ubigeo=="100606" & estrato1==8
replace defes = .80923676 if ubigeo=="100901" & estrato1==5
replace defes = .8315478 if ubigeo=="100901" & estrato1==7
replace defes = .8315478 if ubigeo=="100903" & estrato1==7
replace defes = .8315478 if ubigeo=="100904" & estrato1==7
replace defes = .8315478 if ubigeo=="100904" & estrato1==8
replace defes = .8315478 if ubigeo=="100905" & estrato1==6
replace defes = .8315478 if ubigeo=="100905" & estrato1==7
replace defes = .75313884 if ubigeo=="110203" & estrato1==6
replace defes = .75313884 if ubigeo=="110208" & estrato1==6
replace defes = .75313884 if ubigeo=="110405" & estrato1==6
replace defes = .80923676 if ubigeo=="120303" & estrato1==5
replace defes = .8315478 if ubigeo=="120305" & estrato1==7
replace defes = .8315478 if ubigeo=="120603" & estrato1==7
replace defes = .8315478 if ubigeo=="120608" & estrato1==7
replace defes = .7500404 if ubigeo=="130302" & estrato1==7
replace defes = .7500404 if ubigeo=="130602" & estrato1==7
replace defes = .7500404 if ubigeo=="130604" & estrato1==6
replace defes = .7500404 if ubigeo=="130613" & estrato1==7
replace defes = .8120261 if ubigeo=="130702" & estrato1==8
replace defes = .7500404 if ubigeo=="130803" & estrato1==7
replace defes = .7500404 if ubigeo=="131007" & estrato1==7
replace defes = .7500404 if ubigeo=="140202" & estrato1==7
replace defes = .7500404 if ubigeo=="140203" & estrato1==7
replace defes = .7500404 if ubigeo=="140203" & estrato1==8
replace defes = .95415074 if ubigeo=="170102" & estrato1==6
replace defes = .73304796 if ubigeo=="180103" & estrato1==6
replace defes = .8679355 if ubigeo=="180104" & estrato1==8
replace defes = .75313884 if ubigeo=="190105" & estrato1==7
replace defes = .75313884 if ubigeo=="190105" & estrato1==8
replace defes = .75313884 if ubigeo=="190110" & estrato1==7
replace defes = .75313884 if ubigeo=="190112" & estrato1==7
replace defes = .75313884 if ubigeo=="190205" & estrato1==6
replace defes = .8120261 if ubigeo=="200205" & estrato1==8
replace defes = .8315478 if ubigeo=="210309" & estrato1==7
replace defes = .8315478 if ubigeo=="210309" & estrato1==7
replace defes = .80923676 if ubigeo=="211207" & estrato1==5
replace defes = .8315478 if ubigeo=="211207" & estrato1==7
replace defes = .8315478 if ubigeo=="211209" & estrato1==7
replace defes = .8315478 if ubigeo=="211209" & estrato1==8







