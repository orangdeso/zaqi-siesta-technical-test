import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository repository;

  UpdateTodoUseCase({required this.repository});

  Future<Either<String, TodoEntity>> call(int id, String title, {String? description}) async {
    if (title.trim().isEmpty) {
      return const Left('Todo title cannot be empty');
    }
    return await repository.updateTodo(id, title, description: description);
  }
}