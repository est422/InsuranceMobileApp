import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage_info/storage_info.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/DrawerNavigationMenu.dart';
import 'package:insurance_app/MobileInfo.dart';
import 'package:insurance_app/TestDevice.dart';
import 'package:insurance_app/main.dart';
import 'package:insurance_app/models/User.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String? email;
  final String? device;
  final String? model;
  final String? createdAt;
  final int? handsetCost;
  final String? handsetId;
  final int? iMEI1;
  final int? iMEI2;
  final String? serialNo;
  final String? platform;
  final String? hardWare;
  final int? enteredAmount;
  final String? selectedPlan;
  final String? imageUrl;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.device,
      required this.model,
      required this.createdAt,
      required this.handsetCost,
      required this.handsetId,
      required this.iMEI1,
      required this.iMEI2,
      required this.serialNo,
      required this.platform,
      required this.hardWare,
      required this.enteredAmount,
      required this.selectedPlan,
      required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
      device: json['Device'],
      model: json['Model'],
      createdAt: json['CreatedAt'],
      handsetCost: json['HandsetCost'],
      handsetId: json['HandsetId'],
      iMEI1: json['IMEI1'],
      iMEI2: json['IMEI2'],
      serialNo: json['SerialNo'],
      platform: json['Platform'],
      hardWare: json['HardWare'],
      enteredAmount: json['EnteredAmount'],
      selectedPlan: json['SelectedPlan'],
      imageUrl: json['ImageUrl'],
    );
  }
}

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
    // _readAccess();
    // profile = _getProfile(userAccountId);
  }

  Future<double> _getInternalStorageSpace() async {
    return await StorageInfo.getStorageTotalSpaceInGB; // return double
    // print("StorageInfo: $StorageInfo");
    // return await StorageInfo.getStorageFreeSpaceInGB; // return double
  }

  Future<double> _getExternalStorageSpace() async {
    return await StorageInfo.getExternalStorageTotalSpaceInGB; // return double
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
      FutureBuilder(
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
    ]));
  }
}
