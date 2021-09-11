import 'dart:io';
import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/animal_model.dart';

class FindAnimal {
  late Animal animal;
  late Adress adress;
  late String newsName;
  late String description;
  late File? imageAnimal;
  late String imagePath;

  FindAnimal(
      {required this.animal,
      required this.adress,
      required this.newsName,
      required this.description,
      this.imageAnimal,
      required this.imagePath});

  Map toMap() {
    Map data = {};

    data['animal'] = animal;
    data['adress'] = adress;
    data['newsName'] = newsName;
    data['description'] = description;
    data['imageAnimal'] = imageAnimal;
    data['imagePath'] = imagePath;

    return data;
  }

  FindAnimal.fromMap(Map data) {
    animal = data['animal'];
    adress = data['adress'];
    newsName = data['newsName'];
    description = data['description'];
    imageAnimal = data['imageAnimal'];
    imagePath = data['imagePath'];
  }
}
