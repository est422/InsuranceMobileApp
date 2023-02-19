import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraTest extends StatefulWidget {
  const CameraTest({
    super.key,
  });

  // final CameraDescription camera;

  @override
  State<CameraTest> createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  late CameraController _frontCameraController;
  // late CameraController _backCameraController;
  Future<void>? _initializeFrontCameraControllerFuture;
  // Future<void>? _initializeBackCameraControllerFuture;
  late List<CameraDescription> cameras;
  // int initialCamera = 1;

//   Future<void> backCameraCheck() async {
//     WidgetsFlutterBinding.ensureInitialized();

// // Obtain a list of the available cameras on the device.
//     final cameras = await availableCameras();
//     // print("cameras back $cameras");
//     _frontCameraController = CameraController(
//       // Get a specific camera from the list of available cameras.
//       cameras[0],
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeFrontCameraControllerFuture =
//         _frontCameraController.initialize();
//     // frontCameraCheck();
//   }

  Future<void> frontCameraCheck() async {
    WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
    // final cameras = await availableCameras();
    cameras = await availableCameras();
    print("cameras $cameras");
    _initializeFrontCameraControllerFuture =
        _frontCameraController.initialize();
    _frontCameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    // Next, initialize the controller. This returns a Future.
    // _initializeFrontCameraControllerFuture =
    //     _frontCameraController.initialize();
    // backCameraCheck();
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    frontCameraCheck();
    // backCameraCheck();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _frontCameraController.dispose();
    // _backCameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Test Camera'),
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1)),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeFrontCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_frontCameraController);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: SingleChildScrollView(
      //     child: Column(children: [
      //   Container(
      //     margin: const EdgeInsets.all(10.0),
      //     child: FutureBuilder<void>(
      //       future: _initializeFrontCameraControllerFuture,
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           // If the Future is complete, display the preview.
      //           return CameraPreview(_frontCameraController);
      //         } else {
      //           // Otherwise, display a loading indicator.
      //           return const Center(child: CircularProgressIndicator());
      //         }
      //       },
      //     ),
      //   ),
      // Container(
      //   margin: const EdgeInsets.all(10.0),
      //   child: FutureBuilder<void>(
      //     future: _initializeFrontCameraControllerFuture,
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         // If the Future is complete, display the preview.
      //         return CameraPreview(_frontCameraController);
      //       } else {
      //         // Otherwise, display a loading indicator.
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //     },
      //   ),
      // )
      // ]))
      // body: FutureBuilder<void>(
      //   future: _initializeControllerFuture,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // If the Future is complete, display the preview.
      //       return Container(
      //         margin: const EdgeInsets.all(20),
      //         padding: const EdgeInsets.all(10),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(100),
      //             border: Border.all(width: 2, color: Colors.green)),
      //         child: const Icon(Icons.camera, size: 50.0),
      //       );
      //     } else {
      //       // Otherwise, display a loading indicator.
      //       return Container(
      //         margin: const EdgeInsets.all(20),
      //         padding: const EdgeInsets.all(10),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(100),
      //             border: Border.all(width: 2, color: Colors.red)),
      //         child: const Icon(Icons.camera, size: 50.0),
      //       );
      //     }
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     // Take the Picture in a try / catch block. If anything goes wrong,
      //     // catch the error.
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;

      //       // Attempt to take a picture and get the file `image`
      //       // where it was saved.
      //       final image = await _controller.takePicture();

      //       if (!mounted) return;

      //       // If the picture was taken, display it on a new screen.
      //       // await Navigator.of(context).push(
      //       // MaterialPageRoute(
      //       // builder: (context) => DisplayPictureScreen(
      //       // Pass the automatically generated path to
      //       // the DisplayPictureScreen widget.
      //       // imagePath: image.path,
      //       // ),
      //       // ),
      //       // );
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //       print(e);
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),
    );
  }
}
