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

import 'DrawerNavigationMenu.dart';
import 'TestDevice.dart';
import 'UserProfile.dart';
import 'main.dart';
import 'models/User.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({super.key});

  @override
  State<ChoosePlan> createState() {
    return _ChoosePlanState();
  }
}

class _ChoosePlanState extends State<ChoosePlan> {
  XFile? imageFile;
  String? imageUrl;
  late int amountSelected;
  late String selectedPlanType;
  late bool isLoading = false;
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late int? userAccountId;
  late Future<User> profile;
  late String errorMessage;

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
      setState(() => imageUrl = imageFile.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  _errorMessage(String erorMessage) {
    return WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color.fromARGB(255, 252, 251, 251),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 200),
          content: Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              child: Text(
                erorMessage,
                style: const TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 24),
              ))));
    });
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
      endDrawer: const DrawerNavigationMenu(),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    onPressed: pickImage,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text("Pick Image from Gallery",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))))),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Available with leading mobile carriers and providers.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                  ),
                ),
                Card(
                    shadowColor: const Color.fromARGB(255, 8, 0, 0),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(153, 245, 244, 244),
                            width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Looking for the peace of mind that comes with staying connected to your life even when something happens to your phone? Our cell phone insurance plans are available at many carriers and retailers, including those below.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                      ),
                    )),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const Text(
                    'Please choose your suitable payment plan',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  // shape: const Border(
                  // top: BorderSide(width: 20.0, color: Colors.white)),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('SELECT YOUR EXCESS ',
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('CHOOSE YOUR POLICY TERM ',
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                                shadowColor: const Color.fromARGB(255, 8, 0, 0),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(153, 245, 244, 244),
                                        width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const Text('Monthly',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const Text('60.00',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            color: const Color.fromRGBO(
                                                109, 21, 23, 1),
                                            // textColor: Colors.white,
                                            // onPressed: _launchUrl,
                                            onPressed: () async {
                                              if (imageUrl == null) {
                                                setState(() {
                                                  errorMessage =
                                                      "Please select an image";
                                                });
                                                _errorMessage(errorMessage);
                                              } else if (imageUrl != null) {
                                                try {
                                                  setState(() {
                                                    isLoading = true;
                                                    amountSelected = 60;
                                                    selectedPlanType =
                                                        "Monthly";
                                                  });
                                                  final http.Response response =
                                                      await http.put(
                                                          Uri.parse(
                                                              'https://insurancebackendapi-5yi8.onrender.com/api/users/user/edit/$userAccountId'),
                                                          // 'https://localhost:7000/api/user/edit/$userAccountId'),
                                                          headers: {
                                                            // 'Content-Type':
                                                            //     'multipart/form-data',
                                                            'Content-Type':
                                                                'application/json',
                                                          },
                                                          body: jsonEncode(
                                                            {
                                                              "EnteredAmount":
                                                                  amountSelected,
                                                              "SelectedPlan":
                                                                  selectedPlanType,
                                                              "ImageUrl":
                                                                  imageUrl
                                                            },
                                                          ));
                                                  if (response.statusCode ==
                                                      200) {
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AgreeToPolicy()),
                                                    );
                                                  } else if (response
                                                          .statusCode ==
                                                      404) {
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Request failed";
                                                    });
                                                    _errorMessage(errorMessage);
                                                    // print(response);
                                                  } else if (response
                                                          .statusCode ==
                                                      400) {
                                                    // throw Exception('User login failed!');
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Request failed";
                                                    });
                                                    // formKey.currentState?.reset();
                                                    _errorMessage(errorMessage);
                                                  } else if (response
                                                          .statusCode ==
                                                      500) {
                                                    // formKey.currentState?.reset();
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Internal server error";
                                                    });
                                                    _errorMessage(errorMessage);
                                                  }
                                                } catch (e) {
                                                  // ignore: avoid_print
                                                  print(e);
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              // alignment: Alignment.center,
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0),
                                              ),
                                            ))),
                                  ],
                                )),
                            // const SizedBox(
                            //   width: 60,
                            // ),
                            Card(
                                shadowColor: const Color.fromARGB(255, 8, 0, 0),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(153, 245, 244, 244),
                                        width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const Text('ANNUAL',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: const Text('120.00',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            color: const Color.fromRGBO(
                                                109, 21, 23, 1),
                                            // textColor: Colors.white,
                                            // onPressed: _launchUrl,
                                            onPressed: () async {
                                              if (imageUrl == null) {
                                                setState(() {
                                                  errorMessage =
                                                      "Please select an image";
                                                });
                                                _errorMessage(errorMessage);
                                              } else if (imageUrl != null) {
                                                try {
                                                  setState(() {
                                                    isLoading = true;
                                                    amountSelected = 120;
                                                    selectedPlanType = "Annual";
                                                  });
                                                  final http.Response response =
                                                      await http.put(
                                                          Uri.parse(
                                                              'https://insurancebackendapi-5yi8.onrender.com/api/users/user/edit/$userAccountId'),
                                                          // 'https://localhost:7000/api/user/edit/$userAccountId'),
                                                          headers: {
                                                            // 'Content-Type':
                                                            //     'multipart/form-data',
                                                            'Content-Type':
                                                                'application/json',
                                                          },
                                                          body: jsonEncode(
                                                            {
                                                              "EnteredAmount":
                                                                  amountSelected,
                                                              "SelectedPlan":
                                                                  selectedPlanType,
                                                              "ImageUrl":
                                                                  imageUrl
                                                            },
                                                          ));
                                                  if (response.statusCode ==
                                                      200) {
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AgreeToPolicy()),
                                                    );
                                                  } else if (response
                                                          .statusCode ==
                                                      404) {
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Request failed";
                                                    });
                                                    _errorMessage(errorMessage);
                                                    // print(response);
                                                  } else if (response
                                                          .statusCode ==
                                                      400) {
                                                    // throw Exception('User login failed!');
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Request failed";
                                                    });
                                                    // formKey.currentState?.reset();
                                                    _errorMessage(errorMessage);
                                                  } else if (response
                                                          .statusCode ==
                                                      500) {
                                                    // formKey.currentState?.reset();
                                                    setState(() {
                                                      isLoading = false;
                                                      errorMessage =
                                                          "Internal server error";
                                                    });
                                                    _errorMessage(errorMessage);
                                                  }
                                                } catch (e) {
                                                  // ignore: avoid_print
                                                  print(e);
                                                }
                                              }
                                              // setState(() {
                                              //   amountSelected = 120;
                                              //   selectedPlanType = "Annual";
                                              // });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0),
                                              ),
                                            ))),
                                  ],
                                )),
                          ]),
                      isLoading
                          ? Container(
                              alignment: Alignment.center,
                              child: const Center(
                                child: CircularProgressIndicator(
                                    // valueColor: Color.,
                                    ),
                              ),
                            )
                          : Container(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('WHATS COVERED',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                color: Colors.black)),
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 8, 0, 0),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(153, 245, 244, 244),
                                  width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            children: [
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 5.0, 5.0, 5.0),
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      child: const Text('Accidental Damage',
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                    ),
                                  ]),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 5.0, 5.0, 5.0),
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      child: const Text('Mechanical Breakdown',
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                    ),
                                  ]),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 5.0, 5.0, 5.0),
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      child: const Text('Malicious Damage',
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20)),
                                    ),
                                  ]),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 5.0, 5.0, 5.0),
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      child: const Text(
                                        'Liquid Damage',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                    )
                                  ])
                            ],
                          ))
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
