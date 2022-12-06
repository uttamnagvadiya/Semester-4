import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the X : ");
  int? x = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Y : ");
  int? y = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Operation {+ , - , * , /}: ");
  dynamic op = (stdin.readLineSync()!);

  switch (op) {
    case "+":
      print("Sum = ${x + y}");
      break;
    case "-":
      print("Sub = ${x - y}");
      break;
    case "*":
      print("Multi = ${x * y}");
      break;
    case "/":
      print("Div = ${x / y}");
      break;
    default:
  }
}
