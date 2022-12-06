import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  dynamic n = int.parse(stdin.readLineSync()!);

  bool flag = true;

  for (var i = 2; i < (n / 2); i++) {
    if (n % i == 0) {
      flag = false;
      break;
    }
  }

  if (flag) {
    print("$n is prime number.");
  } else {
    print("$n is not prime number.");
  }
}
