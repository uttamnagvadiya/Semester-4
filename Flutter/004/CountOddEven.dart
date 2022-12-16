import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number : ");
  int? n = int.parse(stdin.readLineSync()!);

  counter(n);
}

counter(int n) {
  var list = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter value at index [$i] = ");
    list.add(int.parse(stdin.readLineSync()!));
  }

  int oddCount = 0, evenCount = 0, zero = 0;

  for (int i = 0; i < list.length; i++) {
    if (list[i] == 0) {
      zero++;
    } else if (list[i] % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  print("Odd Numbers = $oddCount");
  print("Zeros = $zero");
  print("Even Numbers = $evenCount");
}
