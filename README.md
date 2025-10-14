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

### 1. Upload the MUF Files

Upload these three files to your MUCK:

- `wordle-answers.muf` - Official Wordle answer words database
- `wordle-guesses.muf` - Extended valid guess words (subset included)
- `wordle.muf` - Main game implementation

### 2. Compile the Program

```
@prog wordle.muf
@compile wordle
```

### 3. Create the Command

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
Modify the color definitions in `wordle.muf` lines 28-34 to match your MUCK's color system:

```forth
$def GREEN "^G"     ( Change to your green color code )
$def YELLOW "^Y"    ( Change to your yellow color code )
$def GRAY "^K"      ( Change to your gray color code )
$def RESET "^N"     ( Change to your reset color code )
```

### Unicode Support
If your MUCK supports Unicode, the emoji squares should display properly. If not, you can modify lines 37-39 to use ASCII alternatives:

```forth
$def GREEN_SQUARE "[G]"
$def YELLOW_SQUARE "[Y]"
$def GRAY_SQUARE "[_]"
```

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

The `wordle-guesses.muf` file currently contains a subset of the full allowed guess list for brevity. To get the complete experience, you should replace the word list with the full official Wordle allowed-guess dictionary (approximately 10,000+ words).

You can find the complete word lists from various Wordle solver repositories online.

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