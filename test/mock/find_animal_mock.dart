import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/find_animal_model.dart';

import 'adress_mock.dart';
import 'animal_mock.dart';

class FindAnimalMock {
  static List<Map> list = [
    {
      "animal": AnimalMock.list,
      "anotherPlace": Adress(
          cep: "57280-000",
          city: "Arapiraca",
          neighborhood: "Perucaba",
          street: "Lago da Perucaba",
          houseNumber: "",
          complement: ""),
      "adress": AdressMock.list,
      "anotherPlaceAdress": "Sim",
      "newsName": "Cachorro encontrado com a patinha machucada",
      "description":
          "Encontrei ele perto do Lago da Perucaba, por volta das 21h.",
      "reward": "",
      "imageAnimal": "",
      "imagePath": "",
    },
  ];

  fetch() async {
    return list;
  }
}
