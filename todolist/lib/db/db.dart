import 'package:sqflite/sqflite.dart';

Database? database;
//create table task(id integer primary key,title text ,data text ,time text , status text  )')
// ignore: non_constant_identifier_names
void createdatabase() async {
  // ignore: unused_local_variable
  var database = await openDatabase("todo.db", version: 2,
      onCreate: (database, version) async {
    print("data base created ");
    await database
        .execute(
            'create table task(id integer primary key,title text ,data text ,time text , status text  )')
        .then((value) {
      print("table created ");
    }).catchError((Error) {
      print("error while creating table ");
    });
  }, onOpen: (database) {
    print("data base opened ");
  });
}

void insertdatabase() {
  print("hello insert");
  database?.transaction((txn) async {
    await txn
        .rawInsert(
            'INSERT INTO task (title, date, time,status) VALUES("fist task", "12/05/22", "12.53","new")')
        .then((value) {
      print("$value? inserted successfully ");
    }).catchError((error) {
      print("error while inserting values ");
    });
  });
}
