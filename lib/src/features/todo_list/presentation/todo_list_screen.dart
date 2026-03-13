import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/domain/todo.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/presentation/components/todo_empty_screen.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/presentation/todo_list_screen_controller.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListScreenControllerProvider);
    final hasTodo = todos.isNotEmpty;
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
        onPressed: () async {
          await _onFloatingActionButtonPressed(ref, context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> _onFloatingActionButtonPressed(
  WidgetRef ref,
  BuildContext context,
) async {
  final todoController = TextEditingController();
  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('新しいTodoを追加'),
        content: TextField(
          controller: todoController,
          decoration: const InputDecoration(hintText: 'Todoを入力してください'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () {
              final todoTitle = todoController.text;
              if (todoTitle.isEmpty) return;

              ref
                  .read(todoListScreenControllerProvider.notifier)
                  .addTodo(todoTitle);
              todoController.clear();
              Navigator.pop(context);
            },
            child: const Text('追加'),
          ),
        ],
      );
    },
  );
}
