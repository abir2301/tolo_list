import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

Database? db;
//create table task(id integer primary key,title text ,data text ,time text , status text  )')
// ignore: non_constant_identifier_names
void createdatabase() async {
  // ignore: unused_local_variable
  var db = await openDatabase("app11.db", version: 11,
      onCreate: (Database db, int version) async {
    print("data base created ");
    await db
        .execute(
            'create table task(id integer primary key,title text ,date text ,time text , status text )')
        .then((value) {
      print("table created ");
    }).catchError((Error) {
      print("error while creating table ");
    });
  }, onOpen: (db) {
    getdata(db);
  });
}

Future insertdatabase({
  required title,
  required date,
  required time,
}) async {
  return await db?.transaction((txn) async {
    await txn
        .rawInsert(
            'INSERT INTO task (title, date, time,status) VALUES ("$title", "$date", "$time","new")')
        .then((value) {
      print("$value inserted successfully ");
    }).catchError((error) {
      print("error while inserting values ");
    });
  });
}

void getdata(Database db) async {
  print("database  ");
  List<Map> tasks = await db.rawQuery('SELECT * FROM task');
  print("tasks =$tasks");
}
