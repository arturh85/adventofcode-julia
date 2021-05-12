### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ c5b26b1f-ae3a-4415-a971-373df73a2bb7
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots", "Optim", "Convex", "SCS", "GLPK", "ECOS"])
	
	using Plots, Optim, Convex, SCS, GLPK, ECOS
	plotly()
end

# ╔═╡ aa7f1ad0-b0e8-11eb-3904-bb242d044d08
md"""
# [Day 15: Science for Hungry People](https://adventofcode.com/2015/day/15)

Today, you set out on the task of perfecting your milk-dunking cookie recipe. All you have to do is find the right balance of ingredients.

Your recipe leaves room for exactly `100` teaspoons of ingredients. You make a list of the remaining ingredients you could use to finish the recipe (your puzzle input) and their properties per teaspoon:

-   `capacity` (how well it helps the cookie absorb milk)
-   `durability` (how well it keeps the cookie intact when full of milk)
-   `flavor` (how tasty it makes the cookie)
-   `texture` (how it improves the feel of the cookie)
-   `calories` (how many calories it adds to the cookie)

You can only measure ingredients in whole-teaspoon amounts accurately, and you have to be accurate so you can reproduce your results in the future. The total score of a cookie can be found by adding up each of the properties (negative totals become `0`) and then multiplying together everything except calories.

For instance, suppose you have these two ingredients:

```
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3

```

Then, choosing to use `44` teaspoons of butterscotch and `56` teaspoons of cinnamon (because the amounts of each ingredient must add up to `100`) would result in a cookie with the following properties:

-   A `capacity` of `44*-1 + 56*2 = 68`
-   A `durability` of `44*-2 + 56*3 = 80`
-   A `flavor` of `44*6 + 56*-2 = 152`
-   A `texture` of `44*3 + 56*-1 = 76`

Multiplying these together (`68 * 80 * 152 * 76`, ignoring `calories` for now) results in a total score of `62842880`, which happens to be the best score possible given these ingredients. If any properties had produced a negative total, it would have instead become zero, causing the whole score to multiply to zero.

Given the ingredients in your kitchen and their properties, **what is the total score of the highest-scoring cookie you can make?**
"""

# ╔═╡ 861a2d99-e0a6-44a9-9b18-ca1b25d1eabd
puzzle_input = "Sprinkles: capacity 5, durability -1, flavor 0, texture 0, calories 5
PeanutButter: capacity -1, durability 3, flavor 0, texture 0, calories 1
Frosting: capacity 0, durability -1, flavor 4, texture 0, calories 6
Sugar: capacity -1, durability 0, flavor 0, texture 2, calories 8"

# ╔═╡ ad735981-4fdb-4527-9869-a6a748e2e5dd
example_input = """
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
""" |> strip

# ╔═╡ 02954358-49c5-401f-9a0d-02f52ac9ba51
begin
	allratios = []
	for a in 1:100
		for b in 1:100-a
			for c in 1:100-b
				d = 100 - a - b -c
				@assert a+b+c+d == 100
				push!(allratios, (a,b,c,d))
			end
		end
	end
	allratios
end

# ╔═╡ 3b3bf3fd-0adc-4f43-9c22-5d2ae5f56e39
h(p) = allratios[Int(floor(p * 1.0/length(allratios))+1)]

# ╔═╡ 35b9cb94-a96f-4bf2-9951-4b6233f7096f
h(0.3)

# ╔═╡ 5840a437-718c-4b82-b816-09e8c7f0db5f
begin
	lower = 0
	upper = 1
	initial_x = 0.5
	inner_optimizer = GradientDescent()
	results = optimize(h, lower, upper, initial_x, Fminbox(inner_optimizer))
end

# ╔═╡ 34edc8a5-edc7-4a8d-8bbe-c9d354d8561d
function parseline(line) 
	m = match(r"(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)", line)
	m
	(m[1], parse(Int, m[2]), parse(Int, m[3]), parse(Int, m[4]), parse(Int, m[5]), parse(Int, m[6]))
end

# ╔═╡ 4122ea48-c078-4b72-81ca-0f6163d7b474
example_ingredients = map(parseline, split(example_input, "\n"))

# ╔═╡ cf9d9179-cbd0-4f1d-aee7-5eb7eaed4559
function cookiescore(ingredients, ratios)
	#if sum(ratios) != 100
#		return -1
#end
	scores = [
		sum(map(((idx, ingredient),)-> ingredient[2] * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient[3] * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient[4] * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient[5] * ratios[idx], enumerate(ingredients))),
	]
	prod(map(score -> max(0, score), scores))
end

# ╔═╡ e5a9f833-d4ae-4c93-95b6-a7be49d7a0cd
md"""$$\begin{array}{ll}
  \text{maximize} & f((a,b,c,d) \\
    \text{subject to} & a,b,c,d \in \mathbb{N} \\
  & a+b+c+d = 100 \\
\end{array}$$"""

# ╔═╡ 437b534a-aadf-4fb7-b234-9de378f32912
g(a,b,c,d) = begin
	a + b + c + d
end

# ╔═╡ b280f103-b00d-4e0b-b07c-421612d838dc
supertype(Convex.MultiplyAtom)

# ╔═╡ b9a51427-a73f-4b53-aac0-35c49846ec3e
@assert cookiescore(example_ingredients, (44, 56)) == 62842880

# ╔═╡ 65abcb4d-b961-4ad7-b78a-1d40aa64c867
cookiescore(example_ingredients, (44, 56))

# ╔═╡ 0e81de2d-45d0-4627-8479-9dc92ce4433e
function bestcookiescore(ingredients)
	0
