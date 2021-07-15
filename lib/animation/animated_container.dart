import 'package:flutter/material.dart';

void main() => runApp(AnimaContainer());

class AnimaContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaContainer(title: 'animated align'),
    );
  }
}

class MyAnimaContainer extends StatefulWidget {
  MyAnimaContainer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaContainerState createState() => MyAnimaContainerState();
}

class MyAnimaContainerState extends State<MyAnimaContainer> {
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
            child: AnimatedContainer(
              color: tap ? Colors.amber : Colors.teal,
              height: tap ? 150 : 250,
              width: tap ? 250 : 150,
              duration: const Duration(seconds: 15),
              child: Text('Hiii'),
              alignment: tap ? Alignment.topLeft : Alignment.bottomRight,
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          )),
    );
  }
}
