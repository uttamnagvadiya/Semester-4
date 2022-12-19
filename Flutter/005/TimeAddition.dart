import 'dart:io';

void main(List<String> args) {
  Time t1 = Time();
  t1.setTime();
  Time t2 = Time();
  t2.setTime();

  Time add = Time();
  add = t1.addition(t2);
  add.displayTime();
}

class Time {
  int? hour, minute, second;

  Time() {
    hour = 0;
    minute = 0;
    second = 0;
  }

  setTime() {
    stdout.write("Hours : ");
    hour = int.parse(stdin.readLineSync()!);
    stdout.write("Minutes : ");
    minute = int.parse(stdin.readLineSync()!);
    stdout.write("Seconds : ");
    second = int.parse(stdin.readLineSync()!);
    print("");
  }

  displayTime() {
    print("$hour : $minute : $second");
  }

  addition(Time t2) {
    Time temp = Time();

    temp.second = second! + t2.second!;
    temp.minute = minute! + t2.minute! + temp.second! ~/ 60;
    temp.second = temp.second! % 60;
    temp.hour = hour! + t2.hour! + temp.minute! ~/ 60;
    temp.minute = temp.minute! % 60;

    return temp;
  }
}
