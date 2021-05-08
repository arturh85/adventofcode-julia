### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ e9086930-afeb-11eb-35ad-dba62b2459a9
md"""
# [Day 5: Doesn't He Have Intern-Elves For This?](https://adventofcode.com/2015/day/5)
Santa needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

It contains at least three vowels (`aeiou` only), like `aei`, `xazegov`, or `aeiouaeiouaeiou`.
It contains at least one letter that appears twice in a row, like `xx`, `abcdde` (`dd`), or `aabbccdd` (`aa`, `bb`, `cc`, or `dd`).
It does not contain the strings `ab`, `cd`, `pq`, or `xy`, even if they are part of one of the other requirements.

For example:

- `ugknbfddgicrmopn` is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
- `aaa` is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
- `jchzalrnumimnmhp` is naughty because it has no double letter.
- `haegwjzuvuyypxyu` is naughty because it contains the string xy.
- `dvszwmarrgswjxmb` is naughty because it contains only one vowel.

**How many strings are nice?**
"""

# ╔═╡ c7430382-47c7-4f2e-a260-fa4de8a8648c
puzzle_input = "zgsnvdmlfuplrubt
vlhagaovgqjmgvwq
ffumlmqwfcsyqpss
zztdcqzqddaazdjp
eavfzjajkjesnlsb
urrvucyrzzzooxhx
xdwduffwgcptfwad
orbryxwrmvkrsxsr
jzfeybjlgqikjcow
mayoqiswqqryvqdi
iiyrkoujhgpgkcvx
egcgupjkqwfiwsjl
zbgtglaqqolttgng
eytquncjituzzhsx
dtfkgggvqadhqbwb
zettygjpcoedwyio
rwgwbwzebsnjmtln
esbplxhvzzgawctn
vnvshqgmbotvoine
wflxwmvbhflkqxvo
twdjikcgtpvlctte
minfkyocskvgubvm
sfxhhdhaopajbzof
sofkjdtalvhgwpql
uqfpeauqzumccnrc
tdflsbtiiepijanf
dhfespzrhecigzqb
xobfthcuuzhvhzpn
olgjglxaotocvrhw
jhkzpfcskutwlwge
zurkakkkpchzxjhq
hekxiofhalvmmkdl
azvxuwwfmjdpjskj
arsvmfznblsqngvb
ldhkzhejofreaucc
adrphwlkehqkrdmo
wmveqrezfkaivvaw
iyphmphgntinfezg
blomkvgslfnvspem
cgpaqjvzhbumckwo
ydhqjcuotkeyurpx
sbtzboxypnmdaefr
vxrkhvglynljgqrg
ttgrkjjrxnxherxd
hinyfrjdiwytetkw
sufltffwqbugmozk
tohmqlzxxqzinwxr
jbqkhxfokaljgrlg
fvjeprbxyjemyvuq
gmlondgqmlselwah
ubpwixgxdloqnvjp
lxjfhihcsajxtomj
qouairhvrgpjorgh
nloszcwcxgullvxb
myhsndsttanohnjn
zjvivcgtjwenyilz
qaqlyoyouotsmamm
tadsdceadifqthag
mafgrbmdhpnlbnks
aohjxahenxaermrq
ovvqestjhbuhrwlr
lnakerdnvequfnqb
agwpwsgjrtcjjikz
lhlysrshsmzryzes
xopwzoaqtlukwwdu
xsmfrfteyddrqufn
ohnxbykuvvlbbxpf
bbdlivmchvzfuhoc
vtacidimfcfyobhf
tinyzzddgcnmiabd
tcjzxftqcqrivqhn
vgnduqyfpokbmzim
revkvaxnsxospyow
ydpgwxxoxlywxcgi
wzuxupbzlpzmikel
nscghlafavnsycjh
xorwbquzmgmcapon
asmtiycegeobfxrn
eqjzvgkxgtlyuxok
mmjrskloposgjoqu
gceqosugbkvytfto
khivvoxkvhrgwzjl
qtmejuxbafroifjt
ttmukbmpoagthtfl
bxqkvuzdbehtduwv
gvblrpzjylanoggj
cltewhyjxdbmbtqj
fbkgedqvomdipklj
uxvuplhenqawfcjt
fkdjmayiawdkycva
gnloqfgbnibzyidh
kyzorvtopjiyyyqg
drckpekhpgrioblt
tvhrkmbnpmkkrtki
khaldwntissbijiz
aoojqakosnaxosom
xfptccznbgnpfyqw
moqdwobwhjxhtrow
chfwivedutskovri
gprkyalfnpljcrmi
pwyshpwjndasykst
xuejivogihttzimd
bugepxgpgahtsttl
zufmkmuujavcskpq
urybkdyvsrosrfro
isjxqmlxwtqmulbg
pxctldxgqjqhulgz
hclsekryiwhqqhir
hbuihpalwuidjpcq
ejyqcxmfczqfhbxa
xljdvbucuxnnaysv
irqceqtqwemostbb
anfziqtpqzqdttnz
cgfklbljeneeqfub
zudyqkuqqtdcpmuo
iuvhylvznmhbkbgg
mpgppmgfdzihulnd
argwmgcvqqkxkrdi
pdhrfvdldkfihlou
cbvqnjrvrsnqzfob
lkvovtsqanohzcmm
vxoxjdyoylqcnyzt
kurdpaqiaagiwjle
gwklwnazaxfkuekn
rbaamufphjsjhbdl
tzbrvaqvizhsisbd
pbcqlbfjvlideiub
hiwoetbfywaeddtx
fjirczxtuupfywyf
omeoegeyyospreem
ozbbpupqpsskvrjh
pzvcxkvjdiyeyhxa
odclumkenabcsfzr
npdyqezqdjqaszvm
yodkwzmrhtexfrqa
rjcmmggjtactfrxz
mioxfingsfoimual
aqskaxjjborspfaa
wientdsttkevjtkf
tdaswkzckmxnfnct
voucjhzvkkhuwoqk
boaaruhalgaamqmh
iufzxutxymorltvb
pfbyvbayvnrpijpo
obztirulgyfthgcg
ntrenvhwxypgtjwy
ephlkipjfnjfjrns
pkjhurzbmobhszpx
gqbnjvienzqfbzvj
wjelolsrbginwnno
votanpqpccxqricj
bxyuyiglnmbtvehi
qyophcjfknbcbjrb
anoqkkbcdropskhj
tcnyqaczcfffkrtl
rsvqimuqbuddozrf
meppxdrenexxksdt
tyfhfiynzwadcord
wayrnykevdmywycf
mhowloqnppswyzbu
tserychksuwrgkxz
xycjvvsuaxsbrqal
fkrdsgaoqdcqwlpn
vrabcmlhuktigecp
xgxtdsvpaymzhurx
ciabcqymnchhsxkc
eqxadalcxzocsgtr
tsligrgsjtrnzrex
qeqgmwipbspkbbfq
vzkzsjujltnqwliw
ldrohvodgbxokjxz
jkoricsxhipcibrq
qzquxawqmupeujrr
mizpuwqyzkdbahvk
suupfxbtoojqvdca
ywfmuogvicpywpwm
uevmznxmsxozhobl
vjbyhsemwfwdxfxk
iyouatgejvecmtin
tcchwpuouypllcxe
lgnacnphdiobdsef
uoxjfzmdrmpojgbf
lqbxsxbqqhpjhfxj
knpwpcnnimyjlsyz
fezotpoicsrshfnh
dkiwkgpmhudghyhk
yzptxekgldksridv
pckmzqzyiyzdbcts
oqshafncvftvwvsi
yynihvdywxupqmbt
iwmbeunfiuhjaaic
pkpkrqjvgocvaxjs
ieqspassuvquvlyz
xshhahjaxjoqsjtl
fxrrnaxlqezdcdvd
pksrohfwlaqzpkdd
ravytrdnbxvnnoyy
atkwaifeobgztbgo
inkcabgfdobyeeom
ywpfwectajohqizp
amcgorhxjcybbisv
mbbwmnznhafsofvr
wofcubucymnhuhrv
mrsamnwvftzqcgta
tlfyqoxmsiyzyvgv
ydceguvgotylwtea
btyvcjqhsygunvle
usquiquspcdppqeq
kifnymikhhehgote
ybvkayvtdpgxfpyn
oulxagvbavzmewnx
tvvpekhnbhjskzpj
azzxtstaevxurboa
nfmwtfgrggmqyhdf
ynyzypdmysfwyxgr
iaobtgubrcyqrgmk
uyxcauvpyzabbzgv
fbasfnwiguasoedc
mgmjoalkbvtljilq
szgkxiqkufdvtksb
xgfzborpavdmhiuj
hmuiwnsonvfgcrva
zolcffdtobfntifb
mvzgcsortkugvqjr
pbbpgraaldqvzwhs
zvsxegchksgnhpuv
kdpdboaxsuxfswhx
jdfggigejfupabth
tpeddioybqemyvqz
mxsntwuesonybjby
tzltdsiojfvocige
ubtdrneozoejiqrv
fusyucnhncoxqzql
nlifgomoftdvkpby
pyikzbxoapffbqjw
hzballplvzcsgjug
ymjyigsfehmdsvgz
vpqgyxknniunksko
ffkmaqsjxgzclsnq
jcuxthbedplxhslk
ymlevgofmharicfs
nyhbejkndhqcoisy
rjntxasfjhnlizgm
oqlnuxtzhyiwzeto
tntthdowhewszitu
rmxyoceuwhsvfcua
qpgsjzwenzbxyfgw
sumguxpdkocyagpu
ymfrbxwrawejkduu
hetgrtmojolbmsuf
qzqizpiyfasgttex
qnmoemcpuckzsshx
ddyqiihagcmnxccu
oirwxyfxxyktgheo
phpaoozbdogbushy
uctjdavsimsrnvjn
aurbbphvjtzipnuh
hpbtrubopljmltep
pyyvkthqfsxqhrxg
jdxaiqzkepxbfejk
ukgnwbnysrzvqzlw
lfkatkvcssnlpthd
ucsyecgshklhqmsc
rwdcbdchuahkvmga
rxkgqakawgpwokum
hbuyxeylddfgorgu
tbllspqozaqzglkz
rqfwizjlbwngdvvi
xuxduyzscovachew
kouiuxckkvmetvdy
ycyejrpwxyrweppd
trctlytzwiisjamx
vtvpjceydunjdbez
gmtlejdsrbfofgqy
jgfbgtkzavcjlffj
tyudxlpgraxzchdk
gyecxacqitgozzgd
rxaocylfabmmjcvt
tornfzkzhjyofzqa
kocjcrqcsvagmfqv
zfrswnskuupivzxb
cunkuvhbepztpdug
pmpfnmklqhcmrtmf
tfebzovjwxzumxap
xpsxgaswavnzkzye
lmwijdothmxclqbr
upqxhmctbltxkarl
axspehytmyicthmq
xdwrhwtuooikehbk
tpggalqsytvmwerj
jodysbwnymloeqjf
rxbazvwuvudqlydn
ibizqysweiezhlqa
uexgmotsqjfauhzp
ldymyvumyhyamopg
vbxvlvthgzgnkxnf
pyvbrwlnatxigbrp
azxynqididtrwokb
lwafybyhpfvoawto
ogqoivurfcgspytw
cinrzzradwymqcgu
sgruxdvrewgpmypu
snfnsbywuczrshtd
xfzbyqtyxuxdutpw
fmpvjwbulmncykbo
ljnwoslktrrnffwo
ceaouqquvvienszn
yjomrunrxjyljyge
xpmjsapbnsdnbkdi
uetoytptktkmewre
eixsvzegkadkfbua
afaefrwhcosurprw
bwzmmvkuaxiymzwc
gejyqhhzqgsrybni
gjriqsfrhyguoiiw
gtfyomppzsruhuac
ogemfvmsdqqkfymr
jgzbipsygirsnydh
zghvlhpjnvqmocgr
ngvssuwrbtoxtrka
ietahyupkbuisekn
gqxqwjizescbufvl
eiprekzrygkncxzl
igxfnxtwpyaamkxf
soqjdkxcupevbren
fspypobyzdwstxak
qstcgawvqwtyyidf
gsccjacboqvezxvd
bfsblokjvrqzphmc
srezeptvjmncqkec
opmopgyabjjjoygt
msvbufqexfrtecbf
uiaqweyjiulplelu
pbkwhjsibtwjvswi
xwwzstmozqarurrq
nytptwddwivtbgyq
ejxvsufbzwhzpabr
jouozvzuwlfqzdgh
gfgugjihbklbenrk
lwmnnhiuxqsfvthv
bzvwbknfmaeahzhi
cgyqswikclozyvnu
udmkpvrljsjiagzi
zzuhqokgmisguyna
ekwcdnjzuctsdoua
eueqkdrnzqcaecyd
lnibwxmokbxhlris
fdrbftgjljpzwhea
iabvuhhjsxmqfwld
qgogzkynrgejakta
mfcqftytemgnpupp
klvhlhuqhosvjuqk
gdokmxcgoqvzvaup
juududyojcazzgvr
fyszciheodgmnotg
yfpngnofceqfvtfs
cahndkfehjumwavc
dxsvscqukljxcqyi
cqukcjtucxwrusji
vevmmqlehvgebmid
ahswsogfrumzdofy
ftasbklvdquaxhxb
tsdeumygukferuif
ybfgbwxaaitpwryg
djyaoycbymezglio
trzrgxdjqnmlnzpn
rumwchfihhihpqui
ffrvnsgrnzemksif
oizlksxineqknwzd
cirqcprftpjzrxhk
zrhemeqegmzrpufd
kqgatudhxgzlgkey
syjugymeajlzffhq
nlildhmgnwlopohp
flcszztfbesqhnyz
ohzicmqsajyqptrw
ebyszucgozsjbelq
enxbgvvcuqeloxud
ubwnvecbsmhkxwuk
noifliyxvlkqphbo
hazlqpetgugxxsiz
ihdzoerqwqhgajzb
ivrdwdquxzhdrzar
synwycdvrupablib
mqkdjkntblnmtvxj
qmmvoylxymyovrnq
pjtuxskkowutltlq
gchrqtloggkrjciz
namzqovvsdipazae
yfokqhkmakyjzmys
iapxlbuoiwqfnozm
fbcmlcekgfdurqxe
ednzgtczbplwxjlq
gdvsltzpywffelsp
oaitrrmpqdvduqej
gseupzwowmuuibjo
dfzsffsqpaqoixhh
tclhzqpcvbshxmgx
cfqkptjrulxiabgo
iraiysmwcpmtklhf
znwjlzodhktjqwlm
lcietjndlbgxzjht
gdkcluwjhtaaprfo
vbksxrfznjzwvmmt
vpfftxjfkeltcojl
thrmzmeplpdespnh
yafopikiqswafsit
xxbqgeblfruklnhs
qiufjijzbcpfdgig
ikksmllfyvhyydmi
sknufchjdvccccta
wpdcrramajdoisxr
grnqkjfxofpwjmji
lkffhxonjskyccoh
npnzshnoaqayhpmb
fqpvaamqbrnatjia
oljkoldhfggkfnfc
ihpralzpqfrijynm
gvaxadkuyzgbjpod
onchdguuhrhhspen
uefjmufwlioenaus
thifdypigyihgnzo
ugqblsonqaxycvkg
yevmbiyrqdqrmlbw
bvpvwrhoyneorcmm
gbyjqzcsheaxnyib
knhsmdjssycvuoqf
nizjxiwdakpfttyh
nwrkbhorhfqqoliz
ynsqwvwuwzqpzzwp
yitscrgexjfclwwh
dhajwxqdbtrfltzz
bmrfylxhthiaozpv
frvatcvgknjhcndw
xlvtdmpvkpcnmhya
pxpemuzuqzjlmtoc
dijdacfteteypkoq
knrcdkrvywagglnf
fviuajtspnvnptia
xvlqzukmwbcjgwho
bazlsjdsjoeuvgoz
nslzmlhosrjarndj
menvuwiuymknunwm
uavfnvyrjeiwqmuu
yrfowuvasupngckz
taevqhlrcohlnwye
skcudnogbncusorn
omtnmkqnqedsajfv
yqmgsqdgsuysqcts
odsnbtyimikkbmdd
vuryaohxdvjllieb
dhaxldeywwsfamlo
opobvtchezqnxpak
pzfnegouvsrfgvro
rzkcgpxdslzrdktu
ksztdtqzxvhuryam
ctnqnhkcooqipgkh
pyqbbvrzdittqbgm
koennvmolejeftij
rvzlreqikqlgyczj
xrnujfoyhonzkdgd
mmsmhkxaiqupfjil
ypjwoemqizddvyfd
qgugcxnbhvgahykj
cviodlsrtimbkgmy
xbfbbechhmrjxhnw
psuipaoucfczfxkp
hdhwcpeuptgqqvim
gsxlruhjeaareilr
vgyqonnljuznyrhk
eewezahlumervpyu
iiolebrxfadtnigy
tdadlrodykrdfscn
ocvdtzjxrhtjurpo
gidljbuvuovkhhrf
qwfcpilbjwzboohd
xzohxonlezuiupbg
vslpbkkqgvgbcbix
pivzqrzfxosbstzn
fyqcfboevcqmbhhs
yqsrneacnlxswojx
heicqpxxyrwcbsjz
yzynmnnoumkmlbeh
bncadbjdvvmczylw
hlnjskgfzbgmigfn
fphpszymugpcykka
zbifcktanxpmufvy
saklpkhoyfeqbguy
nqtqfcfxmpivnjyo
locygrwerxlsvzqm
qqflecydqvlogjme
njklmixvgkzpgppf
ugzkpjwjflaswyma
lriousvkbeftslcy
nsvsauxzfbbotgmh
tblcpuhjyybrlica
hqwshxcilwtmxrsf
xojwroydfeoqupup
tikuzsrogpnohpib
layenyqgxdfggloc
nqsvjvbrpuxkqvmq
ivchgxkdlfjdzxmk
uoghiuosiiwiwdws
twsgsfzyszsfinlc
waixcmadmhtqvcmd
zkgitozgrqehtjkw
xbkmyxkzqyktmpfi
qlyapfmlybmatwxn
ntawlvcpuaebuypf
clhebxqdkcyndyof
nrcxuceywiklpemc
lmurgiminxpapzmq
obalwqlkykzflxou
huvcudpiryefbcye
zlxbddpnyuyapach
gqfwzfislmwzyegy
jhynkjtxedmemlob
hmrnvjodnsfiukex
pstmikjykzyavfef
wuwpnscrwzsyalyt
hksvadripgdgwynm
tvpfthzjleqfxwkh
xpmrxxepkrosnrco
qjkqecsnevlhqsly
jjnrfsxzzwkhnwdm
pehmzrzsjngccale
bsnansnfxduritrr
ejzxkefwmzmbxhlb
pceatehnizeujfrs
jtidrtgxopyeslzl
sytaoidnamfwtqcr
iabjnikomkgmyirr
eitavndozoezojsi
wtsbhaftgrbqfsmm
vvusvrivsmhtfild
qifbtzszfyzsjzyx
ifhhjpaqatpbxzau
etjqdimpyjxiuhty
fvllmbdbsjozxrip
tjtgkadqkdtdlkpi
xnydmjleowezrecn
vhcbhxqalroaryfn
scgvfqsangfbhtay
lbufpduxwvdkwhmb
tshipehzspkhmdoi
gtszsebsulyajcfl
dlrzswhxajcivlgg
kgjruggcikrfrkrw
xxupctxtmryersbn
hljjqfjrubzozxts
giaxjhcwazrenjzs
tyffxtpufpxylpye
jfugdxxyfwkzqmgv
kbgufbosjghahacw
xpbhhssgegmthwxb
npefofiharjypyzk
velxsseyxuhrpycy
sglslryxsiwwqzfw
susohnlpelojhklv
lfnpqfvptqhogdmk
vtcrzetlekguqyle
jlyggqdtamcjiuxn
olxxqfgizjmvigvl
cyypypveppxxxfuq
hewmxtlzfqoqznwd
jzgxxybfeqfyzsmp
xzvvndrhuejnzesx
esiripjpvtqqwjkv
xnhrwhjtactofwrd
knuzpuogbzplofqx
tihycsdwqggxntqk
xkfywvvugkdalehs
cztwdivxagtqjjel
dsaslcagopsbfioy
gmowqtkgrlqjimbl
ctcomvdbiatdvbsd
gujyrnpsssxmqjhz
nygeovliqjfauhjf
mmgmcvnuppkbnonz
bhipnkoxhzcotwel
wkwpgedgxvpltqid
mliajvpdocyzcbot
kqjhsipuibyjuref
zqdczykothbgxwsy
koirtljkuqzxioaz
audpjvhmqzvhzqas
cxyhxlhntyidldfx
iasgocejboxjgtkx
abehujmqotwcufxp
fmlrzqmazajxeedl
knswpkekbacuxfby
yvyalnvrxgstqhxm
sjnrljfrfuyqfwuw
ssaqruwarlvxrqzm
iaxbpeqqzlcwfqjz
uwyxshjutkanvvsc
uxwrlwbblcianvnb
nodtifgrxdojhneh
mloxjfusriktxrms
lkfzrwulbctupggc
gcrjljatfhitcgfj
tkdfxeanwskaivqs
ypyjxqtmitwubbgt
ssxbygzbjsltedjj
zdrsnoorwqfalnha
xlgmissaiqmowppd
azhbwhiopwpguiuo
fydlahgxtekbweet
qtaveuqpifprdoiy
kpubqyepxqleucem
wlqrgqmnupwiuory
rwyocktuqkuhdwxz
abzjfsdevoygctqv
zsofhaqqghncmzuw
lqbjwjqxqbfgdckc
bkhyxjkrqbbunido
yepxfjnnhldidsjb
builayfduxbppafc
wedllowzeuswkuez
gverfowxwtnvgrmo
tpxycfumxdqgntwf
lqzokaoglwnfcolw
yqsksyheyspmcdqt
vufvchcjjcltwddl
saeatqmuvnoacddt
dxjngeydvsjbobjs
ucrcxoakevhsgcep
cajgwjsfxkasbayt
hknzmteafsfemwuv
xxwhxwiinchqqudr
usfenmavvuevevgr
kxcobcwhsgyizjok
vhqnydeboeunnvyk
bgxbwbxypnxvaacw
bwjzdypacwgervgk
rrioqjluawwwnjcr
fiaeyggmgijnasot
xizotjsoqmkvhbzm
uzphtrpxwfnaiidz
kihppzgvgyoncptg
hfbkfrxwejdeuwbz
zgqthtuaqyrxicdy
zitqdjnnwhznftze
jnzlplsrwovxlqsn
bmwrobuhwnwivpca
uuwsvcdnoyovxuhn
nmfvoqgoppoyosaj
hxjkcppaisezygpe
icvnysgixapvtoos
vbvzajjgrmjygkhu
jinptbqkyqredaos
dpmknzhkhleawfvz
ouwwkfhcedsgqqxe
owroouiyptrijzgv
bewnckpmnbrmhfyu
evdqxevdacsbfbjb
catppmrovqavxstn
dqsbjibugjkhgazg
mkcldhjochtnvvne
sblkmhtifwtfnmsx
lynnaujghehmpfpt
vrseaozoheawffoq
ytysdzbpbazorqes
sezawbudymfvziff
vrlfhledogbgxbau
bipdlplesdezbldn
ermaenjunjtbekeo
eyaedubkthdecxjq
gbzurepoojlwucuy
rsiaqiiipjlouecx
beqjhvroixhiemtw
buzlowghhqbcbdwv
ldexambveeosaimo
fpyjzachgrhxcvnx
komgvqejojpnykol
fxebehjoxdujwmfu
jnfgvheocgtvmvkx
qmcclxxgnclkuspx
rsbelzrfdblatmzu
vexzwqjqrsenlrhm
tnfbkclwetommqmh
lzoskleonvmprdri
nnahplxqscvtgfwi
ubqdsflhnmiayzrp
xtiyqxhfyqonqzrn
omdtmjeqhmlfojfr
cnimgkdbxkkcnmkb
tapyijgmxzbmqnks
byacsxavjboovukk
awugnhcrygaoppjq
yxcnwrvhojpuxehg
btjdudofhxmgqbao
nzqlfygiysfuilou
nubwfjdxavunrliq
vqxmmhsbmhlewceh
ygavmcybepzfevrp
kgflmrqsvxprkqgq
iaqyqmcaedscmakk
cvbojnbfmrawxzkh
jjjrprbnlijzatuw
lcsudrrfnnggbrmk
qzgxbiavunawfibc
gnnalgfvefdfdwwg
nokmiitzrigxavsc
etzoxwzxqkkhvais
urxxfacgjccieufi
lqrioqhuvgcotuec
dydbaeyoypsbftra
hhrotenctylggzaf
evctqvzjnozpdxzu
tbpvithmorujxlcp
pllbtcbrtkfpvxcw
fzyxdqilyvqreowv
xdleeddxwvqjfmmt
fcldzthqqpbswoin
sgomzrpjfmvgwlzi
axjyskmtdjbxpwoz
hcvaevqxsmabvswh
lfdlsfcwkwicizfk
isjbwpzdognhoxvm
oqnexibqxlyxpluh
zqfbgodsfzwgcwuf
kvmnwruwsjllbldz
kghazimdyiyhmokj
uiktgpsxpoahofxn
zkdwawxargcmidct
ftbixlyiprshrjup
nofhmbxififwroeg
mcdaqrhplffxrcdt
fbjxnwojcvlawmlb
rizoftvwfdhiwyac
eduogrtyhxfwyars
zoikunqxgjwfqqwr
zxwbbpmvctzezaqh
nghujwyeabwdqnop
vcxamijpoyyksogn
jnckdbuteoqlsdae
jurfqqawafmsiqwv
inepmztrzehfafie
tznzkyvzodbrtscf
xewbavjeppflwscl
ucndzsorexjlnplo
jpxbctscngxgusvu
mfmygcllauzuoaok
oibkuxhjmhxhhzby
zjkslwagmeoisunw
avnnxmopdgvmukuu
jmaargejcwboqhkt
yacmpeosarsrfkrv
iqhgupookcaovwgh
ebjkdnxwtikqzufc
imdhbarytcscbsvb
ifyibukeffkbqvcr
aloighmyvwybtxhx
yszqwrutbkiwkxjg
xyholyzlltjhsuhp
gykhmrwucneoxcrf
badkdgqrpjzbabet
sunaucaucykwtkjj
pumqkglgfdhneero
usgtyuestahlydxq
xmfhflphzeudjsjm
knywgmclisgpootg
mtojnyrnvxtweuzb
uuxufbwfegysabww
vobhwwocqttlbsik
yuydfezeqgqxqmnd
wbqgqkwbibiilhzc
sfdmgxsbuzsawush
ilhbxcfgordyxwvp
ahqoavuysblnqaeg
plwgtvpgotskmsey
ewjcmzkcnautrrmp
tyekgzbznlikcyqj
bqzctiuaxpriuiga
bimvbfjkiupyqiys
mpqtbcxfhwymxncw
htemlptvqhharjgb
mqbsmsruwzzxgcxc
zjyedjwhnvteuaid
pzoelkoidwglpttc
efydnsvlfimvwxhx
gfyhgoeiyjcgfyze
deqtomhwopmzvjlt
casafubtkoopuaju
yylsfarntbucfulg
mgjwsormkjsrrxan
lkkenpupgmjpnqqd
tegweszyohsoluot
lihsfdwxmxvwdxna
rrefrjjxerphejwb
guuazonjoebhymtm
ysofqzmfmyneziki
lmjgaliatcpduoal
qzthcpjwtgahbebr
wvakvephyukmpemm
simxacxxzfoaeddw
aetgqmiqzxbvbviz
jxlmhdmqggevrxes
mmuglnjmuddzgaik
svopsqhtrslgycgc
xnvcsiiqrcjkvecn
kkvumxtvashxcops
bduflsdyeectvcgl
vfrxbwmmytjvqnsj
eeqtdneiyiaiofxw
crtbgknfacjtwkfl
uuutuoxdsxolpbhd
lcrztwzreaswovtn
htorkvnvujmjdqzj
wttzuzvrzlyhfzyf
oraewznfwgdsnhuk
rctlkqqvkwbgrcgk
cfehrsrqhzyiwtmz
kbvxwcumjkhvjpui
xxlocexbmniiakfo
gtknkkzvykmlqghl
kcjuxvkuimhwqrtk
vohekwkuyuoacuww
vorctgughscysyfo
zmjevqplngzswxyq
qhswdrhrijnatkyo
joakcwpfggtitizs
juzlwjijcmtswdtq
icbyaqohpkemhkip
rpdxgpzxncedmvzh
rozkmimbqhbhcddv
wkkypomlvyglpfpf
jcaqyaqvsefwtaya
ghvmtecoxlebdwnf
lqrcyiykkkpkxvqt
eqlarfazchmzotev
vqwndafvmpguggef
dbfxzrdkkrusmdke
cmjpjjgndozcmefj
hbrdcwjuyxapyhlo
mmforetykbosdwce
zynfntqwblbnfqik
sodwujfwlasznaiz
yyvrivjiqnxzqkfp
uldbskmmjbqllpnm
fyhhrmrsukeptynl
hpfjekktvdkgdkzl
bozhkoekcxzeorob
uvpptyfrzkvmtoky
hkhfprmjdpjvfkcb
igxzwktwsqhsivqu
qceomwysgkcylipb
cglateoynluyeqgc
xcsdfkpeguxgvpfh
owjhxlcncdgkqyia
rpbmrpcesiakqpna
lueszxiourxsmezb
zelvsowimzkxliwc
vzxbttoobtvdtkca
pfxvzphzwscqkzsi
edsjorainowytbzu
ipsegdaluoiphmnz
mkhueokfpemywvuw
urxdnumhylpafdlc
ggluurzavsxkvwkl
ctclphidqgteakox
tfobosynxsktajuk
jzrmemhxqmzhllif
eemwekimdfvqslsx
yjkwpzrbanoaajgq
rlxghzanuyeimfhx
hozbgdoorhthlqpv
obkbmflhyanxilnx
xojrippyxjmpzmsz
ukykmbfheixuviue
qivlmdexwucqkres
rmyxxipqkarpjmox
fgaftctbvcvnrror
raawxozucfqvasru
dinpjbdfjfizexdh
gybxubwnnbuyvjcr
qrqitdvyoneqyxcg
jqzcfggayzyoqteo
cikqpvxizpdbmppm
stfpldgyhfmucjjv
slzbcuihmimpduri
aufajwfrsorqqsnl
iylmzraibygmgmqj
lcdyfpcqlktudfmu
pmomzzsdpvgkkliw
zpplirgtscfhbrkj
mvhyerxfiljlotjl
ofkvrorwwhusyxjx
xngzmvcgkqfltjpe
yxfxaqipmysahqqq
sdqafdzgfdjuabup
qcqajmerahcdgxfv
xqimrqtupbapawro
qfvkqwidzzrehsbl
himixxvueksiqfdf
vgtfqpuzxxmhrvvd
adiioqeiejguaost
jnzxuycjxvxehbvm
xedbpxdhphamoodk
jsrioscmwlsfuxrg
mtsynnfxunuohbnf
enamqzfzjunnnkpe
uwcvfecunobyhces
ciygixtgbsccpftq
ewjgcronizkcsfjy
wztjkoipxsikoimv
jrgalyvfelwxforw
imylyalawbqwkrwb
yflwqfnuuvgjsgcj
wkysyzusldlojoue
zopllxnidcffcuau
bscgwxuprxaerskj
zvnvprxxjkhnkkpq
nejwxbhjxxdbenid
chryiccsebdbcnkc
guoeefaeafhlgvxh
nzapxrfrrqhsingx
mkzvquzvqvwsejqs
kozmlmbchydtxeeo
keylygnoqhmfzrfp
srwzoxccndoxylxe
uqjzalppoorosxxo
potmkinyuqxsfdfw
qkkwrhpbhypxhiun
wgfvnogarjmdbxyh
gkidtvepcvxopzuf
atwhvmmdvmewhzty
pybxizvuiwwngqej
zfumwnazxwwxtiry
keboraqttctosemx
vtlzxaqdetbhclib
wjiecykptzexuayl
ejatfnyjjdawepyk
mpcrobansyssvmju
gqukndzganeueabm
ukzscvomorucdnqd
wfydhtbzehgwfazx
mtwqdzlephqvxqmx
dltmlfxbjopefibh
atcfrowdflluqtbi
vowawlophlxaqonw
vblgdjzvwnocdipw
uzerzksmkvnlvlhm
ytjwhpaylohorvxd
siprvfxvnxcdgofz
cbhjupewcyjhvtgs
apqtozaofusmfqli
tmssrtlxfouowqnr
ntutrvwnzzgmokes
zrsgpwdzokztdpis
nrobvmsxtfmrqdhv
kadkaftffaziqdze
yrovbgcyqtlsnoux
modheiwuhntdecqs
gzhjypwddizemnys
gaputpwpcsvzxjho
bgmouxwoajgaozau
oxuapfrjcpyakiwt
kntwbvhuaahdixzj
epqjdjbnkxdnaccx
dspltdvznhypykri
tdrgqmbnagrxdwtt
njfqawzjggmemtbg
chpemsgwpzjpdnkk
fpsrobmbqbmigmwk
flxptsrqaazmprnl
nzdunrxlcbfklshm
miuwljvtkgzdlbnn
xbhjakklmbhsdmdt
xwxhsbnrwnegwcov
pwosflhodjaiexwq
fhgepuluczttfvqh
tldxcacbvxyamvkt
gffxatrjglkcehim
tzotkdrpxkucsdps
wxheftdepysvmzbe
qfooyczdzoewrmku
rvlwikuqdbpjuvoo
bcbrnbtfrdgijtzt
vaxqmvuogsxonlgq
ibsolflngegravgo
txntccjmqakcoorp
vrrbmqaxfbarmlmc
dzspqmttgsuhczto
pikcscjunxlwqtiw
lwzyogwxqitqfqlv
gsgjsuaqejtzglym
feyeqguxbgmcmgpp
gmttebyebdwvprkn
mzuuwbhzdjfdryxu
fganrbnplymqbzjx
cvsrbdcvhtxxdmro
scmgkjlkqukoamyp
fkgrqbyqpqcworqc
hjsrvkdibdjarxxb
sztzziuqroeidcus
pxdfvcpvwaddrzwv
phdqqxleqdjfgfbg
cqfikbgxvjmnfncy"

