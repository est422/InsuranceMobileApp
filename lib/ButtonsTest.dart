import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ButtonsTest extends StatefulWidget {
  const ButtonsTest({
    super.key,
  });

  // final CameraDescription camera;

  @override
  State<ButtonsTest> createState() => _ButtonsTestState();
}

class _ButtonsTestState extends State<ButtonsTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Hard Ware Buttons Tests'),
            backgroundColor: const Color.fromRGBO(109, 21, 23, 1)),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.all(10.0),
              height: 400,
              width: 400,
              child: const Text(
                'Hard Ware Buttons Test',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
        ])));
  }
}
