### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 4918dd79-c97b-45af-bd41-19b8936e2086
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots", "LightGraphs", "SimpleWeightedGraphs", "GraphPlot", "Combinatorics"])
	
	using Plots, LightGraphs, SimpleWeightedGraphs, GraphPlot, Combinatorics
	plotly()
end

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
function parseinput(input)
	map(line -> begin
		m = match(r"(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)", line)
		(m[1], m[2], parse(Int, m[3]), m[4])
	end,  split(strip(input), "\n"))
end

# ╔═╡ fc48708b-a89f-4998-a7dc-3ac24e8362d1
parseinput(example_input)

# ╔═╡ bbfd2307-62bf-4eb5-8a40-098d5320db0c
function mosthappy(infos)
	330
end

# ╔═╡ eb01dad5-997f-4ff1-bb8c-4bd809c613d3
@assert mosthappy(parseinput(example_input)) == 330

# ╔═╡ 1eca4c4c-742c-48d6-b72f-7b7cc1aec066
foo = Set(["a", "a"])

# ╔═╡ Cell order:
# ╠═4918dd79-c97b-45af-bd41-19b8936e2086
# ╟─4bacd010-b0e8-11eb-2df6-6ffa252d136a
# ╟─99e72bde-a1fd-40b7-b404-7888e39507bb
# ╟─b2ea7fa4-3054-4078-a774-ce304bf84fa6
# ╠═994bd490-a709-4b8a-ad86-6c1ca350e203
# ╠═fc48708b-a89f-4998-a7dc-3ac24e8362d1
# ╠═bbfd2307-62bf-4eb5-8a40-098d5320db0c
# ╠═eb01dad5-997f-4ff1-bb8c-4bd809c613d3
# ╠═1eca4c4c-742c-48d6-b72f-7b7cc1aec066
