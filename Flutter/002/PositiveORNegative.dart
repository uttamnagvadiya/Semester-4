import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  int? number = int.parse(stdin.readLineSync()!);

  if (number < 0) {
    print("This Number is Negative.");
  } else {
    print("This Number is Positive.");
  }
}
