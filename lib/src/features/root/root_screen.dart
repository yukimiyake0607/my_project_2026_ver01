import 'package:flutter/material.dart';
import 'package:my_project_2026_ver01/src/features/mypage/mypage_screen.dart';
import 'package:my_project_2026_ver01/src/features/todo_list/todo_list_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _pages = [const TodoListScreen(), const MypageScreen()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mypage'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
