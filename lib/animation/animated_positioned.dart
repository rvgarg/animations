import 'package:flutter/material.dart';

void main() => runApp(AnimaPositioned());

class AnimaPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaPositioned(title: 'animated align'),
    );
  }
}

class MyAnimaPositioned extends StatefulWidget {
  MyAnimaPositioned({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaPositionedState createState() => MyAnimaPositionedState();
}

class MyAnimaPositionedState extends State<MyAnimaPositioned> {
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
        child: Stack(children: [
          Center(
            child: AnimatedPositioned(
              height: tap ? 150 : 200,
              width: tap ? 200 : 150,
              top: tap ? 100 : 150,
              duration: const Duration(seconds: 2),
              child: Container(
                child: Text('Tap to See'),
                color: Colors.cyanAccent,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          )
        ]),
      ),
    );
  }
}
