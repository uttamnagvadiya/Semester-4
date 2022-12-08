import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter value of Principal : ");
  int? principal = int.parse(stdin.readLineSync()!);
  stdout.write("Enter value of Rate : ");
  int? rate = int.parse(stdin.readLineSync()!);
  stdout.write("Enter value of Time period : ");
  int? time = int.parse(stdin.readLineSync()!);

  intrest(principal, rate, time);
}

void intrest(int p, int r, int t) {
  print("Intrest = ${p * r * t}");
}
