import 'package:flutter/material.dart';
import 'package:gradient_progress/gradient_progress.dart';
import 'dart:math' as math;

class ValueAnimationProgress extends StatefulWidget {

  /// range is from 1 to 100
  double value;

  Color gradientCircularProgressColorOne;

  Color gradientCircularProgressColorTwo;

  Duration duration = Duration(seconds: 3);

  double textSize;

  Color textColor;

  double cardHeight;

  double cardWidth;

  double progressStrokeWidth;

  double progressRadius;

  Color textBackGroundColor;

  ValueAnimationProgress(
      {@required this.value,
      @required this.gradientCircularProgressColorOne,
      @required this.gradientCircularProgressColorTwo,
      @required this.duration,
      @required this.textSize,
      @required this.textColor,
      @required this.textBackGroundColor,
      this.cardHeight = 160.0,
      this.cardWidth = 160.0,
      this.progressRadius = 130,
      this.progressStrokeWidth = 20});

  @override
  _ValueAnimationProgressState createState() => _ValueAnimationProgressState();
}

class _ValueAnimationProgressState extends State<ValueAnimationProgress>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  double value = 0.0;
  bool startAnimation = false;

  @override
  void initState() {
    value = widget.value / 100;
    _animationController =
        new AnimationController(vsync: this, duration: widget.duration);
    _animationController
      ..addListener(() {
        WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(math.pi),
        child: Center(
          child: GradientCircularProgressIndicator(
            gradientColors: [
              widget.gradientCircularProgressColorOne,
              widget.gradientCircularProgressColorTwo,
            ],
            radius: widget.progressRadius,
            strokeWidth: widget.progressStrokeWidth,
            value: new Tween(begin: 0.0, end: value)
                .animate(CurvedAnimation(
                    parent: _animationController, curve: Curves.decelerate))
                .value,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          _animationController.reset();
          _animationController.animateTo(value);
          setState(() {
            startAnimation = true;
          });
        },
        child: Center(
            child: Container(
          height: widget.cardHeight,
          width: widget.cardWidth,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 15,
              color: widget.textBackGroundColor,
              child: Center(
                child: Text(
                  !startAnimation ? "Start" : '${widget.value}%',
                  style: TextStyle(
                      fontSize: widget.textSize, color: widget.textColor),
                ),
              )),
        )),
      )
    ]));
  }
}
