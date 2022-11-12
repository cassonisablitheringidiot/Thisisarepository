import 'dart:math';

import 'package:flutter/material.dart';
import 'package:this_is_a_project/main.dart';
import 'package:this_is_a_project/thisisafile.dart';
import 'package:this_is_a_project/wahooo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'Widgets.dart';
import 'package:page_transition/page_transition.dart';

import 'Prepare to fail. Very, very badly..dart';
import 'database.dart';

import 'dart:convert' as convert;
import 'package:flutter_quill/flutter_quill.dart';


class wahooo extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  String title;
  List<dynamic> json;
  String link =
      "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";

  wahooo(this.json, this.title, this.link);

  @override
  State<wahooo> createState() => wahoooState(json, title, link);
}

class wahoooState extends State<wahooo> {
  String title;
  var json;
  String link = "";

  wahoooState(this.json, this.title, this.link);

  var jsonLink;
  var jsonLinks;
  int _counter = 0;
  QuillController thisisaquill = QuillController.basic();
  double thisisntafloat = 0.15;
  bool amIstupid = true;


  //DatabaseReference db= FirebaseDatabase.instance.ref().child("Thisispath").child("Hello");
  DatabaseHelper dbhelper = DatabaseHelper();
  Material matHelper = Material();
  final myController = TextEditingController();
  List<linkText> textWidgetList = []; // Here we defined a list of widget!

  @override
  void initState() {
    SetTitle();
    SetJson();
    if (this.link != ""){
      var jsonResponse =
      convert.jsonDecode(this.link) as Map<String, dynamic>;
      if (jsonResponse != "") {
        // jsonLink =
        // jsonDecode(link) as Map<String, dynamic>;
        jsonResponse.forEach((key, value) {
          textWidgetList.add(
              linkText(key, value));
        });
    }



    }

  }



  void SetJson() async {
    if (json.isEmpty) {
      thisisaquill = QuillController.basic();
    } else {
      setState(() => thisisaquill = QuillController(
          document: Document.fromJson(json),
          selection: TextSelection.collapsed(offset: 0)));
    }
  }

  void SetTitle() {
    if (title != "Editing Page") {
      setState(() => myController.text = title);
    } else {
      setState(() => myController.text = "Editing Page");
    }
  }

  void thisisaloop() {
    print("Test");
    for (int placeholdervariable = 0;
        placeholdervariable < 21;
        placeholdervariable++) {
      if (placeholdervariable < 10) {
        print("Unholy Screaming");
      } else if (placeholdervariable == 10) {
        print("Perfectly balanced, as all things should be.");
      } else if (placeholdervariable > 10) {
        print("More unholy screaming");
      }
    }
  }

  void _incrementCounter() {
    print("Counter increased by 1");

    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            child: lettheembarassmentcommence(title: "Save file page")));
  }

  void uploadPage() async {
    //DatabaseReference _testRef = FirebaseDatabase.instance.ref().child("Thisisapath");
    taskpage _newTask = taskpage(
        myController.text, //replace hello with myController.text
        jsonEncode(thisisaquill.document.toDelta().toJson()),
        this.link);
    await dbhelper.insertTask(_newTask);
  }




  @override
  //WHERE ALL THE MAGIC HAPPENS
  Widget build(BuildContext context) {


    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: uploadPage,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: AppBar(automaticallyImplyLeading: false, title: Row(children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: MyHomePage(title: "Record Page")));})]),
        actions: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: lettheembarassmentcommence(
                              title: "Save file page")));
                }),

          ]),
        ),
        body: Column(children: [
          TextField(
            controller: myController,
          ),

          //Add TextField widgit here, ex TextField(),
          Padding(
            child: QuillToolbar.basic(controller: thisisaquill),
            padding: EdgeInsets.only(top: 30.0),
          ),
          Expanded(
              child: Container(
            color: Colors.grey,
            child: QuillEditor.basic(controller: thisisaquill, readOnly: false),
          )),
          Container(
              color: Colors.white,
              height: 120,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(children: textWidgetList
                  )))
        ]));
  }
}
