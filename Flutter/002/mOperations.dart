import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the X : ");
  int? x = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Y : ");
  int? y = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Operation : ");
  int? op = int.parse(stdin.readLineSync()!);

  if (op == 1) {
    print("Sum = ${x + y}");
  } else if (op == 2) {
    print("Sub = ${x - y}");
  } else if (op == 3) {
    print("Multi = ${x * y}");
  } else if (op == 4) {
    print("Div = ${x / y}");
  } else {
    print("Not Found.");
  }
}
