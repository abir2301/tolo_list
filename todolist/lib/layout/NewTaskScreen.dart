import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "newtask",
        style: TextStyle(fontWeight: FontWeight.bold, color: (Colors.blue)),
      ),
    );
  }
}
