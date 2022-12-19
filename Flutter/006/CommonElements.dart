import 'dart:io';

void main(List<String> args) {
  CommonElements ce = CommonElements();
  ce.getElements();
  ce.checkCommonElements();
  ce.displayLists();
}

class CommonElements {
  List list1 = [];
  List list2 = [];
  List common = [];

  getElements() {
    for (var i = 0; i < 10; i++) {
      stdout.write("Enter the Element in List 1 : ");
      list1.add(stdin.readLineSync());
    }
    print("");
    for (var i = 0; i < 10; i++) {
      stdout.write("Enter the Element in List 2 : ");
      list2.add(stdin.readLineSync());
    }
  }

  checkCommonElements() {
    for (var i = 0; i < list1.length; i++) {
      if (list2
          .toString()
          .toLowerCase()
          .contains(list1[i].toString().toLowerCase())) {
        common.add(list1[i]);
      }
    }
  }

  displayLists() {
    print("\nList 1 = ${list1}");
    print("");
    print("List 2 = ${list2}");
    print("");
    print("Common List  = ${common}\n");
  }
}
