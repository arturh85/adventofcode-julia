### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ d2c27263-8b8e-486e-9f85-a639ce3749c7
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["MD5"])	
	
	using MD5
end

# ╔═╡ 0a80eec0-af92-11eb-2306-a1148fe38e04
md"""
# [Day 4: The Ideal Stocking Stuffer](https://adventofcode.com/2015/day/4)
Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the economically forward-thinking little girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes. The input to the MD5 hash is some secret key (your puzzle input, given below) followed by a number in decimal. To mine AdventCoins, **you must find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash**.

For example:

If your secret key is `abcdef`, the answer is `609043`, because the MD5 hash of `abcdef609043` starts with five zeroes (`000001dbbfa`...), and it is the lowest such number to do so.
If your secret key is `pqrstuv`, the lowest number it combines with to make an MD5 hash starting with five zeroes is `1048970`; that is, the MD5 hash of `pqrstuv1048970` looks like `000006136ef`....
"""

# ╔═╡ 48e941ba-480f-4f31-b94c-b004130aa114
puzzle_input = "iwrupvqb"

# ╔═╡ 09b4af88-3d43-4136-8904-12b4f6aa3625
function answer(input, zero_count) 
	n = 1
	search = "0" ^ zero_count
	while true
		hash = bytes2hex(md5(input * string(n)))
		if startswith(hash, search)
			return n
		end
		n += 1
	end
end

# ╔═╡ fb6daadc-d6b2-47dd-b7c5-c119d24c33cf
@assert answer("abcdef", 5) == 609043

# ╔═╡ b1b9e6bd-aa83-4c59-b524-189e5bf0d964
@assert answer("pqrstuv", 5) == 1048970

# ╔═╡ e9c559dc-544f-4c28-a9a8-d98477da244e
part1 = answer(puzzle_input, 5)

# ╔═╡ 30832092-32ec-447b-8e66-6a114734629a
md"Your puzzle answer was `346386`."

# ╔═╡ f57a76e1-43db-47ad-971d-89d7a8300db0
md"""
# Part Two
Now find one that starts with six zeroes.
"""

# ╔═╡ 4747ba76-4eac-43ba-bd6a-911e54604c9f
part2 = answer(puzzle_input, 6)

# ╔═╡ 0aa393b8-5b60-4aea-aa0a-025261708ee1
md"Your puzzle answer was `9958218`."

# ╔═╡ Cell order:
# ╠═d2c27263-8b8e-486e-9f85-a639ce3749c7
# ╟─0a80eec0-af92-11eb-2306-a1148fe38e04
# ╟─48e941ba-480f-4f31-b94c-b004130aa114
# ╠═09b4af88-3d43-4136-8904-12b4f6aa3625
# ╠═fb6daadc-d6b2-47dd-b7c5-c119d24c33cf
# ╠═b1b9e6bd-aa83-4c59-b524-189e5bf0d964
# ╠═e9c559dc-544f-4c28-a9a8-d98477da244e
# ╟─30832092-32ec-447b-8e66-6a114734629a
# ╟─f57a76e1-43db-47ad-971d-89d7a8300db0
# ╠═4747ba76-4eac-43ba-bd6a-911e54604c9f
# ╟─0aa393b8-5b60-4aea-aa0a-025261708ee1
