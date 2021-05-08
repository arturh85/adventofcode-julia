### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 2b9eb9cf-d6cc-4dae-bb01-06ae7b62e888
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots"])	
	
	using Plots
	plotly()
end

# ╔═╡ f59b7cd9-989e-4911-ab48-6994091b1a74
md"""
# [Day 1: Not Quite Lisp](https://adventofcode.com/2015/day/1)
Santa was hoping for a white Christmas, but his weather machine's "snow" function is powered by stars, and he's fresh out! To save Christmas, he needs you to collect fifty stars by December 25th.

Collect stars by helping Santa solve puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Here's an easy puzzle to warm you up.

Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions he got are a little confusing. He starts on the ground floor (floor 0) and then follows the instructions one character at a time.

An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.

The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.

For example:

- `(())` and `()()` both result in floor `0`.  
- `(((` and `(()(()(` both result in floor `3`.  
- `))(((((` also results in floor `3`.  
- `())` and `))(` both result in floor `-1` (the first basement level).  
- `)))` and `)())())` both result in floor `-3`.  

**To what floor do the instructions take Santa?**
"""

# ╔═╡ 014cabcd-e65d-42ab-b2ce-ec42d233c5e7
puzzle_input = "(((())))()((((((((())()(()))(()((((()(()(((()((()((()(()()()()()))(((()(()((((((((((())(()()((())()(((())))()(()(()((()(()))(()()()()((()((()(((()()(((((((()()())()((((()()(((((()(())()(())((())()()))()(((((((())(()())(()(((())(()))((())))(()((()())))()())((((())))(()(((((()(())(((()()((()((()((((((((((())(()())))))()))())()()((((()()()()()()((((((())())(((()())()((()()(((()()()))(((((()))(((()(()()()(()(()(((())()))(()(((()((())()(()())())))((()()()(()()(((()))(((()((((()(((((()()(()())((()())())(()((((((()(()()))((((()))))())((())()()((()(()))))((((((((()))(()()(((())())(())()((()()()()((()((()((()()(((())))(()((())()((((((((()((()(()()(((())())())))(())())))()((((()))))))())))()()))()())((()())()((()()()))(()()(((()(())((((())())((((((((()()()()())))()()()((((()()))))))()((((()(((()))(()()())))((()()(((()))()()())())(((())((()()(())()()()(((())))))()())((()))()))((())()()())()())()()(()))())))())()))(())((()(())))(()(())(()))))(()(())())(()(())(()(()))))((()())()))()((((()()))))())))()()())((())()((()()()))()(((()(()))))(())()()))(((()())))))))))(((())))()))())()))))()()(((())))))))()(()()(()))((()))))((())))((()((())))())))()()(()))())()(()((()())(()(()()())())(()()))()))))(()())()()))()()()()))(()(()(()))))))()(()))()))()()(()((())(()(())))()(((())(())())))))()(()(()))))()))(()()()(())()(()(())))()))))()()(((((())))))())()())())())()())()))))()))))))))())()()()()()()())))()))((())()))())))()((())()))))()))())))))))())()()()))()()(()((((()(((((((()(())((()())((()()))()))))(())))()()()(())((())()())))(())))(())))(((()()))()(())(((()(()))((())))())()))((((()))())()))))))))()(())())))(()))()(()()))())()()(())())))())()()(()())))()((()())(()(())(())))))))))))))(()))))()))))))()()())(()(((((()(()())))())()))(()))()))(()()))()())(()))())()(())((()()))))))())))())()(((())))(()(()))()()))()(()))))))((()())(()))))))()())))()()))))))))((((((((()()()(()))))))()())))())))()()((())()))((())(())))())())))()()()((()((()(())))())()(())))))))))()())))()()()()()()))()))((())())(()(()))))))(()()))()))(())))()))))))))))))(()))))))))()))))()))()())()))()()))))))()))))((()))))(()))())()(())))(()())((((()())))()))))(()))()(()()(())))))())))))()))))))())))())))))())))())())))())(()))))(())()(())))())()))((()()))))))())))((())))))))())))(())))))()()())))))())))))()))))))()))()()()(()(((()())())())(()))())))))((()(())(()))))))))(())))()()()())())(()))))()()()))()))())())())()(())))()(((()((((())))))))()))))))))))))))))))))((())()())(()))))()()))))))(()()(())())))())))((())))((())))))))))))))()))))()(()))))))())))))()))(()()())(()())))))))))()))))))(())))))()()))()())(((())))()))(()))))))))(())())))())))())())())()()))((())()(())()())()))()())(())(()))))()())))(()(((()))))))()(()())()()()))()))))))))()()()(())()())()(((((()))()())())(()))))()()()(())))())))()((()())))(()))())()(()())())(()))()()))((()()))((()()()()())))(())()))(()(())))((()()))))))))())))))))())()()))))))))))))))))(())()(())(())()())())()))()(()))))())())))))()())()(()))()()(())))(())())))))(()))))))))))))))())())(())(())))(((()))()))))())((())(()))())))))))())))))())))()))()))))))))))))())()))))()))))((()))(())))()(())))(())()))()))())))())))))))()(()())())))()()())))(())))))(()))))))))))))(()))()))()))())))(((()()()(())((()())))()())(((()))(())()))((()()()())))())(())(()))))()(((((())))(()))())())))))))((((()()()))())())()(()(()())))))))))()())())))(())))()())(((()(())())()()))())())))))))((()())((()()(()))(()(())))()))()))(()))(()))()()(()(((())((((()))()(()))((())()(()(()())()(()))()())))))(()))()))())()())))())))(())))((())(()())))))()))(())(()))()())()(()()((()(()))))))()(())(()())(())()))(((())()))(()()(()()()))))(()(())))()))))())))))())(()()()()()()(((())))(()()))()((())(((((()()())))(()))(()))()()))(((())())()(((()()()()))))(()))(())())))()())(()()())())))))))()))))((())))()())(()))(()(()))())))))())(())))))()()())())()))()()(())))(()))(())((((((())(()))(()))())()))(()()(())))()))(()()))()))()(())))(())))((()(()))(())()()())())))(((()()())(())()))))))()(((()(((((()()(((())(())))())()((()))))((()())()(())(((())))(((()((()(()(()))(()()))())(()))(())(())))()))))))((((()))()((((()(()))()))()()))))()(()(()))()(()((()(((()(()()(((()))))()(((()(()(()(((()(()())())()()(()(()())())(()((((())(()))()))(((((()()())(())()((()()())))()()(((()()))()((((((((()(())))())((()))))(())))(()))))((()((((()()(())(((((()))(((((((((((((()())))((((()(((()((())())()))((()))()(()()((()()()()(()()(()(()(((())()(()((((((()((()()((())()((((()((()()(()()())((()()()((()((())()(()(((()((())((((())(()))((()(()))(()())()((((((((()(((((((((((()))(()(((()(()()()((((())((())()())()))(())((())(()))(((()((()(())))(()))))((()()))))((((()(()(()())(()(())((((((((()((((()((()(((((()))())()(()))(()()((()(())(((((()(())()(((((()()))))))()(((())()(()()((((())()((())((()(((())(((()))((()()((((()(())))))((()((((()((()((()(((())((()))(((((((()(((()((((((((())()))((((())(((((()((((((((()(((()((()(((()()(((()((((((()()(()((((((((()()(()(()(())((((()())()))))(((()))((((())((((()())((()(())()((()((((((()((((((()(())))()())(((())())())()(())()(()())((()()((((())((((((())(()(((((()((((())()((((()(()(())(()())(((())()((())((((()))()((((((())(()(((()(((()((((((()(((()))(()()())())((()((()())()((((())(((()(()(((((((((())(())))()((()()()()(())((()))(((((((()(((((((((()(()))))(()((((((((()((((()((()()((((((()()(((((((()(()(())()(())((()()()((()(((((()())()(((((()())()()((()(()())(()()()(((()()(((((()((((((()()((()(()()()((((((((((((()((((((((()()(((()())))()(((()()(())())((((()((((()((((()()()(())(())((()(()(((((((((((((((()(())(())))))()()))((()(((()(())((()(((()(()()((((()()(((()(((()(((((()()((()(()(((()))((((((()((((((((()((()((())(((((()(((())(())())((()()))((((())()()((()(((()(((((()()(((()))(((()(()(((((((((((((()))((((((((()(((()))))())((((((((((((())((())((()())(((())((())(()((((((((((()(((())((()()(()((())(((((((((((()))((((((((((((()(()())((()((()((()(()(((()((((((((()()(()((()(()(((()))((()))(((((((((((((()(())((((((())(((()(())(()(()(()((()()))((((()((((()((((())))())((((()((((()))((((((()((((((()((()(((())))((())(()))(()((()((((()((()(((()()))((((()()()(((((((())(((())(()))())((((()())(((()(((((((((((()(()(()((()(((((((((((((((()()((((()((((((((()(((()()((()((((()))(((()(())((((((()((((())()((((()((()))(())()(()(((()((())())((((((()(()(())())(((())(()(()())(((((()((()((())()())(())))(((()(())))))))(((()(((()))()((()(((()()((()())()()))())))(((()))(()(((()(((((((((()(()(((((()()(((()())()()))))()(((()))(((()(()(()(()(()))()(())()))(()(((())))(()))))))))))(())((()((())((()(())()(())((()()((((()()((()()))((())(((()((()(())(())))()(()(((((()((()))())()(((((()()(((()(()((((((())(()))(())()))((()(()()))(())())()))(((())))(()((()(((())(())())))((()()((((((((((((((()((()(()()(()(((()))())()()((()()()(())(()))(()())(((())((())()(())()()(()()(())))((()(((()))))(((()()(()()))())((()((())()))((((()()()())((())))(((()(())(((((()(((((()((()(()((((()()(((()()()(((()())(((()()((((())(()))(((()))(())())((()))(((()((()))(((()()((())((()(((((()((((()()())((()))()((((()((()(()()()("

