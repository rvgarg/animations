import 'package:flutter/material.dart';

void main() => runApp(DecoratedBoxTra());

class DecoratedBoxTra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDecoratedBoxTra(title: 'animated align'),
    );
  }
}

class MyDecoratedBoxTra extends StatefulWidget {
  MyDecoratedBoxTra({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyDecoratedBoxTraState createState() => MyDecoratedBoxTraState();
}

class MyDecoratedBoxTraState extends State<MyDecoratedBoxTra>
    with TickerProviderStateMixin {
  var tap = false;
  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: Colors.limeAccent,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60.0),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(0, 6))
          ],
          shape: BoxShape.rectangle),
      end: BoxDecoration(
          color: Colors.amberAccent,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.zero));
  late final controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 12))
        ..repeat(reverse: true);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(controller),
          child: Container(
            width: 100,
            height: 150,
            padding: EdgeInsets.all(15),
            child: Text('Trial'),
          ),
        ),
      ),
    );
  }
}
