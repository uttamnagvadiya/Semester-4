import 'dart:html';
import 'dart:io';

void main(List<String> args) {
  Candidate cd = Candidate();
  
  int ch = 1;
  while(ch == 1){
    cd.getCandidateDetails();
  }
}

class Candidate {
  String? candidate_id, candidate_name, candidate_age;
  double? candidate_weight, candidate_height;

  List<Map<String, dynamic>> userList = [];

  dynamic getCandidateDetails({id, name, age, weight, height}) {
    Map<String, dynamic> map = {};

    stdout.write("Enter the Candidate_ID : ");
    map['id'] = stdin.readLineSync();
    stdout.write("Enter the Candidate_Name : ");
    map['name'] = stdin.readLineSync();
    stdout.write("Enter the Candidate_Age : ");
    map['age'] = stdin.readLineSync();
    stdout.write("Enter the Candidate_Weight : ");
    map['weight'] = stdin.readLineSync();
    stdout.write("Enter the Candidate_Height : ");
    map['height'] = stdin.readLineSync();

    userList.add(map);
    // stdout.write("Enter the Candidate_ID : ");
    // candidate_id = stdin.readLineSync()!;
    // stdout.write("Enter the Candidate_Name : ");
    // candidate_name = stdin.readLineSync()!;
    // stdout.write("Enter the Candidate_Age : ");
    // candidate_age = stdin.readLineSync()!;
    // stdout.write("Enter the Candidate_Weight : ");
    // candidate_weight = double.parse(stdin.readLineSync()!);
    // stdout.write("Enter the Candidate_Height : ");
    // candidate_height = double.parse(stdin.readLineSync()!);
  }

  void displayCandidateDetails() {
    for (var i = 0; i < userList.length; i++) {
      Map<String, dynamic> map = userList[i];

      print("\n \tDETAILS ");
      print("Candidate ID : ${map['id']}");
      print("Candidate Name : ${map['name']}");
      print("Candidate Age : ${map['age']}");
      print("Candidate Weight : ${map['weight']}");
      print("Candidate Height : ${map['height']}");
    }
    // print("Candidate ID : $candidate_id");
    // print("Candidate Name : $candidate_name");
    // print("Candidate Age : $candidate_age");
    // print("Candidate Weight : $candidate_weight");
    // print("Candidate Height : $candidate_height");
  }
}
}