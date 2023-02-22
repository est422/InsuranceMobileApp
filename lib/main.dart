import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/CameraTest.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/DrawerNavigationMenu.dart';
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
import 'ScreenTest.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'LandingPage.dart';

Future<void> main() async {
  runApp(const MyApp());
  // await Firebase.initializeApp();
  // String value = await storage.read(key: key);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Insurance Mobile App',
      home: MyHomePage(title: 'Insurance Mobile App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  late int selectedPage = 0;
  late PageController _pageController =
      PageController(initialPage: 0); // set the initial page you want to show
  int _activePage = 0;
  late bool isLoggedIn = false;
  late int userAccountId;

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
    // _activePage = 0;
    _pageController = PageController(initialPage: _activePage);
    _readAccess();
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose(); // dispose the PageController
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 2;
    final List<Widget> _pages = [
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.all(40),
      //         alignment: Alignment.center,
      //         height: 400,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               image:
      //                   AssetImage("assets/images/home_insurance_slider4.jpg"),
      //               fit: BoxFit.fill),
      //         ),
      //         // child: const Text(
      //         //   'Get Insured, Lead a Sustinable Life!',
      //         //   style: TextStyle(
      //         //       fontSize: 20, fontWeight: FontWeight.bold),
      //         // ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         child: const Text(
      //           'Get Insured, Lead a Sustinable Life!',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/home_insurance_slider4.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              child: const Text(
                'Insure your Mobile Device!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Sign Up and Get Started!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(109, 21, 23, 1)),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneInput(),
                      )),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(109, 21, 23, 1)),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      )),
                ))
          ]),
    ];
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        //   title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
        // ),
        // endDrawer: const DrawerNavigationMenu(),
        // body: const ScreenTest(),
        // );
        body: Stack(
      // fit: StackFit.expand,
      children: [
        PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _activePage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(child: _pages[index]);
            }),
        //creating dots at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 40,
          child: Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  _pages.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 5,
                            // check if a dot is connected to the current page
                            // if true, give it a different color
                            backgroundColor: _activePage == index
                                ? Color.fromRGBO(109, 21, 23, 1)
                                : Colors.white30,
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ],
    ));
  }
}
