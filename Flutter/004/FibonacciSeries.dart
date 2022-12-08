import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  int? numb = int.parse(stdin.readLineSync()!);

  fibonacciSeries(numb);
}

fibonacciSeries(int n) {
  int x = 0, y = 1, flag = 0;

  for (var i = 1; i < n; i++) {
    stdout.write(" $x");
    flag = x + y;
    x = y;
    y = flag;
  }

  stdout.write(" $x");
}
