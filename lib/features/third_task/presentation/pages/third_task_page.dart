import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/neutral_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/typography/typography.dart';
import '../../../../core/components/button/button_fill_component.dart';
import '../controller/todo_controller.dart';
import '../component/todo_item_card.dart';
import '../component/add_todo_dialog.dart';
import '../component/filter_chips.dart' as filter_widget;
import '../component/empty_state_widget.dart';
import '../component/todo_statistics.dart';

class ThirdTaskPage extends StatefulWidget {
  const ThirdTaskPage({super.key});

  @override
  State<ThirdTaskPage> createState() => _ThirdTaskPageState();
}

class _ThirdTaskPageState extends State<ThirdTaskPage> {
  final TodoController controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TypographyStyles.bodyMainMedium(
          'To Do List', 
        ),
        actions: [
          Obx(() {
            if (controller.completedTodos > 0) {
              return TextButton(
                onPressed: () => _showClearCompletedDialog(),
                child: Text(
                  'Clear Completed',
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      body: Column(
        children: [
          // Statistics Section
          Obx(() {
            if (controller.totalTodos > 0) {
              return Container(
                margin: EdgeInsets.all(16.w),
                child: TodoStatistics(
                  totalTodos: controller.totalTodos,
                  completedTodos: controller.completedTodos,
                  pendingTodos: controller.pendingTodos,
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          // Filter Chips
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Obx(() => filter_widget.FilterChips(
              selectedFilter: _mapControllerFilterToWidgetFilter(controller.currentFilter),
              allCount: controller.totalTodos,
              pendingCount: controller.pendingTodos,
              completedCount: controller.completedTodos,
              onFilterChanged: (filter) => controller.setFilter(_mapWidgetFilterToControllerFilter(filter)),
            )),
          ),

          SizedBox(height: 16.h),

          // Todo List
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${controller.errorMessage}',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      ButtonFillComponent(
                        textColor: Colors.amber,
                        text: 'Retry',
                        onTap: () {
                          controller.clearError();
                          controller.refreshTodos();
                        },
                      ),
                    ],
                  ),
                );
              }

              if (controller.todos.isEmpty) {
                return EmptyStateWidget(
                  icon: Icons.task_alt,
                  title: _getEmptyStateTitle(),
                  subtitle: _getEmptyStateSubtitle(),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.refreshTodos,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: controller.todos.length,
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: TodoItemCard(
                        todo: todo,
                        onToggle: () => controller.toggleTodoStatus(todo.id!),
                        onEdit: () => _showEditTodoDialog(todo),
                        onDelete: () => _showDeleteConfirmDialog(todo),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Neutral.neutral90,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  String _getEmptyStateTitle() {
    switch (controller.currentFilter) {
      case TodoFilter.completed:
        return 'No Completed Tasks';
      case TodoFilter.pending:
        return 'No Pending Tasks';
      default:
        return 'No Tasks Yet';
    }
  }

  String _getEmptyStateSubtitle() {
    switch (controller.currentFilter) {
      case TodoFilter.completed:
        return 'Complete some tasks to see them here';
      case TodoFilter.pending:
        return 'All tasks are completed! 🎉';
      default:
        return 'Add a new task to get started';
    }
  }

  void _showAddTodoDialog() {
    print('🔍 [ThirdTaskPage] Opening Add Todo Dialog');
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        onSave: (title, description) {
          print('🔍 [ThirdTaskPage] Received data from dialog - Title: $title, Description: $description');
          controller.addTodo(title, description: description);
        },
      ),
    );
  }

  void _showEditTodoDialog(todo) {
    print('🔍 [ThirdTaskPage] Opening Edit Todo Dialog for: ${todo.title}');
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        todo: todo,
        onSave: (title, description) {
          print('🔍 [ThirdTaskPage] Received updated data from dialog - Title: $title, Description: $description');
          controller.updateTodo(todo.id!, title, description: description);
        },
      ),
    );
  }

  void _showDeleteConfirmDialog(todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Task',
          
        ),
        content: Text(
          'Are you sure you want to delete "${todo.title}"?',
          
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
             
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.deleteTodo(todo.id!);
            },
            child: Text(
              'Delete',
             
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear Completed Tasks',
          
        ),
        content: Text(
          'Are you sure you want to delete all completed tasks?',
          
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.clearCompletedTodos();
            },
            child: Text(
              'Clear All',
             
            ),
          ),
        ],
      ),
    );
  }

  
}

  // Helper methods untuk mapping enum
  filter_widget.TodoFilter _mapControllerFilterToWidgetFilter(TodoFilter controllerFilter) {
    switch (controllerFilter) {
      case TodoFilter.all:
        return filter_widget.TodoFilter.all;
      case TodoFilter.completed:
        return filter_widget.TodoFilter.completed;
      case TodoFilter.pending:
        return filter_widget.TodoFilter.pending;
    }
  }

  TodoFilter _mapWidgetFilterToControllerFilter(filter_widget.TodoFilter widgetFilter) {
    switch (widgetFilter) {
      case filter_widget.TodoFilter.all:
        return TodoFilter.all;
      case filter_widget.TodoFilter.completed:
        return TodoFilter.completed;
      case filter_widget.TodoFilter.pending:
        return TodoFilter.pending;
    }
  }
