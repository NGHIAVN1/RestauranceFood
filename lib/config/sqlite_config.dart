import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class SqliteConfig{
  static final SqliteConfig instance = SqliteConfig._initance();
  Database? _database;  
  SqliteConfig._initance();
  
  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    sqfliteFfiInit();
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'food_app.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        email TEXT,
        password TEXT,
        fullName TEXT,
        phoneNumber TEXT,
        address TEXT
      )
    ''');
  
  }


  
}