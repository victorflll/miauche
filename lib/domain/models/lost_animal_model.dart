import 'dart:html';

import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/animal_model.dart';

class LostAnimal {
  late Animal animal;
  late bool anotherPlace;
  late Adress adress;
  late Adress anotherPlaceAdress;
  late String newsName;
  late String description;
  late String reward;
  late File imageAnimal;
  late String imagePath;

  LostAnimal(
      {required this.animal,
      required this.anotherPlace,
      required this.adress,
      required this.anotherPlaceAdress,
      required this.newsName,
      required this.description,
      required this.reward,
      required this.imageAnimal,
      required this.imagePath});

  Map toMap() {
    Map data = {};

    data['animal'] = this.animal;
    data['anotherPlace'] = this.anotherPlace;
    data['adress'] = this.adress;
    data['anotherPlaceAdress'] = this.anotherPlaceAdress;
    data['newsName'] = this.newsName;
    data['description'] = this.description;
    data['reward'] = this.reward;
    data['imageAnimal'] = this.imageAnimal;
    data['imagePath'] = this.imagePath;

    return data;
  }

  LostAnimal.fromMap(Map data) {
    this.animal = data['animal'];
    this.anotherPlace = data['anotherPlace'];
    this.adress = data['adress'];
    this.anotherPlaceAdress = data['anotherPlaceAdress'];
    this.newsName = data['newsName'];
    this.description = data['description'];
    this.reward = data['reward'];
    this.imageAnimal = data['imageAnimal'];
    this.imagePath = data['imagePath'];
  }
}
