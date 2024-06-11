import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();

  if (input == null) {
    print('No input provided.');
    return;
  }

  int number;
  try {
    number = int.parse(input);
  } catch (e) {
    print('Invalid input. Please provide an integer.');
    return;
  }

  print('$number is ${getNumberSign(number)}');
}

String getNumberSign(int number) {
  if (number > 0) {
    return 'positive';
  } else if (number == 0) {
    return 'zero';
  } else {
    return 'negative';
  }
}