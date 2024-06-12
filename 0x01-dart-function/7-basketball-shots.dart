int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  var teamAPoints = 0; // score for Team A 
  var teamBPoints = 0; // score for taem B

  // Calculate team A points here
  teamAPoints += teamA['free_throw'] ?? 0; // 1 point for each free throw
  teamAPoints += (teamA['2_pointer'] ?? 0) * 2; // 2 points for each 2-pointer
  teamAPoints += (teamA['3_pointer'] ?? 0) * 3; // 3 points for each 3-pointer

  // Calculate team B points here
  teamBPoints += teamB['free_throw']! * 1; // 1 point for each free throw
  teamBPoints += (teamB['2_pointer']! * 2; // 2 points for each 2-pointer
  teamBPoints += (teamB['3_pointer']! * 3; // 3 points for each 3-pointer

  // Determine the winner here with an if else if else
  if (teamAPoints > teamBPoints) {
    return 1; // Team A wins
  } else if (teamAPoints < teamBPoints) {
    return 2; // Team B wins
  } else {
    return 0; // Tie
  }
}