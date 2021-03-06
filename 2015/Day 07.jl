### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 9d8454ee-2283-4725-850b-9b211ff3444f
using PlutoTest

# ╔═╡ efb28490-b023-11eb-04e4-db86b53af0fe
md"""
# [Day 7: Some Assembly Required](https://adventofcode.com/2015/day/7)

This year, Santa brought little Bobby Tables a set of wires and [bitwise logic gates](https://en.wikipedia.org/wiki/Bitwise_operation)! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

Each wire has an identifier (some lowercase letters) and can carry a [16-bit](https://en.wikipedia.org/wiki/16-bit) signal (a number from `0` to `65535`). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

The included instructions booklet describes how to connect the parts together: `x AND y -> z` means to connect wires `x` and `y` to an AND gate, and then connect its output to wire `z`.

For example:

-   `123 -> x` means that the signal `123` is provided to wire `x`.
-   `x AND y -> z` means that the [bitwise AND](https://en.wikipedia.org/wiki/Bitwise_operation#AND) of wire `x` and wire `y` is provided to wire `z`.
-   `p LSHIFT 2 -> q` means that the value from wire `p` is [left-shifted](https://en.wikipedia.org/wiki/Logical_shift) by `2` and then provided to wire `q`.
-   `NOT e -> f` means that the [bitwise complement](https://en.wikipedia.org/wiki/Bitwise_operation#NOT) of the value from wire `e` is provided to wire `f`.

Other possible gates include `OR` ([bitwise OR](https://en.wikipedia.org/wiki/Bitwise_operation#OR)) and `RSHIFT` ([right-shift](https://en.wikipedia.org/wiki/Logical_shift)). If, for some reason, you'd like to emulate the circuit instead, almost all programming languages (for example, [C](https://en.wikipedia.org/wiki/Bitwise_operations_in_C), [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators), or [Python](https://wiki.python.org/moin/BitwiseOperators)) provide operators for these gates.

For example, here is a simple circuit:

```
123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i

```

After it is run, these are the signals on the wires:

```
d: 72
e: 507
f: 492
g: 114
h: 65412
i: 65079
x: 123
y: 456

```

In little Bobby's kit's instructions booklet (provided as your puzzle input), **what signal is ultimately provided to wire `a`?**
"""

