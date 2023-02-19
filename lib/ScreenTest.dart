import 'dart:async';
// import 'package:native_screenshot/native_screenshot.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/CameraTest.dart';

class ScreenTest extends StatefulWidget {
  const ScreenTest({super.key});

  @override
  State<ScreenTest> createState() => _ScreenTestState();
}

class _ScreenTestState extends State<ScreenTest> {
  List<DrawingPoints?> points = [];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startPainting();
    // takeScreenShot();
    // endPainting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: CustomPaint(
              size: Size.infinite,
              painter: CustomScreenPainter(points: points),
            )));
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      points.add(null);
    });
  }

  void _addPoint(Offset position) {
    points.add(
      DrawingPoints(point: position),
    );
  }

  Future<void> takeScreenShot() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      //   String path = await NativeScreenshot.takeScreenshot();
      // print(path);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CameraTest()),
      );
    });
  }

  void startPainting() {
    _timer = Timer(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20.0),
        duration: Duration(seconds: 5),
        content: Text(
            "Paint the entier screen black using your finger\n you have 10 seconds"),
      ));
      endPainting();
    });
  }

  void endPainting() {
    _timer = Timer(const Duration(seconds: 15), () {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20.0),
        duration: Duration(seconds: 5),
        content: Text("Time has expired please wait a moment"),
      ));
      takeScreenShot();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

class CustomScreenPainter extends CustomPainter {
  List<DrawingPoints?> points = [];
  CustomScreenPainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < points.length - 1; i++) {
      var paint = Paint()
        ..color = Colors.black
        ..strokeWidth = 30.0
        ..strokeCap = StrokeCap.round;
      var currentPoint = points[i];
      var nextPoint = points[i + 1];

      if (currentPoint != null && nextPoint != null) {
        canvas.drawLine(currentPoint.point, nextPoint.point, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoints {
  Offset point;

  DrawingPoints({required this.point});
}
