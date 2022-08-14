import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'Widgets.dart';

class DatabaseHelper {
  final List<taskpage> data = <taskpage>[];
  String title = "unamed Task";
  List<dynamic> myJson = [];
  insertTask(taskpage task) async {
    DatabaseReference _db1 = FirebaseDatabase.instance.ref();
    _db1.child('tasks').child(task.title).set(task.toMap());
  }

  List<taskpage> getValue() {
    DatabaseReference _db1 = FirebaseDatabase.instance.ref();
    var ref = _db1.child('tasks');
    ref.onValue.listen((event) {
      //i = 0;
      int x = event.snapshot.children.length;
      print(x);
      data.clear();
      int t = 0;
      for (DataSnapshot i in event.snapshot.children) {
        // title = event.snapshot.children.elementAt(i).value.toString();

        data.insert(t, (taskpage(
          i.children.elementAt(2).value.toString(),
          i.children.elementAt(1).value.toString(),
          i.children.elementAt(0).value.toString(),
        )));
        t++;
      };
    });
    return data; //a list of all our taskpage widgets
  }

  List<dynamic> getSingleJson(String title) {
    DatabaseReference _db1 = FirebaseDatabase.instance.ref()
        .child('tasks')
        .child(title);
    _db1.onValue.listen((event) {

      String task = event.snapshot.children
          .elementAt(0)
          .value
          .toString();
      myJson = jsonDecode(task);

    });
    return myJson;
  }
}