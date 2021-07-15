import 'package:flutter/material.dart';

void main() => runApp(Size());

class Size extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySize(title: 'animated align'),
    );
  }
}

class MySize extends StatefulWidget {
  MySize({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MySizeState createState() => MySizeState();
}

class MySizeState extends State<MySize> with TickerProviderStateMixin {
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
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            child: Text(
              'Size Testing',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ));
  }
}
