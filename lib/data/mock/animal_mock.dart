import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/domain/models/animal_model.dart';

class AnimalMock extends AnimalAbstractApi {
  static List<Map> list = [
    {
      "name": "Bob",
      "age": "1 ano",
      "hasCollor": "Sim",
      "hasDeficiency": "Não",
      "animalType": "Cachorro",
      "gender": "Macho",
      "size": "Pequeno",
      "fur": "Curta",
      "furCollor": "Marrom",
      "additionalFeatures": "",
    },
  ];

  @override
  fetch() async {
    return list;
  }

  @override
  add(Animal animal) async {
    Map data = animal.toMap();

    list.add(data);

    return true;
  }
}
