### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 6ca83e83-423a-4621-ae14-dc8da5913394
using Plots, PlutoTest

# ╔═╡ df80bc4c-770a-4acd-a4f3-337c6b720c71
plotly()

# ╔═╡ 20fb22d0-b0e9-11eb-1561-8b6505f5cb45
md"""
# [Day 18: Like a GIF For Your Yard](https://adventofcode.com/2015/day/18)

After the [million lights incident](https://adventofcode.com/2015/day/6), the fire code has gotten stricter: now, at most ten thousand lights are allowed. You arrange them in a 100x100 grid.

Never one to let you down, Santa again mails you instructions on the ideal lighting configuration. With so few lights, he says, you'll have to resort to animation.

Start by setting your lights to the included initial configuration (your puzzle input). A `#` means "on", and a `.` means "off".

Then, animate your grid in steps, where each step decides the next configuration based on the current one. Each light's next state (either on or off) depends on its current state and the current states of the eight lights adjacent to it (including diagonals). Lights on the edge of the grid might have fewer than eight neighbors; the missing ones always count as "off".

For example, in a simplified 6x6 grid, the light marked `A` has the neighbors numbered `1` through `8`, and the light marked `B`, which is on an edge, only has the neighbors marked `1` through `5`:

```
1B5...
234...
......
..123.
..8A4.
..765.

```

The state a light should have next is based on its current state (on or off) plus the number of neighbors that are on:

-   A light which is on stays on when `2` or `3` neighbors are on, and turns off otherwise.
-   A light which is off turns on if exactly `3` neighbors are on, and stays off otherwise.

All of the lights update simultaneously; they all consider the same current state before moving to the next.

Here's a few steps from an example configuration of another 6x6 grid:

```
Initial state:
.#.#.#
...##.
#....#
..#...
#.#..#
####..

After 1 step:
..##..
..##.#
...##.
......
#.....
#.##..

After 2 steps:
..###.
......
..###.
......
.#....
.#....

After 3 steps:
...#..
......
...#..
..##..
......
......

After 4 steps:
......
......
..##..
..##..
......
......

```

After `4` steps, this example has four lights on.

In your grid of 100x100 lights, given your initial configuration, **how many lights are on after 100 steps?**
"""

