import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the String : ");
  String? str = stdin.readLineSync()!;

  String out = "";

  for (var i = str.length - 1; i >= 0; i--) {
    out = out + str[i];
  }
  print("Reverse String : $out");

  print(str.split('').reversed.join());
}
