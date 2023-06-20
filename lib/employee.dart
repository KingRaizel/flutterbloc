// ignore_for_file: unnecessary_getters_setters

class Employee {
  int _id = 0;
  String _name = '';
  double _salary = 0;

  Employee(this._id, this._name, this._salary);

  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set salary(double salary) {
    _salary = salary;
  }

  int get id => _id;
  String get name => _name;
  double get salary => _salary;
}
