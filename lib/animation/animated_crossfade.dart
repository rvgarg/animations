import 'package:flutter/material.dart';

void main() => runApp(AnimaCrossFade());

class AnimaCrossFade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaCrossFade(title: 'animated align'),
    );
  }
}

class MyAnimaCrossFade extends StatefulWidget {
  MyAnimaCrossFade({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaCrossFadeState createState() => MyAnimaCrossFadeState();
}

class MyAnimaCrossFadeState extends State<MyAnimaCrossFade> {
  var tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: GestureDetector(
          onTap: () {
            setState(() {
              tap = !tap;
            });
          },
          child: Center(
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 4),
              firstChild: Container(
                child: Text('First'),
                height: 100,
                width: 160,
                color: Colors.deepPurpleAccent,
              ),
              crossFadeState:
                  tap ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              secondChild: Container(
                height: 120,
                width: 80,
                child: Text('Second'),
                color: Colors.blueGrey,
              ),
            ),
          )),
    );
  }
}
