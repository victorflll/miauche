import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/domain/models/animal_model.dart';

class LostAnimalMock extends AnimalAbstractApi {
  static List<Map> list = [
    {
      "animal": "Cachorro",
      "anotherPlace": "Perto da área verde",
      "adress": "Rua André Félix da Silva, 495, Novo Horizonte",
      "anotherPlaceAdress": "Não",
      "newsName": "Bob",
      "description": "Cachorro pequeno, branco com manchas pretas, viralata",
      "reward": "200 reais",
      "imageAnimal": "imagem",
      "imagePath": "imagem",
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
