#region FUNCTIONS
# Convert a single character to its Unicode code point value
function ConvertTo-CodePoint($char) {
  'U+{0:X4}' -f [int][char]$char;
}

# Convert a single Unicode code point value to its glyph
function ConvertTo-Glyph($codepoint) {
  if ($codepoint -like "U+*") {
    $codepoint = $codepoint.substring(2);
  }

  [char][Convert]::ToInt32($codepoint, 16);
}

# Get the Unicode category for a single character
function Get-UnicodeCategory($char) {
  [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($char);
}

# Delete an item.
# WARNING:
# If the item is a directory, it will delete *everything* inside of it.
function Remove-RecursiveItem($path) {
  Remove-Item $path -Recurse -Force;
}
#endregion

#region GLOBAL VARIABLES
$global:DefaultUser = [System.Environment]::UserName;
#endregion

#region ALIASES
Set-Alias codepoint ConvertTo-CodePoint;
Set-Alias glyph ConvertTo-Glyph;
Set-Alias rimraf Remove-RecursiveItem;
Set-Alias ucat Get-UnicodeCategory;
#endregion

#region MODULES
Import-Module posh-git;
Import-Module oh-my-posh;
#endregion

#region THEME
Set-Theme Paradox;
#endregion