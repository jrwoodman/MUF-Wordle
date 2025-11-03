# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

MUF Wordle is a complete implementation of the Wordle game for MUCK environments, written in Multi-User Forth (MUF). The game uses official Wordle word lists and provides authentic gameplay with persistent player statistics.

## Key Commands

### Compilation and Installation
The MUF program must be compiled within the MUCK environment itself, not via command-line tools:
```
@prog wordle.muf
@compile wordle
```

After compilation, create the command action:
```
@action wordle;w;word=#<exit-number>
@link wordle=$wordle
```

### Testing
Test the implementation within MUCK using:
- `wordle help` - Verify command system works
- `wordle` - Start a game
- `wordle ABOUT` - Test guess validation
- `wordle stats` - Verify statistics tracking

No automated test suite exists; testing must be done manually in a MUCK environment.

## Code Architecture

### File Structure
- **wordle.muf** - Main game implementation with all logic
- **wordle-answers.muf** - 2,315 official Wordle answer words (included via `$include`)
- **wordle-guesses.muf** - Extended valid guess word list (partial, included via `$include`)

### Core Components

#### Game State Management
Player game state is persisted using MUCK property system with prefix `_wordle/`:
- Current target word, attempt count, guesses list, completion status
- Statistics: games played, won, streaks, guess distribution

Properties are accessed via MUF primitives like `getprop`, `setprop`, `getpropstr`, `setpropstr`.

#### Daily Word Selection
Words are selected deterministically using `systime 86400 /` (days since epoch) as seed, modulo the answer list size. This ensures all players on the same MUCK get the same daily word.

#### Guess Validation System
Two-tier validation:
1. Check against answer word list (2,315 words)
2. Check against extended guess list (partial implementation)

Word validation is case-insensitive (converted to uppercase via `toupper`).

#### Feedback Generation
Two parallel feedback systems:
- **check-guess**: Generates colored text output using MUCK color codes (`^G`, `^Y`, `^K`, `^N`)
- **check-guess-emoji**: Generates Unicode emoji squares (🟩🟨⬜) for shareable results

Both use character-by-character comparison:
1. Exact position match → Green
2. Letter exists elsewhere → Yellow  
3. Letter not in word → Gray

#### Statistics Tracking
The `update-stats` function maintains:
- Total games played/won with percentage calculation
- Current and maximum win streaks
- Guess distribution stored as comma-separated array

Statistics persist across sessions and daily games.

### MUF Language Specifics

**Stack-Based Operations**: MUF is a Forth dialect using reverse Polish notation. All functions manipulate a data stack. Comments like `( player -- )` indicate stack effects (inputs -- outputs).

**String Manipulation**: Uses primitives like `strcut`, `strcat`, `instr`, `strlen`, `toupper` for string operations.

**Control Structures**: Uses `if...then...else`, `begin...while...repeat`, and `do...loop` with stack-based conditions.

**Array Operations**: Uses `explode_array`, `array_getitem`, `array_setitem`, `array_findval`, `array_count`, `array_join` for list manipulation.

### Customization Points

#### Color Codes (lines 28-34)
MUCKs use different color code systems. Current implementation uses:
```forth
$def GREEN "^G"
$def YELLOW "^Y"
$def GRAY "^K"
$def RESET "^N"
```
These must be adjusted per MUCK variant (TinyMUCK, ProtoMUCK, etc.).

#### Unicode Support (lines 37-39)
Emoji squares may need ASCII alternatives for MUCKs without Unicode:
```forth
$def GREEN_SQUARE "[G]"
$def YELLOW_SQUARE "[Y]"
$def GRAY_SQUARE "[_]"
```

#### Word Lists
The `wordle-guesses.muf` file contains a partial subset. For full Wordle experience, expand to ~10,000+ words from official Wordle dictionaries.

## Development Notes

### MUCK Environment Requirements
- Standard MUF array functions support
- Player property read/write permissions
- System time access (`systime` primitive)
- Compatible with TinyMUCK, ProtoMUCK, and similar variants

### Common Patterns
- All player interactions use `me@` to reference the current player
- Property operations should always clean up the stack (`pop`)
- Word validation happens before any game state modification
- Game initialization checks `played-today?` before resetting state

### Debugging Approach
Since MUF has limited debugging tools:
1. Add temporary `tell` statements to output intermediate values
2. Check property values directly using MUCK commands like `examine`
3. Verify word list inclusion by testing known valid/invalid words
4. Use the word selection function with manual timestamps to verify determinism
