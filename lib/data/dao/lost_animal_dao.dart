import 'package:miauche/data/database_helper.dart';
import 'package:miauche/domain/models/lost_animal_model.dart';
import 'package:sqflite/sqflite.dart';

class LostAnimalDAO {
  String tableName = 'LOST_ANIMAL';

  Future<List<LostAnimal>> listAnimalsLost() async {
    List<LostAnimal> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      LostAnimal animals = LostAnimal.fromJson(json);
      list.add(animals);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
