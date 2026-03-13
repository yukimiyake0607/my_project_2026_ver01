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

  void addTodo(String todoTitle) {
    final newTodo = Todo(id: Uuid().v4(), title: todoTitle, isDone: false);
    state = [...state, newTodo];
  }
}
