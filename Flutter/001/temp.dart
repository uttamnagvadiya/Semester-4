import 'dart:io';

void main() {
  print("Enter Temp in Fahrenheit : ");
  dynamic fahrenheit = int.parse(stdin.readLineSync()!);
  double ceisius = ((fahrenheit - 32) * 5) / 9;
  print('Temp in Celsius = ${ceisius}');
}
