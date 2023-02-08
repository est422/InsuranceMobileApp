import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/main.dart';

import 'UserProfile.dart';

class ClientDetail extends StatefulWidget {
  const ClientDetail({super.key});

  @override
  State<ClientDetail> createState() {
    return _ClientDetailState();
  }
}

class _ClientDetailState extends State<ClientDetail> {
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  late final auth;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  // Future<void> _readAccess() async {
  //   final access = await _storage.read(
  //       key: 'token',
  //       iOptions: _getIOSOptions(),
  //       aOptions: _getAndroidOptions());
  //   if (access != null) {
  //     setState(() {
  //       auth = access;
  //       // fetchUser(auth);
  //     });
  //     String normalizedSource = base64Url.normalize(auth.split(".")[1]);
  //     var result = utf8.decode(base64Url.decode(normalizedSource));
  //     Map<String, dynamic> tokenDecoded = json.decode(result);
  //     print(tokenDecoded['Id']);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _readAccess();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;

    final firstName = user["firstName"];
    final lastName = user["lastName"];
    final phone = user["phone"];
    final email = user["email"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('Client Profile'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/testimonials-placeholder.png"),
                          radius: 50,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Column(children: [
                          Text(
                            'FirstName: $firstName',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // Container(
                          //     padding: const EdgeInsets.all(10.0),
                          //     child: InkWell(
                          //         child: const Text(
                          //           'Client Profile',
                          //           style: TextStyle(
                          //               fontSize: 20.0,
                          //               fontWeight: FontWeight.bold,
                          //               color: Color.fromRGBO(109, 21, 23, 1)),
                          //         ),
                          //         onTap: () => Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                 builder: (context) => const Category(),
                          //               ),
                          //             ))),
                        ]),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      // width: 600,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Card(
                          child: Column(children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Last Name: $lastName',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Phone Number: $phone',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Email: $email',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      ])))
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: const Text(
                  //     'Please edit your profile',
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Container(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: InkWell(
                  //         child: const Text(
                  //           'Continue',
                  //           style: TextStyle(
                  //               fontSize: 20.0,
                  //               fontWeight: FontWeight.bold,
                  //               color: const Color.fromRGBO(109, 21, 23, 1)),
                  //         ),
                  //         onTap: () => Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => const Category(),
                  //               ),
                  //             )))
                ]))),
        bottomNavigationBar: const BottomNavigation());
  }
}
