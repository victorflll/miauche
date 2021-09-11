import 'dart:io';
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
  late File? imageAnimal;
  late String imagePath;

  LostAnimal(
      {required this.animal,
      required this.anotherPlace,
      required this.adress,
      required this.anotherPlaceAdress,
      required this.newsName,
      required this.description,
      required this.reward,
      this.imageAnimal,
      required this.imagePath});

  Map toMap() {
    Map data = {};

    data['animal'] = animal;
    data['anotherPlace'] = anotherPlace;
    data['adress'] = adress;
    data['anotherPlaceAdress'] = anotherPlaceAdress;
    data['newsName'] = newsName;
    data['description'] = description;
    data['reward'] = reward;
    data['imageAnimal'] = imageAnimal;
    data['imagePath'] = imagePath;

    return data;
  }

  LostAnimal.fromMap(Map data) {
    animal = data['animal'];
    anotherPlace = data['anotherPlace'];
    adress = data['adress'];
    anotherPlaceAdress = data['anotherPlaceAdress'];
    newsName = data['newsName'];
    description = data['description'];
    reward = data['reward'];
    imageAnimal = data['imageAnimal'];
    imagePath = data['imagePath'];
  }
}
