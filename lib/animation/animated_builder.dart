import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(AnimaBuild());

class AnimaBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaBuild(title: 'animated align'),
    );
  }
}

class MyAnimaBuild extends StatefulWidget {
  MyAnimaBuild({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaBuildState createState() => MyAnimaBuildState();
}

class MyAnimaBuildState extends State<MyAnimaBuild>
    with TickerProviderStateMixin {
  late final controller =
      AnimationController(vsync: this, duration: Duration(seconds: 12))
        ..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: Center(
          child: AnimatedBuilder(
              animation: controller,
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.limeAccent,
                child: new FlutterLogo(size: 150,),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value * pi,
                  child: child,
                );
              })),
    );
  }
}
