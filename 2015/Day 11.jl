### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 090f6f0f-fd67-419b-a35e-5392a59f39b1
using PlutoTest

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

# ╔═╡ 9a03d3c5-3bc6-48c7-87cc-49ef6cbd31d4
function has_straight(s) 
	for idx in 1:length(s)-2
		a = Int(s[idx])
		b = Int(s[idx+1])
		c = Int(s[idx+2])
		
		if b == a + 1 && c == b + 1
			return true
		end
	end
	false
end

# ╔═╡ b10b13e9-de70-4c09-8b7a-9cd530d1e3ac
@assert has_straight("hijklmmn")

# ╔═╡ 2d9e27ff-5557-4c7e-b6a8-b3accd15f7f0
@assert !has_straight("abbceffg")

# ╔═╡ 26342478-769e-4ef1-a3f3-ddf5aad2e281
has_no_confusing(s) = !occursin("i", s) && !occursin("o", s) && !occursin("l", s)

# ╔═╡ a470ee13-e98c-423b-8398-e6c8774983c5
@assert !has_no_confusing("hijklmmn")

# ╔═╡ dd4c2b0b-d8af-411f-9290-d36398772267
@assert has_no_confusing("abbceffg")

# ╔═╡ a0681275-076f-400f-8862-74c0cba5ffc1
# Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.

# ╔═╡ 2144ecf3-79c2-4de1-8aa4-52b4e6b57208
function has_two_nonoverlapping_pair(s) 
	for idx1 in 1:length(s)-1
		if s[idx1] == s[idx1+1]
			for idx2 in idx1+2:length(s)-1
				if s[idx2] == s[idx2+1]
					return true
				end
			end
		end
	end
	false
end

# ╔═╡ d103a1b1-7ade-41da-bc1e-b01337333675
@assert has_two_nonoverlapping_pair("abbceffg")

# ╔═╡ 5a13d4d9-7451-4fb0-8aaf-8d47947c10e4
check1(s) = has_straight(s) && has_no_confusing(s) && has_two_nonoverlapping_pair(s)

# ╔═╡ de4134e2-cc3f-4872-9244-4596d8525292
function next_valid(s) 
	while true
		s = next(s)
		if check1(s)
			return s
		end
	end
end

# ╔═╡ 6b671ffc-ccc1-4b84-9ddb-7f7137995348
@assert next_valid("abcdefgh") == "abcdffaa"

# ╔═╡ a33d8ddb-5ef5-4c0c-891c-eef1368fbcc9
@assert next_valid("ghijklmn") == "ghjaabcc"

# ╔═╡ cbcd58ec-5f81-4ca4-8a4f-2a570db79f2a
part1 = next_valid(puzzle_input)

# ╔═╡ 2d3ab22d-11fe-4ee3-9ee1-9410ae03498a
@test part1 == "hxbxxyzz"

# ╔═╡ bd64f7b1-4074-4eeb-925d-eb8cc7a524bf
md"Your puzzle answer was `hxbxxyzz`."

# ╔═╡ aa05c55c-e79d-4846-95e1-823f0a5ea2e3
md"""
# Part Two
Santa's password expired again. **What's the next one?**
"""

# ╔═╡ 1ef77364-44a3-4819-b0c3-11cca842e53c
part2 = next_valid("hxbxxyzz")

# ╔═╡ fb47e75f-a3a0-4ee9-97c8-8a7e3d3f7831
@test part2 == "hxcaabcc"

# ╔═╡ bd67cd4e-af24-403c-a3ba-9753f11dc21c
md"Your puzzle answer was `hxcaabcc`."

# ╔═╡ Cell order:
# ╠═090f6f0f-fd67-419b-a35e-5392a59f39b1
# ╟─e89c666e-b0e7-11eb-22cf-7f6fd1e299bb
# ╠═ec540096-d9d1-4b5f-b6a2-16c470322424
# ╠═4e20e380-e928-4764-a982-3c0ca6bb942c
# ╠═7a68015d-0282-4cb0-bebc-c265d5ca72d3
# ╠═c4d6ad5b-f500-4435-a8eb-76c1f33f9775
# ╠═8f2717d2-ed5e-4e4e-abcd-6ff2982d8cd6
# ╠═58f76b47-542f-438b-ac71-694a76d9d77b
# ╠═9a03d3c5-3bc6-48c7-87cc-49ef6cbd31d4
# ╠═b10b13e9-de70-4c09-8b7a-9cd530d1e3ac
# ╠═2d9e27ff-5557-4c7e-b6a8-b3accd15f7f0
# ╠═26342478-769e-4ef1-a3f3-ddf5aad2e281
# ╠═a470ee13-e98c-423b-8398-e6c8774983c5
# ╠═dd4c2b0b-d8af-411f-9290-d36398772267
# ╠═a0681275-076f-400f-8862-74c0cba5ffc1
# ╠═2144ecf3-79c2-4de1-8aa4-52b4e6b57208
# ╠═d103a1b1-7ade-41da-bc1e-b01337333675
# ╠═5a13d4d9-7451-4fb0-8aaf-8d47947c10e4
# ╠═de4134e2-cc3f-4872-9244-4596d8525292
# ╠═6b671ffc-ccc1-4b84-9ddb-7f7137995348
# ╠═a33d8ddb-5ef5-4c0c-891c-eef1368fbcc9
# ╠═cbcd58ec-5f81-4ca4-8a4f-2a570db79f2a
# ╠═2d3ab22d-11fe-4ee3-9ee1-9410ae03498a
# ╟─bd64f7b1-4074-4eeb-925d-eb8cc7a524bf
# ╟─aa05c55c-e79d-4846-95e1-823f0a5ea2e3
# ╠═1ef77364-44a3-4819-b0c3-11cca842e53c
# ╠═fb47e75f-a3a0-4ee9-97c8-8a7e3d3f7831
# ╟─bd67cd4e-af24-403c-a3ba-9753f11dc21c