# ╔═╡ 0cc15cb8-4a0f-4a04-a858-43088cb68ff3
is_vowel(c::Char) = contains("aeiou", c)

# ╔═╡ 255d9b2e-4bc3-4b52-a835-9609eacf0c38
vowel_count(str::AbstractString) = sum(map(c -> is_vowel(c) ? 1 : 0, collect(str)))

# ╔═╡ 8cd32bc3-661a-4e0a-b02b-0a51b13c1e6a
# It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
has_enough_vowels(str::AbstractString) = vowel_count(str) >= 3

# ╔═╡ 47de64ba-6e35-402b-b222-c214f2801e5f
@assert !has_enough_vowels("dvszwmarrgswjxmb") # is naughty because it contains only one vowel.

# ╔═╡ 9a2f0a15-57b5-4d28-838d-0bdd7485f500
@assert has_enough_vowels("ugknbfddgicrmopn") # is nice because it has at least three vowels (u...i...o...)

# ╔═╡ a1634cc1-6e18-46d8-97fd-fb2bc38131e5
@assert has_enough_vowels("aaa")

# ╔═╡ 273e3edb-417e-4d47-9450-ad07c41c6281
# It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd)
has_double_letter(str::AbstractString) = begin
	for (idx, c) in enumerate(str[1:end-1])
		if c == str[idx+1]
			return true
		end
	end
	false
