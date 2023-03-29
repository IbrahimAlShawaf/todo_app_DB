import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBController {
  static DBController? _dbController;

  static Database? _database;

  DBController._();

  factory DBController() {
    return _dbController ??= DBController._();
  }
  Future<Database?> get database async {
    _database ??= await initDataBase();
    return _database;
   
  }

// To initialize db and Create it
  initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'todo.sql');
    Database database =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

//   _onUpgrade(Database db, int oldversion, int newversion) async {
//     print("onUpgrade =====================================");
//    // await db.execute("ALTER TABLE notes ADD COLUMN disc TEXT");
//   }

  _onCreate(Database db, int version) async {
    await db.execute(' CREATE TABLE "notes" ('
        'id INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,'
        'title TEXT NOT NULL,'
        'disc TEXT NOT NULL'
        ')');
    print(" onCreate =====================================");
  }

//   mydeleteDatabase() async {
//     String databasepath = await getDatabasesPath();
//     String path = join(databasepath, 'todo.db');
//     await deleteDatabase(path);
//   }
  insertData(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  readData(String sql) async {
     Database? mydb = await database;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;


    // Database? mydb = await database;
    // int? response = 0;
    // if (database != null) {
    //   List<Map> response = await mydb!.rawQuery(sql);
    // } else {
    //   response;
    // }
  }

  updateData(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

// // SELECT
// // DELETE
// // UPDATE
// // INSERT

// }
}
