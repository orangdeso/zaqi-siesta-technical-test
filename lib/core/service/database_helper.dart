import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo_database.db');
    print('🗄️ [DatabaseHelper] Initializing database at: $path');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    print('🗄️ [DatabaseHelper] Creating database tables...');
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        isCompleted INTEGER NOT NULL DEFAULT 0,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');
    print('✅ [DatabaseHelper] Database tables created successfully');
  }

  // CRUD Operations
  Future<int> insertTodo(Map<String, dynamic> todo) async {
    print('📝 [DatabaseHelper] Inserting todo: $todo');
    final db = await database;
    final result = await db.insert('todos', todo);
    print('✅ [DatabaseHelper] Todo inserted with ID: $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getAllTodos() async {
    print('📋 [DatabaseHelper] Getting all todos...');
    final db = await database;
    final result = await db.query('todos', orderBy: 'createdAt DESC');
    print('📋 [DatabaseHelper] Found ${result.length} todos');
    return result;
  }

  Future<List<Map<String, dynamic>>> getTodosByStatus(bool isCompleted) async {
    print('📋 [DatabaseHelper] Getting todos by status: $isCompleted');
    final db = await database;
    final result = await db.query(
      'todos',
      where: 'isCompleted = ?',
      whereArgs: [isCompleted ? 1 : 0],
      orderBy: 'createdAt DESC',
    );
    print('📋 [DatabaseHelper] Found ${result.length} todos with status: $isCompleted');
    return result;
  }

  Future<int> updateTodo(int id, Map<String, dynamic> todo) async {
    print('✏️ [DatabaseHelper] Updating todo ID $id: $todo');
    final db = await database;
    final result = await db.update(
      'todos',
      todo,
      where: 'id = ?',
      whereArgs: [id],
    );
    print('✅ [DatabaseHelper] Todo updated, affected rows: $result');
    return result;
  }

  Future<int> deleteTodo(int id) async {
    print('🗑️ [DatabaseHelper] Deleting todo ID: $id');
    final db = await database;
    final result = await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('✅ [DatabaseHelper] Todo deleted, affected rows: $result');
    return result;
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}