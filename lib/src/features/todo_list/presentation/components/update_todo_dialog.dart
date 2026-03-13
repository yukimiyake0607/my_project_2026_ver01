import 'package:flutter/material.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/domain/todo.dart';

class UpdateTodoDialog {
  UpdateTodoDialog._();

  static Future<Todo?> show(BuildContext context, Todo todo) {
    return showDialog<Todo?>(
      context: context,
      builder: (context) => _UpdateTodoDialogContent(todo: todo),
    );
  }
}

class _UpdateTodoDialogContent extends StatefulWidget {
  const _UpdateTodoDialogContent({required this.todo});
  final Todo todo;

  @override
  State<_UpdateTodoDialogContent> createState() =>
      _UpdateTodoDialogContentState();
}

class _UpdateTodoDialogContentState extends State<_UpdateTodoDialogContent> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('タスクを更新'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'タスクを入力してください'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            final title = _controller.text.trim();
            if (title.isEmpty) return;
            Navigator.pop(
              context,
              Todo(
                id: widget.todo.id,
                title: title,
                isDone: widget.todo.isDone,
              ),
            );
          },
          child: const Text('更新'),
        ),
      ],
    );
  }
}
