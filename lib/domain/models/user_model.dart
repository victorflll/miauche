class User {
  late String name;
  late String email;
  late String phone;
  late String password;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  Map toMap() {
    Map data = {};

    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;

    return data;
  }

  User.fromMap(Map data) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    password = data['password'];
  }
}
