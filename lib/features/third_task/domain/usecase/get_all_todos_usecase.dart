import 'package:dartz/dartz.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetAllTodosUseCase {
  final TodoRepository repository;

  GetAllTodosUseCase({required this.repository});

  Future<Either<String, List<TodoEntity>>> call() async {
    return await repository.getAllTodos();
  }
}