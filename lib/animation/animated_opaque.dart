import 'package:flutter/material.dart';

void main() => runApp(AnimaOpaque());

class AnimaOpaque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaOpaque(title: 'animated align'),
    );
  }
}

class MyAnimaOpaque extends StatefulWidget {
  MyAnimaOpaque({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaOpaqueState createState() => MyAnimaOpaqueState();
}

class MyAnimaOpaqueState extends State<MyAnimaOpaque> {
  var tap = 0.0;

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
            tap = tap == 0.0 ? 1.0 : 0.0;
          });
        },
        child: Center(
          child: Container(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              child: Container(
                child: Text('Hiii'),
                color: Colors.teal,
                height: 150,
                width: 100,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: tap,
            ),
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
