### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ bbfa7498-30bf-4264-b4d9-ee0c238c9984
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots", "LightGraphs", "GraphPlot", "Combinatorics", "PlutoUI"])
	
	using Plots, LightGraphs, GraphPlot, Combinatorics, PlutoUI
	plotly()
end

# ╔═╡ 56cedfe0-b02c-11eb-1f56-3557d6c170bc
md"""
# [Day 9: All in a Single Night](https://adventofcode.com/2015/day/9)


Every year, Santa manages to deliver all of his presents in a single night.

This year, however, he has some new locations to visit; his elves have provided him the distances between every pair of locations. He can start and end at any two (different) locations he wants, but he must visit each location exactly once. What is the shortest distance he can travel to achieve this?

For example, given the following distances:

```
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141

```

The possible routes are therefore:

```
Dublin -> London -> Belfast = 982
London -> Dublin -> Belfast = 605
London -> Belfast -> Dublin = 659
Dublin -> Belfast -> London = 659
Belfast -> Dublin -> London = 605
Belfast -> London -> Dublin = 982

```

The shortest of these is `London -> Dublin -> Belfast = 605`, and so the answer is `605` in this example.

**What is the distance of the shortest route?**
"""

# ╔═╡ 1609ee1f-1d90-4889-b39d-5fe0fb6de8c4
puzzle_input = "AlphaCentauri to Snowdin = 66
AlphaCentauri to Tambi = 28
AlphaCentauri to Faerun = 60
AlphaCentauri to Norrath = 34
AlphaCentauri to Straylight = 34
AlphaCentauri to Tristram = 3
AlphaCentauri to Arbre = 108
Snowdin to Tambi = 22
Snowdin to Faerun = 12
Snowdin to Norrath = 91
Snowdin to Straylight = 121
Snowdin to Tristram = 111
Snowdin to Arbre = 71
Tambi to Faerun = 39
Tambi to Norrath = 113
Tambi to Straylight = 130
Tambi to Tristram = 35
Tambi to Arbre = 40
Faerun to Norrath = 63
Faerun to Straylight = 21
Faerun to Tristram = 57
Faerun to Arbre = 83
Norrath to Straylight = 9
Norrath to Tristram = 50
Norrath to Arbre = 60
Straylight to Tristram = 27
Straylight to Arbre = 81
Tristram to Arbre = 90"

# ╔═╡ 76183faa-4f76-4da6-bcff-255e7d70b730
function read(paths) 
	nodes = []
	distances = Dict()
	
	for line in split(paths, "\n")
		m = match(r"(\w+) to (\w+) = (\d+)", line)
		distances[m[1] * m[2]] = distances[m[2] * m[1]] = parse(Int, m[3])
		
		if m[1] ∉ nodes
			push!(nodes, m[1])
		end
		if m[2] ∉ nodes
			push!(nodes, m[2])
		end
	end
	
	smallest_distance = 9999666
		
	for c in permutations(nodes)
		d = 0
		for idx in 1:length(c)-1
			m = nodes[idx]
			n = nodes[idx+1]
			name = m * n
			d += distances[name]
		end
				
		if d < smallest_distance
			smallest_distance = d
		end
	end
		
	smallest_distance	
end

# ╔═╡ 684af9bd-4282-40ea-85d8-2d2d89c258c0
@assert read("""London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141""") == 605

# ╔═╡ 8e52af28-3c76-4ec9-b6c2-fe780916fc41
with_terminal() do
	read(puzzle_input)
end

# ╔═╡ be574368-3f0d-4863-b420-ad14106b5175
part1 = read(puzzle_input)

# ╔═╡ a9c154ea-3250-4123-94fa-b6b5e9100771
# 316 : your answer is too high

# ╔═╡ db425385-e66e-4461-b03e-5f03551ea816
with_terminal() do
	for c in permutations(["AlphaCentauri", "Snowdin", "Tambi"])
		println(c)
	end
end

# ╔═╡ 3ffc6481-2267-4d97-8065-d2fd78c637e9
function build_graph(paths)
	edges = []
	for line in split(paths, "\n")
		m = match(r"(\w+) to (\w+) = (\d+)", line)
		push!(edges, (m[1], m[2], m[3]))
	end
	
	nodes = Dict()
	next_id = 1
	for (from, to, weight) in edges
		if !haskey(nodes, from)
			nodes[from] = next_id 
			next_id += 1
		end
		if !haskey(nodes, to)
			nodes[to] = next_id 
			next_id += 1
		end
	end
	
	
	g = SimpleGraph(length(nodes));
		
	for (from, to, weight) in edges
		add_edge!(g, nodes[from], nodes[to]);
	end
	
	g
end

# ╔═╡ 78d4f47f-96b6-44f9-b9ab-2cb84bbb19b0
example_graph = build_graph("""London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141""")

# ╔═╡ 7e17c6f5-3972-4777-9611-f4c321108144
gplot(example_graph)

# ╔═╡ 8e78e6fe-cb4a-46f7-839b-42aa35f7b71a
puzzle_graph = build_graph(puzzle_input)

# ╔═╡ 8dde0e83-121f-4720-80b6-00020bd33a6b
gplot(puzzle_graph)

# ╔═╡ Cell order:
# ╠═bbfa7498-30bf-4264-b4d9-ee0c238c9984
# ╟─56cedfe0-b02c-11eb-1f56-3557d6c170bc
# ╟─1609ee1f-1d90-4889-b39d-5fe0fb6de8c4
# ╠═76183faa-4f76-4da6-bcff-255e7d70b730
# ╠═684af9bd-4282-40ea-85d8-2d2d89c258c0
# ╠═8e52af28-3c76-4ec9-b6c2-fe780916fc41
# ╠═be574368-3f0d-4863-b420-ad14106b5175
# ╠═a9c154ea-3250-4123-94fa-b6b5e9100771
# ╠═db425385-e66e-4461-b03e-5f03551ea816
# ╠═3ffc6481-2267-4d97-8065-d2fd78c637e9
# ╠═78d4f47f-96b6-44f9-b9ab-2cb84bbb19b0
# ╠═7e17c6f5-3972-4777-9611-f4c321108144
# ╠═8e78e6fe-cb4a-46f7-839b-42aa35f7b71a
# ╠═8dde0e83-121f-4720-80b6-00020bd33a6b