# ╔═╡ bc36e815-9b26-4e8b-aaae-599e06f95af3
puzzle_input = "NOT dq -> dr
kg OR kf -> kh
ep OR eo -> eq
44430 -> b
NOT gs -> gt
dd OR do -> dp
eg AND ei -> ej
y AND ae -> ag
jx AND jz -> ka
lf RSHIFT 2 -> lg
z AND aa -> ac
dy AND ej -> el
bj OR bi -> bk
kk RSHIFT 3 -> km
NOT cn -> co
gn AND gp -> gq
cq AND cs -> ct
eo LSHIFT 15 -> es
lg OR lm -> ln
dy OR ej -> ek
NOT di -> dj
1 AND fi -> fj
kf LSHIFT 15 -> kj
NOT jy -> jz
NOT ft -> fu
fs AND fu -> fv
NOT hr -> hs
ck OR cl -> cm
jp RSHIFT 5 -> js
iv OR jb -> jc
is OR it -> iu
ld OR le -> lf
NOT fc -> fd
NOT dm -> dn
bn OR by -> bz
aj AND al -> am
cd LSHIFT 15 -> ch
jp AND ka -> kc
ci OR ct -> cu
gv AND gx -> gy
de AND dk -> dm
x RSHIFT 5 -> aa
et RSHIFT 2 -> eu
x RSHIFT 1 -> aq
ia OR ig -> ih
bk LSHIFT 1 -> ce
y OR ae -> af
NOT ca -> cb
e AND f -> h
ia AND ig -> ii
ck AND cl -> cn
NOT jh -> ji
z OR aa -> ab
1 AND en -> eo
ib AND ic -> ie
NOT eh -> ei
iy AND ja -> jb
NOT bb -> bc
ha OR gz -> hb
1 AND cx -> cy
NOT ax -> ay
ev OR ew -> ex
bn RSHIFT 2 -> bo
er OR es -> et
eu OR fa -> fb
jp OR ka -> kb
ea AND eb -> ed
k AND m -> n
et RSHIFT 3 -> ev
et RSHIFT 5 -> ew
hz RSHIFT 1 -> is
ki OR kj -> kk
NOT h -> i
lv LSHIFT 15 -> lz
as RSHIFT 1 -> bl
hu LSHIFT 15 -> hy
iw AND ix -> iz
lf RSHIFT 1 -> ly
fp OR fv -> fw
1 AND am -> an
ap LSHIFT 1 -> bj
u LSHIFT 1 -> ao
b RSHIFT 5 -> f
jq AND jw -> jy
iu RSHIFT 3 -> iw
ih AND ij -> ik
NOT iz -> ja
de OR dk -> dl
iu OR jf -> jg
as AND bd -> bf
b RSHIFT 3 -> e
jq OR jw -> jx
iv AND jb -> jd
cg OR ch -> ci
iu AND jf -> jh
lx -> a
1 AND cc -> cd
ly OR lz -> ma
NOT el -> em
1 AND bh -> bi
fb AND fd -> fe
lf OR lq -> lr
bn RSHIFT 3 -> bp
bn AND by -> ca
af AND ah -> ai
cf LSHIFT 1 -> cz
dw OR dx -> dy
gj AND gu -> gw
jg AND ji -> jj
jr OR js -> jt
bl OR bm -> bn
gj RSHIFT 2 -> gk
cj OR cp -> cq
gj OR gu -> gv
b OR n -> o
o AND q -> r
bi LSHIFT 15 -> bm
dy RSHIFT 1 -> er
cu AND cw -> cx
iw OR ix -> iy
hc OR hd -> he
0 -> c
db OR dc -> dd
kk RSHIFT 2 -> kl
eq LSHIFT 1 -> fk
dz OR ef -> eg
NOT ed -> ee
lw OR lv -> lx
fw AND fy -> fz
dz AND ef -> eh
jp RSHIFT 3 -> jr
lg AND lm -> lo
ci RSHIFT 2 -> cj
be AND bg -> bh
lc LSHIFT 1 -> lw
hm AND ho -> hp
jr AND js -> ju
1 AND io -> ip
cm AND co -> cp
ib OR ic -> id
NOT bf -> bg
fo RSHIFT 5 -> fr
ip LSHIFT 15 -> it
jt AND jv -> jw
jc AND je -> jf
du OR dt -> dv
NOT fx -> fy
aw AND ay -> az
ge LSHIFT 15 -> gi
NOT ak -> al
fm OR fn -> fo
ff AND fh -> fi
ci RSHIFT 5 -> cl
cz OR cy -> da
NOT ey -> ez
NOT ju -> jv
NOT ls -> lt
kk AND kv -> kx
NOT ii -> ij
kl AND kr -> kt
jk LSHIFT 15 -> jo
e OR f -> g
NOT bs -> bt
hi AND hk -> hl
hz OR ik -> il
ek AND em -> en
ao OR an -> ap
dv LSHIFT 1 -> ep
an LSHIFT 15 -> ar
fo RSHIFT 1 -> gh
NOT im -> in
kk RSHIFT 1 -> ld
hw LSHIFT 1 -> iq
ec AND ee -> ef
hb LSHIFT 1 -> hv
kb AND kd -> ke
x AND ai -> ak
dd AND do -> dq
aq OR ar -> as
iq OR ip -> ir
dl AND dn -> do
iu RSHIFT 5 -> ix
as OR bd -> be
NOT go -> gp
fk OR fj -> fl
jm LSHIFT 1 -> kg
NOT cv -> cw
dp AND dr -> ds
dt LSHIFT 15 -> dx
et RSHIFT 1 -> fm
dy RSHIFT 3 -> ea
fp AND fv -> fx
NOT p -> q
dd RSHIFT 2 -> de
eu AND fa -> fc
ba AND bc -> bd
dh AND dj -> dk
lr AND lt -> lu
he RSHIFT 1 -> hx
ex AND ez -> fa
df OR dg -> dh
fj LSHIFT 15 -> fn
NOT kx -> ky
gk OR gq -> gr
dy RSHIFT 2 -> dz
gh OR gi -> gj
lj AND ll -> lm
x OR ai -> aj
bz AND cb -> cc
1 AND lu -> lv
as RSHIFT 3 -> au
ce OR cd -> cf
il AND in -> io
dd RSHIFT 1 -> dw
NOT lo -> lp
c LSHIFT 1 -> t
dd RSHIFT 3 -> df
dd RSHIFT 5 -> dg
lh AND li -> lk
lf RSHIFT 5 -> li
dy RSHIFT 5 -> eb
NOT kt -> ku
at OR az -> ba
x RSHIFT 3 -> z
NOT lk -> ll
lb OR la -> lc
1 AND r -> s
lh OR li -> lj
ln AND lp -> lq
kk RSHIFT 5 -> kn
ea OR eb -> ec
ci AND ct -> cv
b RSHIFT 2 -> d
jp RSHIFT 1 -> ki
NOT cr -> cs
NOT jd -> je
jp RSHIFT 2 -> jq
jn OR jo -> jp
lf RSHIFT 3 -> lh
1 AND ds -> dt
lf AND lq -> ls
la LSHIFT 15 -> le
NOT fg -> fh
at AND az -> bb
au AND av -> ax
kw AND ky -> kz
v OR w -> x
kk OR kv -> kw
ks AND ku -> kv
kh LSHIFT 1 -> lb
1 AND kz -> la
NOT kc -> kd
x RSHIFT 2 -> y
et OR fe -> ff
et AND fe -> fg
NOT ac -> ad
jl OR jk -> jm
1 AND jj -> jk
bn RSHIFT 1 -> cg
NOT kp -> kq
ci RSHIFT 3 -> ck
ev AND ew -> ey
1 AND ke -> kf
cj AND cp -> cr
ir LSHIFT 1 -> jl
NOT gw -> gx
as RSHIFT 2 -> at
iu RSHIFT 1 -> jn
cy LSHIFT 15 -> dc
hg OR hh -> hi
ci RSHIFT 1 -> db
au OR av -> aw
km AND kn -> kp
gj RSHIFT 1 -> hc
iu RSHIFT 2 -> iv
ab AND ad -> ae
da LSHIFT 1 -> du
NOT bw -> bx
km OR kn -> ko
ko AND kq -> kr
bv AND bx -> by
kl OR kr -> ks
1 AND ht -> hu
df AND dg -> di
NOT ag -> ah
d OR j -> k
d AND j -> l
b AND n -> p
gf OR ge -> gg
gg LSHIFT 1 -> ha
bn RSHIFT 5 -> bq
bo OR bu -> bv
1 AND gy -> gz
s LSHIFT 15 -> w
NOT ie -> if
as RSHIFT 5 -> av
bo AND bu -> bw
hz AND ik -> im
bp AND bq -> bs
b RSHIFT 1 -> v
NOT l -> m
bp OR bq -> br
g AND i -> j
br AND bt -> bu
t OR s -> u
hz RSHIFT 5 -> ic
gk AND gq -> gs
fl LSHIFT 1 -> gf
he RSHIFT 3 -> hg
gz LSHIFT 15 -> hd
hf OR hl -> hm
1 AND gd -> ge
fo OR fz -> ga
id AND if -> ig
fo AND fz -> gb
gr AND gt -> gu
he OR hp -> hq
fq AND fr -> ft
ga AND gc -> gd
fo RSHIFT 2 -> fp
gl OR gm -> gn
hg AND hh -> hj
NOT hn -> ho
gl AND gm -> go
he RSHIFT 5 -> hh
NOT gb -> gc
hq AND hs -> ht
hz RSHIFT 3 -> ib
hz RSHIFT 2 -> ia
fq OR fr -> fs
hx OR hy -> hz
he AND hp -> hr
gj RSHIFT 5 -> gm
hf AND hl -> hn
hv OR hu -> hw
NOT hj -> hk
gj RSHIFT 3 -> gl
fo RSHIFT 3 -> fq
he RSHIFT 2 -> hf"

