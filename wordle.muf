( Wordle Game in MUF )
( A recreation of the popular Wordle game for MUCK environments )
( Using official Wordle word lists for authentic gameplay )
( Version 1.0 )
( Wordle game - guess the daily 5-letter word in 6 tries )

( Word list functions - included inline since $include not supported )

( Get the official Wordle answer word list )
: get-answer-words ( -- str )
    "ABACK ABASE ABASH ABATE ABBEY ABBOT ABHOR ABIDE ABLED ABODE ABORT ABOUT ABOVE ABUSE ABYSS ACORN ACRID ACTOR ACUTE ADAGE ADAPT ADEPT ADMIN ADMIT ADOBE ADOPT ADORE ADULT AFFIX AFIRE AFOOT AFORE AFTER AGAIN AGENT AGILE AGING AGLOW AGONY AGREE AHEAD AIDER AISLE ALARM ALBUM ALERT ALGAE ALIBI ALIEN ALIGN ALIKE ALIVE ALLAY ALLEY ALLOT ALLOW ALLOY ALONE ALONG ALOOF ALTER AMASS AMAZE AMBER AMBLE AMEND AMISS AMITY AMONG AMPLE AMPLY AMUSE ANGEL ANGER ANGLE ANGRY ANGST ANIME ANKLE ANNEX ANNOY ANNUL ANODE ANTIC ANVIL AORTA APART APHID APING APNEA APPLE APPLY ARENA ARGUE ARISE ARMOR AROMA AROSE ARRAY ARROW ARSON ARTSY ASCOT ASHEN ASIDE ASKEW ASSAY ASSET ATOLL ATONE ATTIC AUDIO AUDIT AUGUR AUNTY AVAIL AVERT AVOID AWAIT AWAKE AWARD AWARE AWASH AWFUL AWOKE AXIAL AXIOM AXION AZURE BACON BADGE BADLY BAGEL BAGGY BAKER BALER BALKY BALLET BALLY BALSA BANAL BANJO BARGE BARON BASAL BASIC BASIL BASIN BASIS BASTE BATCH BATHE BATON BATTY BAWDY BAYOU BEACH BEADY BEARD BEAST BEATY BEBOP BECKY BEDEL BEGUN BEING BELCH BELIE BELLE BELLY BELOW BENCH BERET BERRY BERTH BESET BETTY BEVEL BEVY BIBLE BICEP BIDDY BIGOT BILGE BILLY BINGE BINGO BIOME BIRCH BIRTH BISON BITTY BLACK BLADE BLAME BLAND BLANK BLARE BLAST BLAZE BLEAK BLEAT BLEED BLESS BLIMP BLIND BLINK BLISS BLITZ BLOAT BLOCK BLOKE BLOND BLOOD BLOOM BLOWN BLUES BLUFF BLUNT BLURB BLURT BLUSH BOARD BOAST BOBBY BOING BOINK BOLUS BOMB BOND BONEY BONUS BOOBY BOOST BOOTH BOOTY BOOZE BOOZY BORAX BORNE BOSOM BOSSY BOTCH BOUGH BOULE BOUND BOWEL BOWER BOWL BRACE BRAID BRAIN BRAKE BRAND BRASH BRASS BRAVE BRAVO BRAWL BRAWN BREAD BREAK BREED BRIAR BRIBE BRICK BRIDE BRIEF BRINE BRING BRINK BRINY BRISK BROAD BROIL BROKE BROOD BROOK BROWN BRUNT BRUSH BRUTE BUDDY BUDGE BUGGY BUILD BUILT BULGE BULKY BULL BUMPY BUNCH BUNNY BURLY BURNT BURST BUSED BUSHY BUTCH BUTTE BUXOM BUYER BYLAW CABAL CABBY CABIN CABLE CACAO CACHE CADDY CADET CAGEY CAIRN CAMEL CAMEO CANAL CANDY CANNY CANOE CANON CAPER CAPUT CARAT CARGO CAROL CARRY CARVE CASTE CATCH CATER CATTY CAULK CAUSE CAVIL CEASE CEDAR CHAFE CHAFF CHAIN CHAIR CHALK CHAMP CHANT CHAOS CHARD CHARM CHART CHASE CHASM CHEAP CHEAT CHECK CHEEK CHESS CHEST CHICK CHIEF CHILD CHILL CHIMP CHIRP CHIVE CHOCK CHOIR CHOKE CHORD CHORE CHOSE CHUCK CHUMP CHUNK CHURN CHUTE CIDER CIGAR CINCH CIRCA CIVIC CIVIL CLACK CLAIM CLAMP CLANG CLANK CLASH CLASP CLASS CLEAN CLEAR CLEAT CLEFT CLERK CLICK CLIFF CLIMB CLING CLINK CLOAK CLOCK CLONE CLOSE CLOTH CLOUD CLOUT CLOWN CLUBS CLUCK CLUED CLUMP CLUNG CLUNK COACH COAST COAT COAX COBRA COCOA COLON COLOR COMET COMFY COMIC COMMA CONCH CONDO CONIC COPSE CORAL CORER CORGI CORKS CORNY COUCH COUGH COULD COUNT COUPE COURT COVEN COVER COWER CRACK CRAFT CRAMP CRANE CRANK CRASH CRASS CRATE CRAVE CRAWL CRAZE CRAZY CREAK CREAM CREED CREEK CREEP CREME CREPE CREPT CRESS CRICK CRIED CRIER CRIES CRIME CRIMP CRISP CROAK CROCK CROFT CRONE CRONY CROOK CROSS CROUP CROWD CROWN CRUDE CRUEL CRUMB CRUMP CRUSH CRUST CRYPT CUBIC CUMIN CURIO CURLY CURRY CURSE CURVE CURVY CUTIE CYBER CYCLE CYNIC DADDY DAILY DAIRY DAISY DALLY DANCE DANDY DATUM DAUNT DEALT DEATH DEBAR DEBIT DEBUG DEBUT DECAF DECAL DECAY DECOR DECOY DECRY DEFER DEIGN DEITY DELAY DELTA DELVE DEMON DEMUR DENIM DENSE DEPOT DEPTH DERBY DETER DETOX DEUCE DEVIL DIARY DICEY DIGIT DILLY DIMLY DINER DINGO DINGY DIODE DIRGE DIRTY DISCO DITCH DITTO DITTY DIVAN DIVER DIZZY DOCK DODGE DODGY DOGMA DOING DOLLY DONOR DONUT DOPEY DOUBT DOUGH DOVE DOWDY DOWEL DOWNY DOWRY DOZEN DRAFT DRAIN DRAKE DRAMA DRANK DRAPE DRAWL DRAWN DREAD DREAM DRESS DRIED DRIER DRIFT DRILL DRILY DRINK DRIVE DROIT DROLL DRONE DROOL DROOP DROWN DRUID DRUNK DRYER DRYLY DUCHY DUCKY DUMMY DUMPY DUNCE DUSKY DUSTY DUTCH DUVET DWARF DWELL DYEING" strcat
    " EAGER EAGLE EARLY EARTH EASEL EATEN EATER EAVES EBONY EBOOK EDICT EDIFY EERIE EGRET EIGHT EJECT EKING ELATE ELBOW ELDER ELECT ELEGY ELFIN ELIDE ELITE ELOPE ELUDE ELVES EMBED EMBER EMCEE EMPTY ENACT ENDOW ENEMA ENEMY ENJOY ENNUI ENSUE ENTER ENTRY ENVOY EPOCH EPOXY EQUAL EQUIP ERASE ERECT ERROR ERUPT ESSAY ESTER ETHER ETHIC ETHOS ETUDE EVADE EVEN EVENT EVERY EVICT EVILS EVOKE EXACT EXALT EXCEL EXERT EXILE EXIST EXPAT EXPEL EXTRA EXULT EYED FABLE FACET FAINT FAIRY FAITH FALSE FANCY FANNY FARCE FATAL FATTY FAULT FAUNA FAVOR FEAST FECAL FEIGN FELLA FELON FEMUR FENCE FERAL FERRY FETAL FETCH FETID FETUS FEVER FEWER FIBER FICUS FIELD FIEND FIERY FIFTH FIFTY FIGHT FILER FILET FILLY FILMY FILTH FINAL FINCH FINER FIRST FISHY FITCH FITTED FIXER FIZZY FJORD FLACK FLAGS FLAIL FLAIR FLAKE FLAKY FLAME FLANK FLARE FLASH FLASK FLECK FLEET FLESH FLICK FLIER FLING FLINT FLIRT FLOAT FLOCK FLOOD FLOOR FLORA FLOSS FLOUR FLOUT FLOWN FLUBS FLUFF FLUID FLUKE FLUME FLUNG FLUNK FLUSH FLUTE FLYER FOAMY FOCAL FOCUS FOGGY FOIST FOLIO FOLLY FORAY FORCE FORGE FORGO FORME FORTH FORTY FORUM FOUND FOYER FRAIL FRAME FRANK FRAUD FRAYED FREAK FREED FREER FRESH FRIAR FRIED FRILL FRISK FRITZ FROCK FROND FRONT FROST FROWN FROZE FRUIT FUDGE FUGUE FULLY FUNGI FUNKY FUNNY FUROR FURRY FUSSY FUZZY GAFFE GAILY GAMER GAMMA GAMUT GASSY GAUDY GAUGE GAUNT GAUZE GAVEL GAWKY GAYER GAYLY GAZER GECKO GEEKY GEESE GENIE GENRE GHOST GHOUL GIANT GIDDY GIPSY GIRLY GIRTH GIVEN GIVER GIZMO GLADE GLAND GLARE GLASS GLAZE GLEAM GLEAN GLIDE GLINT GLOBE GLOOM GLORY GLOSS GLOVE GLYPH GNASH GNOME GOAT GOING GOLEM GOLLY GONAD GONER GOODY GOOEY GOOFY GOOSE GORGE GOTCHA GOUGE GOURD GRACE GRADE GRAFT GRAIL GRAIN GRAND GRANT GRAPE GRAPH GRASP GRASS GRATE GRAVE GRAVY GRAZE GREAT GREED GREEK GREEN GREET GRIEF GRILL GRIME GRIMY GRIND GRIPE GROAN GROIN GROOM GROPE GROSS GROUP GROUT GROVE GROWL GROWN GRUEL GRUFF GRUNT GUARD GUAVA GUESS GUEST GUIDE GUILD GUILT GUISE GULCH GULLY GUMBO GUMMY GUPPY GUSTO GUSTY GYPSY" strcat
    " HABIT HAIKU HAINT HAIRY HALAL HALVE HANDY HAPPY HARDY HAREM HARPY HARSH HASTE HASTY HATCH HATER HAUNT HAUTE HAVEN HAVOC HAZEL HEADY HEARD HEART HEATH HEAVE HEAVY HEDGE HEFTY HEIDI HEIFER HEIST HELIX HELLO HENCE HERON HICKY HIDER HIGHS HIKER HILTS HINGE HIPPO HIPPY HITCH HOARD HOBBY HOIST HOLLY HOMER HONEY HONOR HOOF HOOEY HOOKY HORDE HORNY HORSE HOTEL HOUND HOUSE HOVEL HOVER HOWDY HUMAN HUMID HUMOR HUMPH HUMUS HUNCH HUNKY HURRY HUSKY HUSSY HUTCH HYENA HYMEN HYPER ICHOR ICING IDEAL IDIOM IDLER IDYLL IGLOO ILEUM IMAGE IMBUE IMPEL INANE INBOX INCUR INDEX INEPT INERT INFER INGLE INLAY INLET INNER INPUT INTER INTRO IONIC IOTA IRONY ISLET ISSUE ITCHY IVORY JAUNT JAZZY JEANS JELLY JERKY JETTY JEWEL JIFFY JOINT JOIST JOKER JOLLY JOUST JUDGE JUICE JUICY JUMBO JUMPY JUNTA JUNTO JUROR KAPPA KARMA KAYAK KEBAB KHAKI KINKY KIOSK KITTY KNACK KNAVE KNEAD KNEEL KNELT KNIFE KNOCK KNOLL KNOWN KOALA KRILL LABEL LABOR LADEN LADLE LAGER LANCE LANKY LAPEL LAPSE LARGE LARVA LASSO LATCH LATER LATHE LATTE LAUGH LAYER LEACH LEAFY LEAKY LEANT LEAPT LEARN LEASE LEASH LEAST LEAVE LEDGE LEECH LEERY LEFTY LEGAL LEGGY LEMON LEMUR LEPER LEVEL LEVER LIBEL LIBER LIFER LIGHT LIKER LILAC LIMBO LIMIT LINER LINGO LINTY LION LIPID LISP LITER LITHE LIVER LIVID LLAMA LOAMY LOATH LOBBY LOCAL LOCUS LODGE LOFTY LOGIC LOGIN LOOPY LOOSE LORDY LOSER LOUSY LOVER LOWER LOWLY LOYAL LUCID LUCKY LUMEN LUMPY LUNAR LUNCH LUNGE LUPUS LURCH LURID LUSTY LYING LYMPH LYRIC" strcat
    " MACED MACHO MACRO MADAM MADLY MAFIA MAGIC MAGMA MAIDS MAJOR MAKER MAMBO MAMMA MAMMY MANGA MANGE MANGO MANGY MANIA MANIC MANLY MANOR MAPLE MARCH MARCO MARRY MARSH MASON MASSE MATCH MATER MATEY MAUVE MAXIM MAYBE MAYOR MEALY MEANT MEATY MECCA MEDAL MEDIA MEDIC MELON MERCY MERGE MERIT MERRY METAL METER METRO MICRO MIDGE MIDST MIGHT MILKY MIMIC MINCE MINER MINOR MINTY MINUS MIRTH MISER MISSY MOCHA MODEL MODEM MOGUL MOIST MOLAR MOLDY MONEY MONTH MOODY MOOSE MORAL MOREL MORPH MOSSY MOTEL MOTIF MOTOR MOTTO MOULD MOUND MOUNT MOURN MOUSE MOUTH MOVER MOVIE MOWER MUCUS MUDDY MUGGY MULCH MUMMY MUNCH MURAL MURKY MUSHY MUSIC MUSKY MUSTY MYRRH NADIR NAIVE NANNY NASAL NASTY NATAL NATCH NAVY NEIGH NERDY NERVE NERVY NEVER NEWER NEWLY NICER NICHE NIECE NIGHT NINJA NINNY NINTH NOBLE NOBLY NOISE NOISY NOMAD NORTH NOSY NOTCH NOVEL NUDGE NURSE NUTTY NYLON NYMPH" strcat
    " OASIS OCEAN OCTAL OCTET ODDER ODDLY OFFAL OFFER OFTEN OLDIE OLIVE OMBRE OMEGA ONION ONSET OPERA OPINE OPIUM OPTIC ORBIT ORDER ORGAN OTHER OTTER OUGHT OUNCE OUTDO OUTER OUTGO OVARY OVATE OVERT OWING OWLET OWNED OWNER OXIDE OZONE PADDY PAGAN PAINT PAIR PAL PALM PANDA PANEL PANIC PANSY PAPAL PAPER PAPPY PARTY PASTA PASTE PASTY PATCH PATER PATIO PATSY PATTY PAUSE PAYEE PAYER PEACE PEACH PEARL PECAN PEDAL PENAL PENCE PENNE PENNY PERCH PERIL PERKY PERP PERRY PESKY PESO PETAL PETTY PHASE PHONE PHONY PHOTO PIANO PICKY PIECE PIETY PIGGY PILOT PINCH PINEY PINKY PINTO PIPER PIQUE PITCH PITHY PIVOT PIXEL PIXIE PIZZA PLACE PLAID PLAIN PLAIT PLANE PLANK PLANT PLATE PLAZA PLEAD PLEAT PLIED PLIER PLOD PLONK PLOT PLOVER PLUCK PLUME PLUMP PLUNK PLUSH POESY POINT POISE POKER POLAR POLKA POLYP POMP PONY POOCH POPPA POPPY PORCH POSER POSIT POSSE POUCH POUND POUTY POWER PRANK PRESS PRICE PRICK PRIDE PRIED PRIME PRIMO PRINT PRIOR PRISM PRIVY PRIZE PROBE PRONE PRONG PROOF PROSE PROUD PROVE PROWL PROXY PRUDE PRUNE PSALM PUBIC PUDGY PUFFY PULP PULSE PUNCH PUNY PUPIL PUPPY PUREE PURGE PURSE PUSHY PUTTY PYGMY QUACK QUAIL QUAKE QUALM QUART QUASI QUEEN QUERY QUEST QUEUE QUICK QUIET QUILL QUILT QUIRK QUITE QUOTA QUOTE" strcat
    " RABID RACER RADAR RADIO RAINY RAISE RALPH RAMEN RANCH RANDY RANGE RAPID RARER RASP RATTY RAVEN RAYON RAZOR REACH REACT READY REALM REBEL REBUS REBUT RECAP RECUR REEDS REFER REFIT REGAL REHAB REIGN RELAX RELAY RELIC REMIT RENAL RENEW REPAY REPEL REPLY RERUN RESET RESIN RETCH RETRO RETRY REUSE REVEL REVUE RHINO RHYME RIDER RIDGE RIFLE RIGHT RIGID RIGOR RINSE RIPEN RIPER RISEN RISER RISKY RIVAL RIVER ROACH ROAST ROBIN ROBOT ROCKY RODEO ROGER ROGUE ROMAN ROMP ROOKY ROOMY ROOST ROPEY ROUGE ROUGH ROUND ROUSE ROUTE ROVER ROWDY ROYAL RUDDY RUDER RUGBY RULER RUMBA RUMOR RUPEE RURAL RUSTY" strcat
    " SADLY SAFER SAINT SALAD SALLY SALON SALSA SALTY SALVE SALVO SANDY SANER SAPID SAPPY SASSY SATIN SATYR SAUCE SAUCY SAUNA SAUTE SAVOR SAVOY SAVVY SCALD SCALE SCALP SCAMP SCARE SCARF SCARY SCENE SCENT SCION SCOFF SCONE SCOOP SCOPE SCORE SCORN SCOUR SCOUT SCOWL SCRAM SCRAP SCREE SCREW SCRUB SCUBA SCUFF SCULP SEAM SEAR SEAT SECCO SECT SEDAN SEEDY SEGUE SEIZE SEMEN SENSE SEPIA SERIF SEROUS SERVE SETUP SEVEN SEVER SEWER SHADE SHADY SHAFT SHAKE SHALE SHALL SHAME SHANK SHAPE SHARD SHARE SHARK SHARP SHAVE SHAWL SHEAR SHEEN SHEEP SHEER SHEET SHELF SHELL SHIFT SHINE SHINY SHIRE SHIRK SHIRT SHOAL SHOCK SHONE SHOOK SHOOT SHORE SHORN SHORT SHOUT SHOVE SHOWN SHOWY SHRED SHREW SHRUB SHRUG SHUCK SHUNT SHUSH SHYLY SIEGE SIEVE SIGHT SIGMA SILKY SILLY SINCE SINEW SINGE SINUS SIREN SISSY SIXTH SIXTY SKATE SKEET SKEIN SKIMP SKINK SKINT SKIRT SKULK SKULL SKUNK SLACK SLAIN SLANG SLANT SLASH SLATE SLAVE SLEEK SLEEP SLEET SLEPT SLICE SLICK SLIDE SLIME SLIMY SLING SLINK SLOSH SLOTH SLUMP SLUNG SLUNK SLURP SLUSH SLYLY SMALL SMARM SMART SMASH SMEAR SMELL SMELT SMILE SMIRK SMITE SMITH SMOCK SMOKE SMOKY SMOTE SNACK SNAFU SNAIL SNAKE SNAKY SNARE SNARL SNEAK SNEER SNIDE SNIFF SNIPE SNOOP SNORE SNORT SNOUT SNOWY SNUB SNUCK SNUFF SOAPY SOBER SOCAL SOCK SODAS SOFA SOGGY SOLAR SOLID SOLVE SONAR SONIC SOOEY SOOTH SOOTY SORRY SOUND SOUTH SOWER SPACE SPADE SPANK SPARE SPARK SPASM SPAWN SPEAK SPEAR SPECK SPEED SPELL SPEND SPENT SPERM SPICE SPICY SPIED SPIEL SPIKE SPIKY SPILL SPILT SPINE SPINY SPIRE SPITE SPLAT SPLIT SPOIL SPOKE SPOOF SPOOK SPOOL SPOON SPORE SPORT SPOUT SPRAY SPREE SPRIG SPUNK SPURN SPURT SQUAD SQUAT SQUIB STACK STAFF STAGE STAID STAIN STAIR STAKE STALE STALK STALL STAMP STAND STANK STAPH STARE STARK START STASH STATE STAVE STEAD STEAK STEAL STEAM STEED STEEL STEEP STEER STEIN STEM STERN STICK STIFF STILL STILT STING STINK STINT STOCK STOIC STOKE STOLE STOMP STONE STONY STOOD STOOL STOOP STORE STORK STORM STORY STOUT STOVE STRAP STRAW STRAY STRIP STRUT STUCK STUDY STUFF STUMP STUNG STUNK STUNT STYLE SUAVE SUGAR SUING SUITE SULKY SULLY SUMAC SUNNY SUPER SURER SURGE SURLY SUSHI SWAB SWAG SWAIN SWAMP SWANK SWARM SWASH SWATH SWEAR SWEAT SWEEP SWEET SWELL SWEPT SWIFT SWILL SWINE SWING SWIPE SWIRL SWISH SWOON SWOOP SWORD SWORE SWORN SWUNG SYNOD SYRUP" strcat
    " TABLE TABOO TACIT TACKY TAFFY TAINT TAKEN TAKER TALLY TALON TAMER TANGO TANGY TANTO TAPIR TARDY TAROT TASTE TASTY TATTY TAUNT TAWNY TEACH TEARY TEASE TEDDY TEETH TEMPO TENET TENOR TENSE TENTH TEPID TERRA TERSE TESLA TEST THANK THEFT THEIR THEME THERE THESE THICK THIEF THIGH THING THINK THIRD THORN THOSE THREE THREW THROB THROW THRUM THUMB THUMP THUNK THYME TIARA TIBIA TIDAL TIGER TIGHT TILDE TIMER TIMID TIPSY TITAN TITHE TITLE TOAST TODAY TODDY TOKEN TONAL TONGA TONIC TOOTH TOPAZ TOPIC TORCH TORSO TOTAL TOTEM TOUCH TOUGH TOWEL TOWER TOXIC TRACE TRACK TRACT TRADE TRAIL TRAIN TRAIT TRAMP TRASH TRASHY TREAT TREND TRIAD TRIAL TRIBE TRICE TRICK TRIED TRIFE TRILL TRIPE TRITE TROLL TROOP TROPE TROTH TROUT TROVE TRUCE TRUCK TRUER TRULY TRUMP TRUNK TRUST TRUTH TRYST TUBAL TUBER TULIP TULLE TUMOR TUNIC TURBO TURF TWANG TWEED TWELVE TWICE TWINE TWIRL TWIST TWIXT TYING" strcat
    " UDDER ULTRA UMBER UMBRA UNARY UNCLE UNCUT UNDER UNDID UNDUE UNFED UNFIT UNIFY UNION UNITE UNITY UNLIT UNMET UNSET UNTIL UNWED UNZIP UPPER UPSET URBAN URINE USAGE USHER USING USUAL USURP UTTER VAGUE VAIN VALID VALUE VALVE VAPID VAPOR VAULT VAUNT VEGAN VENOM VENUE VERGE VERSE VERSO VERTU VERVE VICAR VIDEO VIGIL VIGOR VILLA VINYL VIPER VIRAL VIRUS VISIT VISOR VISTA VITAL VIVID VIXEN VOCAL VODKA VOGUE VOICE VOILA VOMIT VOUCH VOWEL VYING WACKY WAFER WAGER WAGES WAGON WAHOO WAIST WAIVE WAKE WALK WALLY WALTZ WAND WANNA WARBLE WARMTH WARRIOR WASTE WATCH WATER WAVER WAXED WEARY WEAVE WEBER WEDGE WEEDY WEIGH WEIRD WELCH WELSH WHACK WHALE WHARF WHEAT WHEEL WHELM WHEN WHERE WHICH WHIFF WHILE WHIM WHINE WHINY WHIRL WHISK WHISPER WHOOP WHORE WHOSE WIDEN WIDER WIDOW WIDTH WIELD WIGHT WILD WILLY WIMPY WINCE WINCH WINDY WIPER WIRED WISER WISPY WITCH WITTY WOKEN WOMAN WOMEN WOODY WOOER WORDY WORLD WORRY WORSE WORST WORTH WOULD WOVEN WRACK WRATH WREAK WRECK WREN WRIST WRITE WRONG WROTE WRUNG YACHT YAHOO YEARN YEAST YIELD YOUNG YOUTH ZEBRA ZESTY ZONAL"
