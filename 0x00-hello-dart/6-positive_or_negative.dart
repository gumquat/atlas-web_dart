import 'dart:io';

void main() {
  print('Enter a number:');
  String? input = stdin.readLineSync();

  if (input != null) {
    int number = int.parse(input);

    if (number > 0) {
      print('$number is positive');
    } else if (number == 0) {
      print('$number is zero');
    } else {
      print('$number is negative');
    }
  }
}