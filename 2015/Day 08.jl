### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 7d1ac287-43d9-4921-bade-5658899648e6
using PlutoTest

# ╔═╡ 7728c7b0-b022-11eb-363f-5f51427038cb
md"""
# [Day 8: Matchsticks](https://adventofcode.com/2015/day/8)

Space on the sleigh is limited this year, and so Santa will be bringing his list as a digital copy. He needs to know how much space it will take up when stored.

It is common in many programming languages to provide a way to escape special characters in strings. For example, [C](https://en.wikipedia.org/wiki/Escape_sequences_in_C), [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), [Perl](http://perldoc.perl.org/perlop.html#Quote-and-Quote-like-Operators), [Python](https://docs.python.org/2.0/ref/strings.html), and even [PHP](http://php.net/manual/en/language.types.string.php#language.types.string.syntax.double) handle special characters in very similar ways.

However, it is important to realize the difference between the number of characters in the code representation of the string literal and the number of characters in the in-memory string itself.

For example:

-   `""` is `2` characters of code (the two double quotes), but the string contains zero characters.
-   `"abc"` is `5` characters of code, but `3` characters in the string data.
-   `"aaa\\"aaa"` is `10` characters of code, but the string itself contains six "a" characters and a single, escaped quote character, for a total of `7` characters in the string data.
-   `"\x27"` is `6` characters of code, but the string itself contains just one - an apostrophe (`'`), escaped using hexadecimal notation.

Santa's list is a file that contains many double-quoted string literals, one on each line. The only escape sequences used are `\\` (which represents a single backslash), `\"` (which represents a lone double-quote character), and `\x` plus two hexadecimal characters (which represents a single character with that ASCII code).

Disregarding the whitespace in the file, **what is the number of characters of code for string literals minus the number of characters in memory for the values of the strings in total for the entire file?**

For example, given the four strings above, the total number of characters of string code (`2 + 5 + 10 + 6 = 23`) minus the total number of characters in memory for string values (`0 + 3 + 7 + 1 = 11`) is `23 - 11 = 12`.
"""

