####### Funciones ########
## La forma más general de expresar una función
#=
function prueba1(argumentos)
    accion
end
=#

#Ejemplo 1
function hola(mensaje)
    println("$mensaje") #Imprime el mensaje
end

#Ejemplo 2
function mult(x,y)
    println("x es $x, y es $y")
    if x==1
        return y ## Valor que estará regresando
    end
    x*y    
end

### Esta es general pero hará operaciones permitidas
x = [1 2 3] 

mult(x,3)

y = "hola";

mult(x,y)

## Nota: Hay que verificar si las operaciones están permitidas


### Ejemplo 3: Varios valores de salida
function multi(n,m)
    r = n+m
    n*m, div(n,m)# si tenemos operaciones sencillas
    # puedo no usar return
end

multi(3,2)

function multi(n,m)
    r = n+m
    n*m, div(n,m)

    return r
end

multi(4,1)

###############

##Ejemplo: Puntos suspensivos
# Tomar mas argumentos
function varargs(n,m,args...) #
println("argumentos: $n,$n,$args")
end

varargs(1,2)
varargs(1,2,3)
varargs(1,2,4,5,6,7)

## Sub-Ejemplo
function varargs2(args...)
    n = args.*2
    return n
end

varargs2(2,3,4)


### Ejemplo: regresando un poco (strings)
function palabras(n,m)
    m = n*m
    println("$n","$m")
    return m
end

palabras("hola","mundo")

### Ejemplo: numeros, vectores
function opera(a,v)
    w = a*v
    z = v/a

    return w,z
end

opera(2,[2 3])


#############################################
# Funciones con argumentos definidos
function mult2(x::Float64,y::Float64)
    x*y
end

mult2(2,3.0)

mult2(2.0,3.0)

function mult3(x::T,y::T,n::Int64) where T<:Float64
    x*y*n
end

mult3(4.0,3.0,2)

##### Funciones como expresiones matemáticas
f(x,y) = x^3 - x*y + 1/y

f(2.0,3)


g(x) = x^2 + 2*x + 1

v = [ 1.0 , 3.0 , 4.0]
g.(v)

w = rand(2,2)

g.(w)
###############
# Argumentos opcionales en las Funciones
#Ejemplo sencillo
function pref(a,b=2;k="ABC")
    r = a + b
    return r
end

pref(1,7)

### Ejemplos: Puntos suspensivos
function varargs2(;args...)
    args
end

salida = varargs2(k1="nombre1",k2="nombre2",k3=7)

#############################
#### Funciones anónimas ######
x= 3;
function (x)
    x + 2
end

(x) -> x+2

h = x -> 3*x

h(2.3)

#######Función de Funciones
function derivada(f::Function,x::Float64,dx::Float64)
    df = (f(x+dx)-f(x-dx))/(2*dx)
    return df
end

derivada(h,2.0,0.001)
#=
function g(x::Float64)
    g = 4*x^2-2
end
=#
derivada(g,1.0,0.001)

######### Funciones anidadas
function a(x)
    z = x^2
    function b(ζ)
        ζ = ζ+1
    end
    return b(z)
end

a(10)

##### Broadcasting
# Podemos operar funciones sobre arreglos
# elemento por elemento usando el operador .

v = rand(10)

a.(v)

w = rand(2,3)

a.(w)
#####################################
######## Despacho múltiple ##########
#####################################

## Funciones pueden tener varios métodos
# Ejemplo:
fm(x::Int64) = x^3 - 2 ## Trabaja con enteros
fm(3.0) ### Error por no estar bien definida
fm(x::Float64) = x^3 - 2.0
fm(3.0) 

####### Despacho múltiple
### Puedo generar diferentes despachos (comportamientos)
### dependiendo del métodos

#### Ejemplos:
gdm(x) = println("hola")
gdm(3)
gdm(x::Int64) = println("Hola entero")
gdm(3.0)
gdm(3)

### Ejemplo: Casos vs Despacho múltiple
function gg(x)
    tf = typeof(x)
    if tf == Int64
        println("Hola entero!")
    elseif tf == Float64
        println("Hola flotante!")
    else 
        println("Hola todos!")
    end
end


j(x::Int64) = println("Hola entero!")

j(x::Float64) = println("Hola flotante!")

j(x) = println("Hola todos!")

j(3)
j(3.0)
j("a")

v = rand(10)
w = rand(3,3)

function producto(x::Vector{Float64},w::Matrix{Float64})

end