end

# ╔═╡ 12123c64-a5d4-42e8-ac89-12d9f0b8cd6e
@assert !has_double_letter("jchzalrnumimnmhp") # is naughty because it has no double letter.

# ╔═╡ c81aed85-fd24-4f1c-a2a7-be7e8ab8ad40
@assert has_double_letter("ugknbfddgicrmopn") # is nice because it has ... a double letter (...dd...)

# ╔═╡ 8972c6bf-bcad-481a-b763-d9a5b22bd358
# It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
no_forbidden(str::AbstractString) = begin
	for bad in ["ab", "cd", "pq", "xy"]
		if contains(str, bad)
			return false
		end
	end
	true
end

# ╔═╡ f768f13a-d075-4ffb-9d81-b2bb3c5b9bab
@assert !no_forbidden("haegwjzuvuyypxyu") # is naughty because it contains the string xy.

# ╔═╡ 8a320756-41fa-4f49-8c72-225065d21a59
@assert no_forbidden("ugknbfddgicrmopn") # is nice because it has ... none of the disallowed substrings.

# ╔═╡ 29f607dd-133e-4cc8-87d4-b101b4017897
check1(str::AbstractString) = 
	has_enough_vowels(str) && 
	has_double_letter(str) && 
	no_forbidden(str)

