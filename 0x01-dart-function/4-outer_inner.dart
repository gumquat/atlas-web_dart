// Outer function
void outer(String name, String id) {
  String fullName = inner(name);
  print('Full Name: $fullName, ID: $id');
}

// Inner function
String inner(String name) {
  List<String> nameParts = name.split(' ');
  String firstName = nameParts[0];
  String lastName = nameParts[1];
  return '$lastName $firstName';
}