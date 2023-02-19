import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/Quotes.dart';
import 'package:insurance_app/TestDevice.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/DeviceInfo.dart';
import 'package:insurance_app/Login.dart';

import 'package:insurance_app/AboutUs.dart';
import 'package:insurance_app/ContactUs.dart';
import 'package:insurance_app/Policy.dart';
import 'package:insurance_app/Register.dart';
import 'package:insurance_app/models/User.dart';
import 'PhoneInput.dart';
import 'main.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'LandingPage.dart';

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

class DrawerNavigationMenu extends StatefulWidget {
  const DrawerNavigationMenu({super.key});

  @override
  State<DrawerNavigationMenu> createState() => _DrawerNavigationMenuState();
}

class _DrawerNavigationMenuState extends State<DrawerNavigationMenu> {
  // final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  late int selectedPage = 0;
  late bool isLoggedIn = false;
  late int userAccountId;

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

  @override
  void initState() {
    super.initState();
    _readAccess();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose(); // dispose the PageController
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/testimonials-placeholder.png"),
                      // radius: 50,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              )),
          ListTile(
            // leading: Icon(Icons.message),
            title: const Text('Home'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.account_circle),
            title: const Text('About Us'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUs()),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.settings),
            title: const Text('Policy'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Policy()),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.settings),
            title: const Text('Contact Us'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactUs()),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.settings),
            title: const Text('Sign Up'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PhoneInput()),
            ),
          ),
          isLoggedIn && userAccountId == 2
              ? ListTile(
                  // leading: Icon(Icons.settings),
                  title: const Text('Admin'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Clients()),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
