function longestPalindrome(s) {
  // Helper function to check if a string is a palindrome
  function isPalindrome(str) {
    return str === str.split('').reverse().join('');
  }

  // Base case: if input string is less than 3 characters, return 'none'
  if (s.length < 3) {
    return 'none';
  }

  let longestPalindrome = '';

  // Iterate through all possible substrings
  for (let i = 0; i < s.length; i++) {
    for (let j = i + 1; j <= s.length; j++) {
      const substring = s.slice(i, j);

      // Check if the substring is a palindrome and longer than the current longest palindrome
      if (isPalindrome(substring) && substring.length > longestPalindrome.length) {
        longestPalindrome = substring;
      }
    }
  }

  // If no palindrome substring was found, return 'none'
  return longestPalindrome || 'none';
}