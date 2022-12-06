import 'dart:io';

void main() {
  stdout.write("Enter the Lowerlimit : ");
  dynamic lower = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Upperlimit : ");
  dynamic upper = int.parse(stdin.readLineSync()!);
  stdout.write("This Numbers is Divisible by 2 but not Divisible by 3. => ");
  for (int i = lower; i <= upper; i++) {
    if (i % 2 == 0 && i % 3 != 0) {
      stdout.write(" $i");
    }
  }
}
