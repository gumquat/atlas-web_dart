import '4-mutables.dart';

class User extends Password {
  String? name;
  int? age;
  double? height;
  int? id;
  String? user_password;

  User({
    required this.name,
    required this.age,
    required this.height,
    required this.id,
    required this.user_password,
  }) : super(password: user_password ?? '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
    };
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    return User(
      id: userJson['id'],
      name: userJson['name'],
      age: userJson['age'],
      height: userJson['height'],
      user_password: userJson['user_password'],
    );
  }

  @override
  String toString() {
    final passwordInstance = Password(password: user_password ?? '');
    return 'User(id : $id ,name: $name, age: $age, height: $height, Password: ${passwordInstance.isValid() ? 'true' : 'false'})';
  }
}