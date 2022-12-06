import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  dynamic n = int.parse(stdin.readLineSync()!);

  dynamic rem;

  while (n > 0) {
    rem = n % 10;
    n = (n ~/ 10);
    stdout.write(rem);
  }
}