# ╔═╡ 064293dc-63ff-44a6-9ecb-5a0fba08df66
@assert check1("ugknbfddgicrmopn")

# ╔═╡ 69765b8f-6917-4781-bfc4-3f00843005a2
@assert check1("aaa")

# ╔═╡ c4811f7d-6801-4fcb-8065-205bbd5e2e03
part1 = split(puzzle_input, "\n") |>
	Base.Fix1(map, str -> check1(str) ? 1 : 0) |>
	sum

# ╔═╡ 12eeff68-cf8d-48c0-a76a-1b6404b32247
md"Your puzzle answer was `238`."

# ╔═╡ 95825a3c-e112-4451-94c4-c68929e28cf3
md"""
# Part Two
Realizing the error of his ways, Santa has switched to a better model of determining whether a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.

Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like `xyxy` (`xy`) or `aabcdefgaa` (`aa`), but not like `aaa` (`aa`, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like `xyx`, `abcdefeghi` (`efe`), or even `aaa`.
For example:

- `qjhvhtzxzqqjkmpb` is nice because is has a pair that appears twice (`qj`) and a letter that repeats with exactly one letter between them (`zxz`).
- `xxyxx` is nice because it has a pair that appears twice and a letter that repeats with one between, even though the letters used by each rule overlap.
- `uurcxstgmygtbstg` is naughty because it has a pair (`tg`) but no repeat with a single letter between them.
- `ieodomkazucvgmuy` is naughty because it has a repeating letter with one between (`odo`), but no pair that appears twice.

**How many strings are nice under these new rules?**
"""

