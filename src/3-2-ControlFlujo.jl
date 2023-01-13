######## Control flujo
# Condicionales
# Loops

#### Condicionales
#=
if condicion1 
    accion1
elseif condicion2
    accion2
elseif condicion3
    accion3
else 
    otra comportamientos
end
=#

# Ejmplos:

var = 11
if var > 10
    println("var tiene valor $var y es mayor que 10")
elseif var < 10
    println("var tiene valor $var y es menor que 10")
else
    println("var es mayor que 10")
end

##### Ejemplo: operador ternario simple: ?
#=
condicion ? accion_si_es_verdadero : accion_si_es_falso
=#
α = 10
β = 15

ζ = α > β ? α : β 
α > β ? α : β 


## Ejemplo: Ternario anidado 
var = 6
varout = "var tiene valor $var"

var > 10 ? "var es mayor que 10" : var < 10 ? "var es menor que 10" : "var es 10"

function cond2(x)
    if x > 10 
        return "var es mayor que 10"
       println("var es mayor que 10")
    elseif x < 10
        return "var es menor que 10"
       println("var es menor que 10")
    else
        return "var es 10"
        println("var es 10")
    end

end

z = cond2(11)


###### Evaluación mínima
#=
Condicion positiva
if condicion 
    accion
end

Es equivalente a:
condicion && accion

Negacion condicion
if !condicion 
    accion
end
Equivalente a:
condicion || accion
=#

#Ejemplo 
function sqroot(n::Int64)
    n >= 0 || error("n debe ser no negativo")
    n >= 0 && return sqrt(n)
    #n > && return sqrt(n)
end

sqroot(4)


###############################
######### Bucles ##############
###############################
#=
for, while 
break, continue
=#
##### Bucle for
#=
for i in coleccion
    accion
end
=#
#Ejemplos
for n=1:10
    println(n^3)
end

v = rand(5)

for r in v
    println(r)
end

for r ∈ v
    println(r^2+1)
end
#### Ejemplo: Función enumerate
arr = [x^2 for x in 1:10]

for (ix,val) ∈ enumerate(arr)
    println("el $ix-ésimo elemento es $val")
end
# El anterior bucle es equivalente
for i =1:length(arr)
    println("el $i-ésimo elemento es $(arr[i])")
end

### Bucles anidados
for n=1:5
    for m = 1:5
        println("$n*$m=$(n*m)")
    end
end

### Bucles externo
for n=1:5,m=1:6
    println("$n*$m=$(n*m)")
end

### Arreglos
v = [ x*y for x in 1:5, y in 1:6]
w = [ x*y for x in 1:5 for y in 1:6]
w[7:10]


######### Bucle while 
#=
while condicion cierta
    accion
end
=#
#Ejemplos
α = 10 
β = 15

while α < β
    println(α)
    α +=1
end

#### Ejemplo: while usando arreglos
arr = [0,1,2,3,4]

while !isempty(arr)
    println(pop!(arr))
end

#### break en bucle while
#Ejemplo:
α = 10
β = 150
while α < β
    print(α," ")
    α +=1
    if α >= 60
        break
    end
end

### break en bucle for
arr = rand(1:10,10)
searched = 11

for (ix,curr) ∈ enumerate(arr)
    if curr == searched
        println("El elemento buscado $searched está en la posición $ix")
        break
    else
        println("No está")
    end
end

#### comando continue

# Ejemplo
for n in 1:10
    if 3<= n <= 6
        continue
    end
    println(n)
end

### Qué tan local es local
x= 3
function funscope(n)
x = 0 # es una variable local 
for i=1:n
    local x # variable local en Loops
    x = i + 1
    if x==7
        println("Esta es la x local en el loop: $x")
    end
end
x
println("Esta es una variable local en la función $x")

global x = 15
end

funscope(11)
x