import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/MobileInfo.dart';
import 'package:insurance_app/main.dart';
import 'package:insurance_app/models/User.dart';

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

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
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
      profile = _getProfile(userAccountId);
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  Future<User> _getProfile(id) async {
    String url = 'https://insurancebackendapi-5yi8.onrender.com/api/user/$id';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      // print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Unable to fetch profile from the REST API');
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
    // final user = ModalRoute.of(context)!.settings.arguments as Map;

    // final firstName = user["firstName"];
    // final lastName = user["lastName"];
    // final phone = user["phone"];
    // final email = user["email"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('User Profile'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  FutureBuilder<User>(
                    future: profile,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                            child: Column(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/testimonials-placeholder.png"),
                                  radius: 50,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Hi, ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      snapshot.data!.firstName,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])
                            ],
                          ),
                          Column(children: [
                            Container(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                    child: const Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(109, 21, 23, 1)),
                                    ),
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Category(),
                                          ),
                                        )))
                          ]),
                          Container(
                              alignment: Alignment.center,
                              // width: 600,
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Card(
                                child: Column(children: [
                                  ListTile(
                                    title: const Text(
                                      'First Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.firstName,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Last Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.lastName,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Phone Number',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.phone,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                              )),
                          const SizedBox(height: 10),
                          Container(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(109, 21, 23, 1)),
                                  ),
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Category(),
                                        ),
                                      ))),
                        ]));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ]))),
        bottomNavigationBar: const BottomNavigation());
  }
}
