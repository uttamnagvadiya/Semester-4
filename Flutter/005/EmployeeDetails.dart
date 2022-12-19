void main(List<String> args) {
  print("\n|| Employee Detail ||");
  Employee("uttam", "0987654321", "Rajkot", 18, 150000.00, "Web Technology")
    ..printDetils()
    ..printSalary()
    ..printSpecialization();

  print("\n|| Manager Detail ||");
  Manager("karan", "1234567890", "Mahika", 17, 135431.56, "CSE")
    ..printDetils()
    ..printSalary()
    ..printDepartment();
}

class Member {
  String? name, phoneNumber, address;
  int? age;
  double? salary;

  Member(String? name, String? phoneNumber, String? address, int? age,
      double? salary) {
    this.name = name;
    this.phoneNumber = phoneNumber;
    this.address = address;
    this.age = age;
    this.salary = salary;
  }

  printSalary() {
    print("Salary = $salary");
  }

  printDetils() {
    print("Name = $name");
    print("Mobile No = $phoneNumber");
    print("Age = $age");
    print("Address = $address");
  }
}

class Employee extends Member {
  String? specialization;

  Employee(super.name, super.phoneNumber, super.address, super.age,
      super.salary, String? specialization) {
    this.specialization = specialization;
  }

  printSpecialization() {
    print("Specialization = $specialization");
  }
}

class Manager extends Member {
  String? department;

  Manager(super.name, super.phoneNumber, super.address, super.age, super.salary,
      String? department) {
    this.department = department;
  }

  printDepartment() {
    print("Department = $department");
  }
}
