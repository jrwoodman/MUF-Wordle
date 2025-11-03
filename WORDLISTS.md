# Word List Options for MUF Wordle

This document explains the different word list configurations available for your Wordle implementation.

## Available Files

### wordle-answers.muf (14KB)
- **2,269 words** - The official Wordle answer list
- Always required - contains words that can be the daily solution
- Already in use by the current implementation

### wordle-guesses.muf (4.7KB) 
- **Partial list** - Small subset of valid guesses (~200 words)
- Original placeholder file with incomplete data
- Suitable for testing but not recommended for production

### wordle-guesses-full.muf (77KB) - **NEW**
- **12,604 words** - Complete extended valid guess list
- All valid 5-letter words accepted by official Wordle
- Extracted from official Wordle dictionary
- Formatted for MUCK with ~80 words per line (prevents line length issues)

## Implementation Options

### Option 1: Full Validation (Recommended)
Use the complete word list for authentic Wordle experience:

**Edit wordle.muf line 10:**
```forth
$include wordle-guesses-full
```

**Pros:**
- Authentic Wordle experience
- Players can use obscure but valid words
- Matches official game behavior

**Cons:**
- Larger file size (77KB)
- Slightly more memory usage in MUCK

### Option 2: Answer List Only (Simplest)
Only accept words from the answer list:

**Edit wordle.muf - replace the `valid-word?` function around line 42:**
```forth
: valid-word? ( str -- bool )
    ( Only check answer words - more restrictive )
    get-answer-words " " explode_array
    swap array_findval -1 = not
;
```

**Pros:**
- Minimal file size
- Faster validation
- Still very playable (2,269 valid words)

**Cons:**
- More restrictive than official Wordle
- Some valid English words will be rejected

### Option 3: Partial List (Current Default)
Keep using the small subset:

**No changes needed** - this is the current configuration.

**Pros:**
- Small file size
- Acceptable for testing

**Cons:**
- Many valid words rejected
- Poor player experience
- Not recommended for production

## Recommendation

**Use Option 1** (full validation) by changing line 10 in `wordle.muf` to:
```forth
$include wordle-guesses-full
```

The 77KB file size is not excessive for modern MUCKs, and provides the authentic Wordle experience players expect.

## File Statistics

| File | Size | Words | Words/Line | Lines |
|------|------|-------|------------|-------|
| wordle-answers.muf | 14KB | 2,269 | All in one string | 1 |
| wordle-guesses.muf | 4.7KB | ~200 | All in one string | 1 |
| wordle-guesses-full.muf | 77KB | 12,604 | ~80 | 174 |

## Testing

After making your choice, test with both common and obscure words:

```
wordle ARISE   ( common word - should work with any option )
wordle XYLYL   ( obscure word - only works with full list )
wordle ZZZZZ   ( invalid - should fail with all options )
```

## Source

The complete word list was sourced from the official Wordle game dictionary, ensuring compatibility with the actual game's validation rules.
