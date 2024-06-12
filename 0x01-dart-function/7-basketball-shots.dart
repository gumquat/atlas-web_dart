int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  int teamAPoints = 0;
  int teamBPoints = 0;

  // Calculate team A points
  int freeThrowA = teamA.containsKey('free_throw') ? teamA['free_throw']! : 0;
  int twoPointerA = teamA.containsKey('2_pointer') ? teamA['2_pointer']! : 0;
  int threePointerA = teamA.containsKey('3_pointer') ? teamA['3_pointer']! : 0;

  teamAPoints += freeThrowA; // 1 point for each free throw
  teamAPoints += twoPointerA * 2; // 2 points for each 2-pointer
  teamAPoints += threePointerA * 3; // 3 points for each 3-pointer

  // Calculate team B points
  int freeThrowB = teamB.containsKey('free_throw') ? teamB['free_throw']! : 0;
  int twoPointerB = teamB.containsKey('2_pointer') ? teamB['2_pointer']! : 0;
  int threePointerB = teamB.containsKey('3_pointer') ? teamB['3_pointer']! : 0;

  teamBPoints += freeThrowB; // 1 point for each free throw
  teamBPoints += twoPointerB * 2; // 2 points for each 2-pointer
  teamBPoints += threePointerB * 3; // 3 points for each 3-pointer

  // Determine the winner
  if (teamAPoints > teamBPoints) {
    return 1; // Team A wins
  } else if (teamAPoints < teamBPoints) {
    return 2; // Team B wins
  } else {
    return 0; // Tie
  }
}