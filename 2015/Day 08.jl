### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

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
puzzle_input = """
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

# ╔═╡ 6a6cb1c1-6b76-4ae6-91f1-0a9f523106a5
function analyse(input) 
	content = input[2:end-1]
	content = replace(content, "\\\"" => "\"")
	content = replace(content, "\\\\" => "\\")
	
	while true
		m = match(r"\\x(\d+)", content)
		if m == nothing
			break
		end
		code = m[1]
		content = replace(content, "\\x" * code  => Char(parse(Int, code)))
	end
		
	return (length(input), length(content))
end

# ╔═╡ 94efc347-bb75-498e-b132-c08b7b0d913f
@assert analyse("\"\"") == (2,0)

# ╔═╡ 0a077daf-0e6f-487d-b7e3-ed3a39ffcc57
@assert analyse("\"abc\"") == (5,3)

# ╔═╡ 5a12de6b-2a06-4a83-8aff-6adcaca2becf
@assert analyse("\"aaa\\\"aaa\"") == (10,7)

# ╔═╡ 6bbf3051-3577-48e3-830f-d0a0db92d44a
@assert analyse("\"\\x27\"") == (6,1)

# ╔═╡ a63c540e-f24f-488e-9180-6234f93d52b2
puzzle_strings = split(rstrip(puzzle_input), "\n")

# ╔═╡ f737a9ba-0814-490c-80ad-b13bd25fa6a1
puzzle_values = map(analyse, puzzle_strings)

# ╔═╡ c32ff503-ccb8-4b93-886d-afa2aa1ac998
# Disregarding the whitespace in the file, what is 

#- the number of characters of code for string literals 
#	minus 
#- the number of characters in memory for the values of the strings 
		
#in total for the entire file?

# ╔═╡ b347bd98-aff4-4390-9f12-fc37ab8d88c6
part1 = sum(map(((code, memory),)->code - memory, puzzle_values))

# ╔═╡ 4520cf19-164c-4dc8-a5d8-f362e2b48d82
md"607: That's not the right answer; your answer is too low. "

# ╔═╡ 3a747d4d-3deb-4da9-809c-28be1491b6e2


# ╔═╡ Cell order:
# ╟─7728c7b0-b022-11eb-363f-5f51427038cb
# ╟─1e37e13a-5f56-478c-8d50-d96ea1e32cd3
# ╠═6a6cb1c1-6b76-4ae6-91f1-0a9f523106a5
# ╠═94efc347-bb75-498e-b132-c08b7b0d913f
# ╠═0a077daf-0e6f-487d-b7e3-ed3a39ffcc57
# ╠═5a12de6b-2a06-4a83-8aff-6adcaca2becf
# ╠═6bbf3051-3577-48e3-830f-d0a0db92d44a
# ╠═a63c540e-f24f-488e-9180-6234f93d52b2
# ╠═f737a9ba-0814-490c-80ad-b13bd25fa6a1
# ╠═c32ff503-ccb8-4b93-886d-afa2aa1ac998
# ╠═b347bd98-aff4-4390-9f12-fc37ab8d88c6
# ╟─4520cf19-164c-4dc8-a5d8-f362e2b48d82
# ╠═3a747d4d-3deb-4da9-809c-28be1491b6e2
