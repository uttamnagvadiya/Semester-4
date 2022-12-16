import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Radius : ");
  double? radius = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Base : ");
  double? base = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the Height : ");
  double? height = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Area : ");
  double? area = double.parse(stdin.readLineSync()!);

  findArea(radius: radius, base: base, height: height, area: area);
}

void findArea(
    {double radius = 0, double base = 0, double height = 0, double area = 0}) {
  double? areaOfCircle = 3.14 * radius * radius;
  print("Area of Circle = $areaOfCircle");

  double? areaOfTriangle = 0.5 * base * height;
  print("Area of Tringle = $areaOfTriangle");

  double? areaOfSquare = area * area;
  print("Area of Square = $areaOfSquare");
}
