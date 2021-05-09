### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 9353168e-bd57-446f-9fc3-ce063aa9c0f5
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add(["Plots"])	
	Pkg.add(Pkg.PackageSpec(url="https://github.com/JuliaPluto/PlutoTest.jl"))	
	
	
	using Plots, PlutoTest
	plotly()
end

# ╔═╡ 1b64f670-b017-11eb-140d-ebd5ac033872
md"""
# [Day 6: Probably a Fire Hazard](https://adventofcode.com/2015/day/6)
Because your neighbors keep defeating you in the holiday house decorating contest year after year, you've decided to deploy one million lights in a 1000x1000 grid.

Furthermore, because you've been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.

Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at `0,0`, `0,999`, `999,999`, and `999,0`. The instructions include whether to `turn on`, `turn off`, or `toggle` various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like `0,0 through 2,2` therefore refers to 9 lights in a 3x3 square. The lights all start turned off.

To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.

For example:

-   `turn on 0,0 through 999,999` would turn on (or leave on) every light.
-   `toggle 0,0 through 999,0` would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
-   `turn off 499,499 through 500,500` would turn off (or leave off) the middle four lights.

**After following the instructions, how many lights are lit?**
"""

# ╔═╡ c87dc276-6a3a-4903-955e-6ee8063b0f53
puzzle_input = "turn on 887,9 through 959,629
turn on 454,398 through 844,448
turn off 539,243 through 559,965
turn off 370,819 through 676,868
turn off 145,40 through 370,997
turn off 301,3 through 808,453
turn on 351,678 through 951,908
toggle 720,196 through 897,994
toggle 831,394 through 904,860
toggle 753,664 through 970,926
turn off 150,300 through 213,740
turn on 141,242 through 932,871
toggle 294,259 through 474,326
toggle 678,333 through 752,957
toggle 393,804 through 510,976
turn off 6,964 through 411,976
turn off 33,572 through 978,590
turn on 579,693 through 650,978
turn on 150,20 through 652,719
turn off 782,143 through 808,802
turn off 240,377 through 761,468
turn off 899,828 through 958,967
turn on 613,565 through 952,659
turn on 295,36 through 964,978
toggle 846,296 through 969,528
turn off 211,254 through 529,491
turn off 231,594 through 406,794
turn off 169,791 through 758,942
turn on 955,440 through 980,477
toggle 944,498 through 995,928
turn on 519,391 through 605,718
toggle 521,303 through 617,366
turn off 524,349 through 694,791
toggle 391,87 through 499,792
toggle 562,527 through 668,935
turn off 68,358 through 857,453
toggle 815,811 through 889,828
turn off 666,61 through 768,87
turn on 27,501 through 921,952
turn on 953,102 through 983,471
turn on 277,552 through 451,723
turn off 64,253 through 655,960
turn on 47,485 through 734,977
turn off 59,119 through 699,734
toggle 407,898 through 493,955
toggle 912,966 through 949,991
turn on 479,990 through 895,990
toggle 390,589 through 869,766
toggle 593,903 through 926,943
toggle 358,439 through 870,528
turn off 649,410 through 652,875
turn on 629,834 through 712,895
toggle 254,555 through 770,901
toggle 641,832 through 947,850
turn on 268,448 through 743,777
turn off 512,123 through 625,874
turn off 498,262 through 930,811
turn off 835,158 through 886,242
toggle 546,310 through 607,773
turn on 501,505 through 896,909
turn off 666,796 through 817,924
toggle 987,789 through 993,809
toggle 745,8 through 860,693
toggle 181,983 through 731,988
turn on 826,174 through 924,883
turn on 239,228 through 843,993
turn on 205,613 through 891,667
toggle 867,873 through 984,896
turn on 628,251 through 677,681
toggle 276,956 through 631,964
turn on 78,358 through 974,713
turn on 521,360 through 773,597
turn off 963,52 through 979,502
turn on 117,151 through 934,622
toggle 237,91 through 528,164
turn on 944,269 through 975,453
toggle 979,460 through 988,964
turn off 440,254 through 681,507
toggle 347,100 through 896,785
turn off 329,592 through 369,985
turn on 931,960 through 979,985
toggle 703,3 through 776,36
toggle 798,120 through 908,550
turn off 186,605 through 914,709
turn off 921,725 through 979,956
toggle 167,34 through 735,249
turn on 726,781 through 987,936
toggle 720,336 through 847,756
turn on 171,630 through 656,769
turn off 417,276 through 751,500
toggle 559,485 through 584,534
turn on 568,629 through 690,873
toggle 248,712 through 277,988
toggle 345,594 through 812,723
turn off 800,108 through 834,618
turn off 967,439 through 986,869
turn on 842,209 through 955,529
turn on 132,653 through 357,696
turn on 817,38 through 973,662
turn off 569,816 through 721,861
turn on 568,429 through 945,724
turn on 77,458 through 844,685
turn off 138,78 through 498,851
turn on 136,21 through 252,986
turn off 2,460 through 863,472
turn on 172,81 through 839,332
turn on 123,216 through 703,384
turn off 879,644 through 944,887
toggle 227,491 through 504,793
toggle 580,418 through 741,479
toggle 65,276 through 414,299
toggle 482,486 through 838,931
turn off 557,768 through 950,927
turn off 615,617 through 955,864
turn on 859,886 through 923,919
turn on 391,330 through 499,971
toggle 521,835 through 613,847
turn on 822,787 through 989,847
turn on 192,142 through 357,846
turn off 564,945 through 985,945
turn off 479,361 through 703,799
toggle 56,481 through 489,978
turn off 632,991 through 774,998
toggle 723,526 through 945,792
turn on 344,149 through 441,640
toggle 568,927 through 624,952
turn on 621,784 through 970,788
toggle 665,783 through 795,981
toggle 386,610 through 817,730
toggle 440,399 through 734,417
toggle 939,201 through 978,803
turn off 395,883 through 554,929
turn on 340,309 through 637,561
turn off 875,147 through 946,481
turn off 945,837 through 957,922
turn off 429,982 through 691,991
toggle 227,137 through 439,822
toggle 4,848 through 7,932
turn off 545,146 through 756,943
turn on 763,863 through 937,994
turn on 232,94 through 404,502
turn off 742,254 through 930,512
turn on 91,931 through 101,942
toggle 585,106 through 651,425
turn on 506,700 through 567,960
turn off 548,44 through 718,352
turn off 194,827 through 673,859
turn off 6,645 through 509,764
turn off 13,230 through 821,361
turn on 734,629 through 919,631
toggle 788,552 through 957,972
toggle 244,747 through 849,773
turn off 162,553 through 276,887
turn off 569,577 through 587,604
turn off 799,482 through 854,956
turn on 744,535 through 909,802
toggle 330,641 through 396,986
turn off 927,458 through 966,564
toggle 984,486 through 986,913
toggle 519,682 through 632,708
turn on 984,977 through 989,986
toggle 766,423 through 934,495
turn on 17,509 through 947,718
turn on 413,783 through 631,903
turn on 482,370 through 493,688
turn on 433,859 through 628,938
turn off 769,549 through 945,810
turn on 178,853 through 539,941
turn off 203,251 through 692,433
turn off 525,638 through 955,794
turn on 169,70 through 764,939
toggle 59,352 through 896,404
toggle 143,245 through 707,320
turn off 103,35 through 160,949
toggle 496,24 through 669,507
turn off 581,847 through 847,903
turn on 689,153 through 733,562
turn on 821,487 through 839,699
turn on 837,627 through 978,723
toggle 96,748 through 973,753
toggle 99,818 through 609,995
turn on 731,193 through 756,509
turn off 622,55 through 813,365
turn on 456,490 through 576,548
turn on 48,421 through 163,674
turn off 853,861 through 924,964
turn off 59,963 through 556,987
turn on 458,710 through 688,847
toggle 12,484 through 878,562
turn off 241,964 through 799,983
turn off 434,299 through 845,772
toggle 896,725 through 956,847
turn on 740,289 through 784,345
turn off 395,840 through 822,845
turn on 955,224 through 996,953
turn off 710,186 through 957,722
turn off 485,949 through 869,985
turn on 848,209 through 975,376
toggle 221,241 through 906,384
turn on 588,49 through 927,496
turn on 273,332 through 735,725
turn on 505,962 through 895,962
toggle 820,112 through 923,143
turn on 919,792 through 978,982
toggle 489,461 through 910,737
turn off 202,642 through 638,940
turn off 708,953 through 970,960
toggle 437,291 through 546,381
turn on 409,358 through 837,479
turn off 756,279 through 870,943
turn off 154,657 through 375,703
turn off 524,622 through 995,779
toggle 514,221 through 651,850
toggle 808,464 through 886,646
toggle 483,537 through 739,840
toggle 654,769 through 831,825
turn off 326,37 through 631,69
turn off 590,570 through 926,656
turn off 881,913 through 911,998
turn on 996,102 through 998,616
turn off 677,503 through 828,563
turn on 860,251 through 877,441
turn off 964,100 through 982,377
toggle 888,403 through 961,597
turn off 632,240 through 938,968
toggle 731,176 through 932,413
turn on 5,498 through 203,835
turn on 819,352 through 929,855
toggle 393,813 through 832,816
toggle 725,689 through 967,888
turn on 968,950 through 969,983
turn off 152,628 through 582,896
turn off 165,844 through 459,935
turn off 882,741 through 974,786
turn off 283,179 through 731,899
toggle 197,366 through 682,445
turn on 106,309 through 120,813
toggle 950,387 through 967,782
turn off 274,603 through 383,759
turn off 155,665 through 284,787
toggle 551,871 through 860,962
turn off 30,826 through 598,892
toggle 76,552 through 977,888
turn on 938,180 through 994,997
toggle 62,381 through 993,656
toggle 625,861 through 921,941
turn on 685,311 through 872,521
turn on 124,934 through 530,962
turn on 606,379 through 961,867
turn off 792,735 through 946,783
turn on 417,480 through 860,598
toggle 178,91 through 481,887
turn off 23,935 through 833,962
toggle 317,14 through 793,425
turn on 986,89 through 999,613
turn off 359,201 through 560,554
turn off 729,494 through 942,626
turn on 204,143 through 876,610
toggle 474,97 through 636,542
turn off 902,924 through 976,973
turn off 389,442 through 824,638
turn off 622,863 through 798,863
turn on 840,622 through 978,920
toggle 567,374 through 925,439
turn off 643,319 through 935,662
toggle 185,42 through 294,810
turn on 47,124 through 598,880
toggle 828,303 through 979,770
turn off 174,272 through 280,311
turn off 540,50 through 880,212
turn on 141,994 through 221,998
turn on 476,695 through 483,901
turn on 960,216 through 972,502
toggle 752,335 through 957,733
turn off 419,713 through 537,998
toggle 772,846 through 994,888
turn on 881,159 through 902,312
turn off 537,651 through 641,816
toggle 561,947 through 638,965
turn on 368,458 through 437,612
turn on 290,149 through 705,919
turn on 711,918 through 974,945
toggle 916,242 through 926,786
toggle 522,272 through 773,314
turn on 432,897 through 440,954
turn off 132,169 through 775,380
toggle 52,205 through 693,747
toggle 926,309 through 976,669
turn off 838,342 through 938,444
turn on 144,431 through 260,951
toggle 780,318 through 975,495
turn off 185,412 through 796,541
turn on 879,548 through 892,860
turn on 294,132 through 460,338
turn on 823,500 through 899,529
turn off 225,603 through 483,920
toggle 717,493 through 930,875
toggle 534,948 through 599,968
turn on 522,730 through 968,950
turn off 102,229 through 674,529"

