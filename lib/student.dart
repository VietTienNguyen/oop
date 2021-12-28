class Student {
  String _id = DateTime.now().toString();
  String _name;
  String _dateBirthday;
  String _sex;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  String get dateBirthday => _dateBirthday;

  set dateBirthday(String value) {
    _dateBirthday = value;
  }

  set name(String value) {
    _name = value;
  }

  void output() {
    print(_name);
    print(_dateBirthday);
    print(_sex);
  }
}
