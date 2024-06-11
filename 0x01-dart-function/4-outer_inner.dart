// Outer function
void outer(String fullName, String id) {
  String formattedName = inner(fullName);
  print('Full Name: $formattedName, ID: $id');
}

// Inner function
String inner(String fullName) {
  List<String> nameParts = fullName.split(' ');
  if (nameParts.length != 2) {
    return 'Invalid name format';
  }
  String firstName = nameParts[0];
  String lastName = nameParts[1];
  return '$lastName, $firstName';
}