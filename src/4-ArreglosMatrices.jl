### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ 7d24bbf2-d5c1-4a73-888b-b6d6b12d144c
using PlutoUI

# ╔═╡ 890fbb5e-0c49-46b0-958d-a1bc26b020cc
using LinearAlgebra

# ╔═╡ c0b437b0-8b87-11ed-0f5c-fd75a05541c0
html"""<style>
main {
    max-width: 1500px;  #1500px
}

pluto-notebook h1 {
  	font-size: 60px;    #60px
	
}

pluto-notebook h2 {
  	font-size: 40px;    #40px
}

html {
  	font-size: 25px;    #25px
}

body {
  	font-size: 25px;    #25px
}
"""

# ╔═╡ 27c29391-0a3f-4ba4-84c1-346f05eb850e
html"<button onclick='present()'>Presentación</button>"

# ╔═╡ 52e8b0f5-5267-4487-b243-ed9ca1b9676d
md"""
# Programación en Julia:  Primeros pasos
Colecciones -- Arreglos, matrices, vectores y tuplas

**Héctor Medel**

**Benjamín Pérez**
"""

# ╔═╡ c6663b27-2934-41b5-887a-665f9f4e3206
md"""
## Matrices

- Hemos visto la sintaxis **[1, 2, 3]** crea un arreglo, en particular, un vector columna.
"""

# ╔═╡ 400949cf-3cd7-4392-8601-cbff552b2876
[1 2 3]   # Vector renglon

# ╔═╡ 98c0cef3-df87-4afb-ae6a-0dd87b839015
[1, 2, 3]   # Vector columna

# ╔═╡ 5653f2e2-ac34-4aba-a015-1d415e596d5e
md"""
- Para crear una matriz, separamos los valores con **espacios** para las columnas, y usamos **;** para los renglones.
"""

# ╔═╡ 4529d0af-b623-4bdf-b52b-0b7df77875f0
[1 2 3; 4 5 6]

# ╔═╡ c32c05cc-576c-4034-82a1-dd6c7979fde0
[1 2 3; 
 4 5 6]

# ╔═╡ c4710b9f-0e19-498e-be9e-15bc5ae86351
md"""
- Noten que no podemos usar **,** y **;** juntas. 
"""

# ╔═╡ 698573b5-7ffc-44b2-b925-15ada2f58876
md"""
## Productos matriciales
"""

# ╔═╡ d0dc2bf0-c814-4c17-93ce-5b3e6094e07f
[1 2] * [3; 4]  # Vector renglon por vector columna

# ╔═╡ 8a90a62c-88cd-422a-bd21-93fb26a6d6c3
[1; 2] * [3 4]  # Vector columna por vector renglon

# ╔═╡ d4cc0ffb-fd52-4b6b-b04d-2bbe96777c8f
[1 2] .* [3 4]  # Producto de vectores por elemento

# ╔═╡ 458139e2-2388-44ab-ac0a-0989c8cc80af
md"""
- Ahora usaremos la función **rand()** para generar matrices cuyos elementos son números aleatorios.
"""

# ╔═╡ cfe8cf91-6aaf-4f9e-9a6c-4e62d27a2ca6
mat1 = rand(20,20)

# ╔═╡ 5fbc21ba-42ea-4295-a916-d493467fcded
md"""
## 
Tenemos en memoria la matriz **mat1**
"""

# ╔═╡ ada3070d-83a8-4d08-b5bd-b0b4b565243d
ndims(mat1)

# ╔═╡ ded3cff4-5337-4d85-a26c-e7de4fd305a6
nrows, ncols = size(mat1)

# ╔═╡ e66b4744-18f7-4dd1-8c87-342d3fb3f9f3
nrows

# ╔═╡ adf9bce5-3b2a-42f7-83d5-1b16e6e1039f
length(mat1)

# ╔═╡ cf470687-3003-48a4-92e0-c01fef3be2a3
size(mat1[:])

