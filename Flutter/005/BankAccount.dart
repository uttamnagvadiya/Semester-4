import 'dart:io';

void main(List<String> args) {
  BankAccount ac = BankAccount();

  while (true) {
    stdout.write("\nEnter the Choice : ");
    switch (int.parse(stdin.readLineSync()!)) {
      case 0:
        ac.menu();
        break;
      case 1:
        ac.getAccountDetails();
        break;
      case 2:
        ac.displayAccountDetails();
        break;
      default:
    }
  }
}

class BankAccount {
  dynamic account_no, email;
  double? balance;
  String? user_name, account_type;

  List<Map<String, dynamic>> customerList = [];

  menu() {
    print("1 -> Insert\n2 -> Display");
  }

  getAccountDetails({ac_no, name, email, ac_type, balance}) {
    Map<String, dynamic> map = {};

    stdout.write("Enter the Account No : ");
    map['ac_no'] = stdin.readLineSync();
    stdout.write("Enter the Account Holder Name : ");
    map['name'] = stdin.readLineSync();
    stdout.write("Enter the Email : ");
    map['email'] = stdin.readLineSync();
    stdout.write("Enter the Account Type : ");
    map['ac_type'] = stdin.readLineSync();
    stdout.write("Enter the Account Balance : ");
    map['balance'] = stdin.readLineSync();

    customerList.add(map);
  }

  displayAccountDetails() {
    print("\n\t|| CUSTOMER DETAILS ||");
    for (var i = 0; i < customerList.length; i++) {
      Map<String, dynamic> map = customerList[i];

      print("Account No : ${map['ac_no']}");
      print("Holder Name : ${map['name']}");
      print("Email : ${map['email']}");
      print("Account Type : ${map['ac_type']}");
      print("Balance : ${map['balance']}\n");
    }
  }
}
