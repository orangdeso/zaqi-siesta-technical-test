import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase({required this.repository});

  Future<Either<String, TodoEntity>> call(String title, {String? description}) async {
    if (title.trim().isEmpty) {
      return const Left('Todo title cannot be empty');
    }
    return await repository.addTodo(title, description: description);
  }
}