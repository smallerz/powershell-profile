# FUNCTIONS

# Convert a single character to its Unicode code point value
function convertCharToUnicodeCodePoint($char) {
  'U+{0:X4}' -f [int][char]$char
}

# Convert a single Unicode code point value to its glyph
function convertUnicodeCodePointToChar($codepoint) {
  [Convert]::ToChar([int][Convert]::ToInt32($codepoint, 16))
}

# Get the Unicode category for a single character
function getCharUnicodeCategory($char) {
  [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($char)
}

# Delete an item. WARNING:
# If the item is a directory, it will delete *everything* inside of it.
function rimraf($path) {
  remove-item $path -recurse -force
}

# GLOBAL VARIABLES

$global:DefaultUser = [System.Environment]::UserName

# ALIASES

set-alias gyp convertUnicodeCodePointToChar
set-alias ucp convertCharToUnicodeCodePoint
set-alias uct getCharUnicodeCategory

# MODULES

import-module posh-git
import-module oh-my-posh

# THEME

set-theme paradox