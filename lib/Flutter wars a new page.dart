import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:speech_to_text/speech_to_text.dart' as stt;

class Flutterwars extends StatefulWidget {
  const Flutterwars({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Flutterwars> createState() => FlutterwarsState();
}
class FlutterwarsState extends State<Flutterwars> {
  int _counter = 0;
  double thisisntafloat = 0.15;
  bool amIstupid = true;
  //late stt.SpeechToText Speech;
  bool islistening=false;
  String text = "Press button and start speaking";

  void IHearEverything() async {
    /*
    if (islistening==false){
      //bool available = await Speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      //);
      //if(available==true){
        setState(() => islistening = true); //Setting State, Will rerun our build method
      //Speech.listen(
        onResult: (val) => setState(() {
          text = val.recognizedWords; //text is the text we are displaying
                                //val.recognizedWords is a string of the words you just spoke
        //  if (val.hasConfidenceRating && val.confidence > 0) {
          //  confidence = val.confidence; //How confident the speech to text is
         // }
        }),
      );
      }
    }
    else{
      Speech.stop();
      setState(() => islistening = false);
    }
*/

  }


  void thisisaloop() {
    print("Test");
    for (int placeholdervariable = 0; placeholdervariable <
        21; placeholdervariable++) {
      if (placeholdervariable < 10) {
        print("Unholy Screaming");
      }
      else if (placeholdervariable == 10) {
        print("Perfectly balanced, as all things should be.");
      }
      else if (placeholdervariable > 10) {
        print("More unholy screaming");
      }
    }
  }


  void _incrementCounter() {
    print("Counter increased by 1");
  }

  @override
  //WHERE ALL THE MAGIC HAPPENS
  Widget build(BuildContext context) { //build
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            IHearEverything();
          }

      ),
      body: SingleChildScrollView(
        reverse: true,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Container(
        // A fixed-height child.
        color: const Color(0xffeeee00), // Yellow
        height: 120.0,
        alignment: Alignment.center,
        child: Text(text),
      ),
            Container(
              // A fixed-height child.
              color: const Color(0xffee002c), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xffee00da), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xff00ee20), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xff009bee), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xff00ee93), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xff9f00ee), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            Container(
              // A fixed-height child.
              color: const Color(0xffee7700), // Yellow
              height: 120.0,
              alignment: Alignment.center,
              child: const Text('Fixed Height Content'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
