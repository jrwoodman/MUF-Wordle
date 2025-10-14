# Changelog

All notable changes to the MUF Wordle project will be documented in this file.

## [1.0.0] - 2025-01-14

### Added
- Initial release of MUF Wordle game
- Complete implementation of Wordle gameplay mechanics
- Official Wordle answer word list (2,315 words)
- Extended valid guess word list (partial implementation)
- Daily word selection with deterministic consistency
- Player statistics tracking:
  - Games played/won
  - Win percentage
  - Current and maximum win streaks
  - Guess distribution histogram
- Color-coded visual feedback system
- Emoji-based shareable results
- Comprehensive help system
- Persistent game state across sessions
- Multiple command options:
  - `wordle` - Start/show game
  - `wordle <word>` - Make guess
  - `wordle status` - Show current board
  - `wordle stats` - View personal statistics
  - `wordle share` - Generate shareable results
  - `wordle help` - Show help information

### Technical Features
- Proper MUF stack management
- Error handling and input validation
- Configurable color system for different MUCKs
- Unicode emoji support with ASCII fallbacks
- Property-based data persistence
- Modular code structure with separate word databases

### Documentation
- Comprehensive README with installation instructions
- Installation notes with troubleshooting guide
- MIT License
- Inline code documentation

## Future Enhancements (Planned)

### [1.1.0] - Planned
- Complete extended guess word list
- Hard mode implementation
- Multiple language support
- Admin commands for game management

### [1.2.0] - Planned  
- Multiplayer competition modes
- Tournament system
- Leaderboards
- Integration with MUCK economy systems

### [1.3.0] - Planned
- Different word lengths (4, 6, 7 letter modes)
- Custom word lists
- Themed word categories
- Time-based challenges

---

## Version Numbering

This project follows [Semantic Versioning](https://semver.org/):
- MAJOR version for incompatible API changes
- MINOR version for new functionality (backwards compatible)  
- PATCH version for bug fixes (backwards compatible)