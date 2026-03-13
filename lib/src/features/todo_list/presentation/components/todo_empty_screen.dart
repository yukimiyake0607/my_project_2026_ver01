import 'package:flutter/material.dart';

class TodoEmptyScreen extends StatelessWidget {
  const TodoEmptyScreen({super.key});

  static const _emptyImagePath = 'assets/fitness.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _emptyImagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Text('no'),
            semanticLabel: 'Todo empty',
          ),
          const SizedBox(height: 16),
          const Text('全てのTodoが完了しています！'),
        ],
      ),
    );
  }
}
