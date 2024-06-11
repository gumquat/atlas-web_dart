void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Please provide a single argument.');
    return;
  }

  int number;
  try {
    number = int.parse(arguments[0]);
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