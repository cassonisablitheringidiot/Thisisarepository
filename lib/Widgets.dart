import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:this_is_a_project/wahooo.dart';
import 'database.dart';
import 'authentication.dart';
import 'package:url_launcher/url_launcher.dart';

class linkText extends StatelessWidget {
  late String link;
  late String name;
  linkText(this.name, this.link);
  Widget build(BuildContext context){
    final Uri _url = Uri.parse(link);

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
          child: new Text(this.name),
          onTap: () => launchUrl(_url))
    );
    }
  }



class taskpage extends StatelessWidget {
  late final String title;
  late final String json;
  late final String link;
  List<dynamic> myJson=[];
  DatabaseHelper _db = DatabaseHelper();
  AuthenticationHelper authnumber2 = AuthenticationHelper();
  Map<String, String> toMap() {
    return {
      'title': title,
      'json' : json,
      'link' : link,
    };
  }

  taskpage(this.title, this.json,this.link);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DatabaseReference _db1 = FirebaseDatabase.instance.ref()
            .child(authnumber2.user.uid)
            .child(title);
        _db1.onValue.listen((event) {
          String task = event.snapshot.children
              .elementAt(0)
              .value
              .toString();
          myJson = jsonDecode(task);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => wahooo(myJson, this.title,this.link)
              ));
        });
      },


        child: Padding(
        padding: EdgeInsets.all(10.0),
    child: Container (
// A fixed-height child.
    color: const Color(0xffee002c), // Yellow
    height: 120.0,
    alignment: Alignment.center,
    child: Row(
        children: [
          Text(this.title),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                DatabaseReference _db1 = FirebaseDatabase.instance.ref()
                    .child(authnumber2.user.uid)
                    .child(title);
                    //need to add a UID for the refrence
                  _db1.remove();
              }),
        ]

    ),
    )));

  }
}