# ╔═╡ 1e37e13a-5f56-478c-8d50-d96ea1e32cd3
puzzle_input2 = raw"""
"qxfcsmh"
"ffsfyxbyuhqkpwatkjgudo"
"byc\x9dyxuafof\\\xa6uf\\axfozomj\\olh\x6a"
"jtqvz"
"uzezxa\"jgbmojtwyfbfguz"
"vqsremfk\x8fxiknektafj"
"wzntebpxnnt\"vqndz\"i\x47vvjqo\""
"higvez\"k\"riewqk"
"dlkrbhbrlfrp\\damiauyucwhty"
"d\""
"qlz"
"ku"
"yy\"\"uoao\"uripabop"
"saduyrntuswlnlkuppdro\\sicxosted"
"tj"
"zzphopswlwdhebwkxeurvizdv"
"xfoheirjoakrpofles\"nfu"
"q\xb7oh\"p\xce\"n"
"qeendp\"ercwgywdjeylxcv"
"dcmem"
"\"i\x13r\"l"
"ikso\xdcbvqnbrjduh\"uqudzki\xderwk"
"wfdsn"
"pwynglklryhtsqbno"
"hcoj\x63iccz\"v\"ttr"
"zf\x23\\hlj\\kkce\\d\\asy\"yyfestwcdxyfj"
"xs"
"m\"tvltapxdvtrxiy"
"bmud"
"k\"a"
"b\"oas"
"\"yexnjjupoqsxyqnquy\"uzfdvetqrc"
"vdw\xe3olxfgujaj"
"qomcxdnd\"\\cfoe\""
"fpul"
"m\"avamefphkpv"
"vvdnb\\x\\uhnxfw\"dpubfkxfmeuhnxisd"
"hey\\"
"ldaeigghlfey"
"eure\"hoy\xa5iezjp\\tm"
"yygb\"twbj\\r\"\x10gmxuhmp\""
"weirebp\x39mqonbtmfmd"
"ltuz\\hs\"e"
"ysvmpc"
"g\x8amjtt\"megl\"omsaihifwa"
"yimmm"
"iiyqfalh"
"cwknlaaf"
"q\x37feg\xc6s\"xx"
"uayrgeurgyp\\oi"
"xhug\"pt\"axugllbdiggzhvy"
"kdaarqmsjfx\xc3d"
"\"vkwla"
"d\""
"tmroz\"bvfinxoe\\mum\"wmm"
"\"n\"bbswxne\\p\\yr\"qhwpdd"
"skzlkietklkqovjhvj\xfe"
"pbg\\pab\"bubqaf\"obzcwxwywbs\\dhtq"
"xxjidvqh\"lx\\wu\"ij"
"daef\x5fe\x5b\\kbeeb\x13qnydtboof"
"ogvazaqy\"j\x73"
"y"
"n\"tibetedldy\\gsamm\"nwu"
"wldkvgdtqulwkad"
"dpmxnj"
"twybw\"cdvf\"mjdajurokbce"
"ru\"\\lasij\"i"
"roc\\vra\\lhrm"
"pbkt\x60booz\"fjlkc"
"j\x4dytvjwrzt"
"\\uiwjkniumxcs"
"cbhm\"nexccior\"v\"j\"nazxilmfp\x47"
"qdxngevzrlgoq"
"\"lrzxftytpobsdfyrtdqpjbpuwmm\x9e"
"mdag\x0asnck\xc2ggj\"slb\"fjy"
"wyqkhjuazdtcgkcxvjkpnjdae"
"aixfk\xc0iom\x21vueob"
"dkiiakyjpkffqlluhaetires"
"ysspv\"lysgkvnmwbbsy"
"gy\"ryexcjjxdm\"xswssgtr"
"s"
"ddxv"
"qwt\"\x27puilb\"pslmbrsxhrz"
"qdg\xc9e\\qwtknlvkol\x54oqvmchn\\"
"lvo"
"b"
"fk\"aa\"\"yenwch\\\\on"
"srig\x63hpwaavs\\\x80qzk\"xa\"\xe6u\\wr"
"yxjxuj\"ghyhhxfj\"\xa6qvatre"
"yoktqxjxkzrklkoeroil"
"\"jfmik\""
"smgseztzdwldikbqrh\""
"jftahgctf\"hoqy"
"tcnhicr\"znpgckt\"ble"
"vqktnkodh\"lo\"a\\bkmdjqqnsqr"
"ztnirfzqq"
"s"
"xx"
"iqj\"y\\hqgzflwrdsusasekyrxbp\\ad"
"\\xzjhlaiynkioz\"\"bxepzimvgwt"
"s\x36rbw"
"mniieztwrisvdx"
"atyfxioy\x2b\\"
"irde\x85\x5cvbah\\jekw\"ia"
"bdmftlhkwrprmpat\"prfaocvp"
"w\\k"
"umbpausy"
"zfauhpsangy"
"p\"zqyw"
"wtztypyqvnnxzvlvipnq\"zu"
"deicgwq\\oqvajpbov\\or\"kgplwu"
"mbzlfgpi\\\\zqcidjpzqdzxityxa"
"lfkxvhma"
"\xf2yduqzqr\"\\fak\"p\"n"
"mpajacfuxotonpadvng"
"anb\\telzvcdu\\a\xf2flfq"
"lrs\"ebethwpmuuc\"\x86ygr"
"qmvdbhtumzc\"ci"
"meet"
"yopg\x0fdxdq\"h\\ugsu\xffmolxjv"
"uhy"
"fzgidrtzycsireghazscvmwcfmw\\t"
"cqohkhpgvpru"
"bihyigtnvmevx\"xx"
"xz"
"zofomwotzuxsjk\"q\"mc\"js\"dnmalhxd"
"\\ktnddux\\fqvt\"ibnjntjcbn"
"ia"
"htjadnefwetyp\xd5kbrwfycbyy"
"\"\\hkuxqddnao"
"meqqsz\x83luecpgaem"
"cvks\x87frvxo\"svqivqsdpgwhukmju"
"sgmxiai\\o\"riufxwjfigr\xdf"
"fgywdfecqufccpcdn"
"faghjoq\x28abxnpxj"
"zuppgzcfb\"dctvp\"elup\"zxkopx"
"xqs\x45xxdqcihbwghmzoa"
"anbnlp\\cgcvm\"hc"
"xf\"fgrngwzys"
"nrxsjduedcy\x24"
"\x71sxl\"gj\"sds\"ulcruguz\\t\\ssvjcwhi"
"jhj\"msch"
"qpovolktfwyiuyicbfeeju\x01"
"nkyxmb\"qyqultgt\"nmvzvvnxnb"
"ycsrkbstgzqb\"uv\\cisn"
"s"
"ueptjnn\"\"sh"
"lp\"z\"d\"mxtxiy"
"yzjtvockdnvbubqabjourf\"k\"uoxwle"
"\x82\"wqm\""
"\xb5cwtuks\x5fpgh"
"wd"
"tbvf"
"ttbmzdgn"
"vfpiyfdejyrlbgcdtwzbnm"
"uc"
"otdcmhpjagqix"
"\\\xb1qso\"s"
"scowax"
"behpstjdh\xccqlgnqjyz\"eesn"
"r\xe1cbnjwzveoomkzlo\\kxlfouhm"
"jgrl"
"kzqs\\r"
"ctscb\x7fthwkdyko\"\x62pkf\"d\xe6knmhurg"
"tc\"kw\x3ftt"
"bxb\x5ccl"
"jyrmfbphsldwpq"
"jylpvysl\"\"juducjg"
"en\\m\"kxpq\"wpb\\\""
"madouht\"bmdwvnyqvpnawiphgac\""
"vuxpk\"ltucrw"
"aae\x60arr"
"ttitnne\"kilkrgssnr\xfdurzh"
"oalw"
"pc\"\"gktkdykzbdpkwigucqni\"nxiqx"
"dbrsaj"
"bgzsowyxcbrvhtvekhsh\"qgd"
"kudfemvk\"\"\"hkbrbil\"chkqoa"
"zjzgj\\ekbhyfzufy"
"\\acos\"fqekuxqzxbmkbnn\x1ejzwrm"
"elxahvudn\"txtmomotgw"
"\x2eoxmwdhelpr\"cgi\xf7pzvb"
"eapheklx"
"hfvma\"mietvc\"tszbbm\"czex"
"h\"iiockj\\\xc1et"
"d\"rmjjftm"
"qlvhdcbqtyrhlc\\"
"yy\"rsucjtulm\"coryri\"eqjlbmk"
"tv"
"r\"bfuht\\jjgujp\""
"kukxvuauamtdosngdjlkauylttaokaj"
"srgost\"\"rbkcqtlccu\x65ohjptstrjkzy"
"yxwxl\\yjilwwxffrjjuazmzjs"
"dxlw\\fkstu\"hjrtiafhyuoh\"sewabne"
"\x88sj\"v"
"rfzprz\xec\"oxqclu\"krzefp\\q"
"cfmhdbjuhrcymgxpylllyvpni"
"ucrmjvmimmcq\x88\xd9\"lz"
"lujtt\""
"gvbqoixn\"pmledpjmo\"flydnwkfxllf"
"dvxqlbshhmelsk\x8big\"l"
"mx\x54lma\x8bbguxejg"
"\x66jdati\xeceieo"
"\"iyyupixei\x54ff"
"xohzf\"rbxsoksxamiu"
"vlhthspeshzbppa\x4drhqnohjop\"\"mfjd"
"f\"tvxxla\"vurian\"\"idjq\x3aptm\xc3olep"
"gzqz"
"kbq\\wogye\\altvi\\hbvmodny"
"j\xd8"
"ofjozdhkblvndl"
"hbitoupimbawimxlxqze"
"ypeleimnme"
"xfwdrzsc\\oxqamawyizvi\\y"
"enoikppx\xa1ixe\"yo\"gumye"
"fb"
"vzf"
"zxidr"
"cu\x31beirsywtskq"
"lxpjbvqzztafwezd"
"\\jyxeuo\x18bv"
"b\"vawc\"p\\\\giern\"b"
"odizunx\"\"t\\yicdn\"x\"sdiz"
"\"\"tebrtsi"
"ctyzsxv\xa6pegfkwsi\"tgyltaakytccb"
"htxwbofchvmzbppycccliyik\xe5a"
"ggsslefamsklezqkrd"
"rcep\"fnimwvvdx\"l"
"zyrzlqmd\x12egvqs\\llqyie"
"\x07gsqyrr\\rcyhyspsvn"
"butg\""
"gb"
"gywkoxf\"jsg\\wtopxvumirqxlwz"
"rj\"ir\"wldwveair\x2es\"dhjrdehbqnzl"
"ru\"elktnsbxufk\\ejufjfjlevt\\lrzd"
"\"widsvok"
"oy\"\x81nuesvw"
"ay"
"syticfac\x1cfjsivwlmy\"pumsqlqqzx"
"m"
"rjjkfh\x78cf\x2brgceg\"jmdyas\"\\xlv\xb6p"
"tmuvo\"\x3ffdqdovjmdmkgpstotojkv\"as"
"jd\\ojvynhxllfzzxvbn\"wrpphcvx"
"pz"
"\"twr"
"n\\hdzmxe\"mzjjeadlz"
"fb\"rprxuagvahjnri"
"rfmexmjjgh\\xrnmyvnatrvfruflaqjnd"
"obbbde\"co\"qr\"qpiwjgqahqm\\jjp\""
"vpbq\"\"y\"czk\\b\x52ed\"lnzepobp"
"syzeajzfarplydipny\"y\"\xe8ad"
"mpyodwb"
"\x47rakphlqqptd"
"wa\"oj\"aiy"
"a"
"ropozx"
"q\x51nbtlwa"
"etukvgx\\jqxlkq"
"\"tp\"rah\"pg\"s\"bpdtes\\tkasdhqd"
"dn\"qqpkikadowssb\xcah\"dzpsf\\ect\"jdh"
"pxunovbbrrn\\vullyn\"bno\"\"\"myfxlp\""
"qaixyazuryvkmoulhcqaotegfj\\mpzm"
"bvfrbicutzbjwn\\oml\"cf\"d\"ezcpv\"j"
"rmbrdtneudemigdhelmb"
"aq\\aurmbhy"
"wujqvzw"
"gf\"tssmvm\"gm\"hu\x9a\xb7yjawsa"
"hrhqqxow\xe2gsydtdspcfqy\"zw\\ou"
"ianwwf\\yko\\tdujhhqdi"
"xylz\"zpvpab"
"lwuopbeeegp"
"aoop\x49jhhcexdmdtun"
"\\\\mouqqcsgmz"
"tltuvwhveau\x43b\"ymxjlcgiymcynwt"
"gsugerumpyuhtjljbhrdyoj"
"lnjm\xb8wg\"ajh"
"zmspue\"nfttdon\\b\"eww"
"\"w\x67jwaq\x7ernmyvs\\rmdsuwydsd\"th"
"ogtgvtlmcvgllyv"
"z\"fqi\"rvddoehrciyl"
"yustxxtot\"muec\"xvfdbzunzvveq"
"mqslw"
"txqnyvzmibqgjs\xb6xy\x86nfalfyx"
"kzhehlmkholov"
"plpmywcnirrjutjguosh\\"
"pydbnqofv\"dn\\m"
"aegqof"
"eambmxt\\dxagoogl\\zapfwwlmk"
"afbmqitxxqhddlozuxcpjxgh"
"vgts"
"bfdpqtoxzzhmzcilehnflna"
"s\"idpz"
"\xcfhgly\"nlmztwybx\"ecezmsxaqw"
"aackfgndqcqiy"
"\x22unqdlsrvgzfaohoffgxzfpir\"s"
"abh\"ydv\"kbpdhrerl"
"bdzpg"
"ekwgkywtmzp"
"wtoodejqmrrgslhvnk\"pi\"ldnogpth"
"njro\x68qgbx\xe4af\"\\suan"
"""

