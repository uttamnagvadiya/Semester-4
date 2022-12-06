import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  dynamic numb = int.parse(stdin.readLineSync()!);
  int n = numb;
  dynamic fact = 1;
  while (numb > 0) {
    fact = fact * numb;
    numb--;
  }
  print("$fact factorial of $n");
}