# ╔═╡ 6b6a90e8-880b-46f4-9e7d-6c72056441d1
function interpret(commands)
	state = Dict()
	for command in commands
		parts = split(command, " -> ")
		state[parts[2]] = parts[1] 
	end		
	state
end

# ╔═╡ bb73bdf7-b4f2-4794-a269-d1862133db40
function eval_expr(expr::AbstractString, state::Dict)
	parts = split(expr, " ")
	if length(parts) == 1
		right = parts[1]
		if occursin(r"\d+", right) 
			return parse(UInt16, right)
		else
			value = eval_expr(state[right], state)
			# cache result to prevent infinite loop
			state[right] = string(Int(value))
			return value
		end
	elseif length(parts) == 2
		right = eval_expr(parts[2], state)
		op = parts[1]
		if op == "NOT"
			return UInt16(~ right)
		end
	elseif length(parts) == 3
		left = eval_expr(parts[1], state)
		right = eval_expr(parts[3], state)
		op = parts[2]
		if op == "AND"
			return UInt16(left & right)
		elseif op == "OR"
			return UInt16(left | right)
		elseif op == "LSHIFT"
			return UInt16(left << right)
		elseif op == "RSHIFT"
			return UInt16(left >> right)
		end
	end
	throw(ErrorException("invalid syntax"))
end

# ╔═╡ 70a11986-1efc-4c06-939c-5c2489a1a2a9
example_input = "123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i"

# ╔═╡ 5b0d40b2-04b1-43f4-bd7d-64d698b6db10
example_state = interpret(split(example_input, "\n"))

