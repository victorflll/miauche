import 'package:miauche/data/interfaces/abstract_api.dart';
import 'package:miauche/domain/models/user_model.dart';

class UserMock extends UserAbstractApi {
  static List<Map> list = [
    {
      "name": "Maria José",
      "email": "mariajose@gmail.com",
      "phone": "(82)98111-2233",
      "password": "12345678",
    },
    {
      "name": "José dos Santos",
      "email": "santos.jose@gmail.com",
      "phone": "(82)99922-1133",
      "password": "87654321",
    },
  ];

  @override
  fetch() async {
    return list;
  }

  @override
  add(User user) async {
    Map data = user.toMap();

    list.add(data);

    return true;
  }
}
