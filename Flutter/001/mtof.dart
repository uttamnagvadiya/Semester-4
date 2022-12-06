import 'dart:io';

void main(List<String> args) {
  print("Meter : ");
  dynamic meter = int.parse(stdin.readLineSync()!);

  double feet = meter * 3.280840;

  print("Feet : $feet");
}
