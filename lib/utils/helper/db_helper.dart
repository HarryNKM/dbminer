import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper helper = DbHelper();


  Database? db;

  Future<Database?> checkDB() async {
    if (db != null) {
      return db;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "harry.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE text (id INTEGER PRIMARY KEY AUTOINCREMENT,text TEXT,author TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertQuotes(String text, String author) async {
    db = await checkDB();
    String query =
        "INSERT INTO text (text,author) VALUES ('$text','$author')";
    db!.rawInsert(query);
  }

  Future<List<Map>> readQuote() async {
    db = await checkDB();
    String query = "SELECT * FROM text";
    List<Map> data = await db!.rawQuery(query);
    return data;
  }

  Future<void> deleteQuote(int id) async {
    db = await checkDB();
    String query = "DELETE FROM text WHERE id = $id";
    db!.rawDelete(query);
  }

  Future<void> updateQuote(String text, int id) async {
    db = await checkDB();

    String query = "UPDATE text SET name = '$text' WHERE id = '$id'";
    db!.rawUpdate(query);
  }

  Future<List<Map>> filterQuote(int data) async {
    db = await checkDB();
    String query = "SELECT * FROM text WHERE status = $data";
    List<Map> filter = await db!.rawQuery(query);
    return filter;
  }
}
