import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mydata.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ExchangeRate(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            currency TEXT,
            rate REAL
          )
        ''');
      },
    );
  }

  static Future<void> insertRate(String currency, double rate) async {
    final db = await getDatabase();
    await db.insert(
      'ExchangeRate',
      {'currency': currency, 'rate': rate},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getRates() async {
    final db = await getDatabase();
    return await db.query('ExchangeRate');
  }
}
