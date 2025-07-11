import 'package:get/get.dart';
import '../../../../core/service/database_helper.dart';
import '../../data/datasources/todo_local_datasource.dart';
import '../../data/repository/todo_repository_impl.dart';
import '../../domain/repository/todo_repository.dart';
import '../../domain/usecase/delete_todo_usecase.dart';
import '../../domain/usecase/get_all_todos_usecase.dart';
import '../../domain/usecase/get_todos_by_status_usecase.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/update_todo_usecase.dart';
import '../../domain/usecase/toggle_todo_status_usecase.dart';
import '../controller/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // Core service (already registered in main.dart)
    // Get.lazyPut<DatabaseHelper>(() => DatabaseHelper());

    // Data layer
    Get.lazyPut<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(databaseHelper: Get.find<DatabaseHelper>()),
    );

    Get.lazyPut<TodoRepository>(
      () => TodoRepositoryImpl(localDataSource: Get.find<TodoLocalDataSource>()),
    );

    // Domain layer - Use cases
    Get.lazyPut<GetAllTodosUseCase>(
      () => GetAllTodosUseCase(repository: Get.find<TodoRepository>()),
    );

    Get.lazyPut<GetTodosByStatusUseCase>(
      () => GetTodosByStatusUseCase(repository: Get.find<TodoRepository>()),
    );

    Get.lazyPut<AddTodoUseCase>(
      () => AddTodoUseCase(repository: Get.find<TodoRepository>()),
    );

    Get.lazyPut<UpdateTodoUseCase>(
      () => UpdateTodoUseCase(repository: Get.find<TodoRepository>()),
    );

    Get.lazyPut<ToggleTodoStatusUseCase>(
      () => ToggleTodoStatusUseCase(repository: Get.find<TodoRepository>()),
    );

    Get.lazyPut<DeleteTodoUseCase>(
      () => DeleteTodoUseCase(repository: Get.find<TodoRepository>()),
    );

    // Presentation layer
    Get.lazyPut<TodoController>(
      () => TodoController(
        getAllTodosUseCase: Get.find<GetAllTodosUseCase>(),
        getTodosByStatusUseCase: Get.find<GetTodosByStatusUseCase>(),
        addTodoUseCase: Get.find<AddTodoUseCase>(),
        updateTodoUseCase: Get.find<UpdateTodoUseCase>(),
        toggleTodoStatusUseCase: Get.find<ToggleTodoStatusUseCase>(),
        deleteTodoUseCase: Get.find<DeleteTodoUseCase>(),
      ),
    );
  }
}