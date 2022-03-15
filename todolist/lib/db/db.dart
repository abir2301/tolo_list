/*import 'package:flutter/foundation.dart';*/
import 'package:sqflite/sqflite.dart';

Database? db;
//create table task(id integer primary key,title text ,data text ,time text , status text  )')
// ignore: non_constant_identifier_names
void createdatabase() async {
  // ignore: unused_local_variable
  var db = await openDatabase("task2022.db", version: 11,
      onCreate: (Database db, int version) async {
    print("data base created ");
    await db
        .execute(
            'create table task(id integer primary key,title text ,date text ,time text , status text )')
        .then((value) {})
        .catchError((Error) {
      print("error while creating table ");
    });
  }, onOpen: (db) {
    print("database oppen ");
    getdata(db);
  });
}

Future insertdatabase({
  required String? title,
  required String? date,
  required String? time,
}) async {
  print(title);
  print(time);
  print(date);
  await db?.transaction((txn) async {
    int? id1 = await txn
        .rawInsert(
            'INSERT INTO task(title,time, date,status) VALUES("$title", "$time", "$date" , "new" )')
        .catchError((Error) {
      print(Error.toString());
    });
    print("id1 ===$id1");
  }).then((value) {
    print(value);
  }).catchError((Error) {
    print(Error.toString());
  });
}

void getdata(Database db) async {
  print("database  ");
  List<Map> tasks = await db.rawQuery('SELECT * FROM task').then((value) {
    print("tasks =$value");
    return value;
  }).catchError((Error) {
    print(Error.toString());
  });
}
