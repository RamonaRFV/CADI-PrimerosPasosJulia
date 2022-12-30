### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ 719ec702-0f6b-4f42-b53d-07604a338c9d
html"""<style>
main {
    max-width: 1500px;
}

pluto-notebook h1 {
  	font-size: 60px;
}

pluto-notebook h2 {
  	font-size: 40px;
}

html {
  	font-size: 25px;
}

body {
  	font-size: 25px;
}
"""

# ╔═╡ ac1d6a24-01fc-4e18-8f46-8e49f240d96d
html"<button onclick='present()'>Presentación</button>"

# ╔═╡ 722ac6c0-6730-4a61-8e0e-3c06eb3d4f45
md"""
# Programación en Julia:  Primeros pasos
Variables, tipos y operaciones

**Héctor Medel**

**Benjamín Pérez**
"""

# ╔═╡ 56853c2d-37c9-4470-80ec-4af67e2e6521
md"""
## Existen distintos tipos de datos en Julia
Por ejemplo: Char, Int64, Float64
"""

# ╔═╡ 5545e7a7-7f77-4333-811c-ffc273d18930
y = 7

# ╔═╡ d2b293fa-21ab-4e81-b614-09476a2c9b35
typeof(y)

# ╔═╡ 91b39963-86ff-4a57-9c7e-e6b8ada53154
x = "CADI"

# ╔═╡ 2ee9d938-2249-4563-860a-752d3599e01e
typeof(x)

# ╔═╡ 9a373fdc-0302-4597-9656-3393e004fc9e
w = 2.5;   # Agregamos ; para que no imprima el resultado

# ╔═╡ d9299fa1-6cb0-4567-9a0e-0caa860e5fe7
typeof(w)

# ╔═╡ a783ad85-7f97-4a14-959e-478ea23f5993
y+z

# ╔═╡ 91e7a326-594e-4ca9-abd7-9a7b47b96885
y+x

# ╔═╡ 91c8f652-c971-40cd-84a2-a15ab732f573
y+w

# ╔═╡ e67641ac-3ffa-4d5c-b624-f4a2e61d9e3c
md"""
## Algunas ideas para nombrar variables
- Minúsculas con múltiples palabras separadas por un guion bajo ( _ ).
- Nombres cortos.
- Podemos usar símbolos Unicode.  Por ejemplo, **\alpha[TAB]** despliega $\alpha$.
"""

# ╔═╡ 4c86098d-1599-49b5-b5a3-10c5c7999b08
current_time = 0.7

# ╔═╡ 3bd2f608-cd46-414d-bb24-80c69258a80b
α = 2

# ╔═╡ 6f44af70-fe78-4807-9430-86e4e2edb2da
md"""
Los comentarios se agregan usando el símbolo **#**
"""

# ╔═╡ 3394a9bd-51d6-491d-b6ef-724758b60cca
β = 3.1 # Este es un comentario

# ╔═╡ f1d01fce-34e5-448e-bc63-fe1ac07ff958
md"""
Para desplegar valores usamos la funcion **print()**
"""

# ╔═╡ 6c09306b-b10e-4bb5-93c6-24944cfddced
print(β)

# ╔═╡ 8285477d-0d59-461d-9ae0-41d53ac43433
md"""
Incluso podemos agregar texto y el valor de una variable usando el mismo comando
"""

# ╔═╡ 6d492b21-b4a0-409d-b23c-0eacb234efb2
print("El valor de la variable β es $(β)")

# ╔═╡ Cell order:
# ╟─719ec702-0f6b-4f42-b53d-07604a338c9d
# ╟─ac1d6a24-01fc-4e18-8f46-8e49f240d96d
# ╟─722ac6c0-6730-4a61-8e0e-3c06eb3d4f45
# ╟─56853c2d-37c9-4470-80ec-4af67e2e6521
# ╟─5545e7a7-7f77-4333-811c-ffc273d18930
# ╠═d2b293fa-21ab-4e81-b614-09476a2c9b35
# ╠═91b39963-86ff-4a57-9c7e-e6b8ada53154
# ╠═2ee9d938-2249-4563-860a-752d3599e01e
# ╠═9a373fdc-0302-4597-9656-3393e004fc9e
# ╠═d9299fa1-6cb0-4567-9a0e-0caa860e5fe7
# ╠═a783ad85-7f97-4a14-959e-478ea23f5993
# ╠═91e7a326-594e-4ca9-abd7-9a7b47b96885
# ╠═91c8f652-c971-40cd-84a2-a15ab732f573
# ╟─e67641ac-3ffa-4d5c-b624-f4a2e61d9e3c
# ╠═4c86098d-1599-49b5-b5a3-10c5c7999b08
# ╠═3bd2f608-cd46-414d-bb24-80c69258a80b
# ╟─6f44af70-fe78-4807-9430-86e4e2edb2da
# ╠═3394a9bd-51d6-491d-b6ef-724758b60cca
# ╟─f1d01fce-34e5-448e-bc63-fe1ac07ff958
# ╠═6c09306b-b10e-4bb5-93c6-24944cfddced
# ╟─8285477d-0d59-461d-9ae0-41d53ac43433
# ╠═6d492b21-b4a0-409d-b23c-0eacb234efb2
