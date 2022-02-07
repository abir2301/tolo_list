import 'package:flutter/material.dart';
import 'package:todolist/layout/ArchvedTaskScreen.dart';
import 'package:todolist/layout/NewDoneTaskScreen.dart';
import 'package:todolist/layout/NewTaskScreen.dart';
import 'db/db.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int curentIndex = 0;
  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
    const NewTaskScreen(),
    const NewDoneTaskScreen(),
    const ArchivedTaskScreen()
  ];
  @override
  // ignore: override_on_non_overriding_member
  void initState() {
    super.initState();
    createdatabase();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text(' todo list App  '),
        ),
        body: Screens[curentIndex],
        // ignore: prefer_const_constructors
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: insertdatabase,
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
