import 'package:dartz/dartz.dart';
import '../repository/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository repository;

  DeleteTodoUseCase({required this.repository});

  Future<Either<String, bool>> call(int id) async {
    return await repository.deleteTodo(id);
  }
}