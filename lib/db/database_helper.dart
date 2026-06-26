import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('campus_app.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tugas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        course TEXT NOT NULL,
        dueDate TEXT NOT NULL,
        status TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertTugas(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('tugas', data);
  }

  Future<List<Map<String, dynamic>>> getTugas() async {
    final db = await instance.database;
    return await db.query('tugas', orderBy: 'id DESC');
  }

  Future<int> updateTugas(int id, String status) async {
    final db = await instance.database;
    return await db.update(
      'tugas',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTugas(int id) async {
    final db = await instance.database;
    return await db.delete(
      'tugas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateStatus(int id, String status) async {
  final db = await instance.database;

  return await db.update(
    'tugas',
    {
      'status': status,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}
}