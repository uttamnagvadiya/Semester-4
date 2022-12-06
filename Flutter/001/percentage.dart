import 'dart:io';

void main() {
  print('s1 : ');
  dynamic s1 = int.parse(stdin.readLineSync()!);
  print("s2 : ");
  dynamic s2 = int.parse(stdin.readLineSync()!);
  print("s3 : ");
  dynamic s3 = int.parse(stdin.readLineSync()!);
  print("s4 : ");
  dynamic s4 = int.parse(stdin.readLineSync()!);
  print("s5 : ");
  dynamic s5 = int.parse(stdin.readLineSync()!);

  double percentage = ((s1 + s2 + s3 + s4 + s5) * 100) / 500;

  print("Percentage is = ${percentage}%");
}