# ╔═╡ c73f4666-7302-4743-bb13-07ca4aea6440
puzzle_input = "#...##......#......##.##..#...##......##.#.#.###.#.#..#..#......####..#......###.#.#....#..##..###..
####..#.#...#....#.#####.##.##.#..#.......#....#.##...###.###..#.#.#........#..#.#.##...##..#.####.#
...#..##...#.#.###.#.###..#.##.####.###...#...........#.###..##.#.##.#.###...#.#..###....#.###.#..#.
.#...##...####.#..#.....#..#...#.#.##...#...##..#.#.###....#..###.....##..#.###..###.....##..###...#
..##.#####....##..#.#..##.##..######...#..###.######.....#..##...#.#..##..##..#..#..#..##.#.#.#.#...
.###.###.###...##...##..###..##.###.#.....##..##.#.#########...##..##.#..##.#..##..####..#.#.#.#####
#.#####..###.###.##.##.#...#.#.#.#..#.###...#..##.###.#...####.#..#.#.....###..#..####..#.#.#...##..
....#...##.....#....####.##.#.###..#.#.##..#.#...##.###.###..#.##..#.#.##..##..#.##.###..#.#.###.###
##.##...#.##...#.#..#.#..#...###...###.#..#..#.#####..###.#......#.....###.#####.#.#..#.#.#.##..#.#.
#.#..#.....#.....##.#..##...###..##...##...###.#.###.#..#.#.###...##..##..#.###...#.#######.#...#.#.
#.#.....####.#..#.##...#.##....#####.###.#.....#####....###..#........##..####...#...#.###....#..###
##.#.##..#.#.##.#.....##.#.....###.####.#..######.....####.#.#..##.#.##...#..#.#.....#.####.#.......
#..#..#.#..#.######.##..##.####.....##.#.##.#.######..#.#....#.#...#.#..#..#.#.###.#..#.#.#..#...###
####..####.#.#.###.....#.#.#.##..#.##.##.##.#..##..##.#.##.....#.#..#.####.....###.#..#.####.#.#..##
###.##..##.#.##..#..##...#.#####.##.#....##.####.#.##....#..###.#.#.##...#.....#.#.#.#.#..##.#.#..#.
......#..####...##.##...#.##.##...##..#..##.###..#...#..##...#.#....###.####...#.##.###.#.##.####.##
..#...#####.#.#..#.##....#..#...#..####.....###...##.###....#..#.###...#........#.#.##..#..#.#.....#
#######.#.#.###.###..######.##..#####.##.###.###....####.#..##.##...###.#..############.#.##....##.#
#.#...##.###.#.###..#.#.#.#.#.#..##..####.#..##.....#.##..#.##...##.#..##..#.#.#....##....##.#..#.#.
..#.#.####.....###..#######.#.#.#.#...##.#####.....##...##...##.###..######.###..#...####.#..###.###
.#.##....#.#.##..##.#.##.##..######...#.....#..#.#.#.#.....#.#..##.#.#.......#######....#.......#...
..###.##.##..##....#.###...#.....##..##......###...##..###.##...##.###.#.#.#.###.###.#.#...###..#...
.##.#.#...#...##.#.#...#..#..#.#...##.#.##...##..#....#.#..##.#..#.#..#.#.....#..#.#...#######.#.##.
...####....#.###.#..###..##...##..#.#.#.###...#..##.##.##..##.#...#..#.##.....#.#........#..#.#.####
.....##..###...#....#.#.#.#...###.###...#.#...#.#.####....#..####...###..#..######..##.##..###.#####
#####.##..#....###.###....##.....#.#..#....#.#####.##.#.####.#.##...#..###...###..##...#.###.#####..
###.##..........########.######....####.###.#..##...#.##.####.#.....##..#####..###...#####.....#.#.#
##..#####.##.#.#####.#.##.##..#.##....########.#####.#...#.###.##...#.###.#.#..#....##.#..#...#.#.#.
.##.#....#..#...#..#####..#..##.#......#..#....########...#..#...#.....####.#...##...#.###.#.#..##.#
.##.##.#.##.#.##...#.#.#..##.##.###.#..##..#...###.##.###.#####.#.###..#..###.#...#.###.#...#..#.#.#
.#..#..#.#..#..###..#....###.####.##.#.###.#.##.###.#.##.###.###...###...###.#...####...#.##.##.#.#.
###..##...###...#..##.#..#.#...##....###.##.##..#####....###..#..#....#..###.###.#...#.##...#.#.#..#
#....#.......##.....#.##...#..#.###.#.##..##..#.##..#.###..##.##...#####.#..#####..#####..#####....#
.####.####....###..###.#.##.####.##.#...####.#.###.#.....#...####..#####.###..#.#.###.##.##...##..#.
####..##...##.########...##..###..#..###.##.#.#.#........#.#####.#...#.###.####.#..####..#.#.#....##
###.#..#...###.#..#..#.###...##..###.##.#.#...#..#...####..##....#.#..#..##.#.#...#####.###.#..#.#.#
...##....#.###.#.#..##...##.###.#..#..#......#...#.#..####.#.##..######.####.#...#..#..#..##.#.#.##.
##.####.#...#..#.#.##..##.#.#.###..##...####......#..######.#......#.##.#....##...###.#.#..#......##
#.....#...#######.##.#..#.#...###.#..#.####....#.#.##.#.##...###..#...#.###.##..#.###..#.##...#####.
#####.##...#..#.#.#.......#.##..#####..#####...###..##.#.#..###.#.#####.####..#.#..##...#.##...#.###
.##.#..#######.###.#.####.....##...#.##.#.#..#...##....####......######.#..######.....##########.##.
##...#.#..#.##.###.#.#.#.##.###.##..##.##.##...#.#..###.#######..#.....#####..#....######.#..##..###
.#.#.###.....#..##..#.#..##..#.###...###.#..##...#...#.#####.#.#####..###.#..#...##..#.#..#..####...
.#......##..#.....####.###....##.###.....###.##........#.###.##..#..#.#######.#.######..##..###.....
..##.#.#..#.##...#.###.###...######..#..#.#..#....###.#.#....#..........#...##.##.##.#..##..#.#####.
###.###.#..#.##..##.#..#..##.....##.....#..#######.#..#.#.#.####.###..###.#.#..#.##.##.####.###.####
#.#.#..#....########.#..#..#...##..#.##..#.#..##..####...##.....#.##.#.#...########..#.###.#..#.#.##
.##.....#...#.#...##.##....###...##..#.####...#..#.#..#..#.##..#.###.##.####.##..####.....##.#.....#
....####.#.##.#.##.#..##.#.######.##.####..#...####.#..###.#.#..#..##.#.#.....##.#####.#.####...#.#.
#..#####.#####.....##....######..##....#..#.#.###.#####.....##.##.####.#...##...#.##.#.#####.##.#...
##.####..###.#....#...#.#.#.#.###.#####.#.####..####...####......##..#..#..#.#.##...########....#...
.###.#.#.#.#..####.##.#..######..#.#.###.....#.#......#.#.#.#..####.##...##.#####.#.##..##..#..#.#..
.....###...#...#.####.###.#.#.#.#.....#....#.####.###.##.##.##.#######......#.####......#....##.....
##..#..#.#.##..#...#..##.##.##..###.#....##.##....####.#.##.###....#.##.#.#.##...##.###...#..#..####
...#.#..##..##.#...##.##...#.#......#.#.##..###....####.##...#.#.###.#..#..#.####..##..##..#####.###
.##.##..##########.##...#.##.####.#.#######.##.#.##.##..#...##....########.###..##.##.##.#..##.#.#.#
#####.#....#.##..#.....#......##.##..#.##.###..##.......###..##.#.###.##.###....####.#..#.###..#.#.#
.#...#..#.##....##....#...####....#...#..#...####...########.###.#..##.#.#.##..###..#.#.###.....##.#
##..##.....###......#..###.##.####.##.####.#.#....#..#...#..#.#..#.###.#...#...#..##.##...#..#######
.....##..###..##...#####.#.#.....###.#.#..####...#.#.#..#..####..##.#..###.####.#....##..###....#..#
#.#.##.#....#.#####.#....##...#...##...##....#.#.......#....#..#...###.###.#.####..####....#.##.#.#.
..##...##..###.#.#.##.#..#....#.#.....##.###.#.###.###.....#...#.#..#######.#####..#.###...##......#
#......###..#....#.#..#.###.##.#...##..###.####.#.#....#.##..#.###..##.#..#####..##.###.....#..###..
##.#.##..##.###.#..##.....#.##.....###....##.####.######.#...#..###....#.#...#.##.....###....#..#.#.
.##.#.#.#.##..#.#.#..##..#.###.####....#..###.######..####.#.....###.##..#...###.#..######.##.#.##..
...##.####.#..##.#####.##.#...##..#..#...#.#.#.#####...#....#..###...#..#....#.#.##.#.######.#..####
..#.#.#.#...#.######.#.....#..#.#..###....#.#.########...#....#.#.##..#...##...#.#..#.#.###....##...
#####..#..##..#..##..#..#.#.##.#....#####.####.##.#.###..##..##....#.....#.#####.#...#.#####.##.#.#.
#.#..#####...####.###.###.....####.###.....##...##...#..#..#######.#.##....##..####.....##...#..#..#
#.#.###.#.#..##..#....#.#...#.#.##.##..#.##.....##...#.#..##.......##.#.###..#####.#.##....#.##.....
...#.......#....#.#.####.#.###.###..#....#..##.#..####........#.##..#...#.#...###.#..#.#.#...#...#..
...##.#####.##.#.###.##.##.#.##..##.#.#.#.#.#.##.#..##...##.#.#..#..##.##.#####.#.###...#####..#..#.
#######.#..#..#....##.#.#..####.#..#..###...#..#.......###.#.#.####....#.###...#.#.###.#.#.#.#..###.
..##.##.#.##.###....###.##.#.###.#...#....#.####..###..###.#.#..#...##.#.#.#..##.###..###.#.##...###
######..######..##..##.#.#.##.##.#..##..#.#.#.##..#.#...#...#.#.#..######.#..#.#.######..#......##.#
#.#####.....#.......#########..###.##...#...##.#.#..#...#####...#...#..#.###.#..#.#...###.#.#.#...#.
#....##....###...##.##.#...##.........##.#.#..#.#.##.#.######.#####..#..###.###.#...#.#.##.######...
#.#...###.#.###.##.#.######.#######.###.##..#.#.#...######.##.####.##..#.#.#.#......##..##.........#
..###..##....#.....##...#.#.###.#.#.....##.#...###.####.#...#...##..##.#.#.####..###...######....#.#
..###.#.##.####.#..#.##....##..#####....#..##.##.#..#######...#.####...##.#.#.##.........#....#....#
.##.#...#.####..#.#...#.##..######.##..##.#.###.##..###.###....##..#.##.##..##.#...###.##.##.###....
#...###.###.#..#....#.......#..#.....###..#.###.##.##....#.####.#.####.##..##..#..#.....#....##.#.#.
.##.#..#..#.##.......#.####.#######.....#.##.##.#.....#.#..#....######.#..###.##.##.....#.####..##.#
###..#.###.#..####.....##....#..####....#.##.##..#...######.#########...#.#....##...###.#..#.##...#.
#..###..##..#.#.##.###.#.#.##...###.#...##.##..#.###....###..#.#...#.###..######.#..#.###..#..#..#.#
.#........##.#.###..###.#.#.##.....##.##.#.#...##..#.##....###..#.#.#.#.##....#.##..#.#...###...#...
####.####..#....#.#.#..#..##.......##.####...###.##..#.#.##.#..##..######.......##.#.##..#...#.....#
..#..#..###..##.##..######.#..###..###.#.##..##.#..#####.#.#.#.##..#.##..##.##......####.#..........
...##.##..###.#...###....#.#.#.#.....#.##.....##...#...#......####...##.##....##.#..#.####.#..###.#.
..#.....####.#.###.#####..#..###..#..#.#...#####...###.###....#.###..#...#..#..#.#..#.##..##.#.#....
..##.#####...###.###.........#....##.####.##..#.#..#.#...#...##.##.##..#.#.##.########......#####...
...###.#.#..#...#.###.###.......##.###.#..#.##########...#..#.#.#.##.#.###...######..#.#...###.##...
.#.#.#######.#..##.##..##...#...####...#..#####.#..##...###.#.#...#.##...#......#..##.####..#.....##
.##.##.#.#......#######..###.....##.#.##..###......#....####...#.###.#.##.#........#..#....##.....##
#...#.###.#.##...##.####....#...#.###..#.#.....#.#....#.#.#.##...#.#..#####.#.#..#..#..#....#...####
.....##...###......#####..##.##.##...##.#.#####..##...#.#.#.#.###...###.##.####..#.#..#.#..#.####.##
#..#..##.#.##.#.##.#.#.#..###....###.##.#.##.#...#.#..#...#....###.#..#.#.######.#...####..#..##.#.#
#..#.#..#...###.#..##.#...#...##.#......#...#..#..####..##.....#.###...#.#..#.#....#.#####.##.###...
###....#.#..#.#..###..#.##......#...#..#..##.#..###..##..#..#.####..#...########..##.#.##.#.#.#...#.
.#.#.##.##.###..#...#.#....#..#.##..#.#.#.#.##.##.#####...#........####..###..####.#####..#.##.#.##."

