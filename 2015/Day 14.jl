### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 76d27f60-b0e8-11eb-3fd3-a7b73d0d4cfe
md"""
# [Day 14: Reindeer Olympics](https://adventofcode.com/2015/day/14)

This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must rest occasionally to recover their energy. Santa would like to know which of his reindeer is fastest, and so he has them race.

Reindeer can only either be flying (always at their top speed) or resting (not moving at all), and always spend whole seconds in either state.

For example, suppose you have the following Reindeer:

-   Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
-   Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.

After one second, Comet has gone 14 km, while Dancer has gone 16 km. After ten seconds, Comet has gone 140 km, while Dancer has gone 160 km. On the eleventh second, Comet begins resting (staying at 140 km), and Dancer continues on for a total distance of 176 km. On the 12th second, both reindeer are resting. They continue to rest until the 138th second, when Comet flies for another ten seconds. On the 174th second, Dancer flies for another 11 seconds.

In this example, after the 1000th second, both reindeer are resting, and Comet is in the lead at `1120` km (poor Dancer has only gotten `1056` km by that point). So, in this situation, Comet would win (if the race ended at 1000 seconds).

Given the descriptions of each reindeer (in your puzzle input), after exactly `2503` seconds, **what distance has the winning reindeer traveled?**
"""

# ╔═╡ 7b3cffcf-5c04-4d13-9714-8dad9e4956f3
puzzle_input = "Vixen can fly 19 km/s for 7 seconds, but then must rest for 124 seconds.
Rudolph can fly 3 km/s for 15 seconds, but then must rest for 28 seconds.
Donner can fly 19 km/s for 9 seconds, but then must rest for 164 seconds.
Blitzen can fly 19 km/s for 9 seconds, but then must rest for 158 seconds.
Comet can fly 13 km/s for 7 seconds, but then must rest for 82 seconds.
Cupid can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Dancer can fly 3 km/s for 16 seconds, but then must rest for 37 seconds.
Prancer can fly 25 km/s for 6 seconds, but then must rest for 143 seconds."

# ╔═╡ 4c30acd3-078f-40a6-8e22-c90704abef38
function parseline(line) 
	m = match(r"(\w+) can fly (\d+) km/s for (\d+) seconds, but then must rest for (\d+) seconds.", line)
	(parse(Int, m[2]), parse(Int, m[3]), parse(Int, m[4]))
end

# ╔═╡ 6259b41c-e73c-46b6-bf76-2f42c6428003
example_players = map(parseline, ["Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.", "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."])

# ╔═╡ 21d4c9cf-2502-4522-90fc-5136e5bd13bd
function distance(player, time)
	km = player[1]
	fly_seconds = player[2]
	rest_seconds = player[3]
	d = 0
	while time > 0
		stepTime = min(fly_seconds, time)
		d += stepTime * km		
		time -= stepTime + rest_seconds
	end
	
	d		
end

# ╔═╡ bec1d683-76e6-4b80-968c-4179944073cc
maxdistance(players, time) = maximum(map(player->distance(player, time), players))

# ╔═╡ cac38821-4cef-4d15-a86b-7878a37392da
@assert maxdistance(example_players, 1000) == 1120

# ╔═╡ 315d6498-c7d6-44f6-876f-3cbc599d7393
puzzle_players = map(parseline, split(puzzle_input, "\n"))

# ╔═╡ 598ca1b1-acfc-449d-be51-6ae63efaeaa7
part1 = maxdistance(puzzle_players, 2503)

# ╔═╡ 17210bdf-21cd-4f48-8e86-b7c568ee3e2d
md"Your puzzle answer was `2660`."

# ╔═╡ 0975d5a4-675e-42b8-8ab1-4b31dc2de102
md"""
# Part Two 

Seeing how reindeer move in bursts, Santa decides he's not pleased with the old scoring system.

Instead, at the end of each second, he awards one point to the reindeer currently in the lead. (If there are multiple reindeer tied for the lead, they each get one point.) He keeps the traditional 2503 second time limit, of course, as doing otherwise would be entirely ridiculous.

Given the example reindeer from above, after the first second, Dancer is in the lead and gets one point. He stays in the lead until several seconds into Comet's second burst: after the 140th second, Comet pulls into the lead and gets his first point. Of course, since Dancer had been in the lead for the 139 seconds before that, he has accumulated 139 points by the 140th second.

After the 1000th second, Dancer has accumulated `689` points, while poor Comet, our old champion, only has `312`. So, with the new scoring system, Dancer would win (if the race ended at 1000 seconds).

Again given the descriptions of each reindeer (in your puzzle input), after exactly `2503` seconds, **how many points does the winning reindeer have?**
"""

# ╔═╡ 9cd8509d-38c3-49d0-bc6d-84c862bd37e0


# ╔═╡ Cell order:
# ╟─76d27f60-b0e8-11eb-3fd3-a7b73d0d4cfe
# ╟─7b3cffcf-5c04-4d13-9714-8dad9e4956f3
# ╠═4c30acd3-078f-40a6-8e22-c90704abef38
# ╠═6259b41c-e73c-46b6-bf76-2f42c6428003
# ╠═21d4c9cf-2502-4522-90fc-5136e5bd13bd
# ╠═bec1d683-76e6-4b80-968c-4179944073cc
# ╠═cac38821-4cef-4d15-a86b-7878a37392da
# ╠═315d6498-c7d6-44f6-876f-3cbc599d7393
# ╠═598ca1b1-acfc-449d-be51-6ae63efaeaa7
# ╟─17210bdf-21cd-4f48-8e86-b7c568ee3e2d
# ╟─0975d5a4-675e-42b8-8ab1-4b31dc2de102
# ╠═9cd8509d-38c3-49d0-bc6d-84c862bd37e0
