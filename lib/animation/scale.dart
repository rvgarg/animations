import 'package:flutter/material.dart';

void main() => runApp(Scale());

class Scale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScale(title: 'animated align'),
    );
  }
}

class MyScale extends StatefulWidget {
  MyScale({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyScaleState createState() => MyScaleState();
}

class MyScaleState extends State<MyScale> with TickerProviderStateMixin {

  late final AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(seconds: 10))
    ..repeat(reverse: true);

  late final Animation<double> animation = CurvedAnimation(
      parent: controller, curve: Curves.fastOutSlowIn);

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
          )
      ),
      body: Center(
        child: ScaleTransition(scale: animation,
          child: Container(padding: EdgeInsets.all(10),
            color: Colors.redAccent,
            child: FlutterLogo(size: 140,),
          ),
        ),
      ),
    );
  }
}
