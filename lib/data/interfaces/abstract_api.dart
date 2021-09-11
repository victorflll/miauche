import 'package:miauche/domain/models/animal_model.dart';
import 'package:miauche/domain/models/user_model.dart';

abstract class UserAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(User user);
}

abstract class AnimalAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(Animal animal);
}
