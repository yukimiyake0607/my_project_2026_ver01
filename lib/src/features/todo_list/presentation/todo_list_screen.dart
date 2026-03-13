import 'package:flutter/material.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/domain/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [
    Todo(id: '1', title: 'Todo 1', isDone: false),
    Todo(id: '2', title: 'Todo 2', isDone: false),
    Todo(id: '3', title: 'Todo 3', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
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
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: todos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
