import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetTodosByStatusUseCase {
  final TodoRepository repository;

  GetTodosByStatusUseCase({required this.repository});

  Future<Either<String, List<TodoEntity>>> call(bool isCompleted) async {
    return await repository.getTodosByStatus(isCompleted);
  }
}