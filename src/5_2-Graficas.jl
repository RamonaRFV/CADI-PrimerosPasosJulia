# Plots.jl
# GR, Plotly, PyPlot, UnicodePlots
# Makie

using Plots

xs = 0.0:0.01:2.0
ys = xs.^2
plot(xs, ys)

plotattr(:Series)

plot(xs, ys,
    color = :orange,
    linewidth = 4,
    linestyle = :dash,
    arrow = :arrow,
    xlabel = "x",
    ylabel = "y",
    xticks = 0:0.2:2,
    yticks = 0:0.2:4
    )

# escena
p = plot()
p = plot!(xlabel = "x",
        ylabel = "y",
        xticks = 0:0.2:2,
        yticks = 0:0.2:4
        )

# grafica
p = plot!(xs, ys,
        color = :blue,
        linewidth = 4,
        linestyle = :dash,
        arrow = :arrow
        )

ys2 = sqrt.(xs)        
p = plot!(xs, ys2,
        color = :black,
        linewidth = 4,
        linestyle = :dash,
        arrow = :arrow)

plot(p)

# scatter
xs3 = rand(10)
ys3 = rand(10)

p1 = scatter(xs3, ys3)
p2 = plot(xs, xs.^3)

plot(p, p1, p2)

## Funcion de dos variables
gg(x,y) = exp(-x^2 - y^2)
xs = -2.0:0.2:2.0
ys = xs'

GG = gg.(xs, ys)

# wireframe
wireframe(xs, ys', GG)

# heatmap
heatmap(xs, ys', GG, aspect_ratio=1)

## curva parametrica
tt = -0.2:0.1:1.2
rx1 = tt
ry1 = -0.3*tt .- 0.3
rz1 = gg.(rx1, ry1)

# wireframe con una curva sobre su superficie 
p7 = wireframe(xs, ys', GG)
p7 = plot3d!(rx1, ry1, rz1, linewidth=4, color = :red)

# grabar la figura
## Usaremos la funcion savefig()
savefig(p7, "figura1.png")
savefig(p7, "figura1.pdf")
savefig(p7, "figura1.svg")

# Images... ]add Images <-- jalar las figuras

Nt = 50
# gr()
pAnimacion=plot()
anim = @animate for ii = 1:Nt
    pAnimacion = scatter([rand()],[rand()], xlims=(0,1), ylims=(0,1), color=:black, leg=false)
end

cps = 10
gif(anim, "anim_fps15.gif", fps = cps)