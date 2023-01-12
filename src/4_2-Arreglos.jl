1### Algo mas de manejo de arreglos

A = [1, 2, 3]
B = [1 2 3]
C = [1 2 3; 
     4 4 5]

# Operaciones matriciales
[1 2] * [3; 4]
[1; 2] * [1 2]
[1 2] .* [3 4]

zeros(Float64, 10,10)
mrand = rand(10, 15)
Array{Any}(undef, 10,10)

# Informacion de las matrices
ndims(mrand)
size(mrand)
size(mrand,1)
size(mrand,2)
length(mrand)
size(mrand[:])
ones(10,15)

vectorR = 1:5
vectorC = [2, 5, 1]
Arand = rand(5,10)
Arand[:,[2,5,2]]
rand(5,10)[vectorR, vectorC]

# Instalamos el paquete de algebra lineal
# ]add LinearAlgebra

# Matriz identidad
I   # Letra I mayuscula
Matrix(I, 5, 5)

M = rand(500,500);  # ; no despliega el resultado
M + I
M + Matrix(I,500,500)

# Instalamos el paquete de benchmark
# ]add BenchmarkTools
@benchmark M + Matrix(I,500,500)
@benchmark M + I

# Funciones reshape y repeat
# reshape(vector, renglones, columnas)
vectorA = collect(1:12)
reshape(vectorA, 3, :)
matrizB = [1 2 3 4; 5 6 7 8; 9 10 11 12]
reshape(matrizB, 12, 1)

aa = zeros(3,3,3)
reshape(aa, 1, 1, 27)

# repeat
matrizC = [1 2; 
           3 4]
repeat(matrizC, 2, 4)
Arp = repeat(matrizC, inner=(2,2), outer=(3,4))
Arp

# Definicion de una funcion Gaussiana
ff(x,y) = exp(-x^2 - y^2)

# Queremos definir una malla
xs = collect(-2.0:0.1:2.0)
ys = collect(-2.0:0.1:2.0)

# [X,Y] = meshgrid(x,y)   #  Dos matrices de coordenadas

ff.(xs,ys')

# mi meshgrid "casero"
Xs = repeat(xs, 1, length(xs))
Ys = Xs'

ff.(Xs,Ys)