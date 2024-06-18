import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    // Fetch user data as a JSON string
    final userDataJson = await fetchUserData();

    // Parse the JSON string into a Map
    final userData = jsonDecode(userDataJson);

    // Extract username from the fetched data
    final username = userData['username'];

    return 'Hello $username';
  } catch (e) {
    return 'error caught: $e';
  }
}

Future<String> loginUser() async {
  try {
    // Check user credentials
    final isValidCredentials = await checkCredentials();

    print('There is a user: $isValidCredentials');

    if (isValidCredentials) {
      // If credentials are valid, greet the user
      final greeting = await greetUser();
      return greeting;
    } else {
      // If credentials are invalid, return the error message
      return 'Wrong credentials';
    }
  } catch (e) {
    return 'error caught: $e';
  }
}