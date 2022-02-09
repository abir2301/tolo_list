import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onsubmit,
  Function? ontap,
  Function? onchange,
  Function? validate,
  required String label,
  required IconData iconform,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: (value) {
      onsubmit;
    },
    onTap: () {
      ontap;
    },
    decoration: InputDecoration(label: Text(label), icon: Icon(iconform)),
  );
}

Widget form({required context}) {
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();

  return Form(
      child: Container(
    color: Colors.grey[300],
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          defaultTextFormField(
              controller: titlecontroller,
              onsubmit: (value) {
                timecontroller.text = value;
              },
              type: TextInputType.text,
              validate: (value) {
                if (value.isempty) {
                  return ('value must not be empty ');
                }
              },
              label: 'task Title',
              iconform: Icons.title),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  timecontroller.text = value!.format(context).toString();
                  print("time controller ${timecontroller.text}");
                }).catchError((Error) {
                  print("error while get task time ");
                });
              },
              controller: timecontroller,
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return ('value must not be empty ');
                }
              },
              decoration: const InputDecoration(
                  label: Text("task time'"), icon: Icon(Icons.timer))),
        ],
      ),
    ),
  ));
}