# ╔═╡ 1e28516d-8dc3-43c6-bd9d-b2afd93cf87e
puzzle_input = String(read("Day 08.txt"))

# ╔═╡ 6a6cb1c1-6b76-4ae6-91f1-0a9f523106a5
function decode(input) 
	if input[1] != '"'
		throw(ErrorException("invalid syntax1: " * input))
	end
	if input[length(input)] != '"'
		throw(ErrorException("invalid syntax2: " * input))
	end
	content = input[2:end-1]
	content = replace(content, "\\\"" => "\"")
	content = replace(content, "\\\\" => "\\")
	
	while true
		m = match(r"\\x([0-9a-fA-F]{2})", content)
		if m == nothing
			break
		end
		code = m[1]
		content = replace(content, "\\x" * code  => Char(parse(Int, code, base = 16)))
	end
		
	return content
end

# ╔═╡ 8b3fb62a-ebdc-429e-83b8-d89deda32282
function count_diff(arr, func) 
	before = arr           |> Base.Fix1(map, length) 
	after = map(func, arr) |> Base.Fix1(map, length)
	sum(before .- after)
end

# ╔═╡ c1b22b74-c875-40e9-911a-9b0ac762e887
example_input = raw"""
""
"abc"
"aaa\\"aaa"
"\x27"
"""

