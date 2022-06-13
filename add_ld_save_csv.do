**************************************************************

* Agrega los valores de la variable deflactor espacial (ld)
* para los años anteriores al 2012

**************************************************************
* Así como el IPC captura las diferencias de poder adquisitivo
* en el tiempo, el deflactor espacial captura las diferencias
* de poder adquisitivo en el espacio, siendo que diversas
* regiones poseen niveles de precios diferentes (debido a la
* no existencia de un único mercado nacional y los costos de
* transporte diferenciados)
* Usar esta variable nos permite obtener indicadores (de
* ingresos y gastos) no sesgados
* https://www.inei.gob.pe/media/cifras_de_pobreza/nota01.pdf

* Dominios de estudio:
* Costa (urbana y rural), sierra (urbana y rural),
* selva (urbana y rural) y Lima Metropolitana


**************************************************************

* A partir de los microdatos del INEI de ENAHO - metodología 
* actualizada para los años 2012-2021, módulo 34: sumarias
* (http://iinei.inei.gob.pe/microdatos/)
* obtenemos los datos que serán de nuestras variables
* regresoras (ubigeo, departamento y estrato) y explicada
* (deflactor espacial) y los guardamos en un archivo .csv
* a fin de importarlo como dataframe en python


***************************************************************

clear all

cd "D:\Universidad\ENAHO-sumarias"

use sumaria-2012.dta,clear

forvalue j=2013/2021{
append using sumaria-`j'.dta
}

replace aÑo = año if aÑo==""
drop año

gen id = substr(ubigeo, 1, 2)
destring(id), generate(dept)
drop id

gen estrato_ = estrato

keep aÑo ubigeo dept estrato_ ld

export delimited using "C:\Users\Fabian\Desktop\data_2012-2021.csv", replace



******************************************************************

* De igual manera, obtenemos los datos para los años 2004-2011, pero antes, añadimos los valores para el deflactor espacial que se infirieron manualmente (con base en las mismas variables que usaremos como regresoras)


******************************************************************


clear all

cd "D:\Universidad\ENAHO-sumarias"


* Cargar todos los .dta (2004-2017)

use sumaria-2004.dta,clear

forvalue j=2005/2011{
append using sumaria-`j'.dta
}


* Para el periodo 2004-2011 la columna def_es no existe
gen def_es = .


* Valores de def_es (ld):
/*
  .733048	.7500404	.7531388	.7569472
 .7946057	.8092368	.8120261	  .81303
 .8158062	.8315478	.8540332	.8558343
 .8679355	.8908556	 .924496	.9541507
       1
*/


* Generamos una nueva variable para el departamento,
* llamada dept, cuyos valores están dados por los 2
* primeros dígitos de la variable ubigeo convertidas
* de string a numérica
/*
01	Amazonas	07	Callao			13	La Libertad		19	Pasco		25	Ucayali	
02	Áncash		08	Cusco			14	Lambayeque		20	Piura	
03	Apurímac	09	Huancavelica	15	Lima			21	Puno		
04	Arequipa	10	Huánuco			16	Loreto			22	San Martín	
05	Ayacucho	11	Ica				17	Madre de Dios	23	Tacna				
06	Cajamarca	12	Junín			18	Moquegua		24	Tumbes
*/

gen id = substr(ubigeo, 1, 2)
destring(id), generate(dept)
drop id

gen id = substr(ubigeo,1,4)
destring(id), generate(prov)
drop id

* Generamos una copia de la variable estrato para que
* no tenga etiquetas de valor
gen estrato_ = estrato


/*

sort aÑo
sort def_es
edit def_es aÑo ubigeo estrato_ ld

*/




* 01: Amazonas

replace def_es = .81580621 if ubigeo=="010101" & estrato_==4
replace def_es = .75004041 if ubigeo=="010110" & estrato_==8
replace def_es = .75004041 if ubigeo=="010111" & estrato_==6
replace def_es = .75004041 if ubigeo=="010114" & estrato_==7
replace def_es = .75004041 if ubigeo=="010114" & estrato_==8
replace def_es = .75004041 if ubigeo=="010120" & estrato_==6
replace def_es = .75004041 if ubigeo=="010120" & estrato_==8
replace def_es = .80923676 if ubigeo=="010201" & estrato_==4
replace def_es = .8315478 if ubigeo=="010201" & estrato_==7
replace def_es = .8315478 if ubigeo=="010202" & estrato_==7
replace def_es = .8315478 if ubigeo=="010203" & estrato_==7
replace def_es = .8315478 if ubigeo=="010205" & estrato_==7
replace def_es = .80923676 if ubigeo=="010312" & estrato_==5
replace def_es = .8315478 if ubigeo=="010312" & estrato_==8
replace def_es = .8315478 if ubigeo=="010401" & estrato_==7
replace def_es = .8315478 if ubigeo=="010402" & estrato_==7
replace def_es = .80923676 if ubigeo=="010403" & estrato_==5
replace def_es = .8315478 if ubigeo=="010403" & estrato_==6
replace def_es = .8315478 if ubigeo=="010403" & estrato_==8
replace def_es = .81580621 if ubigeo=="010501" & estrato_==5
replace def_es = .75004041 if ubigeo=="010503" & estrato_==7
replace def_es = .75004041 if ubigeo=="010504" & estrato_==7
replace def_es = .81580621 if ubigeo=="010509" & estrato_==5
replace def_es = .75004041 if ubigeo=="010509" & estrato_==7
replace def_es = .75004041 if ubigeo=="010510" & estrato_==6
replace def_es = .75004041 if ubigeo=="010513" & estrato_==8
replace def_es = .75004041 if ubigeo=="010521" & estrato_==6
replace def_es = .75004041 if ubigeo=="010521" & estrato_==8
replace def_es = .75004041 if ubigeo=="010523" & estrato_==8
replace def_es = .8315478 if ubigeo=="010602" & estrato_==7
replace def_es = .8315478 if ubigeo=="010603" & estrato_==6
replace def_es = .8315478 if ubigeo=="010604" & estrato_==6
replace def_es = .8315478 if ubigeo=="010604" & estrato_==7
replace def_es = .8315478 if ubigeo=="010604" & estrato_==8
replace def_es = .8315478 if ubigeo=="010607" & estrato_==7
replace def_es = .8315478 if ubigeo=="010611" & estrato_==8
replace def_es = .80923676 if ubigeo=="010701" & estrato_==4
replace def_es = .8315478 if ubigeo=="010701" & estrato_==7
replace def_es = .80923676 if ubigeo=="010702" & estrato_==5
replace def_es = .8315478 if ubigeo=="010702" & estrato_==7
replace def_es = .8315478 if ubigeo=="010703" & estrato_==7
replace def_es = .8315478 if prov==107 & estrato_==7
replace def_es = .8315478 if prov==107 & estrato_==8
replace def_es = .8315478 if ubigeo=="010707" & estrato_==6
replace def_es = .8315478 if ubigeo=="010705" & estrato_==6


* 02: Áncash

replace def_es = .75694716 if prov==201 & estrato_==2
replace def_es = .75313884 if prov==201 & estrato_==6
replace def_es = .75313884 if prov==201 & estrato_==7
replace def_es = .75313884 if prov==201 & estrato_==8
replace def_es = .75313884 if prov==203 & estrato_==6
replace def_es = .75313884 if prov==203 & estrato_==7
replace def_es = .75313884 if prov==203 & estrato_==8
replace def_es = .75313884 if prov==204 & estrato_==7
replace def_es = .75694716 if prov==204 & estrato_==5
replace def_es = .75313884 if prov==204 & estrato_==8
replace def_es = .75313884 if prov==205 & estrato_==6
replace def_es = .75313884 if prov==205 & estrato_==7
replace def_es = .75313884 if prov==205 & estrato_==8
replace def_es = .75694716 if prov==206 & estrato_==5
replace def_es = .75313884 if prov==206 & estrato_==7
replace def_es = .75313884 if prov==207 & estrato_==7

replace def_es = .85583431 if prov==208 & estrato_==4
replace def_es = .89085555 if prov==208 & estrato_==7
replace def_es = .89085555 if prov==208 & estrato_==8

replace def_es = .75313884 if prov==210 & estrato_==6
replace def_es = .75313884 if prov==210 & estrato_==7

replace def_es = .85583431 if prov==211 & estrato_==5
replace def_es = .75313884 if ubigeo=="021102" & estrato_==8
replace def_es = .75313884 if prov==212 & estrato_==6
replace def_es = .75313884 if prov==212 & estrato_==7
replace def_es = .75313884 if prov==213 & estrato_==7
replace def_es = .75313884 if prov==215 & estrato_==7

replace def_es = .75694716 if prov==216 & estrato_==5
replace def_es = .75694716 if prov==216 & estrato_==5
replace def_es = .75313884 if prov==216 & estrato_==7
replace def_es = .75313884 if prov==216 & estrato_==8
replace def_es = .85583431 if prov==218 & estrato_==2
replace def_es = .85583431 if prov==218 & estrato_==5
replace def_es = .85583431 if prov==218 & estrato_==7
replace def_es = .75313884 if ubigeo=="021802" & estrato_==7

replace def_es = .85583431 if ubigeo=="021805" & estrato_==7
replace def_es = .75313884 if ubigeo=="021903" & estrato_==8
replace def_es = .75313884 if ubigeo=="021907" & estrato_==7
replace def_es = .75313884 if ubigeo=="021910" & estrato_==8
replace def_es = .75313884 if prov==220 & estrato_==7
replace def_es = .75694716 if prov==220 & estrato_==5


* 03: Apurímac

replace def_es = .81303 if dept==3 & estrato_==3
replace def_es = .81303 if dept==3 & estrato_==4
replace def_es = .81303 if dept==3 & estrato_==5
replace def_es = .73304796 if dept==3 & estrato_==6
replace def_es = .73304796 if dept==3 & estrato_==7
replace def_es = .73304796 if dept==3 & estrato_==8


* 04: Arequipa

replace def_es = .81303 if ubigeo=="040101" & estrato_==1
replace def_es = .81303 if ubigeo=="040102" & estrato_==1
replace def_es = .81303 if ubigeo=="040103" & estrato_==1
replace def_es = .81303 if ubigeo=="040104" & estrato_==1
replace def_es = .81303 if ubigeo=="040107" & estrato_==1

replace def_es = .85403317 if ubigeo=="040108" & estrato_==5
replace def_es = .86793548 if ubigeo=="040108" & estrato_==7

replace def_es = .81303 if ubigeo=="040109" & estrato_==1
replace def_es = .81303 if ubigeo=="040110" & estrato_==1
replace def_es = .81303 if ubigeo=="040112" & estrato_==1
replace def_es = .81303 if ubigeo=="040116" & estrato_==1
replace def_es = .81303 if ubigeo=="040117" & estrato_==1
replace def_es = .85403317 if ubigeo=="040121" & estrato_==5
replace def_es = .81303 if ubigeo=="040122" & estrato_==1
replace def_es = .81303 if ubigeo=="040123" & estrato_==1
replace def_es = .81303 if ubigeo=="040124" & estrato_==5
replace def_es = .81303 if ubigeo=="040126" & estrato_==1
replace def_es = .81303 if ubigeo=="040126" & estrato_==4
replace def_es = .81303 if ubigeo=="040128" & estrato_==4
replace def_es = .81303 if ubigeo=="040129" & estrato_==1
replace def_es = .85403317 if ubigeo=="040201" & estrato_==4
replace def_es = .85403317 if ubigeo=="040204" & estrato_==4
replace def_es = .73304796 if ubigeo=="040119" & estrato_==7
replace def_es = .73304796 if ubigeo=="040121" & estrato_==8
replace def_es = .86793548 if ubigeo=="040205" & estrato_==8
replace def_es = .86793548 if ubigeo=="040206" & estrato_==6
replace def_es = .86793548 if ubigeo=="040206" & estrato_==8
replace def_es = .85403317 if ubigeo=="040208" & estrato_==4

replace def_es = .86793548 if ubigeo=="040208" & estrato_==7
replace def_es = .86793548 if ubigeo=="040302" & estrato_==7
replace def_es = .85403317 if ubigeo=="040303" & estrato_==5
replace def_es = .86793548 if ubigeo=="040306" & estrato_==8
replace def_es = .73304796 if ubigeo=="040401" & estrato_==7
replace def_es = .73304796 if ubigeo=="040406" & estrato_==8
replace def_es = .81303 if ubigeo=="040410" & estrato_==5
replace def_es = .73304796 if ubigeo=="040410" & estrato_==7
replace def_es = .73304796 if ubigeo=="040410" & estrato_==8
replace def_es = .73304796 if ubigeo=="040504" & estrato_==7
replace def_es = .73304796 if ubigeo=="040506" & estrato_==6
replace def_es = .73304796 if ubigeo=="040517" & estrato_==6
replace def_es = .73304796 if ubigeo=="040519" & estrato_==8
replace def_es = .81303 if ubigeo=="040520" & estrato_==5
replace def_es = .73304796 if ubigeo=="040520" & estrato_==7
replace def_es = .73304796 if ubigeo=="040603" & estrato_==7
replace def_es = .73304796 if ubigeo=="040603" & estrato_==4
replace def_es = .85403317 if ubigeo=="040701" & estrato_==4
replace def_es = .86793548 if ubigeo=="040702" & estrato_==8
replace def_es = .73304796 if ubigeo=="040801" & estrato_==8
replace def_es = .73304796 if ubigeo=="040803" & estrato_==6
replace def_es = .73304796 if ubigeo=="040807" & estrato_==7


* 05: Ayacucho

replace def_es = .75694716 if dept==5 & estrato_==2
replace def_es = .75313884 if dept==5 & estrato_==7
replace def_es = .75313884 if dept==5 & estrato_==8
replace def_es = .75313884 if dept==5 & estrato_==6
replace def_es = .75313884 if dept==5 & estrato_==5
replace def_es = .75694716 if dept==5 & estrato_==4
	
replace def_es = .80923676 if ubigeo=="050407" & estrato_==5
replace def_es = .8315478 if ubigeo=="050407" & estrato_==7
replace def_es = .8315478 if ubigeo=="050407" & estrato_==8
replace def_es = .80923676 if ubigeo=="050408" & estrato_==5
replace def_es = .8315478 if ubigeo=="050408" & estrato_==7
replace def_es = .8315478 if ubigeo=="050408" & estrato_==8
replace def_es = .8315478 if ubigeo=="050409" & estrato_==7

replace def_es = .75694716 if ubigeo=="050502" & estrato_==5
replace def_es = .80923676 if ubigeo=="050503" & estrato_==5
replace def_es = .8315478 if ubigeo=="050503" & estrato_==7
replace def_es = .80923676 if ubigeo=="050507" & estrato_==5
replace def_es = .75694716 if ubigeo=="050508" & estrato_==5
replace def_es = .80923676 if ubigeo=="050509" & estrato_==5
replace def_es = .8315478 if ubigeo=="050509" & estrato_==7
replace def_es = .75694716 if ubigeo=="050601" & estrato_==5
replace def_es = .75694716 if ubigeo=="050602" & estrato_==5
replace def_es = .75694716 if ubigeo=="050604" & estrato_==5
replace def_es = .75694716 if ubigeo=="050701" & estrato_==5
replace def_es = .75694716 if ubigeo=="050801" & estrato_==5
replace def_es = .75694716 if ubigeo=="051001" & estrato_==5
replace def_es = .75694716 if ubigeo=="051005" & estrato_==5
replace def_es = .75694716 if ubigeo=="051010" & estrato_==5
replace def_es = .75694716 if ubigeo=="051011" & estrato_==5


* 06: Cajamarca

replace def_es = .81580621 if prov==601 & estrato_==2
replace def_es = .75004041 if prov==601 & estrato_==7
replace def_es = .75004041 if prov==601 & estrato_==8
replace def_es = .81580621 if prov==602 & estrato_==5
replace def_es = .75004041 if prov==602 & estrato_==7
replace def_es = .75004041 if prov==602 & estrato_==8
replace def_es = .75004041 if prov==603 & estrato_==7
replace def_es = .75004041 if prov==603 & estrato_==8
replace def_es = .75004041 if prov==603 & estrato_==6
replace def_es = .81580621 if prov==604 & estrato_==5
replace def_es = .75004041 if prov==604 & estrato_==7
replace def_es = .75004041 if prov==604 & estrato_==8
replace def_es = .8315478 if ubigeo=="060405" & estrato_==8
replace def_es = .75004041 if prov==604 & estrato_==6
replace def_es = .75004041 if prov==605 & estrato_==7
replace def_es = .75004041 if ubigeo=="060601" & estrato_==7
replace def_es = .75004041 if ubigeo=="060607" & estrato_==7
replace def_es = .75004041 if ubigeo=="060612" & estrato_==7
replace def_es = .75004041 if ubigeo=="060613" & estrato_==7
replace def_es = .75004041 if ubigeo=="060613" & estrato_==8
replace def_es = .81580621 if ubigeo=="060701" & estrato_==5
replace def_es = .75004041 if ubigeo=="060701" & estrato_==7
replace def_es = .75004041 if ubigeo=="060701" & estrato_==8
replace def_es = .75004041 if ubigeo=="060703" & estrato_==7
replace def_es = .80923676 if dept==6 & estrato_==3
replace def_es = .8315478 if ubigeo=="060801" & estrato_==7
replace def_es = .8315478 if ubigeo=="060801" & estrato_==8
replace def_es = .8315478 if ubigeo=="060807" & estrato_==7
replace def_es = .81580621 if ubigeo=="060808" & estrato_==5
replace def_es = .8315478 if ubigeo=="060808" & estrato_==7
replace def_es = .8315478 if ubigeo=="060811" & estrato_==7
replace def_es = .8315478 if ubigeo=="060812" & estrato_==7
replace def_es = .80923676 if ubigeo=="060901" & estrato_==5
replace def_es = .8315478 if ubigeo=="060901" & estrato_==7
replace def_es = .8315478 if ubigeo=="060902" & estrato_==7
replace def_es = .8315478 if ubigeo=="060903" & estrato_==7
replace def_es = .8315478 if ubigeo=="060904" & estrato_==7
replace def_es = .8315478 if ubigeo=="060906" & estrato_==7
replace def_es = .75004041 if ubigeo=="061001" & estrato_==7
replace def_es = .75004041 if ubigeo=="061006" & estrato_==7
replace def_es = .75004041 if ubigeo=="061007" & estrato_==7
replace def_es = .75004041 if ubigeo=="061103" & estrato_==7
replace def_es = .75004041 if ubigeo=="061107" & estrato_==7
replace def_es = .75004041 if ubigeo=="061109" & estrato_==7
replace def_es = .75004041 if ubigeo=="061202" & estrato_==7
replace def_es = .81580621 if ubigeo=="061301" & estrato_==5
replace def_es = .75004041 if ubigeo=="061310" & estrato_==7
replace def_es = .75004041 if ubigeo=="061311" & estrato_==7
replace def_es = .75004041 if ubigeo=="061311" & estrato_==8
replace def_es = .75004041 if ubigeo=="060809" & estrato_==7
replace def_es = .8315478 if ubigeo=="060906" & estrato_==6
replace def_es = .8315478 if ubigeo=="060906" & estrato_==8
replace def_es = .75004041 if ubigeo=="061102" & estrato_==6
replace def_es = .75004041 if ubigeo=="061102" & estrato_==8
replace def_es = .75004041 if ubigeo=="060105" & estrato_==6
replace def_es = .8315478 if ubigeo=="060607" & estrato_==7


* 07: Callao

replace def_es = 1 if dept==7


* 08: Cusco

replace def_es = .81303 if dept==8 & estrato_==2
replace def_es = .73304796 if dept==8 & estrato_==7
replace def_es = .81303 if dept==8 & estrato_==5
replace def_es = .73304796 if dept==8 & estrato_==6
replace def_es = .73304796 if dept==8 & estrato_==8
replace def_es = .81303 if dept==8 & estrato_==4
replace def_es = .80923676 if ubigeo=="080901" & estrato_==4
replace def_es = .80923676 if ubigeo=="080901" & estrato_==5
replace def_es = .80923676 if ubigeo=="080902" & estrato_==5
replace def_es = .8315478 if ubigeo=="080902" & estrato_==7
replace def_es = .8315478 if ubigeo=="080902" & estrato_==8
replace def_es = .8315478 if ubigeo=="080904" & estrato_==7
replace def_es = .8315478 if ubigeo=="080905" & estrato_==7
replace def_es = .8315478 if ubigeo=="080905" & estrato_==8
replace def_es = .8315478 if ubigeo=="080906" & estrato_==6
replace def_es = .8315478 if ubigeo=="080906" & estrato_==7
replace def_es = .80923676 if ubigeo=="080907" & estrato_==5
replace def_es = .8315478 if ubigeo=="080907" & estrato_==7
replace def_es = .8315478 if ubigeo=="080907" & estrato_==7
replace def_es = .80923676 if ubigeo=="080910" & estrato_==5
replace def_es = .8315478 if ubigeo=="080910" & estrato_==7
replace def_es = .8315478 if ubigeo=="080910" & estrato_==8
replace def_es = .8315478 if ubigeo=="081106" & estrato_==7
replace def_es = .8315478 if ubigeo=="081203" & estrato_==7


* 09: Huancavelica

replace def_es = .75694716 if dept==9 & estrato_==4
replace def_es = .75313884 if dept==9 & estrato_==6
replace def_es = .75313884 if dept==9 & estrato_==7
replace def_es = .75313884 if dept==9 & estrato_==8
replace def_es = .75694716 if dept==9 & estrato_==5


* 10: Huánuco

replace def_es = .75694716 if dept==10 & estrato_==2
replace def_es = .75313884 if dept==10 & estrato_==7
replace def_es = .75313884 if dept==10 & estrato_==8
replace def_es = .75694716 if dept==10 & estrato_==5
replace def_es = .75313884 if dept==10 & estrato_==6
replace def_es = .80923676 if dept==10 & estrato_==4


* 11: Ica

replace def_es = .85583431 if dept==11 & estrato_==2
replace def_es = .89085555 if dept==11 & estrato_==7
replace def_es = .85583431 if dept==11 & estrato_==4
replace def_es = .89085555 if dept==11 & estrato_==6
replace def_es = .85583431 if dept==11 & estrato_==5


* 12: Junín

replace def_es = .75694716 if dept==12 & estrato_==2
replace def_es = .75313884 if dept==12 & estrato_==7
replace def_es = .75694716 if dept==12 & estrato_==5
replace def_es = .75313884 if dept==12 & estrato_==8
replace def_es = .75313884 if dept==12 & estrato_==6

replace def_es = .8315478 if ubigeo=="120301" & estrato_==7
replace def_es = .8315478 if ubigeo=="120301" & estrato_==8
replace def_es = .8315478 if ubigeo=="120302" & estrato_==7
replace def_es = .8315478 if ubigeo=="120302" & estrato_==8
replace def_es = .8315478 if ubigeo=="120303" & estrato_==7
replace def_es = .8315478 if ubigeo=="120304" & estrato_==7
replace def_es = .80923676 if ubigeo=="120305" & estrato_==5
replace def_es = .8315478 if ubigeo=="120601" & estrato_==7
replace def_es = .8315478 if ubigeo=="120601" & estrato_==8
replace def_es = .8315478 if ubigeo=="120602" & estrato_==7
replace def_es = .8315478 if ubigeo=="120607" & estrato_==6
replace def_es = .8315478 if ubigeo=="120607" & estrato_==7
replace def_es = .8315478 if ubigeo=="120607" & estrato_==8
replace def_es = .8315478 if ubigeo=="120699" & estrato_==7
replace def_es = .80923676 if ubigeo=="120699" & estrato_==5
replace def_es = .8315478 if ubigeo=="120699" & estrato_==8
replace def_es = .75694716 if ubigeo=="120701" & estrato_==4
replace def_es = .75694716 if ubigeo=="120801" & estrato_==4
replace def_es = .8315478 if ubigeo=="120301" & estrato_==5
replace def_es = .8315478 if ubigeo=="120303" & estrato_==5
replace def_es = .75694716 if ubigeo=="120401" & estrato_==4


* 13: La Libertad

replace def_es = .79460567 if dept==13 & estrato_==1
replace def_es = .79460567 if dept==13 & estrato_==4
replace def_es = .81202608 if dept==13 & estrato_==7
replace def_es = .79460567 if dept==13 & estrato_==5
replace def_es = .75004041 if dept==13 & estrato_==8
replace def_es = .81202608 if ubigeo=="130402" & estrato_==8
replace def_es = .81202608 if ubigeo=="130501" & estrato_==5
replace def_es = .75004041 if ubigeo=="130501" & estrato_==7
replace def_es = .75004041 if ubigeo=="130502" & estrato_==7
replace def_es = .75004041 if ubigeo=="130503" & estrato_==7
replace def_es = .75004041 if ubigeo=="130504" & estrato_==7
replace def_es = .81580621 if ubigeo=="130601" & estrato_==5
replace def_es = .75004041 if ubigeo=="130601" & estrato_==7
replace def_es = .75004041 if ubigeo=="130604" & estrato_==7
replace def_es = .75004041 if ubigeo=="130608" & estrato_==7
replace def_es = .75004041 if ubigeo=="130611" & estrato_==7
replace def_es = .81580621 if ubigeo=="130613" & estrato_==5
replace def_es = .81580621 if ubigeo=="130614" & estrato_==5
replace def_es = .75004041 if ubigeo=="130614" & estrato_==7
replace def_es = .75004041 if ubigeo=="130614" & estrato_==7
replace def_es = .81202608 if ubigeo=="130703" & estrato_==8
replace def_es = .81580621 if ubigeo=="130801" & estrato_==5
replace def_es = .75004041 if ubigeo=="130801" & estrato_==7
replace def_es = .75004041 if ubigeo=="130802" & estrato_==7
replace def_es = .75004041 if ubigeo=="130804" & estrato_==7
replace def_es = .75004041 if ubigeo=="130806" & estrato_==7
replace def_es = .75004041 if ubigeo=="130808" & estrato_==5
replace def_es = .75004041 if ubigeo=="130809" & estrato_==7
replace def_es = .75004041 if ubigeo=="130812" & estrato_==7
replace def_es = .75004041 if ubigeo=="130813" & estrato_==7
replace def_es = .81580621 if ubigeo=="130901" & estrato_==4
replace def_es = .75004041 if ubigeo=="130901" & estrato_==7
replace def_es = .75004041 if ubigeo=="130902" & estrato_==7
replace def_es = .75004041 if ubigeo=="130903" & estrato_==7
replace def_es = .75004041 if ubigeo=="130905" & estrato_==7
replace def_es = .75004041 if ubigeo=="130906" & estrato_==7
replace def_es = .75004041 if ubigeo=="130907" & estrato_==7
replace def_es = .75004041 if ubigeo=="130908" & estrato_==7
replace def_es = .75004041 if ubigeo=="131001" & estrato_==7

* replace def_es = ld if dept==13 & estrato_==5

replace def_es = .75004041 if ubigeo=="131002" & estrato_==7
replace def_es = .75004041 if ubigeo=="131006" & estrato_==7
replace def_es = .75004041 if ubigeo=="131008" & estrato_==7
replace def_es = .75004041 if ubigeo=="131103" & estrato_==7
replace def_es = .75004041 if ubigeo=="131104" & estrato_==7
replace def_es = .81202608 if ubigeo=="131201" & estrato_==8
replace def_es = .75004041 if ubigeo=="130108" & estrato_==6
replace def_es = .79460567 if ubigeo=="130202" & estrato_==5

replace def_es = .79460567 if ubigeo=="130401" & estrato_==3
replace def_es = .75004041 if ubigeo=="130301" & estrato_==5

replace def_es = .81580621 if ubigeo=="130601" & estrato_==5
replace def_es = .75004041 if ubigeo=="130608" & estrato_==6
replace def_es = .79460567 if ubigeo=="130705" & estrato_==5
replace def_es = .75004041 if ubigeo=="130902" & estrato_==5
replace def_es = .75004041 if ubigeo=="130905" & estrato_==6
replace def_es = .75004041 if ubigeo=="131002" & estrato_==6


* 14: Lambayeque

replace def_es = .79460567 if dept==14 & estrato_==2
replace def_es = .81202608 if dept==14 & estrato_==6
replace def_es = .79460567 if dept==14 & estrato_==5
replace def_es = .81202608 if dept==14 & estrato_==6
replace def_es = .81202608 if dept==14 & estrato_==7
replace def_es = .81202608 if dept==14 & estrato_==8
replace def_es = .79460567 if dept==14 & estrato_==4


* 15: Lima

* replace def_es = ld if dept==15
replace def_es = 1 if prov==1501
replace def_es = .85583431 if dept==15 & estrato_==3
replace def_es = .85583431 if dept==15 & estrato_==3

replace def_es = 1 if prov==1501 & estrato==1
replace def_es = .85583431 if ubigeo=="150202" & estrato_==4
replace def_es = .85583431 if ubigeo=="150204" & estrato_==3

replace def_es = .85583431 if dept==15 & estrato_==3
replace def_es = .89085555 if ubigeo=="150601" & estrato_==7
replace def_es = .85583431 if ubigeo=="150603" & estrato_==5
replace def_es = .85583431 if ubigeo=="150605" & estrato_==4
replace def_es = .85583431 if ubigeo=="150611" & estrato_==8
replace def_es = .89085555 if ubigeo=="150201" & estrato_==7
replace def_es = .89085555 if ubigeo=="150204" & estrato_==7
replace def_es = .75313884 if ubigeo=="150303" & estrato_==8
replace def_es = .75313884 if ubigeo=="150304" & estrato_==7
replace def_es = .75694716 if ubigeo=="150401" & estrato_==5
replace def_es = .75313884 if ubigeo=="150405" & estrato_==6
replace def_es = .75313884 if ubigeo=="150406" & estrato_==8
replace def_es = .89085555 if ubigeo=="150501" & estrato_==7
replace def_es = .89085555 if ubigeo=="150502" & estrato_==8
replace def_es = .85583431 if ubigeo=="150505" & estrato_==5
replace def_es = .89085555 if ubigeo=="150503" & estrato_==6
replace def_es = .89085555 if ubigeo=="150510" & estrato_==7
replace def_es = .89085555 if ubigeo=="150513" & estrato_==7
replace def_es = .89085555 if ubigeo=="150514" & estrato_==8
replace def_es = .75313884 if ubigeo=="150611" & estrato_==8
replace def_es = .75313884 if ubigeo=="150702" & estrato_==7
replace def_es = .75694716 if ubigeo=="150708" & estrato_==5
replace def_es = .75694716 if ubigeo=="150728" & estrato_==5
replace def_es = .85583431 if dept==15 & estrato_==2
replace def_es = .75313884 if ubigeo=="150801" & estrato_==7
replace def_es = .89085555 if ubigeo=="150811" & estrato_==7
replace def_es = .89085555 if ubigeo=="150812" & estrato_==7
replace def_es = .75313884 if ubigeo=="150902" & estrato_==6
replace def_es = .75313884 if ubigeo=="151004" & estrato_==6
replace def_es = .75313884 if ubigeo=="151009" & estrato_==8
replace def_es = .75313884 if ubigeo=="151022" & estrato_==8
replace def_es = .75313884 if ubigeo=="151030" & estrato_==8


* 16: Loreto

replace def_es = .924496 if dept==16 & estrato_==2
replace def_es = .95415074 if dept==16 & estrato_==7
replace def_es = .95415074 if dept==16 & estrato_==8
replace def_es = .95415074 if dept==16 & estrato_==6
replace def_es = .924496 if dept==16 & estrato_==4
replace def_es = .924496 if dept==16 & estrato_==5


*17: Madre de Dios

replace def_es = .924496 if ubigeo=="170101" & estrato_==4

replace def_es = .95415074 if ubigeo=="170101" & estrato_==7
replace def_es = .95415074 if ubigeo=="170101" & estrato_==8
replace def_es = .924496 if ubigeo=="170102" & estrato_==6
replace def_es = .95415074 if ubigeo=="170102" & estrato_==7
replace def_es = .95415074 if ubigeo=="170102" & estrato_==8
replace def_es = .924496 if ubigeo=="170103" & estrato_==5
replace def_es = .95415074 if ubigeo=="170103" & estrato_==8
replace def_es = .924496 if ubigeo=="170104" & estrato_==6
replace def_es = .95415074 if ubigeo=="170104" & estrato_==8
replace def_es = .95415074 if ubigeo=="170104" & estrato_==6
replace def_es = .95415074 if ubigeo=="170201" & estrato_==6
replace def_es = .95415074 if ubigeo=="170203" & estrato_==6
replace def_es = .95415074 if ubigeo=="170203" & estrato_==8
replace def_es = .924496 if ubigeo=="170204" & estrato_==5
replace def_es = .95415074 if ubigeo=="170204" & estrato_==8
replace def_es = .924496 if ubigeo=="170302" & estrato_==5
replace def_es = .95415074 if ubigeo=="170302" & estrato_==8
replace def_es = .95415074 if ubigeo=="170303" & estrato_==8
replace def_es = .95415074 if ubigeo=="170303" & estrato_==6
replace def_es = .85403317 if ubigeo=="180101" & estrato_==3


* 18: Moquegua

replace def_es=.85403317 if ubigeo=="180101" & estrato_==3
replace def_es=.86793548 if ubigeo=="180101" & estrato_==7
replace def_es=.86793548 if ubigeo=="180101" & estrato_==8
replace def_es=.81303 if ubigeo=="180102" & estrato_==5
replace def_es=.73304796 if ubigeo=="180102" & estrato_==8
replace def_es=.85403317 if ubigeo=="180104" & estrato_==3
replace def_es=.81303 if ubigeo=="180106" & estrato_==5
replace def_es=.73304796 if ubigeo=="180106" & estrato_==8
replace def_es=.73304796 if ubigeo=="180201" & estrato_==6
replace def_es=.73304796 if ubigeo=="180201" & estrato_==7
replace def_es=.73304796 if ubigeo=="180202" 
replace def_es=.73304796 if ubigeo=="180203"
replace def_es=.73304796 if ubigeo=="180204" 
replace def_es=.73304796 if ubigeo=="180205" 
replace def_es=.73304796 if ubigeo=="180206" 
replace def_es=.73304796 if ubigeo=="180207" 
replace def_es=.73304796 if ubigeo=="180208" 
replace def_es=.73304796 if ubigeo=="180209" 
replace def_es=.73304796 if ubigeo=="180210" 
replace def_es=.73304796 if ubigeo=="180211"
replace def_es=.85403317 if ubigeo=="180301" & estrato_==3
replace def_es=.85403317 if ubigeo=="180303" 
replace def_es=.73304796 if ubigeo=="180301" & estrato_==8
replace def_es=.81303 if ubigeo=="180201" & estrato_==5


*19: Pasco

replace def_es = .75694716 if ubigeo=="190101" & estrato_==3
replace def_es = .75313884 if ubigeo=="190102" & estrato_==7
replace def_es = .75694716 if ubigeo=="190103" & estrato_==5
replace def_es = .75694716 if ubigeo=="190104" & estrato_==5
replace def_es = .75313884 if ubigeo=="190104" & estrato_==7
replace def_es = .75694716 if ubigeo=="190105" & estrato_==8
replace def_es = .75694716 if ubigeo=="190107" & estrato_==5
replace def_es = .75313884 if ubigeo=="190107" & estrato_==7
replace def_es = .75313884 if ubigeo=="190108" & estrato_==7
replace def_es = .75694716 if ubigeo=="190109" & estrato_==3
replace def_es = .75313884 if ubigeo=="190109" & estrato_==7
replace def_es = .75694716 if ubigeo=="190110" & estrato_==7
replace def_es = .75694716 if ubigeo=="190111" & estrato_==5
replace def_es = .75694716 if ubigeo=="190112" & estrato_==5
replace def_es = .75694716 if ubigeo=="190112" & estrato_==7
replace def_es = .75694716 if ubigeo=="190113" & estrato_==3
replace def_es = .75694716 if ubigeo=="190201" & estrato_==5
replace def_es = .75313884 if ubigeo=="190201" & estrato_==7
replace def_es = .75694716 if ubigeo=="190202" & estrato_==5
replace def_es = .75694716 if ubigeo=="190205" & estrato_==6
replace def_es = .75694716 if ubigeo=="190206" & estrato_==5
replace def_es = .75313884 if ubigeo=="190206" & estrato_==7
replace def_es = .75694716 if ubigeo=="190206" & estrato_==8
replace def_es = .80923676 if ubigeo=="190208" & estrato_==7
replace def_es = .8315478 if ubigeo=="190301" & estrato_==7
replace def_es = .75313884 if ubigeo=="190302" & estrato_==7
replace def_es = .8315478 if ubigeo=="190303" & estrato_==7
replace def_es = .8315478 if ubigeo=="190304" & estrato_==7
replace def_es = .8315478 if ubigeo=="190305" & estrato_==7
replace def_es = .80923676 if ubigeo=="190306" & estrato_==5
replace def_es = .8315478 if ubigeo=="190306" & estrato_==7
replace def_es = .80923676 if ubigeo=="190307" & estrato_==5
replace def_es = .8315478 if ubigeo=="190307" & estrato_==7
replace def_es = .8315478 if ubigeo=="190307" & estrato_==8


* 20: Piura

replace def_es = .79460567 if ubigeo=="200101" & estrato_==2
replace def_es = .81202608 if ubigeo=="200101" & estrato_==8
replace def_es = .79460567 if ubigeo=="200104" & estrato_==2
replace def_es = .79460567 if ubigeo=="200105" & estrato_==3
replace def_es = .79460567 if ubigeo=="200109" & estrato_==4
replace def_es = .79460567 if ubigeo=="200109" & estrato_==6
replace def_es = .79460567 if ubigeo=="200110" & estrato_==4
replace def_es = .81202608 if ubigeo=="200111" & estrato_==7
replace def_es = .81202608 if ubigeo=="200111" & estrato_==8
replace def_es = .79460567 if ubigeo=="200114" & estrato_==4
replace def_es = .81202608 if ubigeo=="200114" & estrato_==7
replace def_es = .81202608 if ubigeo=="200114" & estrato_==8
replace def_es = .81580621  if ubigeo=="200201" & estrato_==5
replace def_es = .75004041  if ubigeo=="200201" & estrato_==7
replace def_es = .81202608  if ubigeo=="200202" & estrato_==7
replace def_es = .81202608  if ubigeo=="200205" & estrato_==7
replace def_es = .75004041  if ubigeo=="200205" & estrato_==8
replace def_es = .75004041  if ubigeo=="200206" & estrato_==7
replace def_es = .81202608 if ubigeo=="200206" & estrato_==8
replace def_es = .81202608 if ubigeo=="200208" & estrato_==8
replace def_es = .75004041  if ubigeo=="200301" & estrato_==7
replace def_es = .81202608  if ubigeo=="200302" & estrato_==7
replace def_es = .75004041  if ubigeo=="200304" & estrato_==7
replace def_es = .75004041  if ubigeo=="200304" & estrato_==8
replace def_es = .75004041  if ubigeo=="200308" & estrato_==7
replace def_es = .79460567  if ubigeo=="200401" & estrato_==3
replace def_es = .81202608  if ubigeo=="200401" & estrato_==7
replace def_es = .79460567  if ubigeo=="200401" & estrato_==8
replace def_es = .75004041  if ubigeo=="200402" & estrato_==8
replace def_es = .75004041  if ubigeo=="200403" & estrato_==6
replace def_es = .75004041  if ubigeo=="200403" & estrato_==7
replace def_es = .81202608  if ubigeo=="200404" & estrato_==7
replace def_es = .81202608  if ubigeo=="200409" & estrato_==6
replace def_es = .81202608  if ubigeo=="200410" & estrato_==7
replace def_es = .79460567  if ubigeo=="200501" & estrato_==3
replace def_es = .79460567  if ubigeo=="200505" & estrato_==5
replace def_es = .79460567  if ubigeo=="200601" & estrato_==2
replace def_es = .81202608  if ubigeo=="200601" & estrato_==7
replace def_es = .79460567  if ubigeo=="200601" & estrato_==8
replace def_es = .79460567  if ubigeo=="200602" & estrato_==2
replace def_es = .81202608  if ubigeo=="200603" & estrato_==5
replace def_es = .79460567  if ubigeo=="200604" & estrato_==8
replace def_es = .79460567  if ubigeo=="200607" & estrato_==4
replace def_es = .79460567  if ubigeo=="200701" & estrato_==3
replace def_es = .79460567  if ubigeo=="200703" & estrato_==5
replace def_es = .79460567  if ubigeo=="200801" & estrato_==8
replace def_es = .79460567  if ubigeo=="200803" & estrato_==5


* 21: Puno

replace def_es = .73304796 if dept==21 & estrato_==8
replace def_es = .73304796 if dept==21 & estrato_==7
replace def_es = .73304796 if dept==21 & estrato_==6
replace def_es = .81303 if dept==21 & estrato_==5
replace def_es = .81303 if dept==21 & estrato_==4
replace def_es = .81303 if dept==21 & estrato_==2


* 22: San Martín

replace def_es = .8315478 if dept==22 & estrato_==8
replace def_es = .8315478 if dept==22 & estrato_==7
replace def_es = .8315478 if dept==22 & estrato_==6
replace def_es = .80923676 if dept==22 & estrato_==5
replace def_es = .80923676 if dept==22 & estrato_==4
replace def_es = .80923676 if dept==22 & estrato_==3


* 23: Tacna

replace def_es = .73304796 if ubigeo=="230408" & estrato_==6
replace def_es = .73304796 if ubigeo=="230407" & estrato_==6
replace def_es = .73304796 if ubigeo=="230406" & estrato_==6
replace def_es = .73304796 if ubigeo=="230201" & estrato_==7
replace def_es = .85403317 if dept==23 & estrato_==2
replace def_es = .73304796 if prov==2304 & estrato_==6
replace def_es = .86793548 if ubigeo=="230103" & estrato_==7
replace def_es = .86793548 if ubigeo=="230103" & estrato_==6
replace def_es = .86793548 if ubigeo=="230103" & estrato_==8
replace def_es = .86793548 if ubigeo=="230105" & estrato_==6
replace def_es = .86793548 if ubigeo=="230105" & estrato_==8
replace def_es = .73304796 if ubigeo=="230106" & estrato_==8
replace def_es = .73304796 if ubigeo=="230107" & estrato_==7

replace def_es = .86793548 if ubigeo=="230109" & estrato_==5
replace def_es = .86793548 if ubigeo=="230109" & estrato_==7
replace def_es = .86793548 if ubigeo=="230101" & estrato_==7


* 24: Tumbes

replace def_es = .81202608 if dept == 24 & estrato_==8
replace def_es = .81202608 if dept == 24 & estrato_==7
replace def_es = .81202608 if dept == 24 & estrato_==6
replace def_es = .79460567 if dept == 24 & estrato_==5
replace def_es = .79460567 if dept == 24 & estrato_==3
replace def_es = .79460567 if dept == 24 & estrato_==2


* 25: Ucayali

replace def_es = .95415074 if dept == 25 & estrato_==8
replace def_es = .95415074 if dept == 25 & estrato_==7
replace def_es = .95415074 if dept == 25 & estrato_==6
replace def_es = .924496 if dept == 25 & estrato_==5
replace def_es = .924496 if dept == 25 & estrato_==2




** Resto ()


/*
sort def_es ubigeo estrato_
sort ubigeo estrato_
edit aÑo dept prov ubigeo estrato_ ld def_es nuevo comp

sort comp ubigeo estrato_
edit aÑo dept prov ubigeo estrato_ ld def_es comp
*/


replace def_es = .75004041 if ubigeo=="010101" & estrato_==7
replace def_es = .75004041 if ubigeo=="010109" & estrato_==6
replace def_es = .75004041 if ubigeo=="010109" & estrato_==7
replace def_es = .75004041 if ubigeo=="010109" & estrato_==8

replace def_es = .75004041 if ubigeo=="010110" & estrato_==6
replace def_es = .75004041 if ubigeo=="010113" & estrato_==6

replace def_es = .80923676 if ubigeo=="010202" & estrato_==5
replace def_es = .8315478 if ubigeo=="010203" & estrato_==6
replace def_es = .8315478 if ubigeo=="010204" & estrato_==7
replace def_es = .8315478 if ubigeo=="010205" & estrato_==8

replace def_es = .75004041 if ubigeo=="010305" & estrato_==6
replace def_es = .81580621 if ubigeo=="010306" & estrato_==5
replace def_es = .75004041 if ubigeo=="010306" & estrato_==8
replace def_es = .8315478 if ubigeo=="010309" & estrato_==6
replace def_es = .8315478 if ubigeo=="010310" & estrato_==6
replace def_es = .8315478 if ubigeo=="010310" & estrato_==8
replace def_es = .8315478 if ubigeo=="010312" & estrato_==7

replace def_es = .8315478 if ubigeo=="010401" & estrato_==8
replace def_es = .75004041 if ubigeo=="010502" & estrato_==7
replace def_es = .75004041 if ubigeo=="010502" & estrato_==8
replace def_es = .75004041 if ubigeo=="010503" & estrato_==6
replace def_es = .75004041 if ubigeo=="010504" & estrato_==6
replace def_es = .75004041 if ubigeo=="010505" & estrato_==6
replace def_es = .75004041 if ubigeo=="010506" & estrato_==8
replace def_es = .75004041 if ubigeo=="010514" & estrato_==8
replace def_es = .75004041 if ubigeo=="010515" & estrato_==6
replace def_es = .75004041 if ubigeo=="010515" & estrato_==8
replace def_es = .75004041 if ubigeo=="010516" & estrato_==8
replace def_es = .75004041 if ubigeo=="010519" & estrato_==7
replace def_es = .75004041 if ubigeo=="010521" & estrato_==7
replace def_es = .75004041 if ubigeo=="010522" & estrato_==6
replace def_es = .80923676 if ubigeo=="010601" & estrato_==5
replace def_es = .8315478 if ubigeo=="010601" & estrato_==7
replace def_es = .8315478 if ubigeo=="010601" & estrato_==8
replace def_es = .8315478 if ubigeo=="010605" & estrato_==6
replace def_es = .8315478 if ubigeo=="010606" & estrato_==8
replace def_es = .8315478 if ubigeo=="010609" & estrato_==6
replace def_es = .8315478 if ubigeo=="010609" & estrato_==7
replace def_es = .8315478 if ubigeo=="010609" & estrato_==8
replace def_es = .80923676 if ubigeo=="010703" & estrato_==5
replace def_es = .8315478 if ubigeo=="010704" & estrato_==6


replace def_es = .75694716 if ubigeo=="020101" & estrato_==3
replace def_es = .75694716 if ubigeo=="020105" & estrato_==3
replace def_es = .75694716 if ubigeo=="020108" & estrato_==5
replace def_es = .75313884 if ubigeo=="020401" & estrato_==6
replace def_es = .75694716 if ubigeo=="020508" & estrato_==5
replace def_es = .75313884 if ubigeo=="020603" & estrato_==8
replace def_es = .75313884 if ubigeo=="020701" & estrato_==8
replace def_es = .89085555 if ubigeo=="020803" & estrato_==6
replace def_es = .75694716 if ubigeo=="021001" & estrato_==5
replace def_es = .75313884 if ubigeo=="021003" & estrato_==8
replace def_es = .89085555 if ubigeo=="021103" & estrato_==6
replace def_es = .75694716 if ubigeo=="021201" & estrato_==5
replace def_es = .75313884 if ubigeo=="021301" & estrato_==8
replace def_es = .75313884 if ubigeo=="021402" & estrato_==6
replace def_es = .89085555 if ubigeo=="021405" & estrato_==7
replace def_es = .75313884 if ubigeo=="021501" & estrato_==8
replace def_es = .75313884 if ubigeo=="021511" & estrato_==6
replace def_es = .75313884 if ubigeo=="021701" & estrato_==7
replace def_es = .75313884 if ubigeo=="021703" & estrato_==6
replace def_es = .75313884 if ubigeo=="021709" & estrato_==8
replace def_es = .75313884 if ubigeo=="021802" & estrato_==6
replace def_es = .75313884 if ubigeo=="021906" & estrato_==6
replace def_es = .75313884 if ubigeo=="021906" & estrato_==7
replace def_es = .75313884 if ubigeo=="021908" & estrato_==8
replace def_es = .75313884 if ubigeo=="021909" & estrato_==7
replace def_es = .75313884 if ubigeo=="021909" & estrato_==8
replace def_es = .75313884 if ubigeo=="022001" & estrato_==8
replace def_es = .75313884 if ubigeo=="022002" & estrato_==8


replace def_es = .73304796 if ubigeo=="040105" & estrato_==7
replace def_es = .73304796 if ubigeo=="040105" & estrato_==8
replace def_es = .73304796 if ubigeo=="040106" & estrato_==6
replace def_es = .86793548 if ubigeo=="040118" & estrato_==8
replace def_es = .86793548 if ubigeo=="040121" & estrato_==7
replace def_es = .86793548 if ubigeo=="040124" & estrato_==7
replace def_es = .81303 if ubigeo=="040128" & estrato_==5
replace def_es = .85403317 if ubigeo=="040202" & estrato_==4
replace def_es = .86793548 if ubigeo=="040204" & estrato_==7
replace def_es = .85403317 if ubigeo=="040205" & estrato_==5
replace def_es = .85403317 if ubigeo=="040206" & estrato_==5
replace def_es = .73304796 if ubigeo=="040306" & estrato_==6
replace def_es = .86793548 if ubigeo=="040308" & estrato_==6
replace def_es = .86793548 if ubigeo=="040308" & estrato_==7
replace def_es = .73304796 if ubigeo=="040309" & estrato_==8
replace def_es = .86793548 if ubigeo=="040311" & estrato_==6
replace def_es = .86793548 if ubigeo=="040313" & estrato_==8
replace def_es = .73304796 if ubigeo=="040401" & estrato_==8
replace def_es = .73304796 if ubigeo=="040406" & estrato_==6
replace def_es = .73304796 if ubigeo=="040412" & estrato_==6
replace def_es = .85403317 if ubigeo=="040413" & estrato_==5
replace def_es = .81303 if ubigeo=="040501" & estrato_==5
replace def_es = .81303 if ubigeo=="040505" & estrato_==5
replace def_es = .73304796 if ubigeo=="040507" & estrato_==6
replace def_es = .73304796 if ubigeo=="040508" & estrato_==7
replace def_es = .73304796 if ubigeo=="040509" & estrato_==6
replace def_es = .73304796 if ubigeo=="040516" & estrato_==8
replace def_es = .81303 if ubigeo=="040520" & estrato_==4
replace def_es = .81303 if ubigeo=="040601" & estrato_==5
replace def_es = .73304796 if ubigeo=="040604" & estrato_==7
replace def_es = .73304796 if ubigeo=="040605" & estrato_==6
replace def_es = .73304796 if ubigeo=="040605" & estrato_==7
replace def_es = .73304796 if ubigeo=="040606" & estrato_==7
replace def_es = .73304796 if ubigeo=="040607" & estrato_==8
replace def_es = .73304796 if ubigeo=="040608" & estrato_==8
replace def_es = .85403317 if ubigeo=="040704" & estrato_==5
replace def_es = .86793548 if ubigeo=="040705" & estrato_==6
replace def_es = .85403317 if ubigeo=="040706" & estrato_==5
replace def_es = .73304796 if ubigeo=="040805" & estrato_==6
replace def_es = .73304796 if ubigeo=="040805" & estrato_==7
replace def_es = .73304796 if ubigeo=="040806" & estrato_==8
replace def_es = .73304796 if ubigeo=="040806" & estrato_==8


replace def_es = .81580621 if ubigeo=="060301" & estrato_==5
replace def_es = .75004041 if ubigeo=="060507" & estrato_==6
replace def_es = .81580621 if ubigeo=="060601" & estrato_==5
replace def_es = .75004041 if ubigeo=="060601" & estrato_==8
replace def_es = .75004041 if ubigeo=="060602" & estrato_==7
replace def_es = .75004041 if ubigeo=="060608" & estrato_==8
replace def_es = .75004041 if ubigeo=="060609" & estrato_==7
replace def_es = .8315478 if ubigeo=="060610" & estrato_==6
replace def_es = .75004041 if ubigeo=="060611" & estrato_==7
replace def_es = .75004041 if ubigeo=="060614" & estrato_==7
replace def_es = .75004041 if ubigeo=="060702" & estrato_==8
replace def_es = .75004041 if ubigeo=="060703" & estrato_==8
replace def_es = .8315478 if ubigeo=="060802" & estrato_==7
replace def_es = .8315478 if ubigeo=="060802" & estrato_==8
replace def_es = .8315478 if ubigeo=="060804" & estrato_==6
replace def_es = .8315478 if ubigeo=="060805" & estrato_==7
replace def_es = .8315478 if ubigeo=="060807" & estrato_==8
replace def_es = .75004041 if ubigeo=="060810" & estrato_==6
replace def_es = .8315478 if ubigeo=="060905" & estrato_==8
replace def_es = .75004041 if ubigeo=="060907" & estrato_==7
replace def_es = .75004041 if ubigeo=="061003" & estrato_==7
replace def_es = .75004041 if ubigeo=="061004" & estrato_==7
replace def_es = .75004041 if ubigeo=="061007" & estrato_==8
replace def_es = .75004041 if ubigeo=="061101" & estrato_==7
replace def_es = .75004041 if ubigeo=="061109" & estrato_==8
replace def_es = .75004041 if ubigeo=="061111" & estrato_==8
replace def_es = .75004041 if ubigeo=="061113" & estrato_==7
replace def_es = .75004041 if ubigeo=="061201" & estrato_==7
replace def_es = .75004041 if ubigeo=="061301" & estrato_==7
replace def_es = .75004041 if ubigeo=="061302" & estrato_==6
replace def_es = .75004041 if ubigeo=="061303" & estrato_==6
replace def_es = .75004041 if ubigeo=="061306" & estrato_==7
replace def_es = .75004041 if ubigeo=="061307" & estrato_==7


replace def_es = .89085555 if ubigeo=="110103" & estrato_==8
replace def_es = .89085555 if ubigeo=="110104" & estrato_==8
replace def_es = .89085555 if ubigeo=="110105" & estrato_==8
replace def_es = .89085555 if ubigeo=="110109" & estrato_==8
replace def_es = .89085555 if ubigeo=="110110" & estrato_==8
replace def_es = .89085555 if ubigeo=="110111" & estrato_==8
replace def_es = .89085555 if ubigeo=="110204" & estrato_==8
replace def_es = .89085555 if ubigeo=="110205" & estrato_==8
replace def_es = .75313884 if ubigeo=="110208" & estrato_==8
replace def_es = .89085555 if ubigeo=="110211" & estrato_==8
replace def_es = .89085555 if ubigeo=="110301" & estrato_==8
replace def_es = .89085555 if ubigeo=="110305" & estrato_==8
replace def_es = .89085555 if ubigeo=="110404" & estrato_==8
replace def_es = .85583431 if ubigeo=="110501" & estrato_==3
replace def_es = .89085555 if ubigeo=="110502" & estrato_==8
replace def_es = .89085555 if ubigeo=="110503" & estrato_==8
replace def_es = .85583431 if ubigeo=="110506" & estrato_==3
replace def_es = .85583431 if ubigeo=="110507" & estrato_==3
replace def_es = .85583431 if ubigeo=="110508" & estrato_==3



replace def_es = .80923676 if ubigeo=="120302" & estrato_==4
replace def_es = .80923676 if ubigeo=="120601" & estrato_==4


replace def_es = .79460567 if ubigeo=="130109" & estrato_==5
replace def_es = .81202608 if ubigeo=="130110" & estrato_==6
replace def_es = .79460567 if ubigeo=="130206" & estrato_==5
replace def_es = .75004041 if ubigeo=="130301" & estrato_==6
replace def_es = .79460567 if ubigeo=="130402" & estrato_==5
replace def_es = .79460567 if ubigeo=="130604" & estrato_==6
replace def_es = .79460567 if ubigeo=="130701" & estrato_==5
replace def_es = .81580621 if ubigeo=="131001" & estrato_==5
replace def_es = .75004041 if ubigeo=="131004" & estrato_==6
replace def_es = .79460567 if ubigeo=="131202" & estrato_==5


replace def_es = .85583431 if ubigeo=="150203" & estrato_==4
replace def_es = .75694716 if ubigeo=="150301" & estrato_==5
replace def_es = .75313884 if ubigeo=="150302" & estrato_==6
replace def_es = .75313884 if ubigeo=="150305" & estrato_==7
replace def_es = .75313884 if ubigeo=="150402" & estrato_==7
replace def_es = .89085555 if ubigeo=="150502" & estrato_==7
replace def_es = .89085555 if ubigeo=="150503" & estrato_==8
replace def_es = .89085555 if ubigeo=="150504" & estrato_==7
replace def_es = .89085555 if ubigeo=="150509" & estrato_==7
replace def_es = .85583431 if ubigeo=="150512" & estrato_==5
replace def_es = .75313884 if ubigeo=="150603" & estrato_==6
replace def_es = .89085555 if ubigeo=="150604" & estrato_==7
replace def_es = .89085555 if ubigeo=="150605" & estrato_==7
replace def_es = .89085555 if ubigeo=="150606" & estrato_==7
replace def_es = .75313884 if ubigeo=="150708" & estrato_==6
replace def_es = .75313884 if ubigeo=="150708" & estrato_==7
replace def_es = .75694716 if ubigeo=="150714" & estrato_==5
replace def_es = .75313884 if ubigeo=="150717" & estrato_==6
replace def_es = .75313884 if ubigeo=="150718" & estrato_==6
replace def_es = .75313884 if ubigeo=="150723" & estrato_==7
replace def_es = .75313884 if ubigeo=="150723" & estrato_==8
replace def_es = .75313884 if ubigeo=="150727" & estrato_==6
replace def_es = .75313884 if ubigeo=="150802" & estrato_==8
replace def_es = .75313884 if ubigeo=="150804" & estrato_==6
replace def_es = .89085555 if ubigeo=="150806" & estrato_==7
replace def_es = .75313884 if ubigeo=="150808" & estrato_==6
replace def_es = .85583431 if ubigeo=="150811" & estrato_==5
replace def_es = .89085555 if ubigeo=="150812" & estrato_==8
replace def_es = .75694716 if ubigeo=="150901" & estrato_==5
replace def_es = .75313884 if ubigeo=="151014" & estrato_==8
replace def_es = .75313884 if ubigeo=="151017" & estrato_==6
replace def_es = .75313884 if ubigeo=="151022" & estrato_==6
replace def_es = .75313884 if ubigeo=="151023" & estrato_==6
replace def_es = .75313884 if ubigeo=="151030" & estrato_==6

replace def_es = .95415074 if ubigeo=="170103" & estrato_==7
replace def_es = .95415074 if ubigeo=="170104" & estrato_==7
replace def_es = .95415074 if ubigeo=="170201" & estrato_==8
replace def_es = .95415074 if ubigeo=="170202" & estrato_==6
replace def_es = .95415074 if ubigeo=="170301" & estrato_==6


replace def_es = .95415074 if ubigeo=="180103" & estrato_==6
replace def_es = .95415074 if ubigeo=="180104" & estrato_==8
replace def_es = .81303 if ubigeo=="180105" & estrato_==5
replace def_es = .73304796 if ubigeo=="180106" & estrato_==7
replace def_es = .73304796 if ubigeo=="180106" & estrato_==7


replace def_es = .75313884 if ubigeo=="1910103" & estrato_==7
replace def_es = .75313884 if ubigeo=="1910105" & estrato_==7
replace def_es = .75313884 if ubigeo=="1910110" & estrato_==6
replace def_es = .75313884 if ubigeo=="1910110" & estrato_==8
replace def_es = .75313884 if ubigeo=="1910112" & estrato_==8
replace def_es = .75313884 if ubigeo=="1910202" & estrato_==6
replace def_es = .75313884 if ubigeo=="1910202" & estrato_==7
replace def_es = .75313884 if ubigeo=="1910202" & estrato_==8
replace def_es = .75313884 if ubigeo=="1910204" & estrato_==6
replace def_es = .75313884 if ubigeo=="1910208" & estrato_==6
replace def_es = .80923676 if ubigeo=="1910301" & estrato_==5
replace def_es = .8315478 if ubigeo=="1910303" & estrato_==8
replace def_es = .8315478 if ubigeo=="1910305" & estrato_==8


replace def_es = .81202608 if ubigeo=="200101" & estrato_==7
replace def_es = .79460567 if ubigeo=="200111" & estrato_==5
replace def_es = .75004041 if ubigeo=="200201" & estrato_==8
replace def_es = .75004041 if ubigeo=="200204" & estrato_==7
replace def_es = .81202608 if ubigeo=="200207" & estrato_==7
replace def_es = .81202608 if ubigeo=="200208" & estrato_==7
replace def_es = .81202608 if ubigeo=="200209" & estrato_==7
replace def_es = .81580621 if ubigeo=="200301" & estrato_==5
replace def_es = .75004041 if ubigeo=="200301" & estrato_==8
replace def_es = .75004041 if ubigeo=="200303" & estrato_==7
replace def_es = .81202608 if ubigeo=="200305" & estrato_==6
replace def_es = .81202608 if ubigeo=="200306" & estrato_==7
replace def_es = .81202608 if ubigeo=="200306" & estrato_==8
replace def_es = .75004041 if ubigeo=="200308" & estrato_==8
replace def_es = .79460567 if ubigeo=="200406" & estrato_==5
replace def_es = .81202608 if ubigeo=="200409" & estrato_==7
replace def_es = .79460567 if ubigeo=="200502" & estrato_==5
replace def_es = .81202608 if ubigeo=="200505" & estrato_==7
replace def_es = .81202608 if ubigeo=="200505" & estrato_==8
replace def_es = .81202608 if ubigeo=="200604" & estrato_==7
replace def_es = .81202608 if ubigeo=="200704" & estrato_==6
replace def_es = .79460567 if ubigeo=="200801" & estrato_==4
replace def_es = .81202608 if ubigeo=="200803" & estrato_==8


replace def_es = .80923676 if ubigeo=="220901" & estrato_==2
replace def_es = .80923676 if ubigeo=="220909" & estrato_==2
replace def_es = .80923676 if ubigeo=="220910" & estrato_==2


replace def_es = .86793548 if ubigeo=="230105" & estrato_==7
replace def_es = .73304796 if ubigeo=="230106" & estrato_==6
replace def_es = .73304796 if ubigeo=="230106" & estrato_==7
replace def_es = .86793548 if ubigeo=="230108" & estrato_==8
replace def_es = .86793548 if ubigeo=="230109" & estrato_==6
replace def_es = .86793548 if ubigeo=="230110" & estrato_==8
replace def_es = .81303 if ubigeo=="230201" & estrato_==5
replace def_es = .73304796 if ubigeo=="230201" & estrato_==6
replace def_es = .73304796 if ubigeo=="230201" & estrato_==8
replace def_es = .73304796 if ubigeo=="230202" & estrato_==6
replace def_es = .73304796 if ubigeo=="230202" & estrato_==7
replace def_es = .73304796 if ubigeo=="230203" & estrato_==6
replace def_es = .73304796 if ubigeo=="230203" & estrato_==7
replace def_es = .73304796 if ubigeo=="230204" & estrato_==6
replace def_es = .73304796 if ubigeo=="230205" & estrato_==6
replace def_es = .73304796 if ubigeo=="230206" & estrato_==6
replace def_es = .86793548 if ubigeo=="230301" & estrato_==6
replace def_es = .86793548 if ubigeo=="230301" & estrato_==7
replace def_es = .81303 if ubigeo=="230302" & estrato_==5
replace def_es = .73304796 if ubigeo=="230302" & estrato_==8
replace def_es = .86793548 if ubigeo=="230303" & estrato_==6
replace def_es = .86793548 if ubigeo=="230303" & estrato_==7
replace def_es = .81303 if ubigeo=="230401" & estrato_==5
replace def_es = .73304796 if ubigeo=="230401" & estrato_==7
replace def_es = .73304796 if ubigeo=="230402" & estrato_==8



replace def_es = .75004041 if ubigeo=="010503" & estrato_==8
replace def_es = .75313884 if ubigeo=="021501" & estrato_==6
replace def_es = .73304796 if ubigeo=="040811" & estrato_==6
replace def_es = .75004041 if ubigeo=="061306" & estrato_==8
replace def_es = .89085555 if ubigeo=="110114" & estrato_==8
replace def_es = .75313884 if ubigeo=="110209" & estrato_==8
replace def_es = .75004041 if ubigeo=="130606" & estrato_==6
replace def_es = .75004041 if ubigeo=="130606" & estrato_==7
replace def_es = .89085555 if ubigeo=="150203" & estrato_==7
replace def_es = .85583431 if ubigeo=="150509" & estrato_==4
replace def_es = .75313884 if ubigeo=="150603" & estrato_==8
replace def_es = .75313884 if ubigeo=="150901" & estrato_==7
replace def_es = .95415074 if ubigeo=="170201" & estrato_==7
replace def_es = .95415074 if ubigeo=="170202" & estrato_==8
replace def_es = .75313884 if ubigeo=="190103" & estrato_==7
replace def_es = .75694716 if ubigeo=="190105" & estrato_==7
replace def_es = .75313884 if ubigeo=="190110" & estrato_==6
replace def_es = .75313884 if ubigeo=="190110" & estrato_==8
replace def_es = .75313884 if ubigeo=="190112" & estrato_==8
replace def_es = .75313884 if ubigeo=="190202" & estrato_==6
replace def_es = .75313884 if ubigeo=="190202" & estrato_==7
replace def_es = .75313884 if ubigeo=="190202" & estrato_==8
replace def_es = .75313884 if ubigeo=="190204" & estrato_==6
replace def_es = .75313884 if ubigeo=="190204" & estrato_==8
replace def_es = .75313884 if ubigeo=="190208" & estrato_==6
replace def_es = .80923676 if ubigeo=="190301" & estrato_==5
replace def_es = .8315478 if ubigeo=="190303" & estrato_==6
replace def_es = .8315478 if ubigeo=="190303" & estrato_==8
replace def_es = .8315478 if ubigeo=="190305" & estrato_==8
replace def_es = .81202608 if ubigeo=="200406" & estrato_==8
replace def_es = .86793548 if ubigeo=="230109" & estrato_==8
replace def_es = .79460567 if ubigeo=="200506" & estrato_==5


* arreglar ld diferente a def_es


/*

g nuevo=ld
replace nuevo=def_es if ld == .
g comp = 1 if nuevo == def_es

sort ubigeo estrato_
sort def_es ubigeo estrato_
sort comp ubigeo estrato_
edit aÑo dept prov ubigeo estrato_ ld def_es nuevo comp

drop nuevo
drop comp

*/


replace def_es = .89085555 if ubigeo=="021801" & estrato_==7
replace def_es = .75313884 if ubigeo=="021804" & estrato_==7
replace def_es = .89085555 if ubigeo=="021805" & estrato_==7

* replace def_es = ld if ubigeo=="040520" & estrato_==4
* replace def_es = .81303 if ubigeo=="040520" & estrato_==4 & ld==.

replace def_es = .75694716 if ubigeo=="050108" & estrato_==5
replace def_es = .75694716 if ubigeo=="050202" & estrato_==5
replace def_es = .75694716 if ubigeo=="050301" & estrato_==5
replace def_es = .75694716 if ubigeo=="050501" & estrato_==5
replace def_es = .8315478 if ubigeo=="050507" & estrato_==7
replace def_es = .75694716 if ubigeo=="050705" & estrato_==5
replace def_es = .75694716 if ubigeo=="051101" & estrato_==5
replace def_es = .8315478 if ubigeo=="060405" & estrato_==6
replace def_es = .8120261 if ubigeo=="060505" & estrato_==7
replace def_es = .7500404 if ubigeo=="060607" & estrato_==7
replace def_es = .8315478 if ubigeo=="080901" & estrato_==7
replace def_es = .8315478 if ubigeo=="100601" & estrato_==7
replace def_es = .8315478 if ubigeo=="100602" & estrato_==6
replace def_es = .8315478 if ubigeo=="100602" & estrato_==7
replace def_es = .8315478 if ubigeo=="100603" & estrato_==7
replace def_es = .80923676 if ubigeo=="100604" & estrato_==5
replace def_es = .8315478 if ubigeo=="100604" & estrato_==7
replace def_es = .8315478 if ubigeo=="100604" & estrato_==8
replace def_es = .8315478 if ubigeo=="100605" & estrato_==6
replace def_es = .8315478 if ubigeo=="100605" & estrato_==7
replace def_es = .8315478 if ubigeo=="100606" & estrato_==6
replace def_es = .8315478 if ubigeo=="100606" & estrato_==7
replace def_es = .8315478 if ubigeo=="100606" & estrato_==8
replace def_es = .80923676 if ubigeo=="100901" & estrato_==5
replace def_es = .8315478 if ubigeo=="100901" & estrato_==7
replace def_es = .8315478 if ubigeo=="100903" & estrato_==7
replace def_es = .8315478 if ubigeo=="100904" & estrato_==7
replace def_es = .8315478 if ubigeo=="100904" & estrato_==8
replace def_es = .8315478 if ubigeo=="100905" & estrato_==6
replace def_es = .8315478 if ubigeo=="100905" & estrato_==7
replace def_es = .75313884 if ubigeo=="110203" & estrato_==6
replace def_es = .75313884 if ubigeo=="110208" & estrato_==6
replace def_es = .75313884 if ubigeo=="110405" & estrato_==6
replace def_es = .80923676 if ubigeo=="120303" & estrato_==5
replace def_es = .8315478 if ubigeo=="120305" & estrato_==7
replace def_es = .8315478 if ubigeo=="120603" & estrato_==7
replace def_es = .8315478 if ubigeo=="120608" & estrato_==7
replace def_es = .7500404 if ubigeo=="130302" & estrato_==7
replace def_es = .7500404 if ubigeo=="130602" & estrato_==7
replace def_es = .7500404 if ubigeo=="130604" & estrato_==6
replace def_es = .7500404 if ubigeo=="130613" & estrato_==7
replace def_es = .8120261 if ubigeo=="130702" & estrato_==8
replace def_es = .7500404 if ubigeo=="130803" & estrato_==7
replace def_es = .7500404 if ubigeo=="131007" & estrato_==7
replace def_es = .7500404 if ubigeo=="140202" & estrato_==7
replace def_es = .7500404 if ubigeo=="140203" & estrato_==7
replace def_es = .7500404 if ubigeo=="140203" & estrato_==8
replace def_es = .95415074 if ubigeo=="170102" & estrato_==6
replace def_es = .73304796 if ubigeo=="180103" & estrato_==6
replace def_es = .8679355 if ubigeo=="180104" & estrato_==8
replace def_es = .75313884 if ubigeo=="190105" & estrato_==7
replace def_es = .75313884 if ubigeo=="190105" & estrato_==8
replace def_es = .75313884 if ubigeo=="190110" & estrato_==7
replace def_es = .75313884 if ubigeo=="190112" & estrato_==7
replace def_es = .75313884 if ubigeo=="190205" & estrato_==6
replace def_es = .8120261 if ubigeo=="200205" & estrato_==8
replace def_es = .8315478 if ubigeo=="210309" & estrato_==7
replace def_es = .8315478 if ubigeo=="210309" & estrato_==7
replace def_es = .80923676 if ubigeo=="211207" & estrato_==5
replace def_es = .8315478 if ubigeo=="211207" & estrato_==7
replace def_es = .8315478 if ubigeo=="211209" & estrato_==7
replace def_es = .8315478 if ubigeo=="211209" & estrato_==8


*******************************************************************

* Guardamos nuevo dataframe como .csv

keep aÑo ubigeo dept estrato_ def_es

export delimited using "C:\Users\Fabian\Desktop\data_2004-2011.csv", replace


*******************************************************************

* Usamos estos .csv para crear nuestros modelos (de clasificación)
* y verificar la tasa de aciertos

******************************************************************