import 'package:flutter/material.dart';
import 'package:value_animation_progress/value_animation_progress%20.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Animation Progress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Value Animation Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// range is from 1 to 100
  double value = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ValueAnimationProgress(
        value: value,
        textSize: 30,
        duration: Duration(seconds: 3),
        textColor: Colors.white,
        cardHeight: 170,
        cardWidth: 170,
        progressRadius: 120,
        progressStrokeWidth: 20,
        textBackGroundColor: Colors.blue,
        gradientCircularProgressColorOne: Color.fromRGBO(58, 255, 51, 1),
        gradientCircularProgressColorTwo: Color.fromRGBO(255, 85, 51, 1),
        gradientCircularProgressColorThree: Color.fromRGBO(255, 85, 51, 1),
      )),
    );
  }
}
