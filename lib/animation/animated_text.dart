import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animation/rotation.dart';
import 'package:animations/animation/scale.dart';
import 'package:animations/animation/size.dart';
import 'package:animations/animation/slide.dart';
import 'package:flutter/material.dart';

import 'animated_align.dart';
import 'animated_builder.dart';
import 'animated_container.dart';
import 'animated_crossfade.dart';
import 'animated_defaulttext.dart';
import 'animated_opaque.dart';
import 'animated_positioned.dart';
import 'animated_size.dart';
import 'animated_widget.dart';
import 'decorated_box.dart';
import 'fade_transition.dart';

void main() => runApp(AnimatedText());

class AnimatedText extends StatelessWidget {
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
      home: MyAnimatedText(title: 'animated align'),
    );
  }
}

class MyAnimatedText extends StatefulWidget {
  MyAnimatedText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyAnimatedTextState createState() => MyAnimatedTextState();
}

class MyAnimatedTextState extends State<MyAnimatedText>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))
        ..repeat(reverse: true);

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

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
                Navigator.of(context).pop();
              },
            )),
        body: Center(
          child: Row(
            children: [
              Text(
                'Text',
                style: TextStyle(fontSize: 40),
              ),
              DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.red,
                    fontFamily: 'Horizon'),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('A'),
                    RotateAnimatedText('B'),
                    RotateAnimatedText('C')
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