# ╔═╡ de9c2f12-f7bb-4e0e-badc-1fffb75d569a
example_input = """
.#.#.#
...##.
#....#
..#...
#.#..#
####..
"""

# ╔═╡ 210f6c99-e328-44c4-b7bf-aa6714787310
function evolve(state)
	nextstate = []
	
	rows = split(strip(state), "\n")
		
	width = length(rows[1])
	height = length(rows)
		
	for (row_idx, row) in enumerate(rows)
		nextrow = ""
		
		for (col_idx, col) in enumerate(row)
			nsum = 0
			if col_idx > 1 # left
				nsum += row[col_idx-1] == '#' ? 1 : 0
			end
			if col_idx < width # right
				nsum += row[col_idx+1] == '#' ? 1 : 0
			end
			if row_idx > 1 # up
				nsum += rows[row_idx-1][col_idx] == '#' ? 1 : 0
				
				if col_idx > 1 # up left
					nsum += rows[row_idx-1][col_idx-1] == '#' ? 1 : 0
				end
				if col_idx < width # up right
					nsum += rows[row_idx-1][col_idx+1] == '#' ? 1 : 0
				end
			end
			if row_idx < height # down
				nsum += rows[row_idx+1][col_idx] == '#' ? 1 : 0
				
				if col_idx > 1 # down left
					nsum += rows[row_idx+1][col_idx-1] == '#' ? 1 : 0
				end
				if col_idx < width # down right
					nsum += rows[row_idx+1][col_idx+1] == '#' ? 1 : 0
				end
			end
			
			
			#m[height-row_idx+1, col_idx] = col == '#' ? 1 : 0
			# A light which is on stays on when 2 or 3 neighbors are on, and turns off otherwise.
			
			if col == '#'
				if nsum == 2 || nsum == 3
					nextrow *= '#'
				else
					nextrow *= '.'
				end
			else
			# A light which is off turns on if exactly 3 neighbors are on, and stays off otherwise.
				if nsum == 3
					nextrow *= '#'
				else
					nextrow *= '.'
				end
			end			
		end
		push!(nextstate, nextrow)
	end
	join(nextstate, "\n")
