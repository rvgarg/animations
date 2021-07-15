import 'package:flutter/material.dart';

void main() => runApp(Slide());

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySlide(title: 'animated align'),
    );
  }
}

class MySlide extends StatefulWidget {
  MySlide({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MySlideState createState() => MySlideState();
}

class MySlideState extends State<MySlide> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))
        ..repeat(reverse: true);

  late final Animation<Offset> animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.title),
        ),
        body: Center(
          child: SlideTransition(
            position: animation,
            child: Text('Done!'),
          ),
        ));
  }
}
