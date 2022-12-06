import 'dart:io';

void main(List<String> args) {
  int odd_sum = 0, even_sum = 0;
  while (true) {
    stdout.write("Enter the Number : ");
    int? n = int.parse(stdin.readLineSync()!);

    if (n == 0) {
      print("Sum of Negative Odd Number is ${odd_sum}");
      print("Sum of Positive Even Number is ${even_sum}");
      exit(0);
    } else if (n % 2 == 0 && n > 0) {
      even_sum += n;
    } else if (n % 2 != 0 && n < 0) {
      odd_sum += n;
    }
  }
}
