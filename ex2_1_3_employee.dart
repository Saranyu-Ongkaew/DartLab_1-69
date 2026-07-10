class Employee {
  String name;

  Employee(this.name);

  double calculateSalary() {
    return 0.0;
  }
}

class FullTimeEmployee extends Employee {
  double monthlySalary;
  double bonus;

  FullTimeEmployee(String name, this.monthlySalary, this.bonus) : super(name);

  @override
  double calculateSalary() {
    return monthlySalary + bonus;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked)
    : super(name);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}

void main() {
  List<Employee> employees = [
    FullTimeEmployee('สมชาย ใจดี', 30000.0, 5000.0),
    PartTimeEmployee('สมหญิง รักเรียน', 100.0, 120),
    FullTimeEmployee('วิชัย มานะ', 25000.0, 3000.0),
    PartTimeEmployee('สายใจ ขยัน', 120.0, 80),
  ];

  print('=== รายงานสรุปเงินเดือนพนักงาน (Polymorphism) ===\n');

  for (var emp in employees) {
    print('ชื่อพนักงาน: ${emp.name}');
    print('เงินเดือนสุทธิ: ${emp.calculateSalary()} บาท');
    print('-----------------------------------------');
  }
}
