int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  int teamAPoints = calculateTeamPoints(teamA);
  int teamBPoints = calculateTeamPoints(teamB);

  if (teamAPoints > teamBPoints) {
    return 1; // Team A wins
  } else if (teamAPoints < teamBPoints) {
    return 2; // Team B wins
  } else {
    return 0; // Tie
  }
}

int calculateTeamPoints(Map<String, int> team) {
  int points = 0;

  // Safe null access with null-aware operators
  points += team['Free throws'] ?? 0; // 1 point per free throw
  points += (team['2 pointers'] ?? 0) * 2; // 2 points per 2-pointer
  points += (team['3 pointers'] ?? 0) * 3; // 3 points per 3-pointer

  return points;
}