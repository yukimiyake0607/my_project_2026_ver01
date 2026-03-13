import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/domain/todo.dart';
import 'package:uuid/uuid.dart';

part 'todo_list_screen_controller.g.dart';

@riverpod
class TodoListScreenController extends _$TodoListScreenController {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(String? todoTitle) {
    if (todoTitle == null) return;
    final trimmedTodoTitle = todoTitle.trim();
    if (trimmedTodoTitle.isEmpty) return;

    final newTodo = Todo(
      id: Uuid().v4(),
      title: trimmedTodoTitle,
      isDone: false,
    );
    state = [...state, newTodo];
  }

  void toggleTodo(String? todoId) {
    if (todoId == null) return;
    state = state.map((todo) {
      return todo.id == todoId ? todo.copyWith(isDone: !todo.isDone) : todo;
    }).toList();
  }
}
