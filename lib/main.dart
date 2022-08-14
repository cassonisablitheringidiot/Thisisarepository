import 'package:flutter/material.dart';
import 'package:this_is_a_project/speech_api.dart';
import 'package:this_is_a_project/thisisafile.dart';
import 'package:this_is_a_project/wahooo.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:page_transition/page_transition.dart';

import 'Prepare to fail. Very, very badly..dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fpApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _fpApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error");
              return Text("Something went wrong.");
            } else if (snapshot.hasData) {
              print("yay");
              return MyHomePage(title: 'Recording Page');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double thisisntafloat = 0.15;
  bool amIstupid = true;
  String text = "This is text so type here";
  bool _isListening = false;
  List<dynamic> thisisalist = [];
  Map<String, HighlightedWord> thisisamap = {};
  String url = "";
  late stt.SpeechToText _speech;

  void initState() {
    thisisamap = {
      "Word": HighlightedWord(
        onTap: () => linkadder("Word"),
        textStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      )
    };
  }

  void linkadder(String n) {
    print("This is being called!");
    if (n == "Word") {
      url =
          "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
    }
    if (n == "something") {
      url =
          "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
    }
    if (n == "stuff") {
      url =
          "https://media-exp1.licdn.com/dms/image/C560BAQEmn2W06mzK6w/company-logo_200_200/0/1572544230584?e=2147483647&v=beta&t=RDVTFDPId3rb4lGjDwnJI6_iEK28k1_BzIGD6_AsWq0";
    }
  }

  void listen() async {
    stt.SpeechToText speech = stt.SpeechToText();
    bool available = await speech.initialize();
    if (available) {
      print("Available");
      //speech.listen(onResult: (val) => setState(() {text = val.recognizedWords;}),);
      speech.listen(onResult: print, listenFor: Duration(seconds: 10));
      speech.stop();
    } else {
      print("The user has denied the use of speech recognition.");
    }
    // some time later...
    speech.stop();
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this._isListening = isListening);
        },
      );

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              //_confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void STJ() {
    Map<String, dynamic> thisisalsoamap = new Map<String, dynamic>();
    List<dynamic> averyverycreativename = [];
    thisisalsoamap["insert"] = this.text + "\n";
    List<String> thisisanarray = this.text.split(" ");
    for (String s in thisisanarray) {
      if (s.toLowerCase() == "word") {
        url =
            "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
      }
      if (s.toLowerCase() == "math") {
        url =
            "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
      }
      if (s.toLowerCase() == "something") {
        url =
            "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
      }
      if (s.toLowerCase() == "stuff") {
        url =
            "https://media-exp1.licdn.com/dms/image/C560BAQEmn2W06mzK6w/company-logo_200_200/0/1572544230584?e=2147483647&v=beta&t=RDVTFDPId3rb4lGjDwnJI6_iEK28k1_BzIGD6_AsWq0";
      }
    }
    averyverycreativename.insert(0, thisisalsoamap);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                wahooo(averyverycreativename, "Editing Page", url)));
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
        MaterialPageRoute(
            builder: (context) => wahooo(thisisalist, "Editing Page", url)));
  }

  void thewordstodocmethod() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    List<dynamic> jsoned = [];
    data['insert'] = this.text + '\n';

    jsoned.insert(0, data);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ))4

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => wahooo(jsoned, "Editing Page", url)));
  }

  void reset() {
    setState(() => this.text = "Talk to edit");
  }

  @override
  //WHERE ALL THE MAGIC HAPPENS
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(

        appBar: AppBar(automaticallyImplyLeading: false,title: Row(children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.leftToRight, child: lettheembarassmentcommence(title: "Save file page")));
            },
          ),
        ),
  ]),
        actions: <Widget>[


            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                STJ();
              },
            ),
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () {
                reset();
              },
            ),

          ]),


        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.mic), onPressed: toggleRecording),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                child: TextHighlight(
                    text: text,
                    words: thisisamap,
                    textStyle: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w400))))
        /*Align(
          child: IconButton(
            //iIcon button is a child of container
            icon: Icon(Icons.mic),
            iconSize: 120,
            color: Colors.black54,
            alignment: Alignment(0, 1),
            onPressed: () {
              listen()
;
            },
          ),
          alignment: Alignment(0, 1)),*/
//      floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
