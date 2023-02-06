import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Register.dart';
import 'package:insurance_app/Subscribe.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp/otp.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Login.dart';
import 'package:insurance_app/VerifyNumber.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() {
    return _PhoneInputState();
  }
}

class _PhoneInputState extends State<PhoneInput> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  late String phone;

  String? validateMobile(String? value) {
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  Future<void> _submit() async {
    try {
      if (_formKey.currentState!.validate()) {
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
              builder: (context) => const Subscribe(),
              settings: RouteSettings(arguments: {
                // "firstName": firstName,
                // "lastName": lastName,
                "phone": phone,
                // "email": email,
                // "password": password,
                // "code": code
              })),
        );
      }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Get Started'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Welcome User \nSign up to join'),
                    SizedBox(width: 30),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/testimonials-placeholder.png"),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // obscureText: true,
                  validator: validateMobile,
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
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
                const SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color.fromRGBO(109, 21, 23, 1),
                  // textColor: Colors.white,
                  onPressed: _submit,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                // Container(
                //     padding: const EdgeInsets.all(10.0),
                //     child: InkWell(
                //       child: const Text(
                //         'Log In',
                //         style: TextStyle(
                //             fontSize: 24.0,
                //             fontWeight: FontWeight.bold,
                //             color: const Color.fromRGBO(109, 21, 23, 1)),
                //       ),
                //       onTap: () => Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const Login(),
                //           )),
                //     )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(109, 21, 23, 1), width: 3.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset41@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset42@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset43@2x.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/icons/Asset40@2x.png'),
            ),
          ],
        ),
      ),
    );
  }
}
