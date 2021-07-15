import 'package:flutter/material.dart';

void main() => runApp(Rotation());

class Rotation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRotation(title: 'animated align'),
    );
  }
}

class MyRotation extends StatefulWidget {
  MyRotation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyRotationState createState() => MyRotationState();
}

class MyRotationState extends State<MyRotation> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              child: RotationTransition(
                  turns: animation, child: Center(child: Text('Rotation'))),
              height: 100,
              width: 100,
              color: Colors.tealAccent,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
