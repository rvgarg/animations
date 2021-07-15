import 'package:flutter/material.dart';

void main() => runApp(AnimaSize());

class AnimaSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaSize(title: 'animated align'),
    );
  }
}

class MyAnimaSize extends StatefulWidget {
  MyAnimaSize({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaSizeState createState() => MyAnimaSizeState();
}

class MyAnimaSizeState extends State<MyAnimaSize>
    with TickerProviderStateMixin {
  var tap = false;
  var size = 50.0;

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
              size = tap ? 100.0 : 50.0;
              tap = !tap;
            });
          },
          child: Center(
            child: AnimatedSize(
              duration: const Duration(seconds: 2),
              child: Container(
                child: FlutterLogo(
                  size: size,
                ),
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              vsync: this,
            ),
          )),
    );
  }
}