# ╔═╡ 94efc347-bb75-498e-b132-c08b7b0d913f
@assert decode(raw"\"\"") == ""

# ╔═╡ 0a077daf-0e6f-487d-b7e3-ed3a39ffcc57
@assert decode(raw"\"abc\"") == "abc"

# ╔═╡ 5a12de6b-2a06-4a83-8aff-6adcaca2becf
@assert decode(raw"\"aaa\\\"aaa\"") == "aaa\"aaa"

# ╔═╡ 6bbf3051-3577-48e3-830f-d0a0db92d44a
@assert decode(raw"\"\x27\"") == "'"

# ╔═╡ fdcf3180-be09-4941-8b63-16ea1c4b86ae
@assert count_diff(split(strip(example_input), "\n"), decode) == 12

# ╔═╡ b347bd98-aff4-4390-9f12-fc37ab8d88c6
part1 = count_diff(split(strip(puzzle_input), "\n"), decode)

# ╔═╡ 00c3f519-2637-432a-8c5e-28fafd9020f5
@test part1 == 1350

# ╔═╡ 79bdbb26-ae3e-4311-a4f9-cfdd95a2e29f
md"Your puzzle answer was `1350`."

# ╔═╡ 5059f712-1e4f-4caa-9f2f-4f056d2928f0
md"""
# Part Two

Now, let's go the other way. In addition to finding the number of characters of code, you should now encode each code representation as a new string and find the number of characters of the new encoded representation, including the surrounding double quotes.

For example:

-   `""` encodes to `"\\"\\""`, an increase from `2` characters to `6`.
-   `"abc"` encodes to `"\\"abc\\""`, an increase from `5` characters to `9`.
-   `"aaa\\"aaa"` encodes to `"\\"aaa\\\\\\"aaa\\""`, an increase from `10` characters to `16`.
-   `"\x27"` encodes to `"\\"\\x27\\""`, an increase from `6` characters to `11`.

Your task is to find the total number of characters to represent the newly encoded strings minus the number of characters of code in each original string literal. For example, for the strings above, the total encoded length (`6 + 9 + 16 + 11 = 42`) minus the characters in the original code representation (`23`, just like in the first part of this puzzle) is `42 - 23 = 19`.

"""

