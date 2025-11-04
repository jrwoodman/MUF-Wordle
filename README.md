# MUF Wordle Game

A complete implementation of the popular Wordle game for MUCK environments, written in Multi-User Forth (MUF).

## Features

- **Official Word Lists**: Uses the actual Wordle answer list (2,315 words) and extended guess validation
- **Daily Words**: Deterministic daily word selection that's consistent across all players
- **Authentic Gameplay**: 6 attempts, 5-letter words, colored feedback system
- **Player Statistics**: Tracks games played, win rate, streaks, and guess distribution
- **Shareable Results**: Generate emoji-based results to share (like the real Wordle)
- **Persistent State**: Game state and statistics saved to player properties
- **Color Coding**: Visual feedback using MUCK color codes
- **Unicode Support**: Emoji squares for enhanced visual experience

## Installation

### Step 1: Create Database Object

First, create an object to hold the word lists:

```
@create Wordle-DB
```

Note the dbref (e.g., `#1234`) that is returned.

### Step 2: Initialize Database

Compile and run the database initialization program:

```
@prog wordle-db-init.muf
@compile wordle-db-init
```

Run it with your database object dbref:

```
wordle-db-init #1234
```

This will store all the word lists as properties on the database object.

### Step 3: Configure Main Program

Edit `wordle.muf` and change line 12 to use your database object dbref:

```forth
: get-word-db ( -- dbref )
    #1234  ( CHANGE THIS to your database object dbref )
;
```

### Step 4: Compile Main Program

```
@prog wordle.muf
@compile wordle
```

### Step 5: Create Command

Create an action to run the game:

```
@action wordle;w;word=#<your-exit-number>
@link wordle=$wordle
```

Or attach it to a global command object if your MUCK uses that system.

## Usage

### Basic Commands

- `wordle` - Start a new game or show current game status
- `wordle <word>` - Make a guess (e.g., `wordle ABOUT`)
- `wordle status` - Display current game board
- `wordle stats` - Show your personal statistics
- `wordle share` - Generate shareable result
- `wordle help` - Show help information

### Game Rules

1. Guess the 5-letter word in 6 attempts or fewer
2. Each guess must be a valid English word
3. After each guess, you'll get color-coded feedback:
   - 🟩 **Green**: Correct letter in the correct position
   - 🟨 **Yellow**: Correct letter in the wrong position
   - ⬜ **Gray**: Letter not in the word

4. A new word is available each day at midnight

### Example Gameplay

```
> wordle
🎯 Welcome to Wordle!

Guess the 5-letter word in 6 attempts!
🟩 Green: Correct letter, correct position
🟨 Yellow: Correct letter, wrong position
⬜ Gray: Letter not in word

═══════════════════════════════════════
                WORDLE
═══════════════════════════════════════

  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜

Attempts: 0/6

> wordle AROSE
═══════════════════════════════════════
                WORDLE
═══════════════════════════════════════

  ^K A ^N ^Y R ^N ^K O ^N ^K S ^N ^Y E ^N
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜
  ⬜⬜⬜⬜⬜

Attempts: 1/6
```

## Configuration

### Color Codes
The game uses ANSI escape sequences for colors (lines 44-48 in `wordle.muf`):

```forth
( GREEN = "\[[32m" )
( YELLOW = "\[[33m" )
( GRAY = "\[[90m" )
( RESET = "\[[0m" )
( BOLD = "\[[1m" )
```

If your MUCK uses different color codes, modify the color strings in lines 184, 189, and 192.

### Unicode Support
The game uses Unicode emoji squares (🟩🟨⬜) for visual feedback. If your MUCK doesn't support Unicode, you can replace these in lines 221, 226, and 229 with ASCII alternatives like `[G]`, `[Y]`, and `[_]`.

## Statistics Tracking

The game tracks these statistics per player:
- Total games played
- Games won
- Win percentage
- Current win streak
- Best win streak
- Guess distribution (how many games won in 1, 2, 3, 4, 5, or 6 guesses)

Statistics are stored in player properties and persist across sessions.

## Technical Details

### Property Names
Game state and statistics are stored using these property prefixes:
- `_wordle/word` - Current day's target word
- `_wordle/attempts` - Number of attempts made
- `_wordle/guesses` - Space-separated list of guesses
- `_wordle/complete` - Whether today's game is finished
- `_wordle/stats/*` - Various statistics

### Word Selection
- Daily words are selected deterministically using `systime 86400 /` as a seed
- The same word will be consistent for all players on the same day
- Uses modulo operation against the answer list to select the daily word

### Validation
- Guesses are validated against both the answer word list and extended guess list
- Input is converted to uppercase for consistent processing
- Word length and validity are checked before processing guesses

## Extending the Word Lists

Currently, only the 2,315 official answer words are validated for guesses. To add the extended guess list (approximately 10,000+ words):

1. Expand `wordle-db-init.muf` to include additional word chunks
2. Update the `get-guess-words` function in `wordle.muf` to read from additional properties
3. Re-run the database initialization

You can find the complete Wordle word lists from various Wordle solver repositories online.

## Troubleshooting

### Common Issues

1. **Colors not displaying**: Check your MUCK's color code format and update the `$def` statements accordingly.

2. **Words not recognized**: Ensure both word list files are properly included and compiled.

3. **Statistics not saving**: Verify that players have permission to set properties on themselves.

4. **Daily word inconsistency**: Make sure system time is consistent across your MUCK server.

### Debug Commands
You can add temporary debug output by modifying the word selection function to display the current day number and selected word index.

## License

This implementation is provided as-is for educational and entertainment purposes. The word lists are based on the original Wordle game by Josh Wardle.

## Contributing

Feel free to modify and enhance this implementation for your MUCK. Some potential improvements:

- Hard mode (reuse confirmed letters)
- Multiplayer competitions
- Different word lengths
- Additional language support
- Integration with MUCK economy systems

---

Happy Wordling! 🎯