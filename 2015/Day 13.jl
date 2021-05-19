### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 4918dd79-c97b-45af-bd41-19b8936e2086
using Plots, Combinatorics, PlutoTest

# ╔═╡ 8764aae7-27b7-4426-b97e-8b39f3fda965
using LightGraphs, SimpleWeightedGraphs, GraphPlot

# ╔═╡ e48f4d54-a05a-4cda-8726-36a49b5f2585
plotly()

# ╔═╡ 4bacd010-b0e8-11eb-2df6-6ffa252d136a
md"""
# [Day 13: Knights of the Dinner Table](https://adventofcode.com/2015/day/13)

In years past, the holiday feast with your family hasn't gone so well. Not everyone gets along! This year, you resolve, will be different. You're going to find the optimal seating arrangement and avoid all those awkward conversations.

You start by writing up a list of everyone invited and the amount their happiness would increase or decrease if they were to find themselves sitting next to each other person. You have a circular table that will be just big enough to fit everyone comfortably, and so each person will have exactly two neighbors.

For example, suppose you have only four attendees planned, and you calculate their potential happiness as follows:

```
Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David.
Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David.
Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David.
David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol.

```

Then, if you seat Alice next to David, Alice would lose `2` happiness units (because David talks so much), but David would gain `46` happiness units (because Alice is such a good listener), for a total change of `44`.

If you continue around the table, you could then seat Bob next to Alice (Bob gains `83`, Alice gains `54`). Finally, seat Carol, who sits next to Bob (Carol gains `60`, Bob loses `7`) and David (Carol gains `55`, David gains `41`). The arrangement looks like this:

```
     +41 +46
+55   David    -2
Carol       Alice
+60    Bob    +54
     -7  +83

```

After trying every other seating arrangement in this hypothetical scenario, you find that this one is the most optimal, with a total change in happiness of `330`.

**What is the total change in happiness for the optimal seating arrangement of the actual guest list?**
"""

# ╔═╡ 99e72bde-a1fd-40b7-b404-7888e39507bb
puzzle_input = """
Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 81 happiness units by sitting next to Carol.
Alice would lose 42 happiness units by sitting next to David.
Alice would gain 89 happiness units by sitting next to Eric.
Alice would lose 89 happiness units by sitting next to Frank.
Alice would gain 97 happiness units by sitting next to George.
Alice would lose 94 happiness units by sitting next to Mallory.
Bob would gain 3 happiness units by sitting next to Alice.
Bob would lose 70 happiness units by sitting next to Carol.
Bob would lose 31 happiness units by sitting next to David.
Bob would gain 72 happiness units by sitting next to Eric.
Bob would lose 25 happiness units by sitting next to Frank.
Bob would lose 95 happiness units by sitting next to George.
Bob would gain 11 happiness units by sitting next to Mallory.
Carol would lose 83 happiness units by sitting next to Alice.
Carol would gain 8 happiness units by sitting next to Bob.
Carol would gain 35 happiness units by sitting next to David.
Carol would gain 10 happiness units by sitting next to Eric.
Carol would gain 61 happiness units by sitting next to Frank.
Carol would gain 10 happiness units by sitting next to George.
Carol would gain 29 happiness units by sitting next to Mallory.
David would gain 67 happiness units by sitting next to Alice.
David would gain 25 happiness units by sitting next to Bob.
David would gain 48 happiness units by sitting next to Carol.
David would lose 65 happiness units by sitting next to Eric.
David would gain 8 happiness units by sitting next to Frank.
David would gain 84 happiness units by sitting next to George.
David would gain 9 happiness units by sitting next to Mallory.
Eric would lose 51 happiness units by sitting next to Alice.
Eric would lose 39 happiness units by sitting next to Bob.
Eric would gain 84 happiness units by sitting next to Carol.
Eric would lose 98 happiness units by sitting next to David.
Eric would lose 20 happiness units by sitting next to Frank.
Eric would lose 6 happiness units by sitting next to George.
Eric would gain 60 happiness units by sitting next to Mallory.
Frank would gain 51 happiness units by sitting next to Alice.
Frank would gain 79 happiness units by sitting next to Bob.
Frank would gain 88 happiness units by sitting next to Carol.
Frank would gain 33 happiness units by sitting next to David.
Frank would gain 43 happiness units by sitting next to Eric.
Frank would gain 77 happiness units by sitting next to George.
Frank would lose 3 happiness units by sitting next to Mallory.
George would lose 14 happiness units by sitting next to Alice.
George would lose 12 happiness units by sitting next to Bob.
George would lose 52 happiness units by sitting next to Carol.
George would gain 14 happiness units by sitting next to David.
George would lose 62 happiness units by sitting next to Eric.
George would lose 18 happiness units by sitting next to Frank.
George would lose 17 happiness units by sitting next to Mallory.
Mallory would lose 36 happiness units by sitting next to Alice.
Mallory would gain 76 happiness units by sitting next to Bob.
Mallory would lose 34 happiness units by sitting next to Carol.
Mallory would gain 37 happiness units by sitting next to David.
Mallory would gain 40 happiness units by sitting next to Eric.
Mallory would gain 18 happiness units by sitting next to Frank.
Mallory would gain 7 happiness units by sitting next to George.""" |> strip

# ╔═╡ b2ea7fa4-3054-4078-a774-ce304bf84fa6
example_input = "
Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David.
Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David.
Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David.
David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol." |> strip

