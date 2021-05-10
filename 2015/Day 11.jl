### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ e89c666e-b0e7-11eb-22cf-7f6fd1e299bb
md"""
# [Day 11: Corporate Policy](https://adventofcode.com/2015/day/11)

Santa's previous password expired, and he needs help choosing a new one.

To help him remember his new password after the old one expires, Santa has devised a method of coming up with a password based on the previous one. Corporate policy dictates that passwords must be exactly eight lowercase letters (for security reasons), so he finds his new password by incrementing his old password string repeatedly until it is valid.

Incrementing is just like counting with numbers: `xx`, `xy`, `xz`, `ya`, `yb`, and so on. Increase the rightmost letter one step; if it was `z`, it wraps around to `a`, and repeat with the next letter to the left until one doesn't wrap around.

Unfortunately for Santa, a new Security-Elf recently started, and he has imposed some additional password requirements:

-   Passwords must include one increasing straight of at least three letters, like `abc`, `bcd`, `cde`, and so on, up to `xyz`. They cannot skip letters; `abd` doesn't count.
-   Passwords may not contain the letters `i`, `o`, or `l`, as these letters can be mistaken for other characters and are therefore confusing.
-   Passwords must contain at least two different, non-overlapping pairs of letters, like `aa`, `bb`, or `zz`.

For example:

-   `hijklmmn` meets the first requirement (because it contains the straight `hij`) but fails the second requirement requirement (because it contains `i` and `l`).
-   `abbceffg` meets the third requirement (because it repeats `bb` and `ff`) but fails the first requirement.
-   `abbcegjk` fails the third requirement, because it only has one double letter (`bb`).
-   The next password after `abcdefgh` is `abcdffaa`.
-   The next password after `ghijklmn` is `ghjaabcc`, because you eventually skip all the passwords that start with `ghi...`, since `i` is not allowed.

**Given Santa's current password (your puzzle input), what should his next password be?**
"""

# ╔═╡ ec540096-d9d1-4b5f-b6a2-16c470322424
puzzle_input = "hxbxwxba"

# ╔═╡ 4e20e380-e928-4764-a982-3c0ca6bb942c
function next(str)
	chars = collect(str)
	vmin = Int('a')
	vmax = Int('z')
	
	for idx in reverse(1:length(str))
		v = Int(chars[idx]) + 1
		if v > vmax
			v -= vmax-vmin + 1
			chars[idx] = v
		else
			chars[idx] = v
			break
		end		
	end
	
	join(chars)
end

# ╔═╡ 7a68015d-0282-4cb0-bebc-c265d5ca72d3
@assert next("xx") == "xy"

# ╔═╡ c4d6ad5b-f500-4435-a8eb-76c1f33f9775
@assert next("xy") == "xz"

# ╔═╡ 8f2717d2-ed5e-4e4e-abcd-6ff2982d8cd6
@assert next("xz") == "ya"

# ╔═╡ 58f76b47-542f-438b-ac71-694a76d9d77b
@assert next("ya") == "yb"

# ╔═╡ Cell order:
# ╟─e89c666e-b0e7-11eb-22cf-7f6fd1e299bb
# ╠═ec540096-d9d1-4b5f-b6a2-16c470322424
# ╠═4e20e380-e928-4764-a982-3c0ca6bb942c
# ╠═7a68015d-0282-4cb0-bebc-c265d5ca72d3
# ╠═c4d6ad5b-f500-4435-a8eb-76c1f33f9775
# ╠═8f2717d2-ed5e-4e4e-abcd-6ff2982d8cd6
# ╠═58f76b47-542f-438b-ac71-694a76d9d77b
