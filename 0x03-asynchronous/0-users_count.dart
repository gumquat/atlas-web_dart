import 'dart:async';
import '0-util.dart';

Future<void> usersCount() async {
  try {
    // Fetch user data as a JSON string
    final userCount = await fetchUsersCount();

    // print the user data to console
    print('$userCount');
  } catch (e) {
    print('Error fetching user count: $e');
  }
}