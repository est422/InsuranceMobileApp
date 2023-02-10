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
    final device = user['device'];
    final model = user['model'];
    final createdAt = user['createdAt'];
    final handsetCost = user['handsetCost'];
    final handsetId = user['handsetId'];
    final iMEI1 = user['iMEI1'];
    final iMEI2 = user['iMEI2'];
    final serialNo = user['serialNo'];
    final platform = user['platform'];
    final hardWare = user['hardWare'];
    final enteredAmount = user['enteredAmount'];
    final selectedPlan = user['selectedPlan'];
    final imageUrl = user['imageUrl'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('Client Profile'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(2.0),
                child: Column(children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   // crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/testimonials-placeholder.png"),
                      radius: 50,
                    ),
                  ),
                  // const SizedBox(width: 10),
                  // Container(
                  //   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  //   child: Column(children: [
                  //     Text(
                  //       'FirstName: $firstName',
                  //       style: const TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.bold),
                  //     ),
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
                  // ]),
                  // ),
                  // ],
                  // ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      child: const Text(
                        'User Information',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(109, 21, 23, 1)),
                      )),
                  Container(
                      alignment: Alignment.center,
                      // width: 600,
                      // padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(children: [
                          ListTile(
                            title: const Text(
                              'First Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              firstName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Last Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              lastName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              phone,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: email != null
                                ? Text(
                                    email,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    'Not Set',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ]),
                      )),
                  const Text(
                    'Device Information',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(109, 21, 23, 1)),
                  ),
                  Container(
                      alignment: Alignment.center,
                      // width: 600,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Card(
                          child: Column(children: [
                        ListTile(
                          title: const Text(
                            'Device',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: device != null
                              ? Text(
                                  device,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  'Not Set',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        ListTile(
                          title: const Text(
                            'Model',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: model != null
                              ? Text(
                                  model!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  'Not Set',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        ListTile(
                          title: const Text(
                            'HandsetCost',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            handsetCost.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'HandsetId',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            handsetId.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'IMEI1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            iMEI1.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'IMEI2',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            iMEI2.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'HardWare',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: hardWare != null
                              ? Text(
                                  hardWare,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  'Not Set',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        ListTile(
                          title: const Text(
                            'Platform',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: platform != null
                              ? Text(
                                  platform!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  'Not Set',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        ListTile(
                          title: const Text(
                            'SerialNo',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            serialNo.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'EnteredAmount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            enteredAmount.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'SelectedPlan',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            selectedPlan!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'ImageUrl',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            imageUrl!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]))),
                  // Container(
                  //     alignment: Alignment.center,
                  //     // width: 600,
                  //     padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //     child: Card(
                  //         child: Column(children: [
                  //       Container(
                  //           alignment: Alignment.centerLeft,
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: Text(
                  //             'Last Name: $lastName',
                  //             style: const TextStyle(
                  //                 fontSize: 18, fontWeight: FontWeight.bold),
                  //           )),
                  //       Container(
                  //           alignment: Alignment.centerLeft,
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: Text(
                  //             'Phone Number: $phone',
                  //             style: const TextStyle(
                  //                 fontSize: 18, fontWeight: FontWeight.bold),
                  //           )),
                  //       Container(
                  //         alignment: Alignment.centerLeft,
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Text(
                  //           'Email: $email',
                  //           style: const TextStyle(
                  //               fontSize: 18, fontWeight: FontWeight.bold),
                  //         ),
                  //       )
                  //     ]))),
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
