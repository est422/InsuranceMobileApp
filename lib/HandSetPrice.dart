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
            // margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height / 1.2,
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.phone_android,
                  size: 150.0,
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
                      Text('Enter Handset Actual Price',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
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
                  decoration: InputDecoration(
                    labelText: 'Enter Handset Cost',
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    // errorText: _wrongPassword ? _passwordText : null,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                    width: double.infinity,
                    // padding: const EdgeInsets.all(2.0),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
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
                          _formKey.currentState?.reset();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: const Text(
                            'Submit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