# ╔═╡ 5f5f55f9-216f-42e9-a26c-71139e1f9198
function encode(str) 
	str = replace(str, "\\" => "\\\\")
	str = "\"" * replace(str, "\"" => "\\\"") * "\""
		
	str
end

# ╔═╡ e4e67539-b9e0-4837-b8ea-f9d81404d137
@assert encode(raw"\"\"") == "\"\\\"\\\"\""

# ╔═╡ ba4b0f4a-db22-487f-80b9-40ff7a303734
@assert encode(raw"\"abc\"") == "\"\\\"abc\\\"\""

# ╔═╡ 6461a1a4-86ea-480b-9428-481c7378d731
@assert encode(raw"\"aaa\\\"aaa\"") == "\"\\\"aaa\\\\\\\"aaa\\\"\""

# ╔═╡ fc2681b1-04e2-4b03-b77a-0981807a8061
@assert encode(raw"\"\\x27\"") == "\"\\\"\\\\\\\\x27\\\"\""

# ╔═╡ 028f30af-d191-4313-932d-f75d818b304a
@assert -count_diff(split(strip(example_input), "\n"), encode) == 19

# ╔═╡ bb73ce4a-9d41-426e-bf13-687acf5d532f
part2 = -count_diff(split(strip(puzzle_input), "\n"), encode)

