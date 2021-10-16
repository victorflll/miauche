import 'package:miauche/data/database_helper.dart';
import 'package:miauche/domain/models/find_animal_model.dart';
import 'package:sqflite/sqflite.dart';

class FindAnimalDAO {
  String tableName = 'FIND_ANIMAL';

  Future<List<FindAnimal>> listAnimalsFound() async {
    List<FindAnimal> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      FindAnimal animals = FindAnimal.fromJson(json);
      list.add(animals);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
