import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:insurance_app/ButtonsTest.dart';

class CameraTest extends StatefulWidget {
  const CameraTest({
    super.key,
  });

  // final CameraDescription camera;

  @override
  State<CameraTest> createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  late CameraController _cameraController;
  // late CameraController _frontCameraController;
  Future<void>? _initializeFrontCameraControllerFuture;
  List<CameraDescription> _availableCameras = [];
  late bool checkFrontCamera = false;
  late bool checkBackCamera = false;

  // int initialCamera = 1;

  Future<void> cameraCheck() async {
    WidgetsFlutterBinding.ensureInitialized();
    // final cameras = await availableCameras();
    _availableCameras = await availableCameras();
    print("cameras $_availableCameras");
    _initCamera(_availableCameras.first);
    setState(() {
      checkFrontCamera = true;
    });
    // _frontCameraController = CameraController(
    //     cameras.first, ResolutionPreset.medium,
    //     imageFormatGroup: ImageFormatGroup.yuv420);
    // await _frontCameraController.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {
    //     checkFrontCamera = true;
    //   });
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         // Handle access errors here.
    //         break;
    //       default:
    //         // Handle other errors here.
    //         break;
    //     }
    //   }
    // });

    // _initializeFrontCameraControllerFuture =
    //     _frontCameraController.initialize();
  }

  Future<void> _initCamera(CameraDescription description) async {
    _cameraController =
        CameraController(description, ResolutionPreset.max, enableAudio: true);

    try {
      await _cameraController.initialize();
      _initializeFrontCameraControllerFuture = _cameraController.initialize();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = _cameraController.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (newDescription != null) {
      _initCamera(newDescription);
      setState(() {
        checkBackCamera = true;
      });
    } else {
      print('Asked camera not available');
    }
  }

  @override
  void initState() {
    super.initState();
    cameraCheck();
  }

  // @override
  // void dispose() {
  //   // Dispose of the controller when the widget is disposed.
  //   // _frontCameraController.dispose();
  //   _cameraController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Test Camera'),
            backgroundColor: const Color.fromRGBO(109, 21, 23, 1)),
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        // body: FutureBuilder<void>(
        //   future: _initializeFrontCameraControllerFuture,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       // If the Future is complete, display the preview.
        //       return CameraPreview(_frontCameraController);
        //     } else {
        //       // Otherwise, display a loading indicator.
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 400,
            width: 400,
            child: FutureBuilder<void>(
              future: _initializeFrontCameraControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_cameraController);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
              width: double.infinity,
              // height: 70,
              // padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: const Color.fromRGBO(109, 21, 23, 1),
                onPressed: (() {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BackCameraTest()),
                  // );
                  _toggleCameraLens();
                }),
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Toggle Camera',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              )),
          checkFrontCamera && checkBackCamera
              ? Container(
                  // width: double.infinity,
                  // height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5.0),
                  child: InkWell(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    // color: const Color.fromRGBO(109, 21, 23, 1),
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ButtonsTest()),
                      );
                    }),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Color.fromRGBO(109, 21, 23, 1),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
              : Container()
        ])));
  }
}
