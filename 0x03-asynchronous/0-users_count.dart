import 'dart:async';

Future<void> usersCount() {
  try {
    final userCount = await fetchUsersCount();
    print('Number of users: $userCount');
  } catch (e) {
    print('Error fetching user count: $e');
  }
}

// Simulated fetchUsersCount() function
Future<int> fetchUsersCount() {
  return Future.delayed(const Duration(seconds: 2), () => 42);
}