end

# ╔═╡ 6e394cd1-dbdc-4540-ab6d-39bdf0299a9c
@assert bestcookiescore(example_ingredients) == 62842880

# ╔═╡ c3d471b9-f0b5-4e29-937e-dcb917cf2a9c
bestcookiescore(example_ingredients)

# ╔═╡ 59938b46-ff7d-441f-95ba-1a49fcaeefe7
puzzle_ingredients = map(parseline, split(puzzle_input, "\n"))

# ╔═╡ 0781c72b-7b11-4c1a-8acd-9e6646edb83a
f(ratios) = cookiescore(puzzle_ingredients, ratios)

# ╔═╡ 0d90bd8f-f3e1-4da1-a95b-443ae7bfc213
begin
	Convex.emit_dcp_warnings() = false
	a = Variable(:Int)
	b = Variable(:Int)
	c = Variable(:Int)
	d = Variable(:Int)

	problem = maximize(f((a,b,c,d)), [a+b+c+d == 100])
	#problem = maximize(g(a,b,c,d), [a+b+c+d == 100])
	#solve!(problem, SCS.Optimizer)
	solve!(problem, GLPK.Optimizer)
	#solve!(problem, ECOS.Optimizer)
	
	#solve!(problem, Gurobi.Optimizer)
	#solve!(problem, Mosek.Optimizer)
	
end

# ╔═╡ e7254e54-e1cb-44f5-bb72-f84d3941d684
typeof(b * 5)

# ╔═╡ 04b8263f-d1da-4bc9-a51c-386dd8e056d9
	# Check the status of the problem
	problem.status # :Optimal, :Infeasible, :Unbounded etc.


# ╔═╡ 1369cc78-6fa3-40c3-a9d6-ed8907518841

	# Get the optimal value
	problem.optval

# ╔═╡ 4cc5e639-14f5-4c7a-aeba-7923902299ca
a

# ╔═╡ 0ed935b2-6de6-4105-ac50-f6c9f025cd20
b

# ╔═╡ 376d810d-c5a2-46e5-ac75-5e6cbb938b9c
c

# ╔═╡ 76f0a7c0-c2b4-48db-81b6-5420b6f9f42e
d

# ╔═╡ 0d4650b4-1035-43f4-b423-8824cb3436d2
part1 = bestcookiescore(puzzle_ingredients)

# ╔═╡ ef49dbf5-44bc-4da6-b432-7a11f631a34c
part1_test = cookiescore(puzzle_ingredients, (18, 8, 3, 71))

# ╔═╡ 9eaf770f-b324-4995-9048-3bede3450a78
part1_tes2t = cookiescore(puzzle_ingredients, (25, 25, 25, 25))

# ╔═╡ 05c9cedd-fa2e-4fad-9c51-e69a5f130489
# > 56232

# ╔═╡ Cell order:
# ╠═c5b26b1f-ae3a-4415-a971-373df73a2bb7
# ╟─aa7f1ad0-b0e8-11eb-3904-bb242d044d08
# ╟─861a2d99-e0a6-44a9-9b18-ca1b25d1eabd
# ╠═ad735981-4fdb-4527-9869-a6a748e2e5dd
# ╠═02954358-49c5-401f-9a0d-02f52ac9ba51
# ╠═3b3bf3fd-0adc-4f43-9c22-5d2ae5f56e39
# ╠═35b9cb94-a96f-4bf2-9951-4b6233f7096f
# ╠═5840a437-718c-4b82-b816-09e8c7f0db5f
# ╠═34edc8a5-edc7-4a8d-8bbe-c9d354d8561d
# ╠═4122ea48-c078-4b72-81ca-0f6163d7b474
# ╠═cf9d9179-cbd0-4f1d-aee7-5eb7eaed4559
# ╠═0781c72b-7b11-4c1a-8acd-9e6646edb83a
# ╟─e5a9f833-d4ae-4c93-95b6-a7be49d7a0cd
# ╠═437b534a-aadf-4fb7-b234-9de378f32912
# ╠═0d90bd8f-f3e1-4da1-a95b-443ae7bfc213
# ╠═e7254e54-e1cb-44f5-bb72-f84d3941d684
# ╠═b280f103-b00d-4e0b-b07c-421612d838dc
# ╠═04b8263f-d1da-4bc9-a51c-386dd8e056d9
# ╠═1369cc78-6fa3-40c3-a9d6-ed8907518841
# ╠═4cc5e639-14f5-4c7a-aeba-7923902299ca
# ╠═0ed935b2-6de6-4105-ac50-f6c9f025cd20
# ╠═376d810d-c5a2-46e5-ac75-5e6cbb938b9c
# ╠═76f0a7c0-c2b4-48db-81b6-5420b6f9f42e
# ╠═b9a51427-a73f-4b53-aac0-35c49846ec3e
# ╠═65abcb4d-b961-4ad7-b78a-1d40aa64c867
# ╠═0e81de2d-45d0-4627-8479-9dc92ce4433e
# ╠═6e394cd1-dbdc-4540-ab6d-39bdf0299a9c
# ╠═c3d471b9-f0b5-4e29-937e-dcb917cf2a9c
# ╠═59938b46-ff7d-441f-95ba-1a49fcaeefe7
# ╠═0d4650b4-1035-43f4-b423-8824cb3436d2
# ╠═ef49dbf5-44bc-4da6-b432-7a11f631a34c
# ╠═9eaf770f-b324-4995-9048-3bede3450a78
# ╠═05c9cedd-fa2e-4fad-9c51-e69a5f130489
