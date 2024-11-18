import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:cobaflutter/models/country_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('countries.db');
    return _database!;
  }

  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final dbLocation = join(dbPath, path);
    return openDatabase(dbLocation, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE countries(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      flag TEXT,
      capital TEXT,
      languages TEXT,
      isFavorite INTEGER
    )
    ''');
  }

  Future<int> insert(Country country) async {
    final db = await database;
    return await db.insert('countries', country.toMap());
  }

  Future<bool> isFavorite(int id) async {
    final db = await database;
    final result = await db.query(
      'countries',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return result.first['isFavorite'] == 1;
    }
    return false;
  }

  Future<int> updateFavorite(int id, bool isFavorite) async {
    final db = await database;
    return await db.update(
      'countries',
      {'isFavorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Country>> getFavorites() async {
    final db = await database;
    final result = await db.query('countries', where: 'isFavorite = 1');
    return result.map((json) => Country.fromMap(json)).toList();
  }
}
