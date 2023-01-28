import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';
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
  late int selectedPage;
  late final PageController _pageController;
  // ignore: prefer_typing_uninitialized_variables
  late final auth;
  // ignore: non_constant_identifier_names
  late final User;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  late String phone;
  late String password;

  String? validateMobile(String? value) {
    if (value!.length != 10) {
      return 'Please Enter Your Mobile Number';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Please Enter Your Password';
    } else {
      return null;
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        const CircularProgressIndicator();
        final http.Response response = await http.post(
          Uri.parse(
              'https://insurancebackendapi-5yi8.onrender.com/api/user/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'phone': phone,
            'password': password,
          }),
        );
        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Category()),
          );
        } else {
          throw Exception('User login failed!');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    _readAccess();
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

  @override
  Widget build(BuildContext context) {
    final pageCount = 3;
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
      // body: SingleChildScrollView(
      //   // child: SafeArea(
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: PageView(
      //             controller: _pageController,
      //             onPageChanged: (page) {
      //               setState(() {
      //                 selectedPage = page;
      //               });
      //             },
      //             children: List.generate(pageCount, (index) {
      //               if (index == 2) {
      //                 return Form(
      //                   key: _formKey,
      //                   child: Container(
      //                     padding: const EdgeInsets.all(40.0),
      //                     child: Column(
      //                       children: <Widget>[
      //                         // const SizedBox(height: 40),
      //                         TextFormField(
      //                           // obscureText: true,
      //                           validator: validateMobile,
      //                           controller: _phoneNumberController,
      //                           keyboardType: TextInputType.visiblePassword,
      //                           onChanged: (value) {
      //                             phone = value;
      //                           },
      //                           decoration: const InputDecoration(
      //                             labelText: 'Mobile',
      //                             border: OutlineInputBorder(
      //                               borderRadius: BorderRadius.all(
      //                                 Radius.circular(10.0),
      //                               ),
      //                               borderSide: BorderSide(
      //                                 width: 0,
      //                                 style: BorderStyle.solid,
      //                               ),
      //                             ),
      //                             // errorText: _wrongPassword ? _passwordText : null,
      //                           ),
      //                         ),
      //                         const SizedBox(height: 10),
      //                         TextFormField(
      //                           obscureText: true,
      //                           validator: validatePassword,
      //                           controller: _passwordController,
      //                           keyboardType: TextInputType.visiblePassword,
      //                           onChanged: (value) {
      //                             password = value;
      //                           },
      //                           decoration: const InputDecoration(
      //                             labelText: 'Password',
      //                             border: OutlineInputBorder(
      //                               borderRadius: BorderRadius.all(
      //                                 Radius.circular(10.0),
      //                               ),
      //                               borderSide: BorderSide(
      //                                 width: 0,
      //                                 style: BorderStyle.solid,
      //                               ),
      //                             ),
      //                             // errorText: _wrongPassword ? _passwordText : null,
      //                           ),
      //                         ),
      //                         MaterialButton(
      //                           shape: RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(12),
      //                           ),
      //                           color: const Color.fromRGBO(109, 21, 23, 1),
      //                           // textColor: Colors.white,
      //                           onPressed: _submit,
      //                           child: const Text(
      //                             'Login',
      //                             style: TextStyle(
      //                                 color: Colors.white, fontSize: 20.0),
      //                           ),
      //                         ),
      //                         // Container(
      //                         //     padding: const EdgeInsets.all(10.0),
      //                         //     child: InkWell(
      //                         //       child: const Text(
      //                         //         'Create an account',
      //                         //         style: TextStyle(
      //                         //             fontSize: 24.0,
      //                         //             fontWeight: FontWeight.bold,
      //                         //             color: const Color.fromRGBO(
      //                         //                 109, 21, 23, 1)),
      //                         //       ),
      //                         //       onTap: () => Navigator.push(
      //                         //           context,
      //                         //           MaterialPageRoute(
      //                         //             builder: (context) =>
      //                         //                 const Register(),
      //                         //           )),
      //                         //     ))
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               } else {
      //                 return Container(
      //                   child: Center(
      //                     child: Text('Page $index'),
      //                   ),
      //                 );
      //               }
      //             }),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 24),
      //           child: PageViewDotIndicator(
      //             currentItem: selectedPage,
      //             count: pageCount,
      //             unselectedColor: Colors.white,
      //             selectedColor: Colors.black26,
      //             duration: Duration(milliseconds: 200),
      //             boxShape: BoxShape.circle,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0.0),
                    child: const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                    child: const Text(
                      'Login to your account',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // obscureText: true,
                    validator: validateMobile,
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      // errorText: _wrongPassword ? _passwordText : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    validator: validatePassword,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      // errorText: _wrongPassword ? _passwordText : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    // textColor: Colors.white,
                    onPressed: _submit,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(109, 21, 23, 1)),
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            )),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
