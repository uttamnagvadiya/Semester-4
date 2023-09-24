import 'package:intl/intl.dart';
// import 'package:my_first_application/filename.dart';

class Util {
  String dateFormat(DateTime date, String format) {
    String result = DateFormat(format).format(date);
    return result;
  }
}

class MyClass {
  String displayDateFromat(DateTime date, String format) {
    String result = Util().dateFormat(date, format);
    return result;
  }
}

class MySubClass extends MyClass {
  String displayDateFromatInherited(DateTime date, String format) {
    String result = Util().dateFormat(date, format);
    return result;
  }
}

void demo() {
  DateTime currentDate = DateTime.now();

  MyClass a = MyClass();
  print(a.displayDateFromat(currentDate, 'dd MMM, yyyy'));

  MySubClass b = MySubClass();
  print(b.displayDateFromatInherited(currentDate, 'dd MMM, yyyy'));
  print(b.displayDateFromat(currentDate, 'dd MMM, yyyy'));
}

void dateFormat() {
  DateTime currentDate = DateTime.now();

  String format1 = DateFormat("dd MMM, yyyy").format(currentDate);

  print(format1);
}
