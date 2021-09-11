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

    data['name'] = name;
    data['age'] = age;
    data['hasCollor'] = hasCollor;
    data['hasDeficiency'] = hasDeficiency;
    data['animalType'] = animalType;
    data['gender'] = gender;
    data['size'] = size;
    data['fur'] = fur;
    data['furCollor'] = furCollor;
    data['additionalFeatures'] = additionalFeatures;

    return data;
  }

  Animal.fromMap(Map data) {
    name = data['name'];
    age = data['age'];
    hasCollor = data['hasCollor'];
    hasDeficiency = data['hasDeficiency'];
    animalType = data['animalType'];
    gender = data['gender'];
    size = data['size'];
    fur = data['fur'];
    furCollor = data['furCollor'];
    additionalFeatures = data['additionalFeatures'];
  }
}
