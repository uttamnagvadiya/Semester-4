import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Weight in Pound : ");
  dynamic weight = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Height in Inch: ");
  dynamic height = int.parse(stdin.readLineSync()!);

  double kilo = weight * 0.45359237;
  double meter = height * 0.254;

  double bmi = kilo / (meter * meter);

  print('BMI = $bmi');
}
