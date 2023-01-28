import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:insurance_app/CameraTest.dart';

import 'package:insurance_app/Quotes.dart';
import 'package:insurance_app/VerifyDevice.dart';
import 'VerifyDevice.dart';

class TestDevice extends StatefulWidget {
  const TestDevice({super.key});

  @override
  State<TestDevice> createState() {
    return _TestDeviceState();
  }
}

class _TestDeviceState extends State<TestDevice> {
  // late CameraController _controller;
  // late Future<void> _initializeControllerFuture;
  // late final List<CameraDescription> cameras;
  // ignore: prefer_typing_uninitialized_variables
  // late final cameras;

  // Future<void> cameraCheck() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // cameras = await availableCameras();
  // _controller = CameraController(cameras[0], ResolutionPreset.medium);
  // _initializeControllerFuture = _controller.initialize();
  // print(camera);
  // _controller = CameraController(camera[0], ResolutionPreset.max);
  // }

  @override
  void initState() {
    super.initState();
    // cameraCheck();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Test Device'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Please note, the test which has failed, will not be covered under your device protectiion plan',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Container(
                  width: 300,
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
                                    // CamerTest(camera: cameras[0]),
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
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    // textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quotes()),
                      );
                    },
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(109, 21, 23, 1), width: 3.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset41@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset42@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset43@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset40@2x.png'),
            ),
          ],
        ),
      ),
    );
  }
}