# ╔═╡ 542ba6ce-f781-4f10-9414-329177b35733
# It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
has_pair_twice_without_overlapping(str::AbstractString) = begin
	for idx1 in 1:length(str)-3
		for idx2 in idx1+2:length(str)-1
			first = str[idx1:idx1+1]
			second = str[idx2:idx2+1]			
			if first == second
				return true
			end
		end
	end
	false
end

# ╔═╡ 8f6b4850-737c-4194-a0ee-6f49c98a7f49
@assert has_pair_twice_without_overlapping("xyxy")

# ╔═╡ 065377a0-b116-43aa-9b10-da16c2651d73
@assert !has_pair_twice_without_overlapping("aaa") 

# ╔═╡ c8ecfeed-df4a-4d3f-9ce2-4583362d61a2
@assert has_pair_twice_without_overlapping("qjhvhtzxzqqjkmpb") # is nice because is has a pair that appears twice (qj)

# ╔═╡ 192ba648-8047-4a19-b813-b94f64fdbe73
@assert !has_pair_twice_without_overlapping("ieodomkazucvgmuy") # is naughty because it has ... no pair that appears twice.

# ╔═╡ 3c5f7512-2cbb-4d27-8ff4-9109ebb113d0
# It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
has_repeat_with_gap(str::AbstractString) = begin
	for idx in 1:length(str)-2
		if str[idx] == str[idx+2]
			return true
		end
	end
	false
