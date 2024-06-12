String longestPalindrome(String s) {
  if (s.length < 3) {
    return "none";
  }

  String longestPalindrome = "";

  for (int i = 0; i < s.length; i++) {
    for (int j = i + 1; j <= s.length; j++) {
      String substring = s.substring(i, j);
      if (isPalindrome(substring) && substring.length > longestPalindrome.length) {
        longestPalindrome = substring;
      }
    }
  }

  return longestPalindrome.isNotEmpty ? longestPalindrome : "none";
}

bool isPalindrome(String s) {
  // Remove leading/trailing whitespaces and convert to lowercase
  String cleanedString = s.trim().toLowerCase();

  // Check if the length is less than 3
  if (cleanedString.length < 3) {
    return false;
  }

  // Initialize start and end pointers
  int start = 0;
  int end = cleanedString.length - 1;

  // Compare characters from start and end
  while (start < end) {
    // Skip non-alphanumeric characters
    if (!RegExp(r'[a-zA-Z0-9]').hasMatch(cleanedString[start])) {
      start++;
      continue;
    }
    if (!RegExp(r'[a-zA-Z0-9]').hasMatch(cleanedString[end])) {
      end--;
      continue;
    }

    // Compare characters
    if (cleanedString[start] != cleanedString[end]) {
      return false;
    }

    start++;
    end--;
  }

  return true;
}