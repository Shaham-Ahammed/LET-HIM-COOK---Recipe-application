import 'package:let_him_cook/model/favorite_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        'CREATE TABLE favList (id TEXT PRIMARY KEY, name TEXT, imageUrl TEXT)');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'favList',
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  static Future<int> createData(FavModel model) async {
    final db = await DbHelper.db();
    final data = {
      'id': model.id,
      'name': model.name,
      'imageUrl': model.imagePath
    };
    final id = await db.insert("favList", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final data = await DbHelper.db();
    return data.query("favList");
  }

  static Future<void> deleteData(String id) async {
    final db = await DbHelper.db();
    await db.delete("favList", where: 'id=?', whereArgs: [id]);
  }
}
