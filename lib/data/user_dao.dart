import 'package:miauche/data/database_helper.dart';
import 'package:miauche/domain/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO {
  String tableName = 'USER';

  Future<List<User>> listUsers() async {
    List<User> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      User users = User.fromJson(json);
      list.add(users);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
