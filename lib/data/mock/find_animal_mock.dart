import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/data/mock/adress_mock.dart';
import 'package:miauche/data/mock/animal_mock.dart';
import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/find_animal_model.dart';

class FindAnimalMock extends FindAnimalAbstractApi {
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

  @override
  fetch() async {
    return list;
  }

  @override
  add(FindAnimal findAnimal) async {
    Map data = findAnimal.toMap();

    list.add(data);

    return true;
  }
}
