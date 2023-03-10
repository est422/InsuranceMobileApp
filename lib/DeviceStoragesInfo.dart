import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage_info/storage_info.dart';
import 'dart:async';
import 'package:external_path/external_path.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/DrawerNavigationMenu.dart';
import 'package:insurance_app/MobileInfo.dart';
import 'package:insurance_app/TestDevice.dart';
import 'package:insurance_app/main.dart';
import 'package:insurance_app/models/User.dart';

class DeviceStoragesInfo extends StatefulWidget {
  const DeviceStoragesInfo({super.key});

  @override
  State<DeviceStoragesInfo> createState() {
    return _DeviceStoragesInfoState();
  }
}

class _DeviceStoragesInfoState extends State<DeviceStoragesInfo> {
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late int? userAccountId;
  late double storage;
  late double? storageSpaceInfo;
  Future<Directory?>? _externalDocumentsDirectory;
  List<String> _exPath = [];
  // Future<List<Directory>?>? _externalStorageDirectories;

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );

  // IOSOptions _getIOSOptions() =>
  //     const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  // Future<void> _readAccess() async {
  //   final access = await _storage.read(
  //       key: 'token',
  //       iOptions: _getIOSOptions(),
  //       aOptions: _getAndroidOptions());
  //   if (access != null) {
  //     // setState(() {
  //     //   auth = access;
  //     //   // fetchUser(auth);
  //     // });
  //     String normalizedSource = base64Url.normalize(access.split(".")[1]);
  //     var result = utf8.decode(base64Url.decode(normalizedSource));
  //     Map<String, dynamic> tokenDecoded = json.decode(result);
  //     setState(() {
  //       isLoggedIn = true;
  //       userAccountId = tokenDecoded['Id'];
  //     });
  //     profile = _getProfile(userAccountId);
  //   } else {
  //     setState(() {
  //       isLoggedIn = false;
  //     });
  //   }
  // }

  // Future<User> _getProfile(id) async {
  //   String url =
  //       'https://insurancebackendapi-5yi8.onrender.com/api/users/user/profile/$id';
  //   var response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     // 'Accept': 'application/json',
  //   });
  //   if (response.statusCode == 200) {
  //     // print(response.body);
  //     List<dynamic> jsonResponse = jsonDecode(response.body);
  //     return User.fromJson(jsonResponse[0]);
  //   } else {
  //     throw Exception('Unable to fetch profile from the REST API');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getPath();
    // _readAccess();
    // profile = _getProfile(userAccountId);
  }

  Future<void> getPath() async {
    List<String> paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStorageDirectories();

    setState(() {
      _exPath = paths; // [/storage/emulated/0, /storage/B3AE-4D28]
    });
  }

  Future<double> _getInternalStorageSpace() async {
    return await StorageInfo.getStorageTotalSpaceInGB; // return double
    // print("StorageInfo: $StorageInfo");
    // return await StorageInfo.getStorageFreeSpaceInGB; // return double
  }

  Future<double?> _getExternalStorageSpace() async {
    // storageSpaceInfo = await StorageInfo.getExternalStorageTotalSpaceInGB;
    if (_externalDocumentsDirectory != null) {
      return await StorageInfo.getExternalStorageTotalSpaceInGB;
    }
    return null; // return double
    // print("StorageInfo: $StorageInfo");
    // return await StorageInfo.getStorageFreeSpaceInGB; // return double
  }

  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)!.settings.arguments as Map;

    // final firstName = user["firstName"];
    // final lastName = user["lastName"];
    // final phone = user["phone"];
    // final email = user["email"];

    return Card(
        shadowColor: const Color.fromARGB(255, 8, 0, 0),
        shape: const RoundedRectangleBorder(
            side:
                BorderSide(color: Color.fromARGB(153, 245, 244, 244), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(children: <Widget>[
          FutureBuilder(
              future: _getInternalStorageSpace(),
              builder: (context, snapshot) {
                // print(snapshot.error);
                if (snapshot.hasData) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Internal Storage Space: ${snapshot.data} GB',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Internal Storage Space: Not detected",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ));
                }
              }),
          _exPath.isEmpty
              ? FutureBuilder(
                  future: _getExternalStorageSpace(),
                  builder: (context, snapshot) {
                    // print(snapshot.error);
                    if (snapshot.hasData) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'External Storage Space: ${snapshot.data} GB',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "External Storage Space: Not detected",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ));
                    }
                  })
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "External Storage Space: Not detected",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ))
        ]));
  }
}
