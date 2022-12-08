import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  dynamic n = int.parse(stdin.readLineSync()!);

  check(n);
}

check(int n) {
  bool flag = true;

  for (var i = 2; i < (n / 2); i++) {
    if (n % i == 0) {
      flag = false;
      break;
    }
  }

  print(flag && n != 0 && n != 1 ? "1" : "0");
}
