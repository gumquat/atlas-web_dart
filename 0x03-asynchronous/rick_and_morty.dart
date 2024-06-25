import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  final url = Uri.parse('https://rickandmortyapi.com/api/character');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final characters = jsonDecode(response.body)['results'];
      characters.forEach((character) => print(character['name']));
    } else {
      print('Failed to load characters');
    }
  } catch (e) {
    print('Error: $e');
  }
}
