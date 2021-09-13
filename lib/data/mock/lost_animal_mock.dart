import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/data/mock/adress_mock.dart';
import 'package:miauche/data/mock/animal_mock.dart';
import 'package:miauche/domain/models/adress_model.dart';
import 'package:miauche/domain/models/lost_animal_model.dart';
import 'animal_mock.dart';

class LostAnimalMock extends LostAnimalAbstractApi {
  static List<Map> list = [
    {
      "animal": AnimalMock.list,
      "anotherPlace": Adress(
          cep: "57313040",
          city: "Arapiraca",
          neighborhood: "Brasília",
          street: "Nossa Senhora de Fátima",
          houseNumber: "300",
          complement: "casa"),
      "adress": AdressMock.list,
      "anotherPlaceAdress": "Sim",
      "newsName": "Animal perdido pelo bairro brasília",
      "description": "Fugiu por volta das 10h da manhã",
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
  add(LostAnimal lostAnimal) async {
    Map data = lostAnimal.toMap();

    list.add(data);

    return true;
  }
}
