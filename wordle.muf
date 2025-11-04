( Wordle Game in MUF )
( A recreation of the popular Wordle game for MUCK environments )
( Using official Wordle word lists for authentic gameplay )

$version 1.0
$author YourName  
$note Wordle game - guess the daily 5-letter word in 6 tries

$include wordle-answers
$include wordle-guesses

( Property names for game state - defined as literals )
( No $def support, using direct string/number replacements )

( Game constants )
( WORD_LENGTH = 5 )
( MAX_ATTEMPTS = 6 )

( Color codes for output - adjust these for your MUCK's color system )
( GREEN = "^G" )
( YELLOW = "^Y" )
( GRAY = "^K" )
( RESET = "^N" )
( BOLD = "^B" )
( UNDERLINE = "^U" )

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
            "^G" swap strcat "^N" strcat strcat
        else
            ( Check if letter exists elsewhere in target )
            4 pick over instr if
                ( Letter exists but wrong position - yellow )
                "^Y" swap strcat "^N" strcat strcat
            else
                ( Letter not in word - gray )
                "^K" swap strcat "^N" strcat strcat
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
    "^B                WORDLE^N" tell
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
            "^B^G🎉 Congratulations! You found it!^N" tell
        else
            "😞 Better luck tomorrow! The word was: ^B" 4 pick strcat "^N" strcat tell
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