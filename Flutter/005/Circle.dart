import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Radius : ");
  double? radius = double.parse(stdin.readLineSync()!);

  Circle()
    ..area(radius)
    ..perimeter(radius);
}

class Circle {
  area(double r) {
    print("Area of Circle = ${3.14 * r * r}");
  }

  perimeter(double r) {
    print("Perimeter of Circle = ${2 * 3.14 * r}");
  }
}
