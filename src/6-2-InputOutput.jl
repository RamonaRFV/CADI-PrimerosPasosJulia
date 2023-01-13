#=
Intput/Output de datos

Paquetes
-- DelimitedFiles
-- CSV
-- DataFrames

pkg> add DelimitedFiles, CSV, DataFrames
=#

###################################
###### Abrir/Cerrar archivos ######
###################################
#=
se utiliza el comando open
opciones:
r <- lectura
w <- escritura
a <- append
=#
#Ejemplo 1: Escritura sencilla
io = open("textout.txt","w")
write(io,"Hola a todos!")
close(io)

readdir()

#Ejemplo: Lectura sencilla
iin = open("textout.txt","r")
read(iin,String)
close(iin)

using Faker

ttext = Faker.text(number_chars=100000)

io = open("texto.txt","w")
write(io,ttext)
close(io)

iin2 = open("texto.txt","r")
read(iin2,String)
close(iin2)

## append
io = open("textout.txt","a")
write(io,"Hola universo!")
close(io)

######## do 
# Ejemplo escritura
tt = "hola, hola, mundo!"
open("textout2.txt","w") do file
    write(file,tt)
end
readdir()

#Ejemplo lectura
ft = open("textout2.txt")do file
    read(file,String)
end

ft
# Ejemplo append
open("textout3.txt","a") do file
    for j=1:100
        print(file,j)
    end
end

readdir()

io = open("textout3.txt","r")
read(io,String)
close(io)

vt = open("textout3.txt")do file
    read(file,String)
end
vt

##############################################
########### DelimitedFiles ###################
##############################################
#=
Con este paquete podemos tratar lectura y escritura
de arreglos
=#
using DelimitedFiles

x = [1,2,3,4,5]
y = [6,7,8,9,10]

open("delimout1.txt","w") do file
    writedlm(file,[x y])
end

readdir()

## Ejemplo lectura
mt = readdlm("delimout1.txt",'\t',Int,'\n')

mt

vt = Vector(1:100)

open("vector1.txt","w") do file
    writedlm(file, vt)
end

readdir()

vtt = vec(readdlm("vector1.txt",' ',Any,'\n'))

vtt

################################################
################ CSV / DataFrames ##############
################################################
using CSV, DataFrames
#=
CSV manipula archivos con extension CSV
DataFrames presentar los datos como dataframe
=#

#Ejemplo: cargar archivos

dfr1 = CSV.File("230110COVID19MEXICO.csv") 

df1 = DataFrame(dfr1)

dfsample1 = first(df1,200000)

#Ejemplo: Escritura
CSV.write("sample1.csv",dfsample1)

readdir()

dfsample1[:,4]
dfsample1.UCI

