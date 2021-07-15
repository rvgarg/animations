import 'package:flutter/material.dart';

void main() => runApp(FadeTransitionW());

class FadeTransitionW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFadeTransitionW(title: 'animated align'),
    );
  }
}

class MyFadeTransitionW extends StatefulWidget {
  MyFadeTransitionW({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyFadeTransitionWState createState() => MyFadeTransitionWState();
}

class MyFadeTransitionWState extends State<MyFadeTransitionW>
    with TickerProviderStateMixin {
  var tap = false;

  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))
        ..repeat(reverse: true);

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

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
          child: FadeTransition(
            child: Container(
              color: Colors.green,
              child: Text('Faded Text',style: TextStyle(color: Colors.red),),
              padding: EdgeInsets.all(10),
            ),
            opacity: animation,
          ),
        ));
  }
}
