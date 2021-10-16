import 'package:miauche/domain/models/adress_model.dart';
import 'adress_mock.dart';
import 'animal_mock.dart';

class LostAnimalMock {
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

  fetch() async {
    return list;
  }
}
