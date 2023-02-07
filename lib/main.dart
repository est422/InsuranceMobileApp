import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/ChoosePlan.dart';
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
import 'package:insurance_app/models/users.dart';
import 'PhoneInput.dart';
import 'mainSection.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  // ignore: prefer_typing_uninitialized_variables
  late final auth;
  // ignore: non_constant_identifier_names
  late final User;
  // final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  // late String phone;
  // late String password;
  late int selectedPage = 0;
  // late final PageController _pageController;
  late PageController _pageController =
      PageController(initialPage: 0); // set the initial page you want to show
  int _activePage = 0;

  // String? validateMobile(String? value) {
  //   if (value!.length != 10) {
  //     return 'Please Enter Your Mobile Number';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validatePassword(String? value) {
  //   if (value!.length < 6) {
  //     return 'Please Enter Your Password';
  //   } else {
  //     return null;
  //   }
  // }

  // Future<void> _submit() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       const CircularProgressIndicator();
  //       final http.Response response = await http.post(
  //         Uri.parse(
  //             'https://insurancebackendapi-5yi8.onrender.com/api/user/login'),
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode({
  //           'phone': phone,
  //           'password': password,
  //         }),
  //       );
  //       if (response.statusCode == 200) {
  //         // ignore: use_build_context_synchronously
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const Category()),
  //         );
  //       } else {
  //         throw Exception('User login failed!');
  //       }
  //     } catch (e) {
  //       // ignore: avoid_print
  //       print(e);
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _activePage = 0;
    // _pageController = PageController(initialPage: _activePage);
    // _readAccess();
  }

  Future<void> _readAccess() async {
    final access = await _storage.read(
        key: 'Access',
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (access != null) {
      setState(() {
        auth = access;
        // fetchUser(auth);
      });
    }
  }

  // Future<User> fetchUser(auth) async {
  //   try {
  //     final http.Response response = await http.get(
  //       Uri.parse('https://insurancebackendapi-5yi8.onrender.com/api/user/'),
  //       headers: {
  //         'Authorization': auth,
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => const MobileInfo()),
  //       // );
  //       return User = jsonDecode(response.body);
  //     } else {
  //       throw Exception('User Not Found!');
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  final List<Widget> _pages = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/home_insurance_slider3.jpg"),
            fit: BoxFit.cover),
      ),
      child: const Text('Get Insured, Lead a Sustinable Life!'),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/home_insurance_slider4.jpg"),
            fit: BoxFit.cover),
      ),
      child: const Text('Insure your Mobile Device!'),
    ),
    Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/images/home_insurance_slider4.jpg"),
          //     fit: BoxFit.cover),
          ),
      child: const Text('Sign Up and Get Started!'),
    ),
  ];

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
              // child: const Text(
              //   'Get Insured, Lead a Sustinable Life!',
              //   style: TextStyle(
              //       fontSize: 20, fontWeight: FontWeight.bold),
              // ),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
      ),
      endDrawer: Drawer(
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
            const ListTile(
              // leading: Icon(Icons.message),
              title: Text('Home'),
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
                MaterialPageRoute(builder: (context) => const Register()),
              ),
            ),
          ],
        ),
      ),
      // body: const ChoosePlan(),
      // body: const LandingPage(),
      // body: Stack(
      //   // fit: StackFit.expand,
      //   children: [
      //     PageView.builder(
      //         controller: _pageController,
      //         onPageChanged: (int index) {
      //           setState(() {
      //             _activePage = index;
      //           });
      //         },
      //         itemCount: _pages.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Container(child: _pages[index]);
      //         }),
      //     //creating dots at bottom
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       height: 40,
      //       child: Container(
      //         color: Colors.black12,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: List<Widget>.generate(
      //               _pages.length,
      //               (index) => Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 8),
      //                     child: InkWell(
      //                       onTap: () {
      //                         _pageController.animateToPage(index,
      //                             duration: const Duration(milliseconds: 300),
      //                             curve: Curves.easeIn);
      //                       },
      //                       child: CircleAvatar(
      //                         radius: 5,
      //                         // check if a dot is connected to the current page
      //                         // if true, give it a different color
      //                         backgroundColor: _activePage == index
      //                             ? Color.fromRGBO(109, 21, 23, 1)
      //                             : Colors.white30,
      //                       ),
      //                     ),
      //                   )),
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: PageView(
      //             controller: _pageController,
      //             onPageChanged: (page) {
      //               setState(() {
      //                 selectedPage = page;
      //               });
      //             },
      // children: List.generate(pageCount, (index) {
      //   return Container(
      //     child: Center(
      //       child: Text('Page $index'),
      //     ),
      //   );
      // }),
      // children: <Widget>[
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      // Container(
      //   padding: const EdgeInsets.all(40),
      //   alignment: Alignment.center,
      //   height: 400,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage(
      //             "assets/images/home_insurance_slider4.jpg"),
      //         fit: BoxFit.fill),
      //   ),
      //   // child: const Text(
      //   //   'Get Insured, Lead a Sustinable Life!',
      //   //   style: TextStyle(
      //   //       fontSize: 20, fontWeight: FontWeight.bold),
      //   // ),
      // ),
      // Container(
      //   child: const Text(
      //     'Insure your Mobile Device!',
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      // ),
      // ]),
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         margin: const EdgeInsets.all(10),
      //         alignment: Alignment.center,
      //         child: const Text('Sign Up and Get Started!',
      //             style: TextStyle(
      //               fontSize: 20.0,
      //               fontWeight: FontWeight.bold,
      //             )),
      //       ),
      //       Container(
      //           padding: const EdgeInsets.all(10),
      //           child: InkWell(
      //             child: const Text(
      //               'Get Started',
      //               style: TextStyle(
      //                   fontSize: 24.0,
      //                   fontWeight: FontWeight.bold,
      //                   color: Color.fromRGBO(109, 21, 23, 1)),
      //             ),
      //             onTap: () => Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const PhoneInput(),
      //                 )),
      //           )),
      //       Container(
      //           padding: const EdgeInsets.all(10),
      //           child: InkWell(
      //             child: const Text(
      //               'Login',
      //               style: TextStyle(
      //                   fontSize: 18.0,
      //                   fontWeight: FontWeight.bold,
      //                   color: Color.fromRGBO(109, 21, 23, 1)),
      //             ),
      //             onTap: () => Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const Login(),
      //                 )),
      //           ))
      //     ]),
      // ]),
      // ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 24),
      //         child: PageViewDotIndicator(
      //           currentItem: selectedPage,
      //           count: pageCount,
      //           unselectedColor: Colors.black26,
      //           selectedColor: Color.fromRGBO(109, 21, 23, 1),
      //           duration: Duration(milliseconds: 200),
      //           boxShape: BoxShape.circle,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 16,
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(40),
                  alignment: Alignment.center,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/home_insurance_slider4.jpg"),
                        fit: BoxFit.fill),
                  ),
                  child: const Text(
                    'Get Insured, Lead a Sustinable Life!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
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
      ),
    );
  }
}
