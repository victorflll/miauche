class User {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? cep;
  String? city;
  String? neighborhood;
  String? street;
  int? houseNumber;
  String? complement;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.cep,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.houseNumber,
      required this.complement});

  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    password = data['password'];
    cep = data['CEP'];
    city = data['city'];
    neighborhood = data['neighborhood'];
    street = data['street'];
    houseNumber = data['houseNumber'];
    complement = data['complement'];
  }

  @override
  String toString() {
    return 'User{name = $name, email = $email, phone = $phone, password = $password, cep = $cep, city = $city, neighborhood = $neighborhood, street = $street, houseNumber = $houseNumber, complement = $complement},';
  }
}
