// // Copyright 2017 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:developer' as developer;
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:network_info_plus/network_info_plus.dart';

// // Sets a platform override for desktop to avoid exceptions. See
// // https://flutter.dev/desktop#target-platform-override for more info.
// void _enablePlatformOverrideForDesktop() {
//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   }
// }

// class WifiTest extends StatefulWidget {
//   const WifiTest({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   State<WifiTest> createState() => _WifiTestState();
// }

// class _WifiTestState extends State<WifiTest> {
//   String _connectionStatus = 'Unknown';
//   final NetworkInfo _networkInfo = NetworkInfo();

//   @override
//   void initState() {
//     super.initState();
//     _enablePlatformOverrideForDesktop();
//     _initNetworkInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test Wifi'),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(20),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 border: Border.all(width: 2, color: Colors.green)),
//             child: const Icon(Icons.wifi, size: 50.0),
//           ),
//           const SizedBox(height: 16),
//           Text(_connectionStatus),
//         ],
//       )),
//     );
//   }

//   Future<void> _initNetworkInfo() async {
//     String? wifiName,
//         wifiBSSID,
//         wifiIPv4,
//         wifiIPv6,
//         wifiGatewayIP,
//         wifiBroadcast,
//         wifiSubmask;

//     try {
//       if (!kIsWeb && Platform.isIOS) {
//         var status = await _networkInfo.getLocationServiceAuthorization();
//         if (status == LocationAuthorizationStatus.notDetermined) {
//           status = await _networkInfo.requestLocationServiceAuthorization();
//         }
//         if (status == LocationAuthorizationStatus.authorizedAlways ||
//             status == LocationAuthorizationStatus.authorizedWhenInUse) {
//           wifiName = await _networkInfo.getWifiName();
//         } else {
//           wifiName = await _networkInfo.getWifiName();
//         }
//       } else {
//         wifiName = await _networkInfo.getWifiName();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi Name', error: e);
//       wifiName = 'Failed to get Wifi Name';
//     }

//     try {
//       if (!kIsWeb && Platform.isIOS) {
//         var status = await _networkInfo.getLocationServiceAuthorization();
//         if (status == LocationAuthorizationStatus.notDetermined) {
//           status = await _networkInfo.requestLocationServiceAuthorization();
//         }
//         if (status == LocationAuthorizationStatus.authorizedAlways ||
//             status == LocationAuthorizationStatus.authorizedWhenInUse) {
//           wifiBSSID = await _networkInfo.getWifiBSSID();
//         } else {
//           wifiBSSID = await _networkInfo.getWifiBSSID();
//         }
//       } else {
//         wifiBSSID = await _networkInfo.getWifiBSSID();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi BSSID', error: e);
//       wifiBSSID = 'Failed to get Wifi BSSID';
//     }

//     try {
//       wifiIPv4 = await _networkInfo.getWifiIP();
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi IPv4', error: e);
//       wifiIPv4 = 'Failed to get Wifi IPv4';
//     }

//     try {
//       if (!Platform.isWindows) {
//         wifiIPv6 = await _networkInfo.getWifiIPv6();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi IPv6', error: e);
//       wifiIPv6 = 'Failed to get Wifi IPv6';
//     }

//     try {
//       if (!Platform.isWindows) {
//         wifiSubmask = await _networkInfo.getWifiSubmask();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi submask address', error: e);
//       wifiSubmask = 'Failed to get Wifi submask address';
//     }

//     try {
//       if (!Platform.isWindows) {
//         wifiBroadcast = await _networkInfo.getWifiBroadcast();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi broadcast', error: e);
//       wifiBroadcast = 'Failed to get Wifi broadcast';
//     }

//     try {
//       if (!Platform.isWindows) {
//         wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
//       }
//     } on PlatformException catch (e) {
//       developer.log('Failed to get Wifi gateway address', error: e);
//       wifiGatewayIP = 'Failed to get Wifi gateway address';
//     }

//     setState(() {
//       _connectionStatus = 'Wifi Name: $wifiName\n'
//           'Wifi BSSID: $wifiBSSID\n'
//           'Wifi IPv4: $wifiIPv4\n'
//           'Wifi IPv6: $wifiIPv6\n'
//           'Wifi Broadcast: $wifiBroadcast\n'
//           'Wifi Gateway: $wifiGatewayIP\n'
//           'Wifi Submask: $wifiSubmask\n';
//     });
//   }
// }
