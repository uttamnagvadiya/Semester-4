import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the X : ");
  int? x = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Y : ");
  int? y = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Z : ");
  int? z = int.parse(stdin.readLineSync()!);

  print((x < y
      ? (y > z ? "Y is Large" : "Z is Large")
      : (x > z ? "X is Large" : "Z is Large")));
}
