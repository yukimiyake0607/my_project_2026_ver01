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

  /// タスクを追加するメソッドです。
  ///
  /// バリデーションはControllerで行う。
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

  /// タスクの完了状態を切り替えるメソッドです。
  ///
  /// バリデーションはControllerで行う。
  void toggleTodo(String? todoId) {
    if (todoId == null) return;
    state = state.map((todo) {
      return todo.id == todoId ? todo.copyWith(isDone: !todo.isDone) : todo;
    }).toList();
  }

  /// タスクを削除するメソッドです。
  ///
  /// バリデーションはControllerで行う。
  void deleteTodo(String? todoId) {
    if (todoId == null) return;

    state = state.where((todo) => todo.id != todoId).toList();
  }
}
