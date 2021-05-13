### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ bbfa7498-30bf-4264-b4d9-ee0c238c9984
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots", "LightGraphs", "GraphPlot", "Combinatorics"])
	
	using Plots, LightGraphs, GraphPlot, Combinatorics
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
	
	nodes, distances
end

# ╔═╡ 8abefd65-5a57-4717-8bf4-4e92ebe9d562
function smallest((nodes, distances),)	
	smallest_distance = 9999666
		
	for c in permutations(nodes)
		d = 0
		for idx in 1:length(c)-1
			m = c[idx]
			n = c[idx+1]
			name = m * n
			d += distances[name]
		end
		
		#println(join(c, " -> ") * " = " * string(d))
				
		if d < smallest_distance
			smallest_distance = d
		end
	end
		
	smallest_distance	
end

# ╔═╡ 684af9bd-4282-40ea-85d8-2d2d89c258c0
@assert smallest(read("""London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141""")) == 605

# ╔═╡ be574368-3f0d-4863-b420-ad14106b5175
part1 = smallest(read(puzzle_input))

# ╔═╡ 1d1f08c8-7092-4ea9-8884-43e28062c036
md"Your puzzle answer was `141`."

# ╔═╡ 64028478-8bc7-412a-82be-de768aaa1fe6
md"""
# Part Two

The next year, just to show off, Santa decides to take the route with the longest distance instead.

He can still start and end at any two (different) locations he wants, and he still must visit each location exactly once.

For example, given the distances above, the longest route would be `982` via (for example) `Dublin -> London -> Belfast`.

**What is the distance of the longest route?**
"""

# ╔═╡ ccd1c5e7-1c13-4608-8293-e4e0a76cca37
function biggest((nodes, distances),)	
	biggest_distance = 0
		
	for c in permutations(nodes)
		d = 0
		for idx in 1:length(c)-1
			m = c[idx]
			n = c[idx+1]
			name = m * n
			d += distances[name]
		end
				
		if d > biggest_distance
			biggest_distance = d
		end
	end
		
	biggest_distance	
end

# ╔═╡ a548a1da-187a-4aa7-a338-c6c0b4114177
@assert biggest(read("""London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141""")) == 982

# ╔═╡ dbdedef1-f657-460f-93a7-e27a2563fcae
part2 = biggest(read(puzzle_input))

# ╔═╡ 0d5b2494-5454-41ec-9a3d-e627e4c27f51
md"Your puzzle answer was `736`."

# ╔═╡ Cell order:
# ╠═bbfa7498-30bf-4264-b4d9-ee0c238c9984
# ╟─56cedfe0-b02c-11eb-1f56-3557d6c170bc
# ╟─1609ee1f-1d90-4889-b39d-5fe0fb6de8c4
# ╠═3ffc6481-2267-4d97-8065-d2fd78c637e9
# ╠═78d4f47f-96b6-44f9-b9ab-2cb84bbb19b0
# ╠═7e17c6f5-3972-4777-9611-f4c321108144
# ╠═8e78e6fe-cb4a-46f7-839b-42aa35f7b71a
# ╠═8dde0e83-121f-4720-80b6-00020bd33a6b
# ╠═76183faa-4f76-4da6-bcff-255e7d70b730
# ╠═8abefd65-5a57-4717-8bf4-4e92ebe9d562
# ╠═684af9bd-4282-40ea-85d8-2d2d89c258c0
# ╠═be574368-3f0d-4863-b420-ad14106b5175
# ╟─1d1f08c8-7092-4ea9-8884-43e28062c036
# ╟─64028478-8bc7-412a-82be-de768aaa1fe6
# ╠═ccd1c5e7-1c13-4608-8293-e4e0a76cca37
# ╠═a548a1da-187a-4aa7-a338-c6c0b4114177
# ╠═dbdedef1-f657-460f-93a7-e27a2563fcae
# ╟─0d5b2494-5454-41ec-9a3d-e627e4c27f51
