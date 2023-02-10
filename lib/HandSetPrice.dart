import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Register.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp/otp.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Login.dart';
import 'package:insurance_app/VerifyNumber.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HandSetPrice extends StatefulWidget {
  const HandSetPrice({super.key});

  @override
  State<HandSetPrice> createState() {
    return _HandSetPriceState();
  }
}

class _HandSetPriceState extends State<HandSetPrice> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  late String price;

  @override
  void initState() {
    super.initState();
  }

  String? validatePrice(String? value) {
    String pattern = r'^\+?[1-9]\d*$';
    RegExp regExp = RegExp(pattern);
    if (value!.length < 5) {
      return 'Please enter your mobile phone price (Must be greater than or equal to 5 digits)';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid number';
    }
    return null;
    // if (value!.length != 5) {
    //   return 'Mobile Number must be of 5 digit';
    // } else {
    //   return null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;
    final phone = user["phone"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Handset Price'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            height: 400,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.phone_android,
                  size: 100.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const
                      // CircleAvatar(
                      //   backgroundImage: AssetImage(
                      //       "assets/images/testimonials-placeholder.png"),
                      // ),
                      // SizedBox(height: 30),
                      Text('Enter Handset Actual Price'),
                  // Text('to complete insurance registration'),
                  // SizedBox(height: 30),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // obscureText: true,
                  validator: validatePrice,
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Handset Cost',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
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
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    // textColor: Colors.white,
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register(),
                                  settings: RouteSettings(arguments: {
                                    // "firstName": firstName,
                                    // "lastName": lastName,
                                    "phone": phone,
                                    "price": price
                                    // "email": email,
                                    // "password": password,
                                    // "code": code
                                  })));
                        }
                      } catch (e) {
                        throw e;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )),
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
