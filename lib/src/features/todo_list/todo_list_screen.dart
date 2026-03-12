import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (value) {
                  return;
                },
              ),
              title: Text('Todo ${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