# ╔═╡ 462f3b05-97a4-4bc7-b817-0b74be141531
dims = (1000, 1000)

# ╔═╡ bdb2415c-bef7-4d31-81cf-4175679b8814
parse_input(input) = split(input, "\n")

# ╔═╡ cfeb0f48-8879-4c32-882a-6cfc5fbe5e78
grid = zeros(dims)

# ╔═╡ b64e92eb-2505-4203-a512-6292235ccea5
apply1!(grid::BitMatrix, command::AbstractString) = begin
	parts = split(command, " ")
	parse_value(str::AbstractString) = split(str, ",") |> 
			Base.Fix1(map, s->parse(Int, s)) |> 
			Base.Fix1(map, s->s+1)
	not(x::Bool) = !x
	
	if parts[1] == "turn"
		from = parse_value(parts[3])
		to = parse_value(parts[5])
		
		if parts[2] == "on"
			grid[from[1]:to[1], from[2]:to[2]] .= 1
		elseif parts[2] == "off"
			grid[from[1]:to[1], from[2]:to[2]] .= 0
		else
			throw(ErrorException("invalid syntax"))
		end
	elseif parts[1] == "toggle"
		from = parse_value(parts[2])
		to = parse_value(parts[4])
		grid[from[1]:to[1], from[2]:to[2]] = not.(grid[from[1]:to[1], from[2]:to[2]])
	else
		throw(ErrorException("invalid syntax"))
	end
	
	grid
