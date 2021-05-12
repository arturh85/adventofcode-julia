### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

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
containers = split(puzzle_input, "\n") |> Base.Fix1(map, s->parse(Int, s))

# ╔═╡ Cell order:
# ╠═00942730-b0e9-11eb-0b2b-f75ca9edadef
# ╟─8c0509ca-d12e-4dcf-9ccc-3f50189a52fc
# ╠═e44eedbb-747f-4c1b-9a86-62360e9ca26d
