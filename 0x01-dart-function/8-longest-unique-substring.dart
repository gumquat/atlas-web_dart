String longestUniqueSubstring(String str) {
  if (str.isEmpty) {
    return "";
  }

  int start = 0;
  int maxLength = 0;
  String maxSubstring = "";
  Map<String, int> charIndex = {};

  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    // If the character is already in the dictionary
    // and its index is greater than or equal to the start index
    if (charIndex.containsKey(char) && charIndex[char]! >= start) {
      // Update the start index to the next character
      start = charIndex[char]! + 1;
    }

    // Update the character index dictionary
    charIndex[char] = i;

    // Update the maximum length and substring
    int currentLength = i - start + 1;
    if (currentLength > maxLength) {
      maxLength = currentLength;
      maxSubstring = str.substring(start, start + maxLength);
    }
  }

  return maxSubstring;
}