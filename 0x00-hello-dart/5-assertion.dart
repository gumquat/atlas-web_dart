void main(List<String> args) {
  int score = 85; // Assign the score value here
  assert(score >= 80, "Uncaught Error: Assertion failed: The score must be bigger or equal to 80');
  print("You Passed");
}