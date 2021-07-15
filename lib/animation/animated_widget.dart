import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(AnimaWidget());

class AnimaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaWidget(title: 'animated align'),
    );
  }
}

class MyAnimaWidget extends StatefulWidget {
  MyAnimaWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaWidgetState createState() => MyAnimaWidgetState();
}

class MyAnimaWidgetState extends State<MyAnimaWidget>
    with TickerProviderStateMixin {
  var tap = false;
  late final controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

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
        body: Center(
            child: MovingWidget(
          controller: controller,
        )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MovingWidget extends AnimatedWidget {
  MovingWidget({Key? key, required AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: progress.value * pi,
      child: FlutterLogo(),
    );
  }
}