# ╔═╡ 86097717-2ce6-45ba-82d7-5de5c2df0369
md"""
Algunas matrices que comúnmente usamos:  zeros(N,M), ones(N,M), Identidad, ...
"""

# ╔═╡ 7a11fdd2-2153-493f-8cce-3637408e0199
zeros(5 ,5)

# ╔═╡ 2bc61cd7-0fc9-4ee9-93e3-92be039a4c64
ones(5 ,5)

# ╔═╡ 37df4036-27f7-470a-ad03-73e9cecb49a1
md"""
##
La matriz identidad se encuentra dentro del paquete LinearAlgebra
"""

# ╔═╡ 6d6c4428-3314-49ee-adad-e72ed73e6a6c
rrmat = rand(5,5)

# ╔═╡ 8b83af4b-b4de-4385-9b35-a142338ed4c6
I  # En muchas ocasiones no necesitamos generar la matriz...  podemos tener un objeto identidad con sus propiedades definidas

# ╔═╡ 40fca436-b150-4979-afe1-4604d3bbb654
Matrix(I,5,5)   # Sin embargo, en otras ocasiones puede ser util generar una matriz... 

# ╔═╡ 704375d9-2849-4a02-85fb-7f77d5e80a2d
rrmat + I

# ╔═╡ 38fffe22-37e8-4c00-8a06-5681c08be96a
rrmat + Matrix(I,5,5)

# ╔═╡ 25179701-9286-4663-8861-bce1dc979b59
rrmat[Matrix(I,5,5)]   # Podemos usar la matriz identidad para accesar a los valores de la diagonal principal

# ╔═╡ 64c1a0c2-6d72-45d8-aeb8-84e7f360728e
md"""
## **reshape**
- Nos permite cambiar las dimensiones de una matriz (si es posible).
"""

# ╔═╡ 3e51d19b-6712-41c9-9627-7e623008b883
vecA = collect(1:12)

# ╔═╡ e15c9b1d-01d8-4f4f-a088-32d55eff7314
reshape(vecA, 2, 6)

# ╔═╡ 51dd95b1-b3bf-4aec-b19a-00f1ee9e04f8
matB = [1 2 3 4; 5 6 7 8; 9 10 11 12]

# ╔═╡ 0b1b99d0-d0f0-4089-bbf0-e29a4563c9df
reshape(matB,4,3)

# ╔═╡ c435d235-e314-477a-a826-5d2e2f60a6a2
md"""
## **repeat**

- Nos permite repetir arreglos para generar un arreglo de dimensión diferente.
"""

# ╔═╡ d3d9c651-fd71-4775-aed9-c42222636c08
matC = [1 2; 3 4]

# ╔═╡ 7fcc283a-e31c-4df9-b5b1-ea2964b3f58b
repeat(matC, 2, 4)

# ╔═╡ 16bca2a2-a650-4373-b2fb-113050f0367b
repeat(matC, inner=(2,2), outer=(3,4))

# ╔═╡ c3fa6229-da01-457c-b49c-fcb7d049ccad
md"""
## Una tupla es un grupo de valores de tamaño fijo, separado por comas y entre paréntesis.
"""

# ╔═╡ 2dc69746-a179-447f-b7c2-fd152b3c4196
md"""
- Puede contener distintos tipos de valores.
- Es un contenedor heterogéneo.
"""

# ╔═╡ 5ae9ed26-1bc4-41ad-9493-8b90609659bd
a1, a2, a3, a4, a5 = 1, 2.4, 'c', "Hola", collect(1:4)

# ╔═╡ 5df86101-82e6-4b63-b439-6fdfd3c489dd
t1 = a1,a2,a3,a4,a5

