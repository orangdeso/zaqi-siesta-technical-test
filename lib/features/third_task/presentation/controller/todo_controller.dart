import 'dart:developer';

import 'package:get/get.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecase/get_all_todos_usecase.dart';
import '../../domain/usecase/get_todos_by_status_usecase.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/update_todo_usecase.dart';
import '../../domain/usecase/toggle_todo_status_usecase.dart';
import '../../domain/usecase/delete_todo_usecase.dart';

enum TodoFilter { all, completed, pending }

class TodoController extends GetxController {
  final GetAllTodosUseCase getAllTodosUseCase;
  final GetTodosByStatusUseCase getTodosByStatusUseCase;
  final AddTodoUseCase addTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final ToggleTodoStatusUseCase toggleTodoStatusUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  TodoController({
    required this.getAllTodosUseCase,
    required this.getTodosByStatusUseCase,
    required this.addTodoUseCase,
    required this.updateTodoUseCase,
    required this.toggleTodoStatusUseCase,
    required this.deleteTodoUseCase,
  });

  // Observable variables
  final RxList<TodoEntity> _allTodos = <TodoEntity>[].obs;
  final RxList<TodoEntity> _filteredTodos = <TodoEntity>[].obs;
  final Rx<TodoFilter> _currentFilter = TodoFilter.all.obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  List<TodoEntity> get todos => _filteredTodos;
  TodoFilter get currentFilter => _currentFilter.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  
  // Statistics
  int get totalTodos => _allTodos.length;
  int get completedTodos => _allTodos.where((todo) => todo.isCompleted).length;
  int get pendingTodos => _allTodos.where((todo) => !todo.isCompleted).length;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  // Load todos from database
  Future<void> loadTodos() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await getAllTodosUseCase.call();
      result.fold(
        (error) => _errorMessage.value = error,
        (todos) {
          _allTodos.value = todos;
          _applyFilter();
        },
      );
    } catch (e) {
      _errorMessage.value = 'Failed to load todos: $e';
      log('Error loading todos: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  // Add new todo
  Future<void> addTodo(String title, {String? description}) async {
    if (title.trim().isEmpty) return;

    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await addTodoUseCase.call(title, description: description);
      result.fold(
        (error) => _errorMessage.value = error,
        (newTodo) {
          _allTodos.insert(0, newTodo);
          _applyFilter();
        },
      );
    } catch (e) {
      _errorMessage.value = 'Failed to add todo: $e';
      log('Error adding todo: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  // Toggle todo completion status
  Future<void> toggleTodoStatus(int todoId) async {
    try {
      log('🔄 [TodoController] Toggling status for todo ID: $todoId');
      
      final todoIndex = _allTodos.indexWhere((todo) => todo.id == todoId);
      if (todoIndex == -1) {
        log('❌ [TodoController] Todo not found with ID: $todoId');
        return;
      }

      final todo = _allTodos[todoIndex];
      log('🔄 [TodoController] Current todo: ${todo.title}, isCompleted: ${todo.isCompleted}');
      
      final result = await toggleTodoStatusUseCase.call(todoId, !todo.isCompleted);
      
      result.fold(
        (error) {
          log('❌ [TodoController] Error toggling todo status: $error');
          _errorMessage.value = error;
        },
        (updatedTodo) {
          log('✅ [TodoController] Todo status toggled successfully: ${updatedTodo.title}, isCompleted: ${updatedTodo.isCompleted}');
          _allTodos[todoIndex] = updatedTodo;
          _applyFilter();
          
          log('📊 [TodoController] Updated todos count: ${_allTodos.length}');
        },
      );
    } catch (e) {
      log('❌ [TodoController] Exception in toggleTodoStatus: $e');
      _errorMessage.value = 'Failed to toggle todo status: $e';
    }
  }

  // Delete todo
  Future<void> deleteTodo(int todoId) async {
    try {
      final result = await deleteTodoUseCase.call(todoId);
      result.fold(
        (error) => _errorMessage.value = error,
        (success) {
          if (success) {
            _allTodos.removeWhere((todo) => todo.id == todoId);
            _applyFilter();
          }
        },
      );
    } catch (e) {
      _errorMessage.value = 'Failed to delete todo: $e';
      log('Error deleting todo: $e');
    }
  }

  // Update todo
  Future<void> updateTodo(int todoId, String title, {String? description}) async {
    if (title.trim().isEmpty) return;

    try {
      final result = await updateTodoUseCase.call(todoId, title, description: description);
      result.fold(
        (error) => _errorMessage.value = error,
        (updatedTodo) {
          final todoIndex = _allTodos.indexWhere((todo) => todo.id == todoId);
          if (todoIndex != -1) {
            _allTodos[todoIndex] = _allTodos[todoIndex].copyWith(
              title: title.trim(),
              description: description?.trim(),
              updatedAt: DateTime.now(),
            );
            _applyFilter();
          }
        },
      );
    } catch (e) {
      _errorMessage.value = 'Failed to update todo: $e';
      log('Error updating todo: $e');
    }
  }

  // Set filter
  void setFilter(TodoFilter filter) {
    _currentFilter.value = filter;
    _applyFilter();
  }

  // Apply current filter
  void _applyFilter() {
    switch (_currentFilter.value) {
      case TodoFilter.all:
        _filteredTodos.value = List.from(_allTodos);
        break;
      case TodoFilter.completed:
        _filteredTodos.value = _allTodos.where((todo) => todo.isCompleted).toList();
        break;
      case TodoFilter.pending:
        _filteredTodos.value = _allTodos.where((todo) => !todo.isCompleted).toList();
        break;
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage.value = '';
  }

  // Clear completed todos
  Future<void> clearCompletedTodos() async {
    try {
      final completedTodoIds = _allTodos
          .where((todo) => todo.isCompleted)
          .map((todo) => todo.id!)
          .toList();

      for (final todoId in completedTodoIds) {
        await deleteTodo(todoId);
      }
    } catch (e) {
      _errorMessage.value = 'Failed to clear completed todos: $e';
      log('Error clearing completed todos: $e');
    }
  }

  // Refresh todos
  Future<void> refreshTodos() async {
    await loadTodos();
  }
}