# ╔═╡ 70c81a2b-32ed-4b04-968c-ab2f283d021b
@assert eval_expr("d", example_state) == 72

# ╔═╡ 8d4dda38-f22c-476f-8b50-38e1d890ce4e
@assert eval_expr("e", example_state) == 507

# ╔═╡ d16c8354-06ab-4307-b6a2-5e0f55c34379
@assert eval_expr("f", example_state) == 492

# ╔═╡ a1cbba28-3794-4fe5-ac40-71a4ce17c4b4
@assert eval_expr("g", example_state) == 114

# ╔═╡ 7a0a9d14-7624-43a9-8e31-7ddc238f5d87
@assert eval_expr("h", example_state) == 65412

# ╔═╡ 5895bb39-ef00-4d57-b970-baa298988564
@assert eval_expr("i", example_state) == 65079

# ╔═╡ e7dda86a-261b-4852-861f-db4d1062300b
@assert eval_expr("x", example_state) == 123

# ╔═╡ 2de2b696-f8fa-4b5b-9c80-264e81e1d231
@assert eval_expr("y", example_state) == 456

# ╔═╡ 789f6538-5bc5-48e1-a2d4-f16b6c520c55
part1_state = interpret(split(puzzle_input, "\n"))

# ╔═╡ a45ae491-e3ee-4827-a111-cb195eb41ba5
part1 = Int(eval_expr("a", part1_state))

# ╔═╡ f5c37588-077d-4511-9974-1f75d61d22f9
@test part1 == 3176

# ╔═╡ 2db74e17-ea06-427a-b1cb-378aa4378580
md"Your puzzle answer was `3176`."

# ╔═╡ c393d2f4-548a-49e3-8aa8-df21a23da09e
md"""
# Part Two

Now, take the signal you got on wire `a`, override wire `b` to that signal, and reset the other wires (including wire `a`). **What new signal is ultimately provided to wire `a`?**
"""

# ╔═╡ 9ce6d6a0-1a69-44d7-b15a-1d47017edba4
part2_state = interpret(split(puzzle_input, "\n"))

# ╔═╡ c04c298e-30c9-4bb4-b6a2-b70b1cf0c68d
part2_state["b"] = "3176"

# ╔═╡ 6bbe9474-4948-4b87-b638-e203a59143f0
part2 = Int(eval_expr("a", part2_state))

# ╔═╡ 2cc8d966-9e91-4035-91a5-441a95b93cb6
@test part2 == 14710

# ╔═╡ d23afbf6-3400-45e9-9e2b-5bfe1cfbf247
md"Your puzzle answer was `14710`."

# ╔═╡ Cell order:
# ╠═9d8454ee-2283-4725-850b-9b211ff3444f
# ╟─efb28490-b023-11eb-04e4-db86b53af0fe
# ╟─bc36e815-9b26-4e8b-aaae-599e06f95af3
# ╠═6b6a90e8-880b-46f4-9e7d-6c72056441d1
# ╠═bb73bdf7-b4f2-4794-a269-d1862133db40
# ╟─70a11986-1efc-4c06-939c-5c2489a1a2a9
# ╠═5b0d40b2-04b1-43f4-bd7d-64d698b6db10
# ╠═70c81a2b-32ed-4b04-968c-ab2f283d021b
# ╠═8d4dda38-f22c-476f-8b50-38e1d890ce4e
# ╠═d16c8354-06ab-4307-b6a2-5e0f55c34379
# ╠═a1cbba28-3794-4fe5-ac40-71a4ce17c4b4
# ╠═7a0a9d14-7624-43a9-8e31-7ddc238f5d87
# ╠═5895bb39-ef00-4d57-b970-baa298988564
# ╠═e7dda86a-261b-4852-861f-db4d1062300b
# ╠═2de2b696-f8fa-4b5b-9c80-264e81e1d231
# ╠═789f6538-5bc5-48e1-a2d4-f16b6c520c55
# ╠═a45ae491-e3ee-4827-a111-cb195eb41ba5
# ╠═f5c37588-077d-4511-9974-1f75d61d22f9
# ╟─2db74e17-ea06-427a-b1cb-378aa4378580
# ╟─c393d2f4-548a-49e3-8aa8-df21a23da09e
# ╠═9ce6d6a0-1a69-44d7-b15a-1d47017edba4
# ╠═c04c298e-30c9-4bb4-b6a2-b70b1cf0c68d
# ╠═6bbe9474-4948-4b87-b638-e203a59143f0
# ╠═2cc8d966-9e91-4035-91a5-441a95b93cb6
# ╟─d23afbf6-3400-45e9-9e2b-5bfe1cfbf247