end

# ╔═╡ 238fc1ab-c208-4f54-9d48-552fba424020
puzzle_commands = parse_input(puzzle_input)

# ╔═╡ fa569771-87e4-4534-83d3-22da3fe425f7
@test sum(apply1!(falses(dims), "turn on 0,0 through 999,999")) == 1000*1000

# ╔═╡ 2d924161-974a-4209-bf72-5632dcc3e5b5
@test sum(apply1!(falses(dims), "toggle 0,0 through 999,0")) == 1000

# ╔═╡ e3e5aa80-54bf-4d7d-912a-00d1d7061ea7
@test sum(apply1!(trues(dims), "toggle 0,0 through 999,0")) == 1000*1000-1000

# ╔═╡ ea5f89aa-012b-4d23-8516-3d26269e27c5
@test sum(apply1!(trues(dims), "turn off 499,499 through 500,500")) == 1000*1000-4

# ╔═╡ 41e0a047-f7a4-4e7c-a9b8-6a3891e52465
function mass_apply1(commands::Vector) 
	grid = falses(dims)
	for command in commands
		apply1!(grid, command)
	end
	grid
end

# ╔═╡ 175908f4-2ef8-44a9-81c0-fb21e4bc10b7
grid1 = mass_apply1(split(puzzle_input, "\n"))

