import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'Widgets.dart';
import'authentication.dart';

class DatabaseHelper {
  List<taskpage> data = <taskpage>[];
  String title = "unamed Task";
  List<dynamic> myJson = [];
  AuthenticationHelper authhelper = AuthenticationHelper();
  insertTask(taskpage task) async {

    DatabaseReference _db1 = FirebaseDatabase.instance.ref();
    _db1.child(authhelper.user.uid).child(task.title).set(task.toMap());
  }

  void updateData(DataSnapshot i)
  {

    List<taskpage> data1 = <taskpage>[];
    int t = 0;
    for (DataSnapshot i in i.children) {
      // title = event.snapshot.children.elementAt(i).value.toString();
      print(i.children.elementAt(0).value.toString());

      data1.insert(t, (taskpage(
        i.children.elementAt(2).value.toString(),
        i.children.elementAt(1).value.toString(),
        i.children.elementAt(0).value.toString(),
      )));
      t++;
    };

    data = data1;
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
      updateData(event.snapshot);
      /*for (DataSnapshot i in event.snapshot.children) {
        // title = event.snapshot.children.elementAt(i).value.toString();
        print(i.children.elementAt(0).value.toString());

        data.insert(t, (taskpage(
          i.children.elementAt(5).value.toString(),
          i.children.elementAt(4).value.toString(),
          i.children.elementAt(3).value.toString(),
          i.children.elementAt(2).value.toString(),
          i.children.elementAt(1).value.toString(),
          i.children.elementAt(0).value.toString(),
        )));
        t++;
      };*/
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