# ╔═╡ d7e33e0f-e8c6-4a00-991e-0a94586b01ae
typeof(t1)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.49"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "3731524a0be8981c0b3969f8e7511b0d5e2849dc"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "6466e524967496866901a78fca3f2e9ea445a559"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eadad7b14cf046de6eb41f13c9275e5aa2711ab6"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.49"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─7d24bbf2-d5c1-4a73-888b-b6d6b12d144c
# ╟─c0b437b0-8b87-11ed-0f5c-fd75a05541c0
# ╟─27c29391-0a3f-4ba4-84c1-346f05eb850e
# ╟─52e8b0f5-5267-4487-b243-ed9ca1b9676d
# ╟─c6663b27-2934-41b5-887a-665f9f4e3206
# ╠═400949cf-3cd7-4392-8601-cbff552b2876
# ╠═98c0cef3-df87-4afb-ae6a-0dd87b839015
# ╟─5653f2e2-ac34-4aba-a015-1d415e596d5e
# ╠═4529d0af-b623-4bdf-b52b-0b7df77875f0
# ╠═c32c05cc-576c-4034-82a1-dd6c7979fde0
# ╟─c4710b9f-0e19-498e-be9e-15bc5ae86351
# ╟─698573b5-7ffc-44b2-b925-15ada2f58876
# ╠═d0dc2bf0-c814-4c17-93ce-5b3e6094e07f
# ╠═8a90a62c-88cd-422a-bd21-93fb26a6d6c3
# ╠═d4cc0ffb-fd52-4b6b-b04d-2bbe96777c8f
# ╟─458139e2-2388-44ab-ac0a-0989c8cc80af
# ╠═cfe8cf91-6aaf-4f9e-9a6c-4e62d27a2ca6
# ╟─5fbc21ba-42ea-4295-a916-d493467fcded
# ╠═ada3070d-83a8-4d08-b5bd-b0b4b565243d
# ╠═ded3cff4-5337-4d85-a26c-e7de4fd305a6
# ╠═e66b4744-18f7-4dd1-8c87-342d3fb3f9f3
# ╠═adf9bce5-3b2a-42f7-83d5-1b16e6e1039f
# ╠═cf470687-3003-48a4-92e0-c01fef3be2a3
# ╟─86097717-2ce6-45ba-82d7-5de5c2df0369
# ╠═7a11fdd2-2153-493f-8cce-3637408e0199
# ╠═2bc61cd7-0fc9-4ee9-93e3-92be039a4c64
# ╟─37df4036-27f7-470a-ad03-73e9cecb49a1
# ╠═890fbb5e-0c49-46b0-958d-a1bc26b020cc
# ╠═6d6c4428-3314-49ee-adad-e72ed73e6a6c
# ╠═8b83af4b-b4de-4385-9b35-a142338ed4c6
# ╠═40fca436-b150-4979-afe1-4604d3bbb654
# ╠═704375d9-2849-4a02-85fb-7f77d5e80a2d
# ╠═38fffe22-37e8-4c00-8a06-5681c08be96a
# ╠═25179701-9286-4663-8861-bce1dc979b59
# ╟─64c1a0c2-6d72-45d8-aeb8-84e7f360728e
# ╠═3e51d19b-6712-41c9-9627-7e623008b883
# ╠═e15c9b1d-01d8-4f4f-a088-32d55eff7314
# ╠═51dd95b1-b3bf-4aec-b19a-00f1ee9e04f8
# ╠═0b1b99d0-d0f0-4089-bbf0-e29a4563c9df
# ╟─c435d235-e314-477a-a826-5d2e2f60a6a2
# ╠═d3d9c651-fd71-4775-aed9-c42222636c08
# ╠═7fcc283a-e31c-4df9-b5b1-ea2964b3f58b
# ╠═16bca2a2-a650-4373-b2fb-113050f0367b
# ╟─c3fa6229-da01-457c-b49c-fcb7d049ccad
# ╟─2dc69746-a179-447f-b7c2-fd152b3c4196
# ╠═5ae9ed26-1bc4-41ad-9493-8b90609659bd
# ╠═5df86101-82e6-4b63-b439-6fdfd3c489dd
# ╠═d7e33e0f-e8c6-4a00-991e-0a94586b01ae
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
