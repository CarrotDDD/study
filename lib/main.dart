import 'package:flutter/material.dart';
import 'dart:math';
import 'AnimatedExam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
       home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:Scaffold(
        appBar: AppBar(
          title : Text('Flutter Tutorial'),
        ),
        body:MovePageList(),
      )
    );
  }
}

class MovePageList extends StatefulWidget {
  const MovePageList({Key? key}) : super(key: key);

  @override
  _MovePageListState createState() => _MovePageListState();
}

class _MovePageListState extends State<MovePageList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Animated Container"),
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter Animatino Container")));
        }),
        ListTile(
          title: Text("Animated Opacity"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAnimatedOpcacity()));
          },
        ),
        ListTile(
            title:Text("Drawer"),
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAnimatedOpcacity()));
            }
        ),
      ],
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
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadius _BorderRadius = BorderRadius.circular(8);
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child:AnimatedContainer(
          width: _width,
          height:_height,
          decoration: BoxDecoration(
            borderRadius: _BorderRadius,//모서리를 둥글게 , Decoration이 있으면 Null로 줘야한다. Decoration 안에 넣어야함
            color: _color,
          ),
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed:(){
            setState(() {
              final random = Random();
              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
              _width = random.nextInt(300).toDouble();// 0 ~ 300 Random Val Gernerate
              _height = random.nextInt(300).toDouble();
              _BorderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
              print("width : "+ _width.toString()+ " height :"+ _height.toString());
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
