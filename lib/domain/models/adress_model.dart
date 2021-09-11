class Adress {
  late String cep;
  late String city;
  late String neighborhood;
  late String street;
  late String houseNumber;
  late String complement;

  Adress(
      {required this.cep,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.houseNumber,
      required this.complement});

  Map toMap() {
    Map data = {};

    data['CEP'] = cep;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    data['houseNumber'] = houseNumber;
    data['complement'] = complement;

    return data;
  }

  Adress.fromMap(Map data) {
    cep = data['CEP'];
    city = data['city'];
    neighborhood = data['neighborhood'];
    street = data['street'];
    houseNumber = data['houseNumber'];
    complement = data['complement'];
  }
}
