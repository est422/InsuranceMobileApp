import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CamerTest extends StatefulWidget {
  const CamerTest({
    super.key,
  });

  // final CameraDescription camera;

  @override
  State<CamerTest> createState() => _CamerTestState();
}

class _CamerTestState extends State<CamerTest> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  // late final List<CameraDescription> cameras;

//   Future<void> cameraCheck() async {
//     WidgetsFlutterBinding.ensureInitialized();

// // Obtain a list of the available cameras on the device.
//     cameras = await availableCameras();
//   }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    // cameraCheck();
    late final CameraDescription cameras =
        availableCameras() as CameraDescription;
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Camera')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2, color: Colors.green)),
              child: const Icon(Icons.camera, size: 50.0),
            );
          } else {
            // Otherwise, display a loading indicator.
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2, color: Colors.red)),
              child: const Icon(Icons.camera, size: 50.0),
            );
          }
        },
      ),
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
