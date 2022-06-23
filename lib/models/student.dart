class Student {
  int? id;
  String? name;
  int? age;

  Student.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    age = map['age'];
  }

  toJson() {
    return {'id': id, 'name': name, 'age': age};
  }
}
