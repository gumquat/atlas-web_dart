import 'dart:async';
import '0-util.dart';

Future<void> usersCount() async {
  try {
    final userCount = await fetchUsersCount();
    print('Number of users: $userCount');
  } catch (e) {
    print('Error fetching user count: $e');
  }
}