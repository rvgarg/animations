import 'package:animations/animation/rotation.dart';
import 'package:animations/animation/scale.dart';
import 'package:animations/animation/slide.dart';
import 'package:flutter/material.dart';

import 'animated_builder.dart';
import 'animated_container.dart';
import 'animated_crossfade.dart';
import 'animated_defaulttext.dart';
import 'animated_opaque.dart';
import 'animated_positioned.dart';
import 'animated_size.dart';
import 'animated_text.dart';
import 'animated_widget.dart';
import 'decorated_box.dart';
import 'fade_transition.dart';
import 'size.dart';

void main() => runApp(AnimaAlign());

class AnimaAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        '/animated_align': (context) => AnimaAlign(),
        '/animated_builder': (context) => AnimaBuild(),
        '/animated_crossfade': (context) => AnimaCrossFade(),
        '/animated_defaulttext': (context) => AnimaDefaultText(),
        '/animated_opaque': (context) => AnimaOpaque(),
        '/animated_positioned': (context) => AnimaPositioned(),
        '/animated_size': (context) => AnimaSize(),
        '/animated_widget': (context) => AnimaWidget(),
        '/decorated_box': (context) => DecoratedBoxTra(),
        '/fade_transition': (context) => FadeTransitionW(),
        '/rotation': (context) => Rotation(),
        '/scale': (context) => Scale(),
        '/size': (context) => Size(),
        '/slide': (context) => Slide(),
        '/animated_container': (context) => AnimaContainer(),
        '/animated_text': (context) => AnimatedText(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAnimaAlign(title: 'animated align'),
    );
  }
}

class MyAnimaAlign extends StatefulWidget {
  MyAnimaAlign({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimaAlignState createState() => MyAnimaAlignState();
}

class MyAnimaAlignState extends State<MyAnimaAlign> {
  var tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            tap = !tap;
          });
        },
        child: Container(
          color: Colors.amber,
          height: double.infinity,
          width: double.infinity,
          child: AnimatedAlign(
            duration: const Duration(seconds: 2),
            child: Padding(
              child: Text(
                'Hiii',
                style: TextStyle(color: Colors.redAccent, fontSize: 30),
              ),
              padding: EdgeInsets.all(20),
            ),
            alignment: tap ? Alignment.topLeft : Alignment.bottomRight,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ),
      ),
    );
  }
}
