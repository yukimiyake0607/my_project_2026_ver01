import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/presentation/components/add_todo_dialog.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/presentation/components/todo_empty_screen.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/presentation/todo_list_screen_controller.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListScreenControllerProvider);
    final hasTodo = todos.isNotEmpty;

    /// FAB押下時の処理
    void onFloatingActionButtonPressed() async {
      final title = await AddTodoDialog.show(context);
      if (title == null || title.isEmpty) return;
      ref.read(todoListScreenControllerProvider.notifier).addTodo(title);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: hasTodo
            ? ListView.separated(
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        return;
                      },
                    ),
                    title: Text(todo.title),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: todos.length,
              )
            : const TodoEmptyScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
