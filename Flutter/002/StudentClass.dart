import 'dart:io';

void main(List<String> args) {
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

  if (percentage < 35) {
    print("You are Fail.");
  } else if (percentage >= 35 && percentage < 45) {
    print("You are Pass.");
  } else if (percentage >= 45 && percentage < 60) {
    print("You are Second Class");
  } else if (percentage >= 60 && percentage < 70) {
    print("You are First Class");
  } else {
    print("You are Distinct Class");
  }
}