end

# ╔═╡ add036cf-c9cf-4042-94e5-c786eecfa2fa
function repeatevolve(state, n)
	for i in 1:n
		state = evolve(state)
	end
	state
end

# ╔═╡ 8e0ff6c5-a830-4b14-b638-9ce8b0db85ad
lights(state) = count(f->f == '#', state)

# ╔═╡ 1bc1d59d-cf9f-4bb4-be4e-786b5864926d
@assert lights(repeatevolve(example_input, 4)) == 4

# ╔═╡ 9c5b6723-ae66-427c-919a-370ace69c63d
function grid2matrix(state)
	rows = split(strip(state), "\n")
		
	width = length(rows[1])
	height = length(rows)
	m = falses(height, width)
		
	for (row_idx, row) in enumerate(rows)
		for (col_idx, col) in enumerate(row)
			m[height-row_idx+1, col_idx] = col == '#' ? 1 : 0
		end
	end
	m
end

# ╔═╡ 3408aee3-3ee1-4fd9-926a-23f87ec96aa8
md"""
```
Initial state:
.#.#.#
...##.
#....#
..#...
#.#..#
####..
```
"""

# ╔═╡ 5d81ca32-cd4f-4164-a021-67c3f54b9370
heatmap(grid2matrix(repeatevolve(example_input, 0)))

