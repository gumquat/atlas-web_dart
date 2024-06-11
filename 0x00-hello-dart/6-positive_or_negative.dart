void main(List<String> args) {
  if (args.isEmpty) {
    print('Please provide a number as an argument.');
    return;
  }

  int number = int.parse(args[0]);

  if (number > 0) {
    print('$number is positive');
  } else if (number == 0) {
    print('$number is zero');
  } else {
    print('$number is negative');
  }
}