;

( Get extended guess word list - returning empty for now )
( Only answer words will be validated - simpler for now )
: get-guess-words ( -- str )
    ""
;

( Property names for game state - defined as literals )
( No $def support, using direct string/number replacements )

( Game constants )
( WORD_LENGTH = 5 )
( MAX_ATTEMPTS = 6 )

( ANSI color codes for output )
( GREEN = "\[[32m" )
( YELLOW = "\[[33m" )
( GRAY = "\[[90m" - bright black )
( RESET = "\[[0m" )
( BOLD = "\[[1m" )

( Emoji alternatives if your MUCK supports Unicode )
( GREEN_SQUARE = "🟩" )
( YELLOW_SQUARE = "🟨" )
( GRAY_SQUARE = "⬜" )

( Check if a word is valid (in either answer list or guess list) )
: valid-word? ( str -- bool )
    dup
    
    ( Check if it's in the answer words )
    get-answer-words " " explode_array
    over array_findval -1 = not if
        pop pop 1 exit
    then
    
    ( Check if it's in the allowed guess words )
    get-guess-words " " explode_array  
    swap array_findval -1 = not
;

( Get today's word using a deterministic seed based on date )
: get-todays-word ( -- str )
    ( Use system time to generate consistent daily word )
    systime 86400 / ( Get days since epoch )
    get-answer-words " " explode_array
    dup array_count
    3 pick swap % ( Use modulo to get consistent index )
    array_getitem
    swap pop
;

( Initialize a new game for player )
: init-game ( player -- )
    ( Clear existing properties )
    dup "_wordle/word" remove_prop
    dup "_wordle/attempts" remove_prop
    dup "_wordle/guesses" remove_prop
    dup "_wordle/complete" remove_prop
    
    ( Set today's word )
    get-todays-word
    over "_wordle/word" setpropstr
    
    ( Initialize attempts )
    0 over "_wordle/attempts" setprop
    
    ( Mark game as active )
    0 over "_wordle/complete" setprop
    
    ( Set last play time to today )
    systime over "_wordle/lastplay" setprop
    
    pop
;

( Check if player has played today )
: played-today? ( player -- bool )
    dup "_wordle/lastplay" getprop
    dup not if
        pop pop 0 exit
    then
    
    ( Check if last play was today )
    systime 86400 / swap 86400 / =
;

( Update player statistics )
: update-stats ( player won? attempts -- )
    ( Increment games played )
    over "_wordle/stats/played" getprop 1 + 2 pick "_wordle/stats/played" setprop
    
    swap if
        ( Player won )
        dup "_wordle/stats/won" getprop 1 + over "_wordle/stats/won" setprop
        
        ( Update current streak )
        dup "_wordle/stats/current_streak" getprop 1 + 
        dup 2 pick "_wordle/stats/current_streak" setprop
        
        ( Update max streak if needed )
        over "_wordle/stats/max_streak" getprop
        over < if
            over "_wordle/stats/max_streak" setprop
        else
            pop
        then
        
        ( Update guess distribution )
        over "_wordle/stats/guess_distribution" getpropstr
        dup not if
            pop "0,0,0,0,0,0"
        then
        "," explode_array
        
        ( Increment the appropriate attempt bucket )
        over 1 - array_getitem atoi 1 +
        intostr over 2 pick 1 - array_setitem
        
        "," array_join
        2 pick "_wordle/stats/guess_distribution" setpropstr
        
    else
        ( Player lost - reset current streak )
        0 over "_wordle/stats/current_streak" setprop
    then
    
    pop pop
;

( Get current game state )
: get-game-state ( player -- word attempts guesses complete )
    dup "_wordle/word" getpropstr
    over "_wordle/attempts" getprop
    over "_wordle/guesses" getpropstr
    swap "_wordle/complete" getprop
;

( Check guess against target and generate colored feedback )
: check-guess ( target guess -- feedback )
    "" swap
    0 ( position counter )
    
    begin
        dup 5 < while
        
        ( Get character at current position from guess )
        over over 1 strcut swap pop 1 strcut swap pop
        
        ( Get character at current position from target )
        4 pick over 1 strcut swap pop 1 strcut swap pop
        
        ( Compare characters )
        over over strcmp not if
            ( Exact match - green )
            "\[[32m" swap strcat "\[[0m" strcat strcat
        else
            ( Check if letter exists elsewhere in target )
            4 pick over instr if
                ( Letter exists but wrong position - yellow )
                "\[[33m" swap strcat "\[[0m" strcat strcat
            else
                ( Letter not in word - gray )
                "\[[90m" swap strcat "\[[0m" strcat strcat
            then
        then
        
        swap pop ( remove character )
        1 + ( increment position )
    repeat
    
    ( Clean up stack )
    pop pop pop
;

( Generate emoji feedback for sharing )
: check-guess-emoji ( target guess -- emoji-str )
    "" swap
    0 ( position counter )
    
    begin
        dup 5 < while
        
        ( Get character at current position from guess )
        over over 1 strcut swap pop 1 strcut swap pop
        
        ( Get character at current position from target )
        4 pick over 1 strcut swap pop 1 strcut swap pop
        
        ( Compare characters )
        over over strcmp not if
            ( Exact match )
            "🟩" strcat
        else
            ( Check if letter exists elsewhere in target )
            4 pick over instr if
                ( Letter exists but wrong position )
                "🟨" strcat
            else
                ( Letter not in word )
                "⬜" strcat
            then
        then
        
        swap pop ( remove character )
        1 + ( increment position )
    repeat
    
    ( Clean up stack )
    pop pop pop
;

( Display game board )
: show-board ( player -- )
    get-game-state
    
    ( Clear screen effect )
    "" tell
    "═══════════════════════════════════════" tell
    "\[[1m                WORDLE\[[0m" tell
    "═══════════════════════════════════════" tell
    "" tell
    
    ( Show previous guesses if any )
    dup if
        " " explode_array
        0 begin
            dup 5 pick array_count < while
            dup 5 pick array_getitem
            
            ( Show the guess with color coding )
            6 pick over check-guess
            "  " swap strcat tell
            
            1 +
        repeat
        pop
    then
    
    ( Show empty rows for remaining attempts )
    dup array_count 6 < if
        dup array_count 6 swap - 0 do
            "  ⬜⬜⬜⬜⬜" tell
        loop
    then
    
    "" tell
    "Attempts: " 3 pick intostr strcat "/6" strcat tell
    
    ( Check if game is complete )
    dup if
        "" tell
        3 pick 4 pick strcmp not if
            "\[[1m\[[32m🎉 Congratulations! You found it!\[[0m" tell
        else
            "😞 Better luck tomorrow! The word was: \[[1m" 4 pick strcat "\[[0m" strcat tell
        then
    then
    
    "" tell
    "═══════════════════════════════════════" tell
    
    ( Clean up stack )
    pop pop pop pop
;

( Make a guess )
: make-guess ( player guess -- )
    ( Validate guess length )
    dup strlen 5 = not if
        pop "❌ Guess must be exactly 5 letters long." tell
        exit
    then
    
    ( Convert to uppercase )
    toupper
    
    ( Validate word )
    dup valid-word? not if
        pop "❌ \"" over strcat "\" is not a valid word." strcat tell
        exit
    then
    
    ( Get current game state )
    over get-game-state
    
    ( Check if game is already complete )
    dup if
        pop pop pop pop pop
        "ℹ️  You've already completed today's Wordle!" tell
        over show-board
        exit
    then
    
    ( Check if max attempts reached )
    over 6 >= if
        pop pop pop pop pop
        "❌ You've used all your attempts!" tell
        over show-board
        exit
    then
    
    ( target-word attempts guesses complete guess )
    
    ( Add guess to guesses list )
    over if
        over " " strcat 4 pick strcat
    else
        4 pick
    then
    
    ( Update guesses property )
    4 pick "_wordle/guesses" setpropstr
    
    ( Increment attempts )
    over 1 + 4 pick "_wordle/attempts" setprop
    
    ( Check if guess is correct )
    4 pick 3 pick strcmp not if
        ( Correct guess! )
        1 4 pick "_wordle/complete" setprop
        4 pick show-board
        
        ( Update statistics )
        4 pick 1 3 pick 1 + update-stats
        
        "" tell
        "🎊 Share your result:" tell
        4 pick generate-share-text tell
        
    else
        ( Incorrect guess )
        ( Check if max attempts reached )
        over 1 + 6 >= if
            ( Game over )
            1 4 pick "_wordle/complete" setprop
            4 pick show-board
            
            ( Update statistics )  
            4 pick 0 6 update-stats
            
            "" tell
            "📊 Share your result:" tell
            4 pick generate-share-text tell
        else
            ( Show updated board )
            4 pick show-board
        then
    then
    
    ( Clean up stack )
    pop pop pop pop pop
;

( Generate shareable result text )
: generate-share-text ( player -- )
    get-game-state pop ( remove complete flag )
    
    ( guesses attempts target )
    
    "Wordle " systime 86400 / intostr strcat
    
    ( Add result )
    over over strcmp not if
        " " strcat over intostr strcat "/6" strcat
    else
        " X/6" strcat
    then
    
    tell "" tell
    
    ( Show emoji grid )
    dup if
        " " explode_array
        0 begin
            dup 4 pick array_count < while
            dup 4 pick array_getitem
            4 pick over check-guess-emoji
            tell
            1 +
        repeat
        pop
    then
    
    ( Clean up )
    pop pop pop
;

( Show player statistics )
: show-stats ( player -- )
    "" tell
    "📊 YOUR STATISTICS" tell
    "═══════════════════" tell
    
    dup "_wordle/stats/played" getprop intostr 
    "Games Played: " swap strcat tell
    
    dup "_wordle/stats/won" getprop over "_wordle/stats/played" getprop
    dup 0 = if
        pop pop "Win Rate: 0%"
    else
        swap 100 * swap / intostr "Win Rate: " swap strcat "%" strcat
    then
    tell
    
    dup "_wordle/stats/current_streak" getprop intostr
    "Current Streak: " swap strcat tell
    
    dup "_wordle/stats/max_streak" getprop intostr
    "Max Streak: " swap strcat tell
    
    "" tell "GUESS DISTRIBUTION" tell
    "─────────────────" tell
    
    dup "_wordle/stats/guess_distribution" getpropstr
    dup not if
        pop "0,0,0,0,0,0"
    then
    "," explode_array
    
    1 begin
        dup 6 <= while
        over 2 pick 1 - array_getitem
        over intostr ":" strcat " " strcat 
        over 0 > if
            over atoi 0 do "█" strcat loop
        then
        " (" strcat 3 pick strcat ")" strcat
        tell
        1 +
    repeat
    pop pop
    
    "" tell
    pop
;

( Main command handler )
: do-wordle ( str -- )
    strip
    
    dup not if
        pop
        me@ played-today? if
            me@ show-board
        else
            "🎯 Welcome to Wordle!" tell
            "" tell
            "Guess the 5-letter word in 6 attempts!" tell
            "🟩 Green: Correct letter, correct position" tell  
            "🟨 Yellow: Correct letter, wrong position" tell
            "⬜ Gray: Letter not in word" tell
            "" tell
            "Type 'wordle <word>' to make a guess" tell
            "Type 'wordle help' for more commands" tell
            "" tell
            me@ init-game
            me@ show-board
        then
        exit
    then
    
    " " split swap
    
    ( Check command )
    dup "help" strcmp not if
        pop pop
        "🎯 WORDLE HELP" tell
        "═══════════════" tell
        "" tell
        "Commands:" tell
        "  wordle          - Start new game or show current" tell
        "  wordle <word>   - Make a guess" tell
        "  wordle status   - Show current game" tell
        "  wordle stats    - Show your statistics" tell
        "  wordle help     - Show this help" tell
        "" tell
        "Rules:" tell
        "• Guess the 5-letter word in 6 attempts" tell
        "• Each guess must be a valid 5-letter word" tell  
        "• Color coding shows how close your guess was" tell
        "• A new word is available each day" tell
        exit
    then
    
    dup "status" strcmp not if
        pop pop
        me@ show-board
        exit
    then
    
    dup "stats" strcmp not if
        pop pop  
        me@ show-stats
        exit
    then
    
    dup "share" strcmp not if
        pop pop
        me@ played-today? if
            me@ generate-share-text
        else
            "❌ You haven't played today's Wordle yet!" tell
        then
        exit
    then
    
    ( Check if it's a word guess )
    dup strlen 5 = if
        pop
        
        ( Check if player has already played today )
        me@ played-today? not if
            me@ init-game
        then
        
        me@ swap make-guess
    else
        pop pop
        "❌ Invalid command. Type 'wordle help' for instructions." tell
    then
;

( Public command entry point )
: cmd-wordle
    command @ "Wordle" setname
    command @ "Guess the daily 5-letter word!" setdesc
    
    do-wordle
;