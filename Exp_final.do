
cd "D:\Universidad\Teorías de la Distribución y la Desigualdad\Caso Puno"

set more off
use "sumaria-2012.dta", clear


forvalue j=2013/2017{
append using sumaria-`j'.dta
}

*Generamos un indicador de departamento
gen dpto = substr(ubigeo,1,2)

* En el año 2013 la variable "aÑo" se nombró por error "año"
tab aÑo año,m
replace aÑo = año if aÑo==""
drop año

tab aÑo,m

*Generamos una variable que nos diferencie los años
gen año = substr(aÑo,1,4)


g gpc = gashog2d/(ld*12*mieperho) // Gasto percápita mensual
g ypc = inghog1d/(ld*12*mieperho) // Ingreso percápita mensual

*Variables en logaritmos
g lgasto=ln(gpc)
g lingreso=ln(ypc)

*Aplicamos el deflactor espacial a nuestra variable "linea"
gen linea_d = linea/ld 

*Recordemos que "linea" identifica el umbral mínimo, según región, que cada persona debe gastar para ser calificado como NO pobre


*****************************
*Histogramas varios         *
*****************************
*Gráfico de Gasto Per Capita mensual (gpc) según región
hist gpc if dpto == "02"

*Ahora según año
hist gpc if dpto == "02" & aÑo == "2014"

*Vamos a poner las gráficas superpuestas de Ancash 2012 vs Ancash 2017
kdensity lingreso if aÑo == "2012" & dpto == "02", nograph generate (fx1) at (x)

kdensity lingreso if aÑo == "2017" & dpto == "02", nograph generate (fx2) at (x)

label var fx1 "Ancash en 2012"

label var fx2 "Ancash en 2017"

line fx1 fx2 x, sort ytitle(Density)



*********************************************
*Logaritmos del ingreso por Kernels         *
*********************************************
tw kdensity lingreso if aÑo == "2017" & dpto == "02" // kernels por Ancash y 2017



*************************************************************
*Gráfico de Pen (desfile de muchos enanos y pocos gigantes) *
*************************************************************
sort ypc
gen poblacion_acumulada = sum(factor07) //poblacion acumulada!!!!
replace poblacion_acumulada = poblacion_acumulada/poblacion_acumulada[_N]
line ypc poblacion_acumulada
line lingreso poblacion_acumulada



*********************
*Gráfico de cajas   *
*********************
gr box gpc ypc if dpto == "02" & aÑo == "2017", nooutside // Box Plot de variables en niveles
gr box lgasto lingreso if dpto == "02" & aÑo == "2017", nooutside // Box Plot de varaibles en logaritmos



*********************
*Gráfico de Pareto  *
*********************
sort dpto ypc
by dpto: gen total = sum(factor07)
by dpto: replace total = total/total[_N]
gen lpareto = log(1-total)
twoway (line lpareto lingreso if dpto == "02") || (line lpareto lingreso if dpto == "15") || if aÑo == "2012", legend(order(02 "Ancash" 15 "Lima"))


*INDICADORES ORDINALES DE DESIGUALDAD
*********************
*Curvas de Lorenz   *
*********************
sort ypc
gen ing_acumulado = sum(ypc*factor07)
replace ing_acumulado = ing_acumulado/ing_acumulado[_N]

twoway line ing_acumulado poblacion_acumulada

drop poblacion_acumulada ing_acumulado
*Lorenz según departamento
sort dpto ypc

by dpto: gen poblacion_acumulada = sum(factor07)
by dpto: replace poblacion_acumulada = poblacion_acumulada/poblacion_acumulada[_N]

*Ingreso acumulado por departamento
by dpto: gen ing_acumulado = sum(ypc*factor07)
by dpto: replace ing_acumulado = ing_acumulado/ing_acumulado[_N]

twoway (line ing_acumulado poblacion_acumulada if dpto == "02") || (line ing_acumulado poblacion_acumulada if dpto == "15") || if aÑo == "2012", legend(label(02 "Ancash") label(15 "Lima"))

**************Lorenz "simple"
lorenz ypc if dpto == "02" & aÑo == "2012"

lorenz ypc if dpto == "15" & aÑo == "2017"
*Gráfico
lorenz ypc if dpto == "15" & aÑo == "2017",g