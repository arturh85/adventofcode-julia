### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ b90cb740-b02c-11eb-3bda-67e10d023147
md"""
# [Day 10: Elves Look, Elves Say](https://adventofcode.com/2015/day/10)

Today, the Elves are playing a game called [look-and-say](https://en.wikipedia.org/wiki/Look-and-say_sequence). They take turns making sequences by reading aloud the previous sequence and using that reading as the next sequence. For example, `211` is read as "one two, two ones", which becomes `1221` (`1` `2`, `2` `1`s).

Look-and-say sequences are generated iteratively, using the previous value as input for the next step. For each step, take the previous value, and replace each run of digits (like `111`) with the number of digits (`3`) followed by the digit itself (`1`).

For example:

-   `1` becomes `11` (`1` copy of digit `1`).
-   `11` becomes `21` (`2` copies of digit `1`).
-   `21` becomes `1211` (one `2` followed by one `1`).
-   `1211` becomes `111221` (one `1`, one `2`, and two `1`s).
-   `111221` becomes `312211` (three `1`s, two `2`s, and one `1`).

Starting with the digits in your puzzle input, apply this process 40 times. **What is the length of the result?**
"""

# ╔═╡ 0353fa91-ea22-4446-a83d-bb43cb52048d
puzzle_input = "3113322113"

# ╔═╡ Cell order:
# ╟─b90cb740-b02c-11eb-3bda-67e10d023147
# ╟─0353fa91-ea22-4446-a83d-bb43cb52048d
