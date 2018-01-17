require "pry"
require "twitter"

#Liste complète de noms de comptes twitter de journalistes fournie par THP
ListJurnalistsByScreenName = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]

#On peut faire tourner le script avec le nombre de comptes cibles que l'on veut. Néanmoins, lorsque la liste est trop importante, twitter refuse les nouvelles requêtes. Par exemple, le nombre maximum de personnes que l'on peut ajouter en "amis" d'un seul coup est de 15.
ListJurnalists = ListJurnalistsByScreenName[27..29]



loop do
puts "Que voulez-vous faire?\n -Taper 1 pour ajouter trois comptes twitters de journalistes à votre liste d'amis\n -Taper 2 pour pour liker les 4 dernières publications de trois comptes twitters de journalistes\n -Taper 3 pour liker les 5 nouvelles publications comportant les mots clés 'informatique', 'formation', peer learning' ou 'THP'\n -Taper 4 liker les 2 prochaines publications apparaissant dans votre fil d'actualités twitter\n -Taper 5 pour quitter"
user_input = gets
user_input = user_input.to_i
break if user_input == 5
tweets_by_key_words_list = []


if user_input == 1
	#Connexion
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  	config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  	config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  	config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
	end
	p client

#Le bloc suivant insère chaque compte ciblé dans ma liste d'amis
	ListJurnalists.each do |name|	
		name.slice!(0)
		name = name.to_s
		client.follow(name)
	end

#Le bloc suivant permet de "liker les "n" premières publications de chaque compte ciblé
elsif user_input == 2
	#Connexion
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  	config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  	config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  	config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
	end
	p client
	#Le bloc suivant like des tweets de comptes désignés par leurs noms, sous la forme @...
	ListJurnalists.each do |name|
		name.slice!(0)
		name = name.to_s
		tweets_ids = client.user_timeline("name", result_type: "recent").take(4)  #La méthode 'user_timeline' permet de récupérer les 'ids' des 'n' premiers tweets du compte ciblé. Par défaut la valeur de n est de 20. La méthode '.take' permet de modifier cette valeur par défaut.
		print tweets_ids
		client.favorite(tweets_ids) #La méthode '.favorite' permet de 'liker' des tweets.
	end

elsif user_input == 3
#Le bloc suivant ouvre le client streaming
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
end

#Le bloc suivant récupère les ids des 5 nouveaux tweets comportant l'un des quatre mots-clés spécifiés
	topics = ["informatique", "formation", "peer learning", "THP"]
	client.filter(track: topics.join(",")) do |object|
	tweets_by_key_words_list.push(object.id) if object.is_a?(Twitter::Tweet)
	break if tweets_by_key_words_list.length == 5
	end
	
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
end
p client

client.favorite(tweets_by_key_words_list)



elsif user_input == 4
#Le bloc suivant ouvre le client streaming
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
end
#Le blocs suivant récupère les ids des nouveaux tweets apparaissant dans le fil d'actualité de l'utilisateur
tweets_by_user_list = []
client.user do |object|
	break if tweets_by_user_list.length == 2
	tweets_by_user_list.push(object.id) if object.is_a?(Twitter::Tweet)	
end			
client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = "20enR5dbVFlhaWo8fLbVaHjqI"
  	config.consumer_secret     = "WWJdZgeOox64uCxKuuQDpE1uELBG9TJ6V4hMZW83pAlhoGX6pc"
  	config.access_token        = "953598083711094785-ac6yEYGO90ASM3S34WLpwP7JZ9n5z2o"
  	config.access_token_secret = "UB3KwuWBDrkDu5z32PDdqwdSnj5p8VecGtMcgbt0BUGES"
	end
p client
client.favorite(tweets_by_user_list)
end
end


