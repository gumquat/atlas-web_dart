public static int whoWins(Map<String, Integer> teamA, Map<String, Integer> teamB) {
    int teamAPoints = calculatePoints(teamA);
    int teamBPoints = calculatePoints(teamB);

    if (teamAPoints > teamBPoints) {
        return 1;
    } else if (teamAPoints < teamBPoints) {
        return 2;
    } else {
        return 0;
    }
}

private static int calculatePoints(Map<String, Integer> team) {
    int points = 0;
    for (Map.Entry<String, Integer> entry : team.entrySet()) {
        String shotType = entry.getKey();
        int shotCount = entry.getValue();

        switch (shotType) {
            case "free_throw":
                points += shotCount;
                break;
            case "2_pointer":
                points += shotCount * 2;
                break;
            case "3_pointer":
                points += shotCount * 3;
                break;
        }
    }
    return points;
}