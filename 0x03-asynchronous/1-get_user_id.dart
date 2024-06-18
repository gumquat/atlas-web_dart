import 'dart:convert';
import '1-util.dart';

Future<String> getUserId() async {
  try {
    // Fetch user data as a JSON string
    final userDataJson = await fetchUserData();

    // Parse the JSON string into a Map
    final userData = jsonDecode(userDataJson);

    // Extract the user ID from the fetched data
    final userId = userData['id'];
    
    // return the user ID
    return userId;
  } catch (e) {
    // Handle any errors
    print('Error fetching user ID: $e');
    return '';
  }
}