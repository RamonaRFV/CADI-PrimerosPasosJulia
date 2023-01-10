# El dia de ayer llegamos a ver
# como generamos arreglos

arreglo = [1, 2, 3, 4, 5]
arreglozeros = zeros(5)
arregloindef = Array{Float64}(undef, 5)
arreglovacio = []
push!(arreglovacio, 1.0)
arreglovacio
push!(arreglovacio, 2.0)

# Generacion de matrices
matriz1 = [1 2 3 4; 
           5 6 7 8; 
           9 10 11 12]

typeof(matriz1)
eltype(matriz1)

matrizF = Float64.(matriz1)   # broadcast
typeof(matrizF)

length(matriz1)
size(matriz1)
ndims(matriz1)

# Indexado en arreglos
# [] --> Indexado
# () --> funciones, tuplas
# : --> lo podemos usar para leer rangos de valores
matrizc = rand(10,10)
matrizc[1,2]
matrizc[2,:]
matrizc[:,2]
matrizc[2:6, 3:5]
matrizc[3:end, 5:end]
matrizc.>0.5

## Concatenar
aa = collect(1:7)
bb = [100, 200, 300]
cc = [aa; bb]

append!(aa,bb)
aa

## Operador . -- Operacion elemento 
# por elemento
# rangos   inicio:incremento:final

x = collect(0:0.1:1)
1.0.+x
sin.(x)

append!(x, 1.1)
x