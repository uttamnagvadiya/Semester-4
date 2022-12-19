import 'dart:io';

void main(List<String> args) {
  Candidate cd = Candidate();

  cd.menu();
  while (true) {
    stdout.write("\nEnter the Choice : ");
    switch (int.parse(stdin.readLineSync()!)) {
      case 0:
        cd.menu();
        break;
      case 1:
        cd.getCandidateDetails();
        break;
      case 2:
        cd.displayCandidateDetails();
        break;
      case 3:
        stdout.write("Enter the Candidate ID you want to search :");
        cd.searchCandidateDetails(stdin.readLineSync()!);
        break;
      case 4:
        stdout.write("Enter the Candidate ID you want to Delete :");
        cd.deleteCandidateDetails(stdin.readLineSync()!);
        break;
      case 5:
        stdout.write("Enter the Candidate ID you want to Update :");
        cd.updateCandidateDetails(stdin.readLineSync()!);
        break;
      default:
    }
  }
}

class Candidate {
  String? candidate_id, candidate_name, candidate_age;
  double? candidate_weight, candidate_height;

  menu() {
    print(
        "0 -> Menu\n1 -> Insert Details.\n2 -> Display Details.\n3 -> Search Candidate.\n4 -> Delete Candidate.\n5 -> Update Details.");
  }

  List<Map<String, dynamic>> userList = [];

  //Insert Details

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
  }

  // Display Details

  void displayCandidateDetails() {
    if (userList.isEmpty) {
      print("Candidate List is Empty.");
    } else {
      print("\n\t|| CANDIDATE DETAILS ||");
      for (var i = 0; i < userList.length; i++) {
        Map<String, dynamic> map = userList[i];

        print("Candidate ID : ${map['id']}");
        print("Candidate Name : ${map['name']}");
        print("Candidate Age : ${map['age']}");
        print("Candidate Weight : ${map['weight']}");
        print("Candidate Height : ${map['height']}\n");
      }
    }
  }

  // Display Details by Name

  void searchCandidateDetails(String id) {
    for (var i = 0; i < userList.length; i++) {
      if (userList[i]['id'].toString().toLowerCase() == id.toLowerCase()) {
        Map<String, dynamic> map = userList[i];
        print("Candidate ID : ${map['id']}");
        print("Candidate Name : ${map['name']}");
        print("Candidate Age : ${map['age']}");
        print("Candidate Weight : ${map['weight']}");
        print("Candidate Height : ${map['height']}\n");
      }
    }
  }

  // Delete Details by ID

  void deleteCandidateDetails(String id) {
    for (var i = 0; i < userList.length; i++) {
      if (userList[i]['id'] == id.toLowerCase()) {
        userList.remove(userList[i]);
        print("Candidate is deleted successfully.");
      }
    }
  }

  // Update Details by ID

  void updateCandidateDetails(String id) {
    for (var i = 0; i < userList.length; i++) {
      if (userList[i]['id'] == id.toLowerCase()) {
        Map<String, dynamic> map = userList[i];
        stdout.write("Enter the Candidate_Name : ");
        map['name'] = stdin.readLineSync();
        stdout.write("Enter the Candidate_Age : ");
        map['age'] = stdin.readLineSync();
        stdout.write("Enter the Candidate_Weight : ");
        map['weight'] = stdin.readLineSync();
        stdout.write("Enter the Candidate_Height : ");
        map['height'] = stdin.readLineSync();

        userList[i] = map;
        print("Candidate Profile is Updated.");
        break;
      }
    }
  }
}
