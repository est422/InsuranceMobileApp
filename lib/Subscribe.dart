import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/HandSetPrice.dart';
import 'package:insurance_app/Register.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp/otp.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Login.dart';
import 'package:insurance_app/VerifyNumber.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() {
    return _SubscribeState();
  }
}

class _SubscribeState extends State<Subscribe> {
  final _formKey = GlobalKey<FormState>();
  // final code = OTP.generateTOTPCodeString(
  //     'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();
  // // final _auth = FirebaseAuth.instance;
  // late String firstName;
  // late String lastName;
  // late String email = "";
  // late String password;
  // late String confirmPassword;
  late String? phone;
  // late bool policy = false;
  // late List<String> smsNumber = [];

  // String? validateMobile(String? value) {
  //   if (value!.length != 10) {
  //     return 'Mobile Number must be of 10 digit';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validateName(String? value) {
  //   if (value!.length < 3) {
  //     return 'Name must be more than 2 charater';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validatePassword(String? value) {
  //   if (value!.length < 6) {
  //     return 'Password must be at least 6 charater';
  //   } else {
  //     return null;
  //   }
  // }

  // String? validateConfirmPassword(String? value) {
  //   if (value!.length < 6) {
  //     return 'Password must be at least 6 charater';
  //   } else if (value != password) {
  //     return 'Password does not match';
  //   }
  //   return null;
  // }

  Future<void> _submit() async {
    try {
      // if (_formKey.currentState!.validate()) {
      // final code = OTP.generateTOTPCodeString(
      //     'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
      // smsNumber.add(phone.toString());
      // String sendResult = await sendSMS(
      //         message: code, recipients: smsNumber, sendDirect: true)
      //     .catchError((err) {
      //   // ignore: avoid_print
      //   print(err);
      // });
      // ignore: avoid_print
      // print(sendResult);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Register(),
            settings: RouteSettings(arguments: {
              // "firstName": firstName,
              // "lastName": lastName,
              "phone": phone,
              // "email": email,
              // "password": password,
              // "code": code
            })),
      );
      // }
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;
    final phone = user["phone"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Subscribe'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            // margin: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
            height: MediaQuery.of(context).size.height / 1.2,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.mail_outline,
                  size: 150.0,
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text('Kindly Send OK to 813',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 20))),
                Container(
                    alignment: Alignment.center,
                    child: const Text('to complete insurance registration',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 20))),
                // CircleAvatar(
                //   backgroundImage: AssetImage(
                //       "assets/images/testimonials-placeholder.png"),
                // ),
                // SizedBox(height: 30),

                // SizedBox(height: 30),
                // const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(30),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: const Color.fromRGBO(109, 21, 23, 1),
                        // textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HandSetPrice(),
                                  settings: RouteSettings(arguments: {
                                    // "firstName": firstName,
                                    // "lastName": lastName,
                                    "phone": phone,
                                    // "email": email,
                                    // "password": password,
                                    // "code": code
                                  })));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          // width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'Click Here',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //       color: Colors.white,
      //       border: Border(
      //           top: BorderSide(
      //               color: Color.fromRGBO(109, 21, 23, 1), width: 3.0))),
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Colors.white,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white.withOpacity(.60),
      //     selectedFontSize: 14,
      //     unselectedFontSize: 14,
      //     onTap: (value) {
      //       // Respond to item press.
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         label: '',
      //         icon: Image.asset('assets/icons/Asset41@2x.png'),
      //       ),
      //       BottomNavigationBarItem(
      //         label: '',
      //         icon: Image.asset('assets/icons/Asset42@2x.png'),
      //       ),
      //       BottomNavigationBarItem(
      //         label: '',
      //         icon: Image.asset('assets/icons/Asset43@2x.png'),
      //       ),
      //       BottomNavigationBarItem(
      //         label: '',
      //         icon: Image.asset('assets/icons/Asset40@2x.png'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
