import 'package:miauche/domain/models/user_model.dart';

abstract class UserAbstractApi {
  Future<List<Map>> fetch();
  Future<bool> add(User user);
}