# ╔═╡ 184bb620-2d32-4b98-a02d-f5b64ae88eb6
heatmap(grid1)

# ╔═╡ 9840d540-607e-47d3-874c-9df7ec814d51
part1 = Int(sum(grid1))

# ╔═╡ 8ada2165-6667-4850-8131-e56b1fde7abe
md"Your puzzle answer was `377891`."

# ╔═╡ b3b7099c-b2c2-4ff4-b5c2-dfa6ec3cda87
md"""
# Part Two

You just finish implementing your winning light pattern when you realize you mistranslated Santa's message from Ancient Nordic Elvish.

The light grid you bought actually has individual brightness controls; each light can have a brightness of zero or more. The lights all start at zero.

The phrase `turn on` actually means that you should increase the brightness of those lights by `1`.

The phrase `turn off` actually means that you should decrease the brightness of those lights by `1`, to a minimum of zero.

The phrase `toggle` actually means that you should increase the brightness of those lights by `2`.

**What is the total brightness of all lights combined after following Santa's instructions?**

For example:

-   `turn on 0,0 through 0,0` would increase the total brightness by `1`.
-   `toggle 0,0 through 999,999` would increase the total brightness by `2000000`.

"""

# ╔═╡ eea139c9-3d08-499a-a9fb-df4f20bd129a
apply2!(grid::Matrix, command::AbstractString) = begin
	parts = split(command, " ")
	parse_value(str::AbstractString) = split(str, ",") |> 
			Base.Fix1(map, s->parse(Int, s)) |> 
			Base.Fix1(map, s->s+1)
	reduce_to_zero(n::Float64) = n > 0 ? n - 1 : 0
	
	if parts[1] == "turn"
		from = parse_value(parts[3])
		to = parse_value(parts[5])
		
		if parts[2] == "on"
			grid[from[1]:to[1], from[2]:to[2]] .+= 1
		elseif parts[2] == "off"
			grid[from[1]:to[1], from[2]:to[2]] = reduce_to_zero.(grid[from[1]:to[1], from[2]:to[2]])
		else
			throw(ErrorException("invalid syntax"))
		end
	elseif parts[1] == "toggle"
		from = parse_value(parts[2])
		to = parse_value(parts[4])
		grid[from[1]:to[1], from[2]:to[2]] .+= 2
	else
		throw(ErrorException("invalid syntax"))
	end
	
	grid
