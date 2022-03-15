import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:todolist/db/db.dart';

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

Widget form() {
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  // ignore: unused_local_variable
  var formkey = GlobalKey<FormState>();

  return MaterialApp(builder: (context, child) {
    return Form(
      key: formkey,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  controller: titlecontroller,
                  onFieldSubmitted: (value) {
                    titlecontroller.text = value;
                  },
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('title must not be empty ');
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text('task Title'),
                    icon: Icon(Icons.title),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextFormField(
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        print(value.toString());
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
                        return ('time   must not be empty ');
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text("task time"), icon: Icon(Icons.timer))),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextFormField(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2050))
                          .then((value) {
                        print(value.toString());
                        datecontroller.text = DateFormat.yMMMd().format(value!);
                        print("time controller ${timecontroller.text}");
                      }).catchError((Error) {
                        print("error while get task time ");
                      });
                    },
                    controller: datecontroller,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('date  must not be empty ');
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text("task date "),
                        icon: Icon(Icons.calendar_today))),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Colors.grey[400],
                  ),
                  child: const Text("add "),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print("insert");
                      insertdatabase(
                              title: titlecontroller.text,
                              date: datecontroller.text,
                              time: timecontroller.text)
                          .catchError((Error) {
                        print(Error.toString());
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  });
}
