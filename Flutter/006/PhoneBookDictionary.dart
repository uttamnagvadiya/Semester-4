import 'dart:io';

void main(List<String> args) {
  PhonebookDictionary contact = PhonebookDictionary();
  contact.menu();
  while (true) {
    stdout.write("Enter the Choice : ");
    switch (int.parse(stdin.readLineSync()!)) {
      case 0:
        contact.menu();
        break;
      case 1:
        contact.getContactDetails();
        break;
      case 2:
        contact.displayContactDetails();
        break;
      case 3:
        contact.searchContactDetails();
        break;
      case 4:
        stdout.write("Enter the Contact Name you want to Delete: ");
        String? deleteName = stdin.readLineSync();
        contact.deleteContactDetails(deleteName!);
        break;
      case 5:
        contact.updateContactDetails();
        break;
      case 6:
        exit(0);
      default:
    }
  }
}

class PhonebookDictionary {
  String? name, phone_no;

  List<Map<String, dynamic>> contactList = [];

  menu() {
    print(
        "0 -> Menu\n1 -> Insert Contact.\n2 -> Display Contacts.\n3 -> Search Contact.\n4 -> Delete Contact.\n5 -> Update Contact.\n6 -> Exit the Program.");
  }

  dynamic getContactDetails({name, phone_no}) {
    Map<String, dynamic> map = {};

    stdout.write("Enter the Contact Name : ");
    map['name'] = stdin.readLineSync();
    map['phone_no'] = getContactNumber();

    contactList.add(map);
  }

  // Insert Method

  dynamic getContactNumber({official, personal}) {
    Map<String, int> contact_number = {};
    stdout.write("Enter the Official Number : ");
    contact_number['official'] = int.parse(stdin.readLineSync()!);
    stdout.write("Your Official Number and Personal are Same (Yes/No) : ");
    String same = stdin.readLineSync()!;
    if (same.toLowerCase() == 'yes') {
      contact_number['personal'] = contact_number['official']!;
    } else {
      stdout.write("Enter the Personal Number : ");
      contact_number['personal'] = int.parse(stdin.readLineSync()!);
    }
    return contact_number;
  }

  // Display Method

  void displayContactDetails() {
    if (contactList.isEmpty) {
      print("Contact List is Empty.");
    } else {
      print("\n\t||CONTACT DETAILS||\n");
      for (var i = 0; i < contactList.length; i++) {
        print("Contact Name = ${contactList[i]['name']}");
        print("Official Number = ${contactList[i]['phone_no']['official']}");
        print("Personal Number = ${contactList[i]['phone_no']['personal']}\n");
      }
    }
  }

  // Search Method

  void searchContactDetails() {
    String? name, searchChoice;
    int? mobile_no;

    stdout.write("You want to search by Name or Number : ");
    searchChoice = stdin.readLineSync()!;

    if (searchChoice.toLowerCase() == 'name') {
      stdout.write("\nEnter the Contact Name : ");
      name = stdin.readLineSync()!;
      for (var i = 0; i < contactList.length; i++) {
        if (contactList[i]['name'].toString().toLowerCase() ==
            name.toLowerCase()) {
          Map<String, dynamic> detailsMap = contactList[i];
          print("\nContact Name = ${detailsMap['name']}");
          print("Contact Name = ${detailsMap['phone_no']['official']}");
          print("Contact Name = ${detailsMap['phone_no']['personal']}\n");
        }
      }
    } else {
      stdout.write("\nEnter the Contact Number : ");
      mobile_no = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < contactList.length; i++) {
        if (contactList[i]['phone_no']['official'] == mobile_no ||
            contactList[i]['phone_no']['personal'] == mobile_no) {
          Map<String, dynamic> detailsMap = contactList[i];
          print("\nContact Name = ${detailsMap['name']}");
          print("Contact Name = ${detailsMap['phone_no']['official']}");
          print("Contact Name = ${detailsMap['phone_no']['personal']}\n");
        }
      }
    }
  }

  // Delete Method

  void deleteContactDetails(String name) {
    for (var i = 0; i < contactList.length; i++) {
      if (contactList[i]['name'].toString().toLowerCase() ==
          name.toLowerCase()) {
        contactList.remove(contactList[i]);
        print("Contact is Deleted Successfully.");
      }
    }
  }

  // Update Method

  void updateContactDetails() {}
}