end

# ╔═╡ ee1b5584-8e75-4ebf-9514-0e5985b9869f
@test sum(apply2!(zeros(dims), "turn on 0,0 through 0,0")) == 1

# ╔═╡ 13f0e9af-d1dd-40ec-99a8-c56b91ab6ce8
@test sum(apply2!(zeros(dims), "toggle 0,0 through 999,999")) == 1000*1000*2

# ╔═╡ 7b0a6f85-0637-4ec0-8d17-3984bd9d8969
function mass_apply2(commands::Vector) 
	grid = zeros(dims)
	for command in commands
		apply2!(grid, command)
	end
	grid
end

# ╔═╡ 4d5a5013-fd59-4fea-8f73-396fba062fc5
grid2 = mass_apply2(split(puzzle_input, "\n"))

# ╔═╡ fbae4e2b-2ea5-414a-b3fd-01cd5630bfda
heatmap(grid2)

# ╔═╡ f245c971-fa2d-482e-a355-67a51963c0cb
part2 = Int(sum(grid2))

# ╔═╡ 0f036ef3-4901-42e4-bf0c-0580215b20cb
md"Your puzzle answer was `14110788`."

# ╔═╡ Cell order:
# ╠═9353168e-bd57-446f-9fc3-ce063aa9c0f5
# ╟─1b64f670-b017-11eb-140d-ebd5ac033872
# ╟─c87dc276-6a3a-4903-955e-6ee8063b0f53
# ╠═462f3b05-97a4-4bc7-b817-0b74be141531
# ╠═bdb2415c-bef7-4d31-81cf-4175679b8814
# ╠═cfeb0f48-8879-4c32-882a-6cfc5fbe5e78
# ╠═b64e92eb-2505-4203-a512-6292235ccea5
# ╠═238fc1ab-c208-4f54-9d48-552fba424020
# ╠═fa569771-87e4-4534-83d3-22da3fe425f7
# ╠═2d924161-974a-4209-bf72-5632dcc3e5b5
# ╠═e3e5aa80-54bf-4d7d-912a-00d1d7061ea7
# ╠═ea5f89aa-012b-4d23-8516-3d26269e27c5
# ╠═41e0a047-f7a4-4e7c-a9b8-6a3891e52465
# ╠═175908f4-2ef8-44a9-81c0-fb21e4bc10b7
# ╠═184bb620-2d32-4b98-a02d-f5b64ae88eb6
# ╠═9840d540-607e-47d3-874c-9df7ec814d51
# ╟─8ada2165-6667-4850-8131-e56b1fde7abe
# ╟─b3b7099c-b2c2-4ff4-b5c2-dfa6ec3cda87
# ╠═eea139c9-3d08-499a-a9fb-df4f20bd129a
# ╠═ee1b5584-8e75-4ebf-9514-0e5985b9869f
# ╠═13f0e9af-d1dd-40ec-99a8-c56b91ab6ce8
# ╠═7b0a6f85-0637-4ec0-8d17-3984bd9d8969
# ╠═4d5a5013-fd59-4fea-8f73-396fba062fc5
# ╠═fbae4e2b-2ea5-414a-b3fd-01cd5630bfda
# ╠═f245c971-fa2d-482e-a355-67a51963c0cb
# ╟─0f036ef3-4901-42e4-bf0c-0580215b20cb
