import 'package:miauche/domain/models/animal_model.dart';
import 'package:miauche/domain/models/find_animal_model.dart';
import 'package:miauche/domain/models/user_model.dart';
import 'package:miauche/domain/models/adress_model.dart';

abstract class UserAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(User user);
}

abstract class AnimalAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(Animal animal);
}

abstract class AdressAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(Adress adress);
}

abstract class FindAnimalAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(FindAnimal findAnimal);
}
