import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text(' todo list App  '),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: curentIndex,
            onTap: (index) {
              setState(() {
                curentIndex = index;
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: 'task '),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.check), label: 'done  '),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined), label: 'archived  ')
            ])));
  }
}
