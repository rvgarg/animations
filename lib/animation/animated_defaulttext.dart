import 'package:flutter/material.dart';

void main() => runApp(AnimaDefaultText());

class AnimaDefaultText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaDefaultText(title: 'animated align'),
    );
  }
}

class MyAnimaDefaultText extends StatefulWidget {
  MyAnimaDefaultText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaDefaultTextState createState() => MyAnimaDefaultTextState();
}

class MyAnimaDefaultTextState extends State<MyAnimaDefaultText> {
  var fontSize = 30.0;
  var tap = false;
  var color = Colors.red;

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
              fontSize = tap ? 30.0 : 60.0;
              color = tap ? Colors.red : Colors.teal;
              tap = !tap;
            });
          },
          child: Container(
            color: Colors.amber,
            height: double.infinity,
            width: double.infinity,
            child: AnimatedDefaultTextStyle(
              child: Text('Raghav'),
              style: TextStyle(
                fontSize: fontSize,
                color: color,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            ),
          ),
        ));
  }
}
