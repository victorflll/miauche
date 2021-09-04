class Animal {
  late String name;
  late int age;
  late bool hasCollor;
  late bool hasDeficiency;
  late String animalType;
  late String gender;
  late String size;
  late String fur;
  late String furCollor;
  late String additionalFeatures;

  Animal(
      {required this.name,
      required this.age,
      required this.hasCollor,
      required this.hasDeficiency,
      required this.animalType,
      required this.gender,
      required this.size,
      required this.fur,
      required this.furCollor,
      required this.additionalFeatures});

  Map toMap() {
    Map data = {};

    data['name'] = this.name;
    data['age'] = this.age;
    data['hasCollor'] = this.hasCollor;
    data['hasDeficiency'] = this.hasDeficiency;
    data['animalType'] = this.animalType;
    data['gender'] = this.gender;
    data['size'] = this.size;
    data['fur'] = this.fur;
    data['furCollor'] = this.furCollor;
    data['additionalFeatures'] = this.additionalFeatures;

    return data;
  }

  Animal.fromMap(Map data) {
    this.name = data['name'];
    this.age = data['age'];
    this.hasCollor = data['hasCollor'];
    this.hasDeficiency = data['hasDeficiency'];
    this.animalType = data['animalType'];
    this.gender = data['gender'];
    this.size = data['size'];
    this.fur = data['fur'];
    this.furCollor = data['furCollor'];
    this.additionalFeatures = data['additionalFeatures'];
  }
}
