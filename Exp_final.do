
cd "D:\Universidad\Teor�as de la Distribuci�n y la Desigualdad\Caso Puno"

set more off
use "sumaria-2012.dta", clear


forvalue j=2013/2017{
append using sumaria-`j'.dta
}

*Generamos un indicador de departamento
gen dpto = substr(ubigeo,1,2)

* En el a�o 2013 la variable "a�o" se nombr� por error "a�o"
tab a�o a�o,m
replace a�o = a�o if a�o==""
drop a�o

tab a�o,m

*Generamos una variable que nos diferencie los a�os
gen a�o = substr(a�o,1,4)


g gpc = gashog2d/(ld*12*mieperho) // Gasto perc�pita mensual
g ypc = inghog1d/(ld*12*mieperho) // Ingreso perc�pita mensual

*Variables en logaritmos
g lgasto=ln(gpc)
g lingreso=ln(ypc)

*Aplicamos el deflactor espacial a nuestra variable "linea"
gen linea_d = linea/ld 

*Recordemos que "linea" identifica el umbral m�nimo, seg�n regi�n, que cada persona debe gastar para ser calificado como NO pobre


*****************************
*Histogramas varios         *
*****************************
*Gr�fico de Gasto Per Capita mensual (gpc) seg�n regi�n
hist gpc if dpto == "02"

*Ahora seg�n a�o
hist gpc if dpto == "02" & a�o == "2014"

*Vamos a poner las gr�ficas superpuestas de Ancash 2012 vs Ancash 2017
kdensity lingreso if a�o == "2012" & dpto == "02", nograph generate (fx1) at (x)

kdensity lingreso if a�o == "2017" & dpto == "02", nograph generate (fx2) at (x)

label var fx1 "Ancash en 2012"

label var fx2 "Ancash en 2017"

line fx1 fx2 x, sort ytitle(Density)



*********************************************
*Logaritmos del ingreso por Kernels         *
*********************************************
tw kdensity lingreso if a�o == "2017" & dpto == "02" // kernels por Ancash y 2017



*************************************************************
*Gr�fico de Pen (desfile de muchos enanos y pocos gigantes) *
*************************************************************
sort ypc
gen poblacion_acumulada = sum(factor07) //poblacion acumulada!!!!
replace poblacion_acumulada = poblacion_acumulada/poblacion_acumulada[_N]
line ypc poblacion_acumulada
line lingreso poblacion_acumulada



*********************
*Gr�fico de cajas   *
*********************
gr box gpc ypc if dpto == "02" & a�o == "2017", nooutside // Box Plot de variables en niveles
gr box lgasto lingreso if dpto == "02" & a�o == "2017", nooutside // Box Plot de varaibles en logaritmos



*********************
*Gr�fico de Pareto  *
*********************
sort dpto ypc
by dpto: gen total = sum(factor07)
by dpto: replace total = total/total[_N]
gen lpareto = log(1-total)
twoway (line lpareto lingreso if dpto == "02") || (line lpareto lingreso if dpto == "15") || if a�o == "2012", legend(order(02 "Ancash" 15 "Lima"))


*INDICADORES ORDINALES DE DESIGUALDAD
*********************
*Curvas de Lorenz   *
*********************
sort ypc
gen ing_acumulado = sum(ypc*factor07)
replace ing_acumulado = ing_acumulado/ing_acumulado[_N]

twoway line ing_acumulado poblacion_acumulada

drop poblacion_acumulada ing_acumulado
*Lorenz seg�n departamento
sort dpto ypc

by dpto: gen poblacion_acumulada = sum(factor07)
by dpto: replace poblacion_acumulada = poblacion_acumulada/poblacion_acumulada[_N]

*Ingreso acumulado por departamento
by dpto: gen ing_acumulado = sum(ypc*factor07)
by dpto: replace ing_acumulado = ing_acumulado/ing_acumulado[_N]

twoway (line ing_acumulado poblacion_acumulada if dpto == "02") || (line ing_acumulado poblacion_acumulada if dpto == "15") || if a�o == "2012", legend(label(02 "Ancash") label(15 "Lima"))

**************Lorenz "simple"
lorenz ypc if dpto == "02" & a�o == "2012"

lorenz ypc if dpto == "15" & a�o == "2017"
*Gr�fico
lorenz ypc if dpto == "15" & a�o == "2017",g