# ╔═╡ d7ce4f93-e416-440d-9778-22898990edc7
md"""
```
After 1 step:
..##..
..##.#
...##.
......
#.....
#.##..
```"""

# ╔═╡ 642279fe-e0b8-4dfd-a015-f9f3e94c6e3a
heatmap(grid2matrix(repeatevolve(example_input, 1)))

# ╔═╡ 1afe4e36-f7df-4f67-a8ee-f639cd03d964
md"""
```
After 2 steps:
..###.
......
..###.
......
.#....
.#....
```"""

# ╔═╡ 6e4148ac-ba55-4dd4-bf3b-ce66bb28d2ee
heatmap(grid2matrix(repeatevolve(example_input, 2)))

# ╔═╡ 6e37530a-aba4-4520-a81e-28a47cf471f9
md"""
```
After 3 steps:
...#..
......
...#..
..##..
......
......
```"""

# ╔═╡ 65534039-fa37-486c-88dd-2c9cdae7f435
heatmap(grid2matrix(repeatevolve(example_input, 3)))

# ╔═╡ d7c592dc-fa4b-4e3d-81a0-cea70369e63c
md"""
```
After 4 steps:
......
......
..##..
..##..
......
......
```"""

# ╔═╡ 9c132f3d-4d90-46b9-b1e8-c055b0722fb7
heatmap(grid2matrix(repeatevolve(example_input, 4)))

# ╔═╡ 905eccfc-b5ec-4ffd-b055-33b16aa72f70
@gif for i=1:99
   heatmap(grid2matrix(repeatevolve(example_input, floor(i/20))))
end every 1

# ╔═╡ 0349d3fa-2eb2-43a4-8cc5-e995472eb3c9
heatmap(grid2matrix(repeatevolve(puzzle_input, 0)))

# ╔═╡ c9234ee3-9206-40fb-b398-571222598774
@gif for i=1:100
   heatmap(grid2matrix(repeatevolve(puzzle_input, i)))
end every 1

# ╔═╡ fd116e3b-2eda-4c68-bca4-152aaf1d05c0
heatmap(grid2matrix(repeatevolve(puzzle_input, 100)))

# ╔═╡ 214c1e6e-7035-4cdb-a380-d86919173535
part1 = lights(repeatevolve(puzzle_input, 100))

# ╔═╡ c44422ed-30e3-4ea7-a81a-291ec6e7084a
@test part1 == 814

# ╔═╡ c3ef9fe2-7a92-45dd-91fe-e31e132b62ec
md"Your puzzle answer was `814`."

