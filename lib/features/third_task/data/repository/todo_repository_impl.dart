import 'package:dartz/dartz.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repository/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../model/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<String, List<TodoEntity>>> getAllTodos() async {
    try {
      final todoModels = await localDataSource.getAllTodos();
      final todoEntities = todoModels.map((model) => _mapToEntity(model)).toList();
      return Right(todoEntities);
    } catch (e) {
      return Left('Failed to get todos: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<TodoEntity>>> getTodosByStatus(bool isCompleted) async {
    try {
      final todoModels = await localDataSource.getTodosByStatus(isCompleted);
      final todoEntities = todoModels.map((model) => _mapToEntity(model)).toList();
      return Right(todoEntities);
    } catch (e) {
      return Left('Failed to get todos by status: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, TodoEntity>> addTodo(String title, {String? description}) async {
    try {
      final now = DateTime.now();
      final todoModel = TodoModel(
        title: title.trim(),
        description: description?.trim(),
        isCompleted: false,
        createdAt: now,
        updatedAt: now,
      );

      final id = await localDataSource.insertTodo(todoModel);
      final newTodo = todoModel.copyWith(id: id);
      return Right(_mapToEntity(newTodo));
    } catch (e) {
      return Left('Failed to add todo: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, TodoEntity>> updateTodo(int id, String title, {String? description}) async {
    try {
      // First, get the existing todo to preserve other data
      final allTodos = await localDataSource.getAllTodos();
      final existingTodo = allTodos.firstWhere(
        (todo) => todo.id == id,
        orElse: () => throw Exception('Todo not found'),
      );

      // Create updated todo model with preserved data
      final now = DateTime.now();
      final updatedTodoModel = existingTodo.copyWith(
        title: title.trim(),
        description: description?.trim(),
        updatedAt: now,
      );

      await localDataSource.updateTodo(id, updatedTodoModel);
      return Right(_mapToEntity(updatedTodoModel));
    } catch (e) {
      return Left('Failed to update todo: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, TodoEntity>> toggleTodoStatus(int id, bool isCompleted) async {
    try {
      // First, get the existing todo to preserve title and description
      final allTodos = await localDataSource.getAllTodos();
      final existingTodo = allTodos.firstWhere(
        (todo) => todo.id == id,
        orElse: () => throw Exception('Todo not found'),
      );

      // Create updated todo model with preserved data
      final now = DateTime.now();
      final updatedTodoModel = existingTodo.copyWith(
        isCompleted: isCompleted,
        updatedAt: now,
      );

      await localDataSource.updateTodo(id, updatedTodoModel);
      return Right(_mapToEntity(updatedTodoModel));
    } catch (e) {
      return Left('Failed to toggle todo status: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> deleteTodo(int id) async {
    try {
      final result = await localDataSource.deleteTodo(id);
      return Right(result > 0);
    } catch (e) {
      return Left('Failed to delete todo: ${e.toString()}');
    }
  }

  TodoEntity _mapToEntity(TodoModel model) {
    return TodoEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      isCompleted: model.isCompleted,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}