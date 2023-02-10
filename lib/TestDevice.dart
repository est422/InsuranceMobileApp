import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/CameraTest.dart';

import 'package:insurance_app/Quotes.dart';
import 'package:insurance_app/VerifyDevice.dart';
import 'VerifyDevice.dart';

class TestDevice extends StatefulWidget {
  const TestDevice({
    super.key,
  });

  @override
  State<TestDevice> createState() {
    return _TestDeviceState();
  }
}

class _TestDeviceState extends State<TestDevice> {
  // late CameraController _controller;
  // late Future<void> _initializeControllerFuture;
  // late List<CameraDescription> cameras;
  //ignore: prefer_typing_uninitialized_variables
  // late final cameras;
  // late Future<List<CameraDescription>> camera = availableCameras();

//   Future<CameraDescription> cameraCheck() async {
//     WidgetsFlutterBinding.ensureInitialized();

// // Obtain a list of the available cameras on the device.
//     final CameraDescription cameras =
//         (await availableCameras()) as CameraDescription;
//     return cameras;
//   }

  @override
  void initState() {
    super.initState();
    // camera = cameraCheck() as Future<List<CameraDescription>>;
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late Future<List<CameraDescription>> camera = cameraCheck();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('Test Device'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    // alignment: Alignment.center,
                    child: const Text(
                      'Please note, the test which has failed, will not be covered under your device protectiion plan.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            // color: const Color.fromARGB(255, 204, 202, 202),
                            padding: const EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.battery_0_bar, size: 50.0),
                                      // Text('Battery'),
                                      SizedBox(width: 15),
                                      Icon(Icons.wifi, size: 50.0),
                                      // Text('Wifi'),
                                      SizedBox(width: 15),
                                      Icon(Icons.sim_card, size: 50.0),
                                      // Text('Sim Card'),
                                    ]),
                              ],
                            ),
                          ),
                          Container(
                            // color: const Color.fromARGB(255, 204, 202, 202),
                            padding: const EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.vibration, size: 50.0),
                                      // Text('Vibration'),
                                      SizedBox(width: 15),
                                      Icon(Icons.speaker, size: 50.0),
                                      // Text('Speaker'),
                                      SizedBox(width: 15),
                                      Icon(Icons.camera, size: 50.0),
                                      // CamerTest(),
                                      // Text('Front Camera')
                                    ]),
                              ],
                            ),
                          ),
                          Container(
                            // color: const Color.fromARGB(255, 204, 202, 202),
                            padding: const EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.earbuds, size: 50.0),
                                      // Text('EarPhone Jack'),
                                      SizedBox(width: 15),
                                      Icon(Icons.photo_camera_back, size: 50.0),
                                      // Text('Back Camera'),
                                      SizedBox(width: 15),
                                      Icon(Icons.smart_display, size: 50.0),
                                      // Text('Display')
                                    ]),
                              ],
                            ),
                          ),
                          // const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color.fromRGBO(109, 21, 23, 1),
                      // textColor: Colors.white,
                      onPressed: () {},
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Quotes()),
                      //   );
                      // },
                      child: const Text(
                        'Start Diagnostic Test',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}
