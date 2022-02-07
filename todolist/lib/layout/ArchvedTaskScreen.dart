import 'package:flutter/material.dart';

class ArchivedTaskScreen extends StatelessWidget {
  const ArchivedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "archived tasks ",
        style: TextStyle(fontWeight: FontWeight.bold, color: (Colors.blue)),
      ),
    );
  }
}
