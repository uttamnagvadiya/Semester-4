import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  stdout.write("Enter value of X : ");
  double? x = double.parse(stdin.readLineSync()!);
  stdout.write("Enter value of Y : ");
  double? y = double.parse(stdin.readLineSync()!);

  maximum(x, y);
}

maximum(double x, double y) {
  print(x > y ? "X is Large." : "Y is Large.");
}
