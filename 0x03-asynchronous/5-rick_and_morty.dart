import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    // Base URL for the Rick and Morty API
    const baseUrl = 'https://rickandmortyapi.com/api/character';

    // Initialize an empty list to store all characters
    final allCharacters = <Map<String, dynamic>>[];

    // Fetch characters in pages
    String nextPageUrl = baseUrl;
    while (nextPageUrl != null) {
      final response = await http.get(Uri.parse(nextPageUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        allCharacters.addAll(data['results']);
        nextPageUrl = data['info']['next'];
      } else {
        throw Exception('Failed to fetch characters');
      }
    }

    // Print all characters
    for (final character in allCharacters) {
      print('Name: ${character['name']}');
      print('Species: ${character['species']}');
      print('Status: ${character['status']}');
      print('Location: ${character['location']['name']}');
      print('---');
    }
  } catch (e) {
    print('error caught: $e');
  }
}