# ╔═╡ 994bd490-a709-4b8a-ad86-6c1ca350e203
function parseline(line)
	m = match(r"(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)", line)
	(
		personA=m[1], 
		value=m[2] == "gain" ? parse(Int, m[3]) : -parse(Int, m[3]), 
		personB=m[4]
	)
end

# ╔═╡ fc48708b-a89f-4998-a7dc-3ac24e8362d1
map(parseline, split(example_input, "\n"))

# ╔═╡ 717f4ea0-b6a7-4049-b4a3-ce79fef4ec32
function calc_happiness(table, rules)
	by_name = Dict(name => 0 for name in table)
	table2 = vcat(table[2:end], table[1])
	
	for (a,b) in zip(table, table2)
		for change in filter(r -> r.personA == a && r.personB == b, rules)
			by_name[a] += change.value
		end
		for change in filter(r -> r.personA == b && r.personB == a, rules)
			by_name[b] += change.value
		end
	end
	
	return sum(values(by_name))
end

# ╔═╡ d726299a-786c-472d-ab10-001bd288f5c1
calc_happiness(["Alice", "Bob", "Carol", "David"], map(parseline, split(example_input, "\n")))

# ╔═╡ bbfd2307-62bf-4eb5-8a40-098d5320db0c
function mosthappy1(rules)
	people = collect(Set(map(rule -> rule.personA, rules)))
	
	maxhappiness = 0
	for perm in permutations(people)
		maxhappiness = max(maxhappiness, calc_happiness(perm, rules))
	end
	maxhappiness
end

# ╔═╡ eb01dad5-997f-4ff1-bb8c-4bd809c613d3
@assert mosthappy1(map(parseline, split(example_input, "\n"))) == 330

# ╔═╡ 39b98fdd-782f-4614-af12-8ba266bee41a
part1 = mosthappy1(map(parseline, split(puzzle_input, "\n")))

# ╔═╡ e8343b85-aa88-4163-bed1-404264ab23af
@test part1 == 709

# ╔═╡ 62ab159c-6bc5-474b-8ae4-86b3a3f8ef12
md"Your puzzle answer was `709`."

# ╔═╡ 5ca3b7cc-5b66-4365-9c2f-7d1034d3c4f2
md"""
# Part Two

In all the commotion, you realize that you forgot to seat yourself. At this point, you're pretty apathetic toward the whole thing, and your happiness wouldn't really go up or down regardless of who you sit next to. You assume everyone else would be just as ambivalent about sitting next to you, too.

So, add yourself to the list, and give all happiness relationships that involve you a score of `0`.

What is the total change in happiness for the optimal seating arrangement that actually includes yourself?

"""

# ╔═╡ 48782852-f830-4772-b514-d95f8b4a5189
function mosthappy2(rules)
	people = collect(Set(map(rule -> rule.personA, rules)))
	me_rules = copy(rules)
	
	for person in people
		push!(rules, (personA="me", value=0, personB=person))
		push!(rules, (personA=person, value=0, personB="me"))
	end	
	
	push!(people, "me")	
	maxhappiness = 0
	for perm in permutations(people)
		maxhappiness = max(maxhappiness, calc_happiness(perm, rules))
	end
	maxhappiness
end

# ╔═╡ 417da2c9-cbe5-4ca9-a46f-18db168dcd88
part2 = mosthappy2(map(parseline, split(puzzle_input, "\n")))

# ╔═╡ db1e2565-3223-423b-a408-4bd2c680dc62
md"Your puzzle answer was `668`."

# ╔═╡ ff4448b7-73a3-4114-8b31-3ed17c02bc30
@test part2 == 668

# ╔═╡ Cell order:
# ╠═4918dd79-c97b-45af-bd41-19b8936e2086
# ╠═8764aae7-27b7-4426-b97e-8b39f3fda965
# ╠═e48f4d54-a05a-4cda-8726-36a49b5f2585
# ╟─4bacd010-b0e8-11eb-2df6-6ffa252d136a
# ╟─99e72bde-a1fd-40b7-b404-7888e39507bb
# ╟─b2ea7fa4-3054-4078-a774-ce304bf84fa6
# ╠═994bd490-a709-4b8a-ad86-6c1ca350e203
# ╠═fc48708b-a89f-4998-a7dc-3ac24e8362d1
# ╠═717f4ea0-b6a7-4049-b4a3-ce79fef4ec32
# ╠═d726299a-786c-472d-ab10-001bd288f5c1
# ╠═bbfd2307-62bf-4eb5-8a40-098d5320db0c
# ╠═eb01dad5-997f-4ff1-bb8c-4bd809c613d3
# ╠═39b98fdd-782f-4614-af12-8ba266bee41a
# ╠═e8343b85-aa88-4163-bed1-404264ab23af
# ╟─62ab159c-6bc5-474b-8ae4-86b3a3f8ef12
# ╟─5ca3b7cc-5b66-4365-9c2f-7d1034d3c4f2
# ╠═48782852-f830-4772-b514-d95f8b4a5189
# ╠═417da2c9-cbe5-4ca9-a46f-18db168dcd88
# ╟─db1e2565-3223-423b-a408-4bd2c680dc62
# ╠═ff4448b7-73a3-4114-8b31-3ed17c02bc30