# ╔═╡ febdc2a5-b736-4c4d-81f7-bccd7c68d725
read_movements(movements) = map(x -> x == '(' ? 1 : -1, collect(movements))

# ╔═╡ 6fee2f51-f7a7-46a9-a54d-33552394e525
@assert sum(read_movements("(())")) == sum(read_movements("()()")) == 0

# ╔═╡ 6e36a546-357e-483f-bd2d-d87bb97edddb
@assert sum(read_movements("(((")) == sum(read_movements("(()(()(")) == 3

# ╔═╡ d42a1ec4-6ddb-476e-a259-54175b7d8a6e
@assert sum(read_movements("))(((((")) == 3

# ╔═╡ f23b09a3-b95c-4d72-8195-1cc36acce0cf
@assert sum(read_movements("())")) == sum(read_movements("))(")) == -1

# ╔═╡ 54a7cd1f-e4de-4064-a6f4-fd09f4e5730c
@assert sum(read_movements(")))")) == sum(read_movements(")())())")) == -3

# ╔═╡ 0d0133fc-e7f2-4776-8a87-0ab75fc06f70
puzzle_movements = read_movements(puzzle_input)

# ╔═╡ 647d7f09-2ba8-40e0-8e78-168099e5e8b1
part1 = sum(puzzle_movements)

