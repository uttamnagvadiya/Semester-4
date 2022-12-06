import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the X : ");
  int? x = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Y : ");
  int? y = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Z : ");
  int? z = int.parse(stdin.readLineSync()!);

  if (x < y) {
    if (y > z) {
      print("Y is Large.");
    } else {
      print("Z is Large.");
    }
  } else {
    if (x > z) {
      print("X is Large");
    } else {
      print("Z is Large");
    }
  }
}
