
import 'package:flutter/material.dart';

import 'Flutter wars a new page.dart';
import 'main.dart';

class nextpage extends StatefulWidget {
   nextpage({required this.title});

  final String title;


   @override
   MyNextPage createState() => MyNextPage();

  }

class MyNextPage extends State<nextpage> {


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  Widget build(BuildContext context){

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Flutterwars(title: "Insert star wars theme here")),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      appBar: PreferredSize(preferredSize: Size.fromHeight(100.0),
        child: AppBar(
         //
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('This is an app. It is an app.'),
        ),
      ),
      body: const Center(
        child: TextField(
          decoration:InputDecoration(
            border:OutlineInputBorder(),
            labelText:'Word of passage'
          )
        )
        //child: Column(
         // children: <Widget>[
         // ]
        //)
      )


    );
  }
}

void _incrementCounter() {
  print("Casson's braincell count -1");
}