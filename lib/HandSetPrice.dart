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

  String? validateMobile(String? value) {
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
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
            padding: const EdgeInsets.fromLTRB(40, 60, 20, 0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/testimonials-placeholder.png"),
                    ),
                    SizedBox(height: 30),
                    Text('Enter Handset Actual Price'),
                    // Text('to complete insurance registration'),
                    SizedBox(height: 30),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // obscureText: true,
                  validator: validateMobile,
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Handset Cost',
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
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color.fromRGBO(109, 21, 23, 1),
                  // textColor: Colors.white,
                  onPressed: () {
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
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
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
