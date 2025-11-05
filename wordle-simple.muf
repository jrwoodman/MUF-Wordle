( Wordle Game in MUF - Simplified for basic MUF )
( A recreation of the popular Wordle game for MUCK environments )
( Version 1.0 - Compatible with circa 2001 MUCK servers )

( Word database configuration )
( Set this to the dbref of your word database object )
( You must run wordle-db-init first to initialize it )
( Change #1234 to your actual database object dbref )
: get-word-db ( -- dbref )
    #1234  ( CHANGE THIS to your database object )
;

( Get the official Wordle answer word list from database )
: get-answer-words ( -- str )
    get-word-db
    
    ( Read and concatenate all word chunks from properties )
    dup "_words/answers/1" getpropstr
    over "_words/answers/2" getpropstr strcat
    over "_words/answers/3" getpropstr strcat
    over "_words/answers/4" getpropstr strcat
    over "_words/answers/5" getpropstr strcat
    over "_words/answers/6" getpropstr strcat
    over "_words/answers/7" getpropstr strcat
    over "_words/answers/8" getpropstr strcat
    swap "_words/answers/9" getpropstr strcat
;

( Check if a word is valid - uses simple string search )
: valid-word? ( str -- bool )
    ( Add spaces around word for exact matching )
    " " swap strcat " " strcat
    
    ( Add spaces around answer list and search )
    get-answer-words " " swap strcat " " strcat
    instr 0 >
;

( Get the Nth word from a space-separated string )
: get-word-at-index ( str index -- word )
    swap " " explode  ( index str1 str2 ... strN N )
    
    ( Now we have: index str1 str2 ... strN N )
    ( We need to pick the word at 'index' position )
    swap 1 +  ( str1 str2 ... strN N index+1 )
    pick  ( str1 str2 ... strN N word )
    
    ( Clean up the stack - pop all the words and count )
    swap  ( str1 str2 ... strN word N )
    0 begin
        over over >
    while
        rot pop
        1 +
    repeat
    pop pop
;

( Get today's word using deterministic seed )
: get-todays-word ( -- str )
    ( Use system time to generate consistent daily word )
    systime 86400 /  ( days since epoch )
    
    ( Count words in answer list )
    get-answer-words " " explode  ( days str1 str2 ... strN N )
    
    ( Calculate index: days % N )
    over swap %  ( days str1 str2 ... strN index )
    
    ( Get the word at that index - it's already on stack )
    ( Stack is: days str1 str2 ... strN index )
    ( We want: str[index] )
    1 + pick  ( days str1 str2 ... strN word )
    
    ( Clean up - we need to pop everything except the word )
    swap  ( days str1 ... word days )
    pop   ( str1 str2 ... strN word )
    
    ( Count how many items to pop )
    get-answer-words " " explode  ( str1 ... word str1' ... N )
    0 begin
        over over >
    while
        rot pop
        1 +
    repeat
    pop
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
    over "_wordle/word" addprop
    
    ( Initialize attempts )
    0 over "_wordle/attempts" addprop
    
    ( Mark game as active )
    0 over "_wordle/complete" addprop
    
    ( Set last play time to today )
    systime over "_wordle/lastplay" addprop
    
    pop
;

( Check if player has played today )
: played-today? ( player -- bool )
    dup "_wordle/lastplay" getpropval
    dup not if
        pop pop 0 exit
    then
    
    ( Check if last play was today )
    systime 86400 / swap 86400 / =
;

( Update player statistics - simplified version )
: update-stats ( player won? attempts -- )
    ( Increment games played )
    over "_wordle/stats/played" getpropval 1 + 2 pick "_wordle/stats/played" addprop
    
    swap if
        ( Player won )
        dup "_wordle/stats/won" getpropval 1 + over "_wordle/stats/won" addprop
        
        ( Update current streak )
        dup "_wordle/stats/current_streak" getpropval 1 + 
        dup 2 pick "_wordle/stats/current_streak" addprop
        
        ( Update max streak if needed )
        over "_wordle/stats/max_streak" getpropval
        over < if
            over "_wordle/stats/max_streak" addprop
        else
            pop
        then
        
        ( Update guess distribution using individual properties )
        over intostr "_wordle/stats/guess" swap strcat
        over over getpropval 1 + rot rot addprop
        
    else
        ( Player lost - reset current streak )
        0 over "_wordle/stats/current_streak" addprop
        pop
    then
    
    pop
;

( Get current game state )
: get-game-state ( player -- word attempts guesses complete )
    dup "_wordle/word" getpropstr
    over "_wordle/attempts" getpropval
    over "_wordle/guesses" getpropstr
    swap "_wordle/complete" getpropval
;

( Check guess against target and generate colored feedback )
: check-guess ( target guess -- feedback )
    "" swap
    0  ( position counter )
    
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
        
        swap pop  ( remove character )
        1 +  ( increment position )
    repeat
    
    ( Clean up stack )
    pop pop pop
;

( Generate emoji feedback for sharing )
: check-guess-emoji ( target guess -- emoji-str )
    "" swap
    0  ( position counter )
    
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
        
        swap pop  ( remove character )
        1 +  ( increment position )
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
        " " explode  ( word attempts guesses complete str1 str2 ... strN N )
        
        ( Show each guess )
        dup 0 > if
            dup 1 = if
                ( Only one guess )
                6 pick over check-guess
                "  " swap strcat tell
                pop
            else
                dup 2 = if
                    ( Two guesses )
                    6 pick 1 pick check-guess "  " swap strcat tell
                    6 pick 2 pick check-guess "  " swap strcat tell
                    pop pop pop
                else
                    ( Three or more guesses )
                    dup 3 >= if
                        6 pick 2 pick check-guess "  " swap strcat tell
                        6 pick 3 pick check-guess "  " swap strcat tell
                        6 pick 4 pick check-guess "  " swap strcat tell
                        
                        dup 4 > if
                            6 pick 5 pick check-guess "  " swap strcat tell
                        then
                        dup 5 > if
                            6 pick 6 pick check-guess "  " swap strcat tell
                        then
                        dup 6 > if
                            6 pick 7 pick check-guess "  " swap strcat tell
                        then
                        
                        ( Clean up exploded strings )
                        0 begin
                            over over >
                        while
                            rot pop 1 +
                        repeat
                        pop pop
                    then
                then
            then
        else
            pop
        then
    then
    
    ( Show empty rows for remaining attempts )
    dup strlen 0 > if
        " " explode
        6 swap - 0 begin
            over over >
        while
            "  ⬜⬜⬜⬜⬜" tell
            1 +
        repeat
        pop pop
    else
        pop
        "  ⬜⬜⬜⬜⬜" tell
        "  ⬜⬜⬜⬜⬜" tell
        "  ⬜⬜⬜⬜⬜" tell
        "  ⬜⬜⬜⬜⬜" tell
        "  ⬜⬜⬜⬜⬜" tell
        "  ⬜⬜⬜⬜⬜" tell
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
        pop "❌ Not a valid word." tell
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
    
    ( Add guess to guesses list )
    over if
        over " " strcat 4 pick strcat
    else
        4 pick
    then
    
    ( Update guesses property )
    4 pick "_wordle/guesses" addprop
    
    ( Increment attempts )
    over 1 + 4 pick "_wordle/attempts" addprop
    
    ( Check if guess is correct )
    4 pick 3 pick strcmp not if
        ( Correct guess! )
        1 4 pick "_wordle/complete" addprop
        4 pick show-board
        
        ( Update statistics )
        4 pick 1 3 pick 1 + update-stats
        
        "" tell
        "🎊 Great job!" tell
    else
        ( Incorrect guess )
        ( Check if max attempts reached )
        over 1 + 6 >= if
            ( Game over )
            1 4 pick "_wordle/complete" addprop
            4 pick show-board
            
            ( Update statistics )
            4 pick 0 6 update-stats
        else
            ( Show updated board )
            4 pick show-board
        then
    then
    
    ( Clean up stack )
    pop pop pop pop pop
;

( Show player statistics - simplified )
: show-stats ( player -- )
    "" tell
    "📊 YOUR STATISTICS" tell
    "═══════════════════" tell
    
    dup "_wordle/stats/played" getpropval intostr 
    "Games Played: " swap strcat tell
    
    dup "_wordle/stats/won" getpropval over "_wordle/stats/played" getpropval
    dup 0 = if
        pop pop "Win Rate: 0%"
    else
        swap 100 * swap / intostr "Win Rate: " swap strcat "%" strcat
    then
    tell
    
    dup "_wordle/stats/current_streak" getpropval intostr
    "Current Streak: " swap strcat tell
    
    dup "_wordle/stats/max_streak" getpropval intostr
    "Max Streak: " swap strcat tell
    
    "" tell "GUESS DISTRIBUTION" tell
    "─────────────────" tell
    
    ( Show distribution for each guess count )
    1 begin
        dup 6 <= while
        over over intostr "_wordle/stats/guess" swap strcat getpropval
        over intostr ":" strcat " " strcat 
        over 0 > if
            over 0 do "█" strcat loop
        then
        " (" strcat swap intostr strcat ")" strcat
        tell
        1 +
    repeat
    pop
    
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
