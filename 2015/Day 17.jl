### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ da1b7333-9417-46ff-82a1-b1c2f2dea898
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Combinatorics"])
	
	using Combinatorics
end

# ╔═╡ 00942730-b0e9-11eb-0b2b-f75ca9edadef
md"""
# [Day 17: No Such Thing as Too Much](https://adventofcode.com/2015/day/17)

The elves bought too much eggnog again - `150` liters this time. To fit it all into your refrigerator, you'll need to move it into smaller containers. You take an inventory of the capacities of the available containers.

For example, suppose you have containers of size `20`, `15`, `10`, `5`, and `5` liters. If you need to store `25` liters, there are four ways to do it:

-   `15` and `10`
-   `20` and `5` (the first `5`)
-   `20` and `5` (the second `5`)
-   `15`, `5`, and `5`

Filling all containers entirely, **how many different combinations of containers can exactly fit all `150` liters of eggnog?**
"""

# ╔═╡ 8c0509ca-d12e-4dcf-9ccc-3f50189a52fc
puzzle_input = "11
30
47
31
32
36
3
1
5
3
32
36
15
11
46
26
28
1
19
3"

# ╔═╡ e44eedbb-747f-4c1b-9a86-62360e9ca26d
puzzle_containers = split(puzzle_input, "\n") |> Base.Fix1(map, s->parse(Int, s))

# ╔═╡ 7c29c125-0158-4350-a265-45c3fcdd7759
example_containers = [20, 15, 10, 5, 5]

# ╔═╡ b3730be9-6de1-441c-9379-d6fbc4070f26
fillcombos(containers, target) = filter(c -> sum(c) == target, collect(combinations(containers)))

# ╔═╡ 8d17977b-147c-4883-907f-8c5a57f6db04
fillcombos(example_containers, 25)

# ╔═╡ 7b8fc350-d982-45a8-84ad-05e05a7621ec
@assert length(fillcombos(example_containers, 25)) == 4

# ╔═╡ 49a9f8fc-35ed-43c9-887f-5a9539f81327
part1 = length(fillcombos(puzzle_containers, 150))

# ╔═╡ d121315b-6677-4321-bf18-3d9e55d0e242
md"Your puzzle answer was `4372`."

# ╔═╡ 2ed48157-bd9b-4374-b1bc-b406ae15c82d
md"""
# Part Two

While playing with all the containers in the kitchen, another load of eggnog arrives! The shipping and receiving department is requesting as many containers as you can spare.

Find the minimum number of containers that can exactly fit all `150` liters of eggnog. How many different ways can you fill that number of containers and still hold exactly `150` litres?

In the example above, the minimum number of containers was two. There were three ways to use that many containers, and so the answer there would be `3`.
"""

# ╔═╡ 5859e90b-f4cf-40f5-a680-9feb4e65c476
function smallestcombo(combo)
	lengths = map(length, combo)
	smallest = minimum(lengths)
	filter(c -> length(c) == smallest, combo)
end

# ╔═╡ 4dd35aa3-75d5-4d1e-8c6f-56527ec9e9b5
@assert length(smallestcombo(fillcombos(example_containers, 25))) == 3

# ╔═╡ e789427d-cc33-4be8-ae59-12c2ed5ad2ea
part2 = length(smallestcombo(fillcombos(puzzle_containers, 150)))

# ╔═╡ 7b90394f-dc75-4ec0-8ba2-b51b1c66fdb0
md"Your puzzle answer was `4`."

# ╔═╡ Cell order:
# ╠═da1b7333-9417-46ff-82a1-b1c2f2dea898
# ╟─00942730-b0e9-11eb-0b2b-f75ca9edadef
# ╟─8c0509ca-d12e-4dcf-9ccc-3f50189a52fc
# ╠═e44eedbb-747f-4c1b-9a86-62360e9ca26d
# ╠═7c29c125-0158-4350-a265-45c3fcdd7759
# ╠═b3730be9-6de1-441c-9379-d6fbc4070f26
# ╠═8d17977b-147c-4883-907f-8c5a57f6db04
# ╠═7b8fc350-d982-45a8-84ad-05e05a7621ec
# ╠═49a9f8fc-35ed-43c9-887f-5a9539f81327
# ╟─d121315b-6677-4321-bf18-3d9e55d0e242
# ╟─2ed48157-bd9b-4374-b1bc-b406ae15c82d
# ╠═5859e90b-f4cf-40f5-a680-9feb4e65c476
# ╠═4dd35aa3-75d5-4d1e-8c6f-56527ec9e9b5
# ╠═e789427d-cc33-4be8-ae59-12c2ed5ad2ea
# ╟─7b90394f-dc75-4ec0-8ba2-b51b1c66fdb0
