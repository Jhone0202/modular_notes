import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;
  final int version = 1;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    return await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: version,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute(
      '''
        "CREATE TABLE Notes(
          id INTEGER PRIMARY KEY,
          title TEXT,
          content TEXT,
          createdAt TEXT
        )"    
      ''',
    );
  }

  Future _onUpgrade(Database database, int odlVesion, int newVersion) async {}
}
