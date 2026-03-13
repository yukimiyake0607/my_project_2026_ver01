import 'package:flutter/material.dart';

/// 新規追加用のダイアログ。
class AddTodoDialog {
  AddTodoDialog._();

  static Future<String?> show(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => const _AddTodoDialogContent(),
    );
  }
}

class _AddTodoDialogContent extends StatefulWidget {
  const _AddTodoDialogContent();

  @override
  State<_AddTodoDialogContent> createState() => _AddTodoDialogContentState();
}

class _AddTodoDialogContentState extends State<_AddTodoDialogContent> {
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
      title: const Text('新しいTodoを追加'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Todoを入力してください'),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            final title = _controller.text.trim();
            Navigator.pop(context, title);
          },
          child: const Text('追加'),
        ),
      ],
    );
  }
}
