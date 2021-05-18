### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 2cb37ccd-f298-404a-8dea-0815bcd7fda9
using PlutoTest

# ╔═╡ 4f66ae50-b0e9-11eb-0350-3535845809d1
md"""
# [Day 19: Medicine for Rudolph](https://adventofcode.com/2015/day/19)

Rudolph the Red-Nosed Reindeer is sick! His nose isn't shining very brightly, and he needs medicine.

Red-Nosed Reindeer biology isn't similar to regular reindeer biology; Rudolph is going to need custom-made medicine. Unfortunately, Red-Nosed Reindeer chemistry isn't similar to regular reindeer chemistry, either.

The North Pole is equipped with a Red-Nosed Reindeer nuclear fusion/fission plant, capable of constructing any Red-Nosed Reindeer molecule you need. It works by starting with some input molecule and then doing a series of replacements, one per step, until it has the right molecule.

However, the machine has to be calibrated before it can be used. Calibration involves determining the number of molecules that can be generated in one step from a given starting point.

For example, imagine a simpler machine that supports only the following replacements:

```
H => HO
H => OH
O => HH

```

Given the replacements above and starting with `HOH`, the following molecules could be generated:

-   `HOOH` (via `H => HO` on the first `H`).
-   `HOHO` (via `H => HO` on the second `H`).
-   `OHOH` (via `H => OH` on the first `H`).
-   `HOOH` (via `H => OH` on the second `H`).
-   `HHHH` (via `O => HH`).

So, in the example above, there are `4` distinct molecules (not five, because `HOOH` appears twice) after one replacement from `HOH`. Santa's favorite molecule, `HOHOHO`, can become `7` distinct molecules (over nine replacements: six from `H`, and three from `O`).

The machine replaces without regard for the surrounding characters. For example, given the string `H2O`, the transition `H => OO` would result in `OO2O`.

Your puzzle input describes all of the possible replacements and, at the bottom, the medicine molecule for which you need to calibrate the machine. **How many distinct molecules can be created after all the different ways you can do one replacement on the medicine molecule?**
"""

# ╔═╡ 1a84a9cf-60bb-423b-b802-b35763e96032
puzzle_input = "Al => ThF
Al => ThRnFAr
B => BCa
B => TiB
B => TiRnFAr
Ca => CaCa
Ca => PB
Ca => PRnFAr
Ca => SiRnFYFAr
Ca => SiRnMgAr
Ca => SiTh
F => CaF
F => PMg
F => SiAl
H => CRnAlAr
H => CRnFYFYFAr
H => CRnFYMgAr
H => CRnMgYFAr
H => HCa
H => NRnFYFAr
H => NRnMgAr
H => NTh
H => OB
H => ORnFAr
Mg => BF
Mg => TiMg
N => CRnFAr
N => HSi
O => CRnFYFAr
O => CRnMgAr
O => HP
O => NRnFAr
O => OTi
P => CaP
P => PTi
P => SiRnFAr
Si => CaSi
Th => ThCa
Ti => BP
Ti => TiTi
e => HF
e => NAl
e => OMg

ORnPBPMgArCaCaCaSiThCaCaSiThCaCaPBSiRnFArRnFArCaCaSiThCaCaSiThCaCaCaCaCaCaSiRnFYFArSiRnMgArCaSiRnPTiTiBFYPBFArSiRnCaSiRnTiRnFArSiAlArPTiBPTiRnCaSiAlArCaPTiTiBPMgYFArPTiRnFArSiRnCaCaFArRnCaFArCaSiRnSiRnMgArFYCaSiRnMgArCaCaSiThPRnFArPBCaSiRnMgArCaCaSiThCaSiRnTiMgArFArSiThSiThCaCaSiRnMgArCaCaSiRnFArTiBPTiRnCaSiAlArCaPTiRnFArPBPBCaCaSiThCaPBSiThPRnFArSiThCaSiThCaSiThCaPTiBSiRnFYFArCaCaPRnFArPBCaCaPBSiRnTiRnFArCaPRnFArSiRnCaCaCaSiThCaRnCaFArYCaSiRnFArBCaCaCaSiThFArPBFArCaSiRnFArRnCaCaCaFArSiRnFArTiRnPMgArF"

# ╔═╡ 03e179fb-d380-4d8d-919c-7dc940533876
example_input = """
H => HO
H => OH
O => HH
""" |> strip

# ╔═╡ 43daa5a3-6c7f-4afd-9bba-bb514bf41e83
function parse1(input)
	d = Dict()
	for line in split(input, "\n")
		parts = split(line, " => ")
		
		key = parts[1]
		if haskey(d, key)
			push!(d[key], parts[2])
		else
			d[key] = [parts[2]]
		end
	end
	d		
end

# ╔═╡ fcad707b-3039-4753-bfe1-7db9a5846c48
parse1(example_input)

# ╔═╡ d393d954-9dc7-4aa3-a219-7a79458babe1
map(f -> (f.match, f.offset), collect(eachmatch(Regex("H"), "HOH")))

# ╔═╡ 19be711d-ca4c-478e-8422-0ece0efefc7e
function molcombinations(mol, c)
	vals = []
	for key in keys(c)
		
		for m in eachmatch(Regex(key), mol)
			
			for val in c[key]
				
			
				n = collect(mol)
				n = collect(val)
				push!(vals, 
					(
					mol[m.offset:m.offset+length(key)-1],
				
					)
				)
						
			end
		end
		
		
		
		#push!(n, c[key] * length(collect(eachmatch(Regex(key), mol))))
	end
	vals
end

# ╔═╡ 0662d133-08c2-4f14-857e-a77a8cb2ba43
molcombinations("HOH", parse1(example_input))

# ╔═╡ b30427b8-b806-4197-9879-b351587b5fb6
@assert length(molcombinations("HOH", example_input)) == 4

# ╔═╡ d29f7880-d4c0-40a7-a92a-c45883c3ae6f
@assert length(molcombinations("HOHOHO", example_input)) == 7

# ╔═╡ Cell order:
# ╠═2cb37ccd-f298-404a-8dea-0815bcd7fda9
# ╟─4f66ae50-b0e9-11eb-0350-3535845809d1
# ╟─1a84a9cf-60bb-423b-b802-b35763e96032
# ╟─03e179fb-d380-4d8d-919c-7dc940533876
# ╠═43daa5a3-6c7f-4afd-9bba-bb514bf41e83
# ╠═fcad707b-3039-4753-bfe1-7db9a5846c48
# ╠═d393d954-9dc7-4aa3-a219-7a79458babe1
# ╠═19be711d-ca4c-478e-8422-0ece0efefc7e
# ╠═0662d133-08c2-4f14-857e-a77a8cb2ba43
# ╠═b30427b8-b806-4197-9879-b351587b5fb6
# ╠═d29f7880-d4c0-40a7-a92a-c45883c3ae6f
