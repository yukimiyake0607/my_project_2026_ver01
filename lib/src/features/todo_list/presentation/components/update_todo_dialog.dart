import 'package:flutter/material.dart';

class UpdateTodoDialog {
  UpdateTodoDialog._();

  static Future<String?> show(
    BuildContext context,
    String currentTitle,
  ) {
    return showDialog<String?>(
      context: context,
      builder: (context) =>
          _UpdateTodoDialogContent(currentTitle: currentTitle),
    );
  }
}

class _UpdateTodoDialogContent extends StatefulWidget {
  const _UpdateTodoDialogContent({
    required this.currentTitle,
  });
  final String currentTitle;

  @override
  State<_UpdateTodoDialogContent> createState() =>
      _UpdateTodoDialogContentState();
}

class _UpdateTodoDialogContentState extends State<_UpdateTodoDialogContent> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentTitle);
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
            Navigator.pop(context, title);
          },
          child: const Text('更新'),
        ),
      ],
    );
  }
}
