// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/AgreeToPolicy.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/DeviceInfo.dart';

import 'TestDevice.dart';
import 'UserProfile.dart';
import 'main.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
    );
  }
}

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({super.key});

  @override
  State<ChoosePlan> createState() {
    return _ChoosePlanState();
  }
}

class _ChoosePlanState extends State<ChoosePlan> {
  XFile? imageFile;
  late String ImageUrl;
  late int amountSelected;
  late String selectedPlanType;
  late bool isLoading = false;
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late int? userAccountId;
  Future<User>? profile;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> _readAccess() async {
    final access = await _storage.read(
        key: 'token',
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (access != null) {
      // setState(() {
      //   auth = access;
      //   // fetchUser(auth);
      // });
      String normalizedSource = base64Url.normalize(access.split(".")[1]);
      var result = utf8.decode(base64Url.decode(normalizedSource));
      Map<String, dynamic> tokenDecoded = json.decode(result);
      setState(() {
        isLoggedIn = true;
        userAccountId = tokenDecoded['Id'];
      });
      // profile = _getProfile(userAccountId);
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  Future pickImage() async {
    try {
      final imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile == null) return;
      final imageTemp = XFile(imageFile.path);
      // setState(() => this.imageFile = imageTemp);
      setState(() => ImageUrl = imageFile.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _readAccess();
    // profile = _getProfile(userAccountId);
  }

  @override
  Widget build(BuildContext context) {
    // final code = user["code"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        title: const Text("Choose Plan"),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            MaterialButton(
                color: const Color.fromRGBO(109, 21, 23, 1),
                onPressed: pickImage,
                child: const Text("Pick Image from Gallery",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Available with leading mobile carriers and providers.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Looking for the peace of mind that comes with staying connected to your life even when something happens to your phone? Our cell phone insurance plans are available at many carriers and retailers, including those below. \n Please choose your suitable payment plan',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.normal,
                        fontSize: 22.0),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  // shape: const Border(
                  // top: BorderSide(width: 20.0, color: Colors.white)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('SELECT YOUR EXCESS ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     // const Icon(Icons.monetization_on, size: 50.0),
                      //     MaterialButton(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         color: const Color.fromRGBO(109, 21, 23, 1),
                      //         // textColor: Colors.white,
                      //         // onPressed: _launchUrl,
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const TestDevice()),
                      //           );
                      //         },
                      //         child: Row(children: const [
                      //           Icon(
                      //             Icons.monetization_on,
                      //             size: 30.0,
                      //             color: Colors.white,
                      //           ),
                      //           Text(
                      //             '25',
                      //             style: TextStyle(
                      //                 color: Colors.white, fontSize: 20.0),
                      //           ),
                      //         ])),
                      //     const SizedBox(width: 8),
                      //     MaterialButton(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         color: const Color.fromRGBO(109, 21, 23, 1),
                      //         // textColor: Colors.white,
                      //         // onPressed: _launchUrl,
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const TestDevice()),
                      //           );
                      //         },
                      //         child: Row(children: const [
                      //           Icon(Icons.monetization_on,
                      //               size: 30.0, color: Colors.white),
                      //           Text(
                      //             '50',
                      //             style: TextStyle(
                      //                 color: Colors.white, fontSize: 20.0),
                      //           ),
                      //         ])),
                      //   ],
                      // ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('CHOOSE YOUR POLICY TERM ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('MONTHLY',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('60.00',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: const Color.fromRGBO(109, 21, 23, 1),
                                  // textColor: Colors.white,
                                  // onPressed: _launchUrl,
                                  onPressed: () async {
                                    try {
                                      setState(() {
                                        isLoading = true;
                                        amountSelected = 60;
                                        selectedPlanType = "Monthly";
                                      });
                                      final http.Response response = await http.put(
                                          Uri.parse(
                                              'https://insurancebackendapi-5yi8.onrender.com/api/users/user/edit/$userAccountId'),
                                          // 'https://localhost:7000/api/user/edit/$userAccountId'),
                                          headers: {
                                            // 'Content-Type':
                                            //     'multipart/form-data',
                                            'Content-Type': 'application/json',
                                          },
                                          body: jsonEncode(
                                            {
                                              "EnteredAmount": amountSelected,
                                              "SelectedPlan": selectedPlanType,
                                              "ImageUrl": ImageUrl
                                            },
                                          ));
                                      if (response.statusCode == 200) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AgreeToPolicy()),
                                        );
                                      } else if (response.statusCode == 404) {
                                        throw Exception('User edit failed!');
                                        // print(response);
                                      }
                                    } catch (e) {
                                      // ignore: avoid_print
                                      print(e);
                                    }
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('ANNUAL',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('120.00',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: const Color.fromRGBO(109, 21, 23, 1),
                                  // textColor: Colors.white,
                                  // onPressed: _launchUrl,
                                  onPressed: () async {
                                    try {
                                      setState(() {
                                        isLoading = true;
                                        amountSelected = 120;
                                        selectedPlanType = "Annual";
                                      });
                                      final http.Response response = await http.put(
                                          Uri.parse(
                                              'https://insurancebackendapi-5yi8.onrender.com/api/users/user/edit/$userAccountId'),
                                          // 'https://localhost:7000/api/user/edit/$userAccountId'),
                                          headers: {
                                            // 'Content-Type':
                                            //     'multipart/form-data',
                                            'Content-Type': 'application/json',
                                          },
                                          body: jsonEncode(
                                            {
                                              "EnteredAmount": amountSelected,
                                              "SelectedPlan": selectedPlanType,
                                              "ImageUrl": ImageUrl
                                            },
                                          ));
                                      if (response.statusCode == 200) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AgreeToPolicy()),
                                        );
                                      } else if (response.statusCode == 404) {
                                        throw Exception('User edit failed!');
                                        // print(response);
                                      }
                                    } catch (e) {
                                      // ignore: avoid_print
                                      print(e);
                                    }
                                    // setState(() {
                                    //   amountSelected = 120;
                                    //   selectedPlanType = "Annual";
                                    // });
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('WHATS COVERED',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                      Column(
                        children: [
                          Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('Accidental Damage'),
                                ),
                              ]),
                          Row(children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Mechanical Breakdown'),
                            ),
                          ]),
                          Row(children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Malicious Damage'),
                            ),
                          ]),
                          Row(children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Liquid Damage'),
                            )
                          ])
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ])),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