# ╔═╡ 67b06ec6-3835-44e7-906e-3ed393110dc3
@test part2 == 2085

# ╔═╡ 60c68ada-5a88-4d86-aa59-d6709afabf4c
md"Your puzzle answer was `2085`."

# ╔═╡ Cell order:
# ╠═7d1ac287-43d9-4921-bade-5658899648e6
# ╟─7728c7b0-b022-11eb-363f-5f51427038cb
# ╟─1e37e13a-5f56-478c-8d50-d96ea1e32cd3
# ╠═1e28516d-8dc3-43c6-bd9d-b2afd93cf87e
# ╠═6a6cb1c1-6b76-4ae6-91f1-0a9f523106a5
# ╠═8b3fb62a-ebdc-429e-83b8-d89deda32282
# ╠═c1b22b74-c875-40e9-911a-9b0ac762e887
# ╠═94efc347-bb75-498e-b132-c08b7b0d913f
# ╠═0a077daf-0e6f-487d-b7e3-ed3a39ffcc57
# ╠═5a12de6b-2a06-4a83-8aff-6adcaca2becf
# ╠═6bbf3051-3577-48e3-830f-d0a0db92d44a
# ╠═fdcf3180-be09-4941-8b63-16ea1c4b86ae
# ╠═b347bd98-aff4-4390-9f12-fc37ab8d88c6
# ╠═00c3f519-2637-432a-8c5e-28fafd9020f5
# ╟─79bdbb26-ae3e-4311-a4f9-cfdd95a2e29f
# ╟─5059f712-1e4f-4caa-9f2f-4f056d2928f0
# ╠═5f5f55f9-216f-42e9-a26c-71139e1f9198
# ╠═e4e67539-b9e0-4837-b8ea-f9d81404d137
# ╠═ba4b0f4a-db22-487f-80b9-40ff7a303734
# ╠═6461a1a4-86ea-480b-9428-481c7378d731
# ╠═fc2681b1-04e2-4b03-b77a-0981807a8061
# ╠═028f30af-d191-4313-932d-f75d818b304a
# ╠═bb73ce4a-9d41-426e-bf13-687acf5d532f
# ╠═67b06ec6-3835-44e7-906e-3ed393110dc3
# ╟─60c68ada-5a88-4d86-aa59-d6709afabf4c
