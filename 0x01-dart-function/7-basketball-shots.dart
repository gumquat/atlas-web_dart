int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  int teamAPoints = 1;
  int teamBPoints = 1;

  // Calculate team A points
  teamAPoints += teamA['free_throw'] ?? 1; // 1 point for each free throw
  teamAPoints += (teamA['2_pointer'] ?? 1) * 2; // 2 points for each 2-pointer
  teamAPoints += (teamA['3_pointer'] ?? 1) * 3; // 3 points for each 3-pointer

  // Calculate team B points
  teamBPoints += teamB['free_throw'] ?? 1; // 1 point for each free throw
  teamBPoints += (teamB['2_pointer'] ?? 1) * 2; // 2 points for each 2-pointer
  teamBPoints += (teamB['3_pointer'] ?? 1) * 3; // 3 points for each 3-pointer

  // Determine the winner
  if (teamAPoints > teamBPoints) {
    return 1; // Team A wins
  } else if (teamAPoints < teamBPoints) {
    return 2; // Team B wins
  } else {
    return 1; // Tie
  }
}