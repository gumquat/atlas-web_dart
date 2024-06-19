# atlas-web_dart
### Resources
- https://dart.dev/resources/dart-cheatsheet

# Table of Contents
1. [Async in Dart](#async)
2. [Future in Dart](#future)
3. [Final in Dart](#final)
4. [Explaining the Rick and Morty API Task](#rnm-api)

# Async
The async keyword is used to mark a function as asynchronous. This means the function can perform asynchronous operations and can use await to wait for Future results.
- using Async and Await
When a function is marked with async, it returns a Future implicitly. <-- VERY IMPORTANT
```
Future<void> printData() async {
  String data = await fetchData(); // Wait for the Future to complete
  print(data);
}
```
- await: The await keyword is used within an async function to wait for a Future to complete and get its value.

## Future
A Future in Dart represents a potential value or error that will be available at some time in the future. It's used for asynchronous programming, where you perform operations that take time to complete, such as I/O operations, without blocking the main thread.

- Creating a future
```
Future<String> fetchData() {
  // Simulate a network request
  return Future.delayed(Duration(seconds: 2), () => 'Data received');
}
```
- Using a Future
You can handle the result of a Future using then, catchError, and whenComplete methods, or with async and await (explained later).
```
fetchData().then((data) {
  print(data);
}).catchError((error) {
  print('Error: $error');
}).whenComplete(() {
  print('Operation completed');
});

```
## Final
The final keyword in Dart is used to declare a variable that can only be set once. After it's set, its value cannot be changed.
- Using Final
```
final String name = 'Alice';
// name = 'Bob'; // This will cause an error because name is final.
```
- Difference between Final and Const
While final variables can be set only once and their value can be computed at runtime, const variables are compile-time constants and must be assigned a constant value.
```
final DateTime now = DateTime.now(); // Allowed, computed at runtime
const int age = 30; // Must be a compile-time constant
```

## Example using Async, Future, and Final
```
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () => 'Data received');
}

void main() async {
  final result = await fetchData(); // Using await to wait for the Future
  print(result);
}
```
In this example:
- fetchData returns a Future<String> that completes after 2 seconds.
- main is marked as async, allowing the use of await to wait for fetchData to complete and get the result.
- result is declared as final since its value is set once and does not change.

## RnM API

### pubspec.yaml
The 'pubspec.yaml' file is a configuration file used in Dart and Flutter projects. 
It specifies metadata about the project, such as its name, dependencies, and environment constraints.
```
name: rick_and_morty

dependencies:
  http: ^0.13.3

environment:
  sdk: ">=2.12.0 <3.0.0"
```
Breakdown:
- name: The name of the project. In this case, it's rick_and_morty.
- dependencies: A list of packages that the project depends on. Here, the project depends on the http package with a version constraint ^0.13.3. This package is used to make HTTP requests.
- environment: Specifies the version constraints for the Dart SDK. The project requires a Dart SDK version from 2.12.0 up to but not including 3.0.0.
### rick_and_morty.dart
The rick_and_morty.dart file is a Dart script that interacts with the Rick and Morty API to fetch and print character information.
1.) Imports:
- dart:convert: This library is used for encoding and decoding JSON.
- package:http/http.dart as http: This is the HTTP package used to make HTTP requests.
2.) Function: 'printRmCharacters'
- Fetches character data from the API and prints it
- The Base URL for Rick and Morty API is defined as a constant 'baseUrl'
- 'allCharacters' is an apty list to store all the data fetched
- Fetching the Data
  - The function fetches characters in pages using a while loop.
  - 'nextPageUrl' holds the URL for the next page of results. It starts with the base URL.
  - Inside the loop, it sends an HTTP GET request to 'nextPageUrl'.
  - If the request is successful (statusCode == 200), it decodes the JSON response and adds the characters to 'allCharacters'. 'nextPageUrl' is updated to the URL of the next page.
  - If the request fails, it throws an exception.
- After fetching all characters, the function iterates through 'allCharacters' and prints each character's name, species, status, and location.
- Any exceptions encountered during the fetch process are caught and printed.

```
import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:http/http.dart' as http; // Import the http package for making HTTP requests

// Asynchronous function to fetch and print Rick and Morty characters
Future<void> printRmCharacters() async {
  try {
    // Base URL for the Rick and Morty API
    const baseUrl = 'https://rickandmortyapi.com/api/character';

    // Initialize an empty list to store all characters
    final allCharacters = <Map<String, dynamic>>[];

    // URL for the next page of results, starts with the base URL
    String nextPageUrl = baseUrl;
    
    // Loop to fetch all pages of characters
    while (nextPageUrl != null) {
      // Send an HTTP GET request to the next page URL
      final response = await http.get(Uri.parse(nextPageUrl));
      
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body);
        
        // Add the results (characters) to the list
        allCharacters.addAll(data['results']);
        
        // Update nextPageUrl to the next page URL from the response
        nextPageUrl = data['info']['next'];
      } else {
        // Throw an exception if the request failed
        throw Exception('Failed to fetch characters');
      }
    }

    // Loop through all characters and print their details
    for (final character in allCharacters) {
      print('Name: ${character['name']}');
      print('Species: ${character['species']}');
      print('Status: ${character['status']}');
      print('Location: ${character['location']['name']}');
      print('---'); // Separator for readability
    }
  } catch (e) {
    // Catch and print any errors that occur during the fetch process
    print('error caught: $e');
  }
}
```