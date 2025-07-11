import '../../../../core/service/database_helper.dart';
import '../model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getAllTodos();
  Future<List<TodoModel>> getTodosByStatus(bool isCompleted);
  Future<int> insertTodo(TodoModel todo);
  Future<int> updateTodo(int id, TodoModel todo);
  Future<int> deleteTodo(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final DatabaseHelper databaseHelper;

  TodoLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<TodoModel>> getAllTodos() async {
    try {
      final todoMaps = await databaseHelper.getAllTodos();
      return todoMaps.map((map) => TodoModel.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get todos from database: $e');
    }
  }

  @override
  Future<List<TodoModel>> getTodosByStatus(bool isCompleted) async {
    try {
      final todoMaps = await databaseHelper.getTodosByStatus(isCompleted);
      return todoMaps.map((map) => TodoModel.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get todos by status from database: $e');
    }
  }

  @override
  Future<int> insertTodo(TodoModel todo) async {
    try {
      return await databaseHelper.insertTodo(todo.toMap());
    } catch (e) {
      throw Exception('Failed to insert todo to database: $e');
    }
  }

  @override
  Future<int> updateTodo(int id, TodoModel todo) async {
    try {
      return await databaseHelper.updateTodo(id, todo.toMap());
    } catch (e) {
      throw Exception('Failed to update todo in database: $e');
    }
  }

  @override
  Future<int> deleteTodo(int id) async {
    try {
      return await databaseHelper.deleteTodo(id);
    } catch (e) {
      throw Exception('Failed to delete todo from database: $e');
    }
  }
}