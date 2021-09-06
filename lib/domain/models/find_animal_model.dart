import 'dart:html';

import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/animal_model.dart';

class FindAnimal {
  late Animal animal;
  late Adress adress;
  late String newsName;
  late String description;
  late File imageAnimal;

  FindAnimal(
      {required this.animal,
      required this.adress, 
      required this.newsName,
      required this.description,
      required this.imageAnimal}
  );

  Map toMap() {
    Map data = {};

    data['animal'] = this.animal;
    data['adress'] = this.adress;
    data['newsName'] = this.newsName;
    data['description'] = this.description;
    data['imageAnimal'] = this.imageAnimal;

    return data;
  }

  FindAnimal.fromMap(Map data) {
    this.animal = data['animal'];
    this.adress = data['adress'];
    this.newsName = data['newsName'];
    this.description = data['description'];
    this.imageAnimal = data['imageAnimal'];
  }
}
