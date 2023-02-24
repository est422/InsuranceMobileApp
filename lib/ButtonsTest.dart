import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

class ButtonsTest extends StatefulWidget {
  const ButtonsTest({
    super.key,
  });

  // final CameraDescription camera;

  @override
  State<ButtonsTest> createState() => _ButtonsTestState();
}

class _ButtonsTestState extends State<ButtonsTest> with WidgetsBindingObserver {
  bool HButtonEvent = false;
  AppLifecycleState? _lastLifecycleState;
  List<String> btnClicked = [];

  // late StreamSubscription<HardwareButtons.VolumeButtonEvent>
  //     _volumeButtonSubscription;
  // late StreamSubscription<HardwareButtons.HomeButtonEvent>
  //     _homeButtonSubscription;
  // late StreamSubscription<HardwareButtons.LockButtonEvent>
  //     _lockButtonSubscription;

  // Future<void> butnclick() async {
  //   const volumeBtnChannel = MethodChannel("mychannel");
  //   volumeBtnChannel.setMethodCallHandler((call) {
  //     if (call.method == "volumeBtnPressed") {
  //       if (call.arguments == "volume_down") {
  //         print("butn ckd $call");
  //         return Future.value(call);
  //       }
  //     }

  //     return Future.value(null);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // super.initState();
    // _volumeButtonSubscription =
    //     HardwareButtons.volumeButtonEvents.listen((event) {
    //   setState(() {
    //     _latestHardwareButtonEvent = event.toString();
    //   });
    // });

    // _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
    //   setState(() {
    //     _latestHardwareButtonEvent = 'HOME_BUTTON';
    //   });
    // });

    // _lockButtonSubscription = HardwareButtons.lockButtonEvents.listen((event) {
    //   setState(() {
    //     _latestHardwareButtonEvent = 'LOCK_BUTTON';
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // _volumeButtonSubscription.cancel();
    // _homeButtonSubscription.cancel();
    // _lockButtonSubscription.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
    switch (state) {
      case AppLifecycleState.paused:
        btnClickedResult();
        break;
      case AppLifecycleState.resumed:
        btnClickedResult();
        break;
      case AppLifecycleState.inactive:
        // btnClicked.add("Power");
        break;
      case AppLifecycleState.detached:
        break;
    }
    super.didChangeAppLifecycleState(state);
    // if (state == AppLifecycleState.paused) {
    //   final value = AppLifecycleState.values;
    //   print("Ap Paused $value");
    //   btnClickedResult();
    // }
    // if (state == AppLifecycleState.resumed) {
    //   print("App Resumed");
    //   btnClickedResult();
    // }
    // print("state $state");
  }

  void addBtnClicked(debugName) {
    btnClicked.add("Home");
    print("btnClicked $btnClicked");
  }

  void btnClickedResult() {
    // btnClicked.add("PowerBtnClicked");
    print("btnClickd $btnClicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Hard Ware Buttons Tests'),
            backgroundColor: const Color.fromRGBO(109, 21, 23, 1)),
        body: Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event.physicalKey == PhysicalKeyboardKey.audioVolumeDown) {
              if (event is KeyDownEvent) {
                print("key $event");
              } else if (event is KeyRepeatEvent) {
                // the user is pressing the key A
              } else if (event is KeyUpEvent) {
                // the user stopped pressing the key A
              }
              // if you handled the event (prevent propagating the events further)
              // return KeyEventResult.handled;
            }
            if (event.physicalKey == PhysicalKeyboardKey.audioVolumeUp) {
              if (event is KeyDownEvent) {
              } else if (event is KeyRepeatEvent) {
              } else if (event is KeyUpEvent) {
                print("key $event");
              }
              // if you handled the event (prevent propagating the events further)
              return KeyEventResult.handled;
            }
            if (event.physicalKey == PhysicalKeyboardKey.power) {
              addBtnClicked(event.physicalKey.debugName);
              print("key $event");
              // if you handled the event (prevent propagating the events further)
              return KeyEventResult.handled;
            }
            if (event.physicalKey == PhysicalKeyboardKey.home) {
              if (KeyEventResult.handled == true) {
                addBtnClicked(event.physicalKey.debugName);
                print("key $KeyEventResult");
              }
              // addBtnClicked(event);
              // btnClicked.add(event.physicalKey.debugName!);
              // btnClicked.add("HomeBtnClicked");

              // if you handled the event (prevent propagating the events further)
              return KeyEventResult.handled;
            }
            // otherwise return this (propagates the events further to be handled elsewhere)
            return KeyEventResult.ignored;
          },
          child: _lastLifecycleState == null
              ? const Text(
                  'This widget has not observed any lifecycle changes.')
              : Text(
                  'The most recent lifecycle state this widget observed was: $_lastLifecycleState. $HButtonEvent'),

          // SingleChildScrollView(
          //     child: Column(children: [
          //   Center(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: <Widget>[
          //         Text('Value: $_latestHardwareButtonEvent\n'),
          //       ],
          //     ),
          //   ),
          // Container(
          //     margin: const EdgeInsets.all(10.0),
          //     height: 400,
          //     width: 400,
          //     child: const Text(
          //       'Hard Ware Buttons Test',
          //       style: TextStyle(color: Colors.white, fontSize: 20.0),
          //     )),
          // ])));
        ));
  }
}
