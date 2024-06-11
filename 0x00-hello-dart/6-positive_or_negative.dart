void main(List<String> args){
  if (args.length <= 0)
    print('Provide a real input please');
    return;

  int number = int.parse(args[0]);
  if (number > 0) {
    print('$number is positive');
  } else if (number == 0) {
    print('$number is zero');
  } else {
    print('$number is negative');
  }
}