# ╔═╡ c039b088-9f32-4381-8128-21f5ffb9d5b4
md"Your puzzle answer was `232`."

# ╔═╡ af2306cd-fa6e-495c-b427-f6c0bc38e6ee
md"""
# Part Two
Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor `-1`). The first character in the instructions has position `1`, the second character has position `2`, and so on.

For example:

- `)` causes him to enter the basement at character position `1`.
- `()())` causes him to enter the basement at character position `5`.

**What is the position of the character that causes Santa to first enter the basement?**
"""

# ╔═╡ eabd9935-40c5-4ae2-9873-12163d35723f
begin
	plot(cumsum(puzzle_movements), label = false)
	hline!([-1], label="basement")
end

# ╔═╡ 3aabdaf4-3654-486f-91ac-01f5f2db3c87
function below_zero_index(movements)
	cumsum = 0
	for (idx, val) in enumerate(movements)
		cumsum += val
		if cumsum < 0
			return idx
		end
	end
end

# ╔═╡ 759a6fbf-8875-42b7-a657-63054c61da3e
@assert below_zero_index(read_movements(")")) == 1

# ╔═╡ 2368ed8d-bae9-4878-bcdb-85277c8b26d3
@assert below_zero_index(read_movements("()())")) == 5

# ╔═╡ 16580bf5-0eaa-4023-b315-7ac09d3d81b1
part2 = below_zero_index(puzzle_movements)

# ╔═╡ ec77d418-36d3-438e-b0a1-e28b3f8be4eb
md"Your puzzle answer was `1783`."

# ╔═╡ Cell order:
# ╠═2b9eb9cf-d6cc-4dae-bb01-06ae7b62e888
# ╟─f59b7cd9-989e-4911-ab48-6994091b1a74
# ╟─014cabcd-e65d-42ab-b2ce-ec42d233c5e7
# ╠═febdc2a5-b736-4c4d-81f7-bccd7c68d725
# ╠═6fee2f51-f7a7-46a9-a54d-33552394e525
# ╠═6e36a546-357e-483f-bd2d-d87bb97edddb
# ╠═d42a1ec4-6ddb-476e-a259-54175b7d8a6e
# ╠═f23b09a3-b95c-4d72-8195-1cc36acce0cf
# ╠═54a7cd1f-e4de-4064-a6f4-fd09f4e5730c
# ╠═0d0133fc-e7f2-4776-8a87-0ab75fc06f70
# ╠═647d7f09-2ba8-40e0-8e78-168099e5e8b1
# ╟─c039b088-9f32-4381-8128-21f5ffb9d5b4
# ╟─af2306cd-fa6e-495c-b427-f6c0bc38e6ee
# ╠═eabd9935-40c5-4ae2-9873-12163d35723f
# ╠═3aabdaf4-3654-486f-91ac-01f5f2db3c87
# ╠═759a6fbf-8875-42b7-a657-63054c61da3e
# ╠═2368ed8d-bae9-4878-bcdb-85277c8b26d3
# ╠═16580bf5-0eaa-4023-b315-7ac09d3d81b1
# ╟─ec77d418-36d3-438e-b0a1-e28b3f8be4eb
