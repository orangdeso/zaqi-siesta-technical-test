import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class ToggleTodoStatusUseCase {
  final TodoRepository repository;

  ToggleTodoStatusUseCase({required this.repository});

  Future<Either<String, TodoEntity>> call(int id, bool isCompleted) async {
    return await repository.toggleTodoStatus(id, isCompleted);
  }
}