import 'dart:io';

void main() {
  print('Enter a number:\n');
  String? input = stdin.readLineSync();

  if (input != null) {
    int number = int.parse(input);

    if (number > 0) {
      print('$number is positive\n');
    } else if (number == 0) {
      print('$number is zero\n');
    } else {
      print('$number is negative\n');
    }
  } else {
    print('Invalid input\n');
  }
}