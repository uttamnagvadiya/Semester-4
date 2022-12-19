import 'dart:io';

void main(List<String> args) {
  List city = [];

  for (var i = 0; i < 5; i++) {
    stdout.write("Enter the City Name : ");
    city.add(stdin.readLineSync());
  }
  print("");
  while (true) {
    stdout.write("You want to Replace any City Name (Y/N) : ");
    String? choice = stdin.readLineSync()!.toLowerCase();
    if (choice == "no") {
      print("\n$city \nThank you");
      exit(0);
    } else if (choice == "yes") {
      stdout.write("Old Name : ");
      String? old_name = stdin.readLineSync();
      stdout.write("New Name : ");
      String? new_name = stdin.readLineSync();

      replace(city, old_name!, new_name!);
      print(city);
    } else {
      print("Please! Enter the Yes / No.");
    }
  }
}

void replace(List city, String old_name, String new_name) {
  print("");
  for (var i = 0; i < city.length; i++) {
    if (old_name == city[i]) {
      city[i] = new_name;
      break;
    }
  }
}