end

# ╔═╡ 799c6130-ff6d-4baa-9ab3-6701464af1d7
@assert has_repeat_with_gap("xyx")

# ╔═╡ db901ec7-d5b8-49d5-96af-83f11a51a357
@assert has_repeat_with_gap("abcdefeghi") # efe

# ╔═╡ ea996734-921d-48a3-bbd4-b62c7b40901b
@assert has_repeat_with_gap("aaa") 

# ╔═╡ 2ab72150-e617-4d50-a744-3056b954624f
@assert !has_repeat_with_gap("uurcxstgmygtbstg") # is naughty because it has ... no repeat with a single letter between them.

# ╔═╡ 51e8ef23-7d4c-4a6b-a477-b7fd17a388dd
check2(str::AbstractString) = 
	has_pair_twice_without_overlapping(str) && 
	has_repeat_with_gap(str)

# ╔═╡ 06344808-f1bc-44d9-818a-6f95a257ae91
part2 = split(puzzle_input, "\n") |>
	Base.Fix1(map, str -> check2(str) ? 1 : 0) |>
	sum

# ╔═╡ 8d322661-54b4-4672-bb21-b83be802983d
md"Your puzzle answer was `69`."

# ╔═╡ af6ef30c-c753-472f-8fde-312e277f1c89


