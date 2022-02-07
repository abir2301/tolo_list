import 'package:flutter/material.dart';

class NewDoneTaskScreen extends StatelessWidget {
  const NewDoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "done tasks ",
        style: TextStyle(fontWeight: FontWeight.bold, color: (Colors.blue)),
      ),
    );
  }
}
