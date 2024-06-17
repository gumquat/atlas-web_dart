// naje a new suer class
class User {
  String name;
  int age;
  double height;

  // cosntructor
  User({required this.name, required this.age, required this.height});

  // method making a json, returns a string representation of 'hello {name}'
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'height': height,
    };
  }
}