# ╔═╡ Cell order:
# ╟─e9086930-afeb-11eb-35ad-dba62b2459a9
# ╟─c7430382-47c7-4f2e-a260-fa4de8a8648c
# ╠═0cc15cb8-4a0f-4a04-a858-43088cb68ff3
# ╠═255d9b2e-4bc3-4b52-a835-9609eacf0c38
# ╠═8cd32bc3-661a-4e0a-b02b-0a51b13c1e6a
# ╠═47de64ba-6e35-402b-b222-c214f2801e5f
# ╠═9a2f0a15-57b5-4d28-838d-0bdd7485f500
# ╠═a1634cc1-6e18-46d8-97fd-fb2bc38131e5
# ╠═273e3edb-417e-4d47-9450-ad07c41c6281
# ╠═12123c64-a5d4-42e8-ac89-12d9f0b8cd6e
# ╠═c81aed85-fd24-4f1c-a2a7-be7e8ab8ad40
# ╠═8972c6bf-bcad-481a-b763-d9a5b22bd358
# ╠═f768f13a-d075-4ffb-9d81-b2bb3c5b9bab
# ╠═8a320756-41fa-4f49-8c72-225065d21a59
# ╠═29f607dd-133e-4cc8-87d4-b101b4017897
# ╠═064293dc-63ff-44a6-9ecb-5a0fba08df66
# ╠═69765b8f-6917-4781-bfc4-3f00843005a2
# ╠═c4811f7d-6801-4fcb-8065-205bbd5e2e03
# ╟─12eeff68-cf8d-48c0-a76a-1b6404b32247
# ╟─95825a3c-e112-4451-94c4-c68929e28cf3
# ╠═542ba6ce-f781-4f10-9414-329177b35733
# ╠═8f6b4850-737c-4194-a0ee-6f49c98a7f49
# ╠═065377a0-b116-43aa-9b10-da16c2651d73
# ╠═c8ecfeed-df4a-4d3f-9ce2-4583362d61a2
# ╠═192ba648-8047-4a19-b813-b94f64fdbe73
# ╠═3c5f7512-2cbb-4d27-8ff4-9109ebb113d0
# ╠═799c6130-ff6d-4baa-9ab3-6701464af1d7
# ╠═db901ec7-d5b8-49d5-96af-83f11a51a357
# ╠═ea996734-921d-48a3-bbd4-b62c7b40901b
# ╠═2ab72150-e617-4d50-a744-3056b954624f
# ╠═51e8ef23-7d4c-4a6b-a477-b7fd17a388dd
# ╠═06344808-f1bc-44d9-818a-6f95a257ae91
# ╟─8d322661-54b4-4672-bb21-b83be802983d
# ╠═af6ef30c-c753-472f-8fde-312e277f1c89
