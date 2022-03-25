import 'package:flutter/material.dart';

class MyAnimatedOpcacity extends StatefulWidget {
  const MyAnimatedOpcacity({Key? key}) : super(key: key);

  @override
  _MyAnimatedOpcacity createState() => _MyAnimatedOpcacity();
}

class _MyAnimatedOpcacity extends State<MyAnimatedOpcacity> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Animated Opacity")),
      ),
      body: Center(
        child: AnimatedOpacity(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.play_arrow),
          onPressed: (){
            setState(() {
              _visible = !_visible;
            });
          },
      ),
    );
  }
}