# ╔═╡ 75f28fc6-29a1-4733-bd5b-88ac67c844b4
md"""
# Part Two

You flip the instructions over; Santa goes on to point out that this is all just an implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life). At least, it was, until you notice that something's wrong with the grid of lights you bought: four lights, one in each corner, are stuck on and can't be turned off. The example above will actually run like this:

```
Initial state:
##.#.#
...##.
#....#
..#...
#.#..#
####.#

After 1 step:
#.##.#
####.#
...##.
......
#...#.
#.####

After 2 steps:
#..#.#
#....#
.#.##.
...##.
.#..##
##.###

After 3 steps:
#...##
####.#
..##.#
......
##....
####.#

After 4 steps:
#.####
#....#
...#..
.##...
#.....
#.#..#

After 5 steps:
##.###
.##..#
.##...
.##...
#.#...
##...#

```

After `5` steps, this example now has `17` lights on.

In your grid of 100x100 lights, given your initial configuration, but with the four corners always in the on state, **how many lights are on after 100 steps?**
"""

# ╔═╡ 72976f12-9139-4d89-8329-ec57b9535410
function fixrowcorners(row)
	chars = collect(row)
	chars[1] = '#'
	chars[length(chars)] = '#'
	join(chars)
end

# ╔═╡ 385a7cab-ea88-4ad6-b614-6d446549eef0
function fixcorners(state) 
	rows = split(strip(state), "\n")
	
	rows[1] = fixrowcorners(rows[1])
	rows[length(rows)] = fixrowcorners(rows[length(rows)])

	join(rows, "\n")
end

# ╔═╡ bac289d5-d7f5-4fa9-a512-72d24d44d1a2
function repeatevolve2(state, n)
	for i in 1:n
		state = evolve(fixcorners(state))
	end
	fixcorners(state)
end

# ╔═╡ 6a36690d-682f-43c7-8a65-34a6b3b5da1a
@assert lights(repeatevolve2(strip(example_input), 5)) == 17

# ╔═╡ f87a84a5-a5cc-421f-9065-a846ca5b9319
md"""

```
Initial state:
##.#.#
...##.
#....#
..#...
#.#..#
####.#
```

"""

# ╔═╡ 259aabd1-703c-45d2-b93e-3f7782b09e58
heatmap(grid2matrix(repeatevolve2(strip(example_input), 0)))

# ╔═╡ 84f4f18a-665a-4667-8733-edcd479d9028
md"""

```

After 1 step:
#.##.#
####.#
...##.
......
#...#.
#.####

```

"""

# ╔═╡ c8752e7b-a4d1-4cb1-bfb3-b5c131d6dec7
heatmap(grid2matrix(repeatevolve2(strip(example_input), 1)))

# ╔═╡ f85bce95-8a94-4658-91fa-aa96dc1e86ca
md"""

```

After 2 steps:
#..#.#
#....#
.#.##.
...##.
.#..##
##.###

```

"""

# ╔═╡ 22a54b94-9e5a-4d5f-924b-fc4a2d585224
heatmap(grid2matrix(repeatevolve2(strip(example_input), 2)))

# ╔═╡ eff70454-34fc-435c-9d8e-d0da4cf440a1
md"""

```

After 3 steps:
#...##
####.#
..##.#
......
##....
####.#

```

"""

# ╔═╡ 8c17a7ae-f5a0-439a-b8ac-7ab106b88988
heatmap(grid2matrix(repeatevolve2(strip(example_input), 3)))

# ╔═╡ cbcdafd8-a2ab-406d-b0a7-cc154f2beb8c
md"""

```

After 4 steps:
#.####
#....#
...#..
.##...
#.....
#.#..#

```

"""

# ╔═╡ e13011e3-5441-419c-b01b-1810dafc5166
heatmap(grid2matrix(repeatevolve2(strip(example_input), 4)))

# ╔═╡ b5342e62-14db-4597-82a9-19d1662cf02c
md"""

```

After 5 steps:
##.###
.##..#
.##...
.##...
#.#...
##...#

```

"""

# ╔═╡ 6ceea610-1318-4458-98cf-aba5a40b3ead
heatmap(grid2matrix(repeatevolve2(strip(example_input), 5)))

# ╔═╡ a6fc1934-51d3-40e7-9098-282f18edc10f
@gif for i=1:100
   heatmap(grid2matrix(repeatevolve2(puzzle_input, i)))
end every 1

# ╔═╡ 6cc2df3c-7532-4b5b-b306-24bc6b06000f
heatmap(grid2matrix(repeatevolve2(puzzle_input, 100)))

