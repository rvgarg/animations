import 'package:animations/animation/animated_align.dart';
import 'package:animations/animation/animated_builder.dart';
import 'package:animations/animation/animated_container.dart';
import 'package:animations/animation/animated_crossfade.dart';
import 'package:animations/animation/animated_defaulttext.dart';
import 'package:animations/animation/animated_opaque.dart';
import 'package:animations/animation/animated_positioned.dart';
import 'package:animations/animation/animated_size.dart';
import 'package:animations/animation/animated_text.dart';
import 'package:animations/animation/animated_widget.dart';
import 'package:animations/animation/decorated_box.dart';
import 'package:animations/animation/fade_transition.dart';
import 'package:animations/animation/rotation.dart';
import 'package:animations/animation/scale.dart';
import 'package:animations/animation/size.dart';
import 'package:animations/animation/slide.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = [
    'Animated Align',
    'Animated Builder',
    'Animated Container',
    'Animated CrossFade',
    'Animated Default Text Style',
    'Animated Opacity',
    'Animated Positioned',
    'Animated Size',
    'Animated Text',
    'Animated Widget',
    'Decorated Box Transition',
    'Fade Transition',
    'Rotation Transition',
    'Size Transition',
    'Scale Transition',
    'Slide Transition'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () {
                setState(() {
                  switch (list[index]) {
                    case 'Animated Align':
                      Navigator.pushNamed(context, '/animated_align');
                      break;
                    case 'Animated Builder':
                      Navigator.pushNamed(context, '/animated_builder');
                      break;
                    case 'Animated Container':
                      Navigator.pushNamed(context, '/animated_container');
                      break;
                    case 'Animated CrossFade':
                      Navigator.pushNamed(context, '/animated_crossfade');
                      break;
                    case 'Animated Default Text Style':
                      Navigator.pushNamed(context, '/animated_defaulttext');
                      break;
                    case 'Animated Opacity':
                      Navigator.pushNamed(context, '/animated_opaque');
                      break;
                    case 'Animated Positioned':
                      Navigator.pushNamed(context, '/animated_positioned');
                      break;
                    case 'Animated Size':
                      Navigator.pushNamed(context, '/animated_size');
                      break;
                    case 'Animated Widget':
                      Navigator.pushNamed(context, '/animated_widget');
                      break;
                    case 'Decorated Box Transition':
                      Navigator.pushNamed(context, '/decorated_box');
                      break;
                    case 'Fade Transition':
                      Navigator.pushNamed(context, '/fade_transition');
                      break;
                    case 'Rotation Transition':
                      Navigator.pushNamed(context, '/rotation');
                      break;
                    case 'Size Transition':
                      Navigator.pushNamed(context, '/size');
                      break;
                    case 'Scale Transition':
                      Navigator.pushNamed(context, '/scale');
                      break;
                    case 'Slide Transition':
                      Navigator.pushNamed(context, '/slide');
                      break;
                    case 'Animated Text':
                      Navigator.pushNamed(context, '/animated_text');
                      break;
                  }
                });
              },
              child: Text(list[index]));
        },
      ),
    );
  }
}
