### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 68fd4890-b438-11eb-3d17-a3cc7fb859ba
md"""
# [Day 1: No Time for a Taxicab](https://adventofcode.com/2016/day/1)

Santa's sleigh uses a very high-precision clock to guide its movements, and the clock's oscillator is regulated by stars. Unfortunately, the stars have been stolen... by the Easter Bunny. To save Christmas, Santa needs you to retrieve all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

You're airdropped near Easter Bunny Headquarters in a city somewhere. "Near", unfortunately, is as close as you can get - the instructions on the Easter Bunny Recruiting Document the Elves intercepted start here, and nobody had time to work them out further.

The Document indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (`L`) or right (`R`) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.

There's no time to follow such ridiculous instructions on foot, though, so you take a moment and work out the destination. Given that you can only walk on the [street grid of the city](https://en.wikipedia.org/wiki/Taxicab_geometry), how far is the shortest path to the destination?

For example:

-   Following `R2, L3` leaves you `2` blocks East and `3` blocks North, or `5` blocks away.
-   `R2, R2, R2` leaves you `2` blocks due South of your starting position, which is `2` blocks away.
-   `R5, L5, R5, R3` leaves you `12` blocks away.

**How many blocks away is Easter Bunny HQ?**
"""

# ╔═╡ 10b9f984-a80f-4bdc-8e91-182224860a6a
puzzle_input = "L4, R2, R4, L5, L3, L1, R4, R5, R1, R3, L3, L2, L2, R5, R1, L1, L2, R2, R2, L5, R5, R5, L2, R1, R2, L2, L4, L1, R5, R2, R1, R1, L2, L3, R2, L5, L186, L5, L3, R3, L5, R4, R2, L5, R1, R4, L1, L3, R3, R1, L1, R4, R2, L1, L4, R5, L1, R50, L4, R3, R78, R4, R2, L4, R3, L4, R4, L1, R5, L4, R1, L2, R3, L2, R5, R5, L4, L1, L2, R185, L5, R2, R1, L3, R4, L5, R2, R4, L3, R4, L2, L5, R1, R2, L2, L1, L2, R2, L2, R1, L5, L3, L4, L3, L4, L2, L5, L5, R2, L3, L4, R4, R4, R5, L4, L2, R4, L5, R3, R1, L1, R3, L2, R2, R1, R5, L4, R5, L3, R2, R3, R1, R4, L4, R1, R3, L5, L1, L3, R2, R1, R4, L4, R3, L3, R3, R2, L3, L3, R4, L2, R4, L3, L4, R5, R1, L1, R5, R3, R1, R3, R4, L1, R4, R3, R1, L5, L5, L4, R4, R3, L2, R1, R5, L3, R4, R5, L4, L5, R2"

# ╔═╡ a5bc4a35-a5cb-4411-805f-49edb1ac09c4


# ╔═╡ 67881f6b-641c-4a8b-9536-05cad11fffe7
function exec_moves(input) 
	moves = split(input, ", ")
	pos = [0,0]
	direction = 1 # north
	
	for move in moves
		distance = parse(Int, move[2])
		if move[1] == "L"
			direction -= 1 
			if direction < 1
				direction = 4
			end
		elseif move[1] == "R"
			direction += 1
			if direction > 4
				direction = 1
			end		
		end
		
		if direction == 1 # north
			pos[1] += distance
		elseif direction == 2 # east
			pos[2] += distance
		elseif direction == 3 # south
			pos[1] -= distance
		elseif direction == 4 # west
			pos[2] -= distance
		end
	end
	
	pos
end

# ╔═╡ ddf66bd4-e128-4c19-a296-1aa80210df61
@assert exec_moves("R2, L3") == (3,2) 

# ╔═╡ 414b8bb2-d348-4f3f-aea2-dc09a0106018
exec_moves("R2, L3")

# ╔═╡ Cell order:
# ╟─68fd4890-b438-11eb-3d17-a3cc7fb859ba
# ╟─10b9f984-a80f-4bdc-8e91-182224860a6a
# ╠═a5bc4a35-a5cb-4411-805f-49edb1ac09c4
# ╠═67881f6b-641c-4a8b-9536-05cad11fffe7
# ╠═ddf66bd4-e128-4c19-a296-1aa80210df61
# ╠═414b8bb2-d348-4f3f-aea2-dc09a0106018