# ╔═╡ 038dca7c-0369-41f4-8902-56ba5081b0fc
part2 = lights(repeatevolve2(puzzle_input, 100))

# ╔═╡ 73ce4e85-0913-4ae8-97dd-dca6d09f2ac8
@test part2 == 924

# ╔═╡ 2e0eb85c-f975-4760-bf4e-e4319d5f1cce
md"Your puzzle answer was `924`."

# ╔═╡ Cell order:
# ╠═6ca83e83-423a-4621-ae14-dc8da5913394
# ╠═df80bc4c-770a-4acd-a4f3-337c6b720c71
# ╟─20fb22d0-b0e9-11eb-1561-8b6505f5cb45
# ╟─c73f4666-7302-4743-bb13-07ca4aea6440
# ╠═de9c2f12-f7bb-4e0e-badc-1fffb75d569a
# ╠═210f6c99-e328-44c4-b7bf-aa6714787310
# ╠═add036cf-c9cf-4042-94e5-c786eecfa2fa
# ╠═8e0ff6c5-a830-4b14-b638-9ce8b0db85ad
# ╠═1bc1d59d-cf9f-4bb4-be4e-786b5864926d
# ╠═9c5b6723-ae66-427c-919a-370ace69c63d
# ╟─3408aee3-3ee1-4fd9-926a-23f87ec96aa8
# ╠═5d81ca32-cd4f-4164-a021-67c3f54b9370
# ╟─d7ce4f93-e416-440d-9778-22898990edc7
# ╠═642279fe-e0b8-4dfd-a015-f9f3e94c6e3a
# ╟─1afe4e36-f7df-4f67-a8ee-f639cd03d964
# ╠═6e4148ac-ba55-4dd4-bf3b-ce66bb28d2ee
# ╟─6e37530a-aba4-4520-a81e-28a47cf471f9
# ╠═65534039-fa37-486c-88dd-2c9cdae7f435
# ╟─d7c592dc-fa4b-4e3d-81a0-cea70369e63c
# ╠═9c132f3d-4d90-46b9-b1e8-c055b0722fb7
# ╠═905eccfc-b5ec-4ffd-b055-33b16aa72f70
# ╠═0349d3fa-2eb2-43a4-8cc5-e995472eb3c9
# ╠═c9234ee3-9206-40fb-b398-571222598774
# ╠═fd116e3b-2eda-4c68-bca4-152aaf1d05c0
# ╠═214c1e6e-7035-4cdb-a380-d86919173535
# ╠═c44422ed-30e3-4ea7-a81a-291ec6e7084a
# ╟─c3ef9fe2-7a92-45dd-91fe-e31e132b62ec
# ╟─75f28fc6-29a1-4733-bd5b-88ac67c844b4
# ╠═385a7cab-ea88-4ad6-b614-6d446549eef0
# ╠═72976f12-9139-4d89-8329-ec57b9535410
# ╠═bac289d5-d7f5-4fa9-a512-72d24d44d1a2
# ╠═6a36690d-682f-43c7-8a65-34a6b3b5da1a
# ╟─f87a84a5-a5cc-421f-9065-a846ca5b9319
# ╠═259aabd1-703c-45d2-b93e-3f7782b09e58
# ╟─84f4f18a-665a-4667-8733-edcd479d9028
# ╠═c8752e7b-a4d1-4cb1-bfb3-b5c131d6dec7
# ╟─f85bce95-8a94-4658-91fa-aa96dc1e86ca
# ╠═22a54b94-9e5a-4d5f-924b-fc4a2d585224
# ╟─eff70454-34fc-435c-9d8e-d0da4cf440a1
# ╠═8c17a7ae-f5a0-439a-b8ac-7ab106b88988
# ╟─cbcdafd8-a2ab-406d-b0a7-cc154f2beb8c
# ╠═e13011e3-5441-419c-b01b-1810dafc5166
# ╟─b5342e62-14db-4597-82a9-19d1662cf02c
# ╠═6ceea610-1318-4458-98cf-aba5a40b3ead
# ╠═a6fc1934-51d3-40e7-9098-282f18edc10f
# ╠═6cc2df3c-7532-4b5b-b306-24bc6b06000f
# ╠═038dca7c-0369-41f4-8902-56ba5081b0fc
# ╠═73ce4e85-0913-4ae8-97dd-dca6d09f2ac8
# ╟─2e0eb85c-f975-4760-bf4e-e4319d5f1cce
