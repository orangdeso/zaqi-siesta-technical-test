import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<String, List<TodoEntity>>> getAllTodos();
  Future<Either<String, List<TodoEntity>>> getTodosByStatus(bool isCompleted);
  Future<Either<String, TodoEntity>> addTodo(String title, {String? description});
  Future<Either<String, TodoEntity>> updateTodo(int id, String title, {String? description});
  Future<Either<String, TodoEntity>> toggleTodoStatus(int id, bool isCompleted);
  Future<Either<String, bool>> deleteTodo(int id);
}