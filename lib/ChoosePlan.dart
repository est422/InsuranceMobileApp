// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'TestDevice.dart';
import 'UserProfile.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({super.key});

  @override
  State<ChoosePlan> createState() {
    return _ChoosePlanState();
  }
}

class _ChoosePlanState extends State<ChoosePlan> {
  XFile? imageFile;
  late int amountSelected;
  late String selectedPlanType;
  late bool isLoading = false;

  Future pickImage() async {
    try {
      final imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile == null) return;
      final imageTemp = XFile(imageFile.path);
      setState(() => this.imageFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {}),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
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
                                    onPressed: () {
                                      setState(() {
                                        amountSelected = 60;
                                        selectedPlanType = "Monthly";
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TestDevice()),
                                      );
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
                                        final http.Response response = await http.post(
                                            Uri.parse(
                                                'https://insurancebackendapi-5yi8.onrender.com/api/user/create'),
                                            // 'http://localhost:7000/api/user/create'),
                                            headers: {
                                              'Content-Type':
                                                  'application/json',
                                            },
                                            body: jsonEncode(
                                              {
                                                "amountSelected":
                                                    amountSelected,
                                                "selectedPlan": selectedPlanType
                                              },
                                            ));
                                        // if (response.statusCode == 200) {
                                        //   // ignore: use_build_context_synchronously
                                        //   Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const UserProfile(),
                                        //         settings:
                                        //             RouteSettings(arguments: {
                                        //           "firstName": firstName,
                                        //           "lastName": lastName,
                                        //           "phone": phone,
                                        //           "email": email,
                                        //           // "password": password,
                                        //           // "code": code
                                        //         })),
                                        // );
                                        // } else {
                                        //   throw Exception(
                                        //       'User creation failed!');
                                        //   // print(response);
                                        // }
                                      } catch (e) {
                                        // ignore: avoid_print
                                        print(e);
                                      }
                                      setState(() {
                                        amountSelected = 120;
                                        selectedPlanType = "Annual";
                                      });
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
                                    child: Text('Accidental Damage'),
                                  ),
                                ]),
                            Row(children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              Container(
                                child: Text('Mechanical Breakdown'),
                              ),
                            ]),
                            Row(children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              Container(
                                child: Text('Malicious Damage'),
                              ),
                            ]),
                            Row(children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              Container(
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
            ])));
  }
}
