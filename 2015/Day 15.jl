### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ c1777303-1af2-4be8-8b26-254b70f6263c
using PlutoTest

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

# ╔═╡ 34edc8a5-edc7-4a8d-8bbe-c9d354d8561d
function parseline(line) 
	m = match(r"(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)", line)
	m
	(name=m[1], capacity=parse(Int, m[2]), durability=parse(Int, m[3]), flavor=parse(Int, m[4]), texture=parse(Int, m[5]), calories=parse(Int, m[6]))
end

# ╔═╡ 4122ea48-c078-4b72-81ca-0f6163d7b474
example_ingredients = map(parseline, split(example_input, "\n"))

# ╔═╡ cf9d9179-cbd0-4f1d-aee7-5eb7eaed4559
function cookiescore(ingredients, ratios)
	#if sum(ratios) != 100
#		return -1
#end
	scores = [
		sum(map(((idx, ingredient),)-> ingredient.capacity * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient.durability * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient.flavor * ratios[idx], enumerate(ingredients))),
		sum(map(((idx, ingredient),)-> ingredient.texture * ratios[idx], enumerate(ingredients))),
	]
	prod(map(score -> max(0, score), scores))
end

# ╔═╡ 782f3c0c-d95f-402f-8e1a-ff640b885c2b
function cookiecalories(ingredients, ratios)
	calories = 0
	for (idx, ratio) in enumerate(ratios)
		calories += ingredients[idx][6] * ratio
	end
	calories
end

# ╔═╡ b9a51427-a73f-4b53-aac0-35c49846ec3e
@assert cookiescore(example_ingredients, (44, 56)) == 62842880

# ╔═╡ 65abcb4d-b961-4ad7-b78a-1d40aa64c867
cookiescore(example_ingredients, (44, 56))

# ╔═╡ 0e81de2d-45d0-4627-8479-9dc92ce4433e
function bestcookiescore1(ingredients)
	best = 0
	for a in 1:100
		for b in 1:100-a
			for c in 1:100-(a+b)
				d = 100 - a - b -c
				score = cookiescore(ingredients, (a,b,c,d))
				if score > best
					best = score
				end
			end
		end
	end
	best
end

# ╔═╡ 6e394cd1-dbdc-4540-ab6d-39bdf0299a9c
@assert bestcookiescore1(example_ingredients) == 62842880

# ╔═╡ c3d471b9-f0b5-4e29-937e-dcb917cf2a9c
bestcookiescore1(example_ingredients)

# ╔═╡ 59938b46-ff7d-441f-95ba-1a49fcaeefe7
puzzle_ingredients = map(parseline, split(puzzle_input, "\n"))

# ╔═╡ 0d4650b4-1035-43f4-b423-8824cb3436d2
part1 = bestcookiescore1(puzzle_ingredients)

# ╔═╡ fb3a890b-211c-4fa5-a85e-472183509fa8
@test part1 == 13882464

# ╔═╡ 117c9ac8-6f1e-4dc3-9b74-bb2cabe9b171
md"Your puzzle answer was `13882464`."

# ╔═╡ 9e397f78-a72b-406b-905c-dc1f79e852d0
md"""
# Part Two

Your cookie recipe becomes wildly popular! Someone asks if you can make another recipe that has exactly `500` calories per cookie (so they can use it as a meal replacement). Keep the rest of your award-winning process the same (100 teaspoons, same ingredients, same scoring system).

For example, given the ingredients above, if you had instead selected `40` teaspoons of butterscotch and `60` teaspoons of cinnamon (which still adds to `100`), the total calorie count would be `40*8 + 60*3 = 500`. The total score would go down, though: only `57600000`, the best you can do in such trying circumstances.

Given the ingredients in your kitchen and their properties, **what is the total score of the highest-scoring cookie you can make with a calorie total of `500`**?

"""

# ╔═╡ 3ae1cb15-f704-4559-9043-186c2874a035
function bestcookiescore2(ingredients)
	best = 0
	for a in 1:100
		for b in 1:100-a
			for c in 1:100-(a+b)
				d = 100 - a - b -c
				score = cookiescore(ingredients, (a,b,c,d))
				if score > best && cookiecalories(ingredients, (a,b,c,d)) == 500
					best = score
				end
			end
		end
	end
	best
end

# ╔═╡ a10ef2a7-c9d9-41f0-9cfc-6921a390306f
part2 = bestcookiescore2(puzzle_ingredients)

# ╔═╡ 9274f947-ede1-446e-9845-9e776b2bf42c
@test part2 == 11171160

# ╔═╡ da313ad1-afdf-45cd-9601-5e6dec1f92bc
md"Your puzzle answer was `11171160`."

# ╔═╡ Cell order:
# ╠═c1777303-1af2-4be8-8b26-254b70f6263c
# ╟─aa7f1ad0-b0e8-11eb-3904-bb242d044d08
# ╟─861a2d99-e0a6-44a9-9b18-ca1b25d1eabd
# ╠═ad735981-4fdb-4527-9869-a6a748e2e5dd
# ╠═34edc8a5-edc7-4a8d-8bbe-c9d354d8561d
# ╠═4122ea48-c078-4b72-81ca-0f6163d7b474
# ╠═cf9d9179-cbd0-4f1d-aee7-5eb7eaed4559
# ╠═782f3c0c-d95f-402f-8e1a-ff640b885c2b
# ╠═b9a51427-a73f-4b53-aac0-35c49846ec3e
# ╠═65abcb4d-b961-4ad7-b78a-1d40aa64c867
# ╠═0e81de2d-45d0-4627-8479-9dc92ce4433e
# ╠═6e394cd1-dbdc-4540-ab6d-39bdf0299a9c
# ╠═c3d471b9-f0b5-4e29-937e-dcb917cf2a9c
# ╠═59938b46-ff7d-441f-95ba-1a49fcaeefe7
# ╠═0d4650b4-1035-43f4-b423-8824cb3436d2
# ╠═fb3a890b-211c-4fa5-a85e-472183509fa8
# ╟─117c9ac8-6f1e-4dc3-9b74-bb2cabe9b171
# ╟─9e397f78-a72b-406b-905c-dc1f79e852d0
# ╠═3ae1cb15-f704-4559-9043-186c2874a035
# ╠═a10ef2a7-c9d9-41f0-9cfc-6921a390306f
# ╠═9274f947-ede1-446e-9845-9e776b2bf42c
# ╟─da313ad1-afdf-45cd-9601-5e6dec1f92bc
