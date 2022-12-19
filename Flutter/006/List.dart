import 'dart:io';

void main(List<String> args) {
  List list = [];
  for (var i = 0; i < 5; i++) {
    stdout.write("Enter the value : ");
    list.add(int.parse(stdin.readLineSync()!));
  }

  int? temp;
  for (var i = 0; i < 5; i++) {
    for (var j = i; j < 5; j++) {
      if (list[i] > list[j]) {
        temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
    }
  }

  for (var i = 0; i < list.length; i++) {
    stdout.write("${list[i]}, ");
  }
}
