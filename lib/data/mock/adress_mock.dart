import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/domain/models/adress_model.dart';


class AdressMock extends AdressAbstractApi {
  static List<Map> list = [
    {
      "CEP": "12345-678",
      "city": "Arapiraca",
      "neighborhood": "Novo Horizonte",
      "street": "José Aranda Valeriano",
      "houseNumber": "123",
      "complement": "",
    },
  ];

  @override
  fetch() async {
    return list;
  }

  @override
  add(Adress adress) async {
    Map data = adress.toMap();

    list.add(data);

    return true;
  }
}
