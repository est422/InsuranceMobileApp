import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'MobileInfo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
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
            MaterialPageRoute(builder: (context) => const MobileInfo()),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              // const SizedBox(height: 40),
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
            ],
          ),
        ),
      ),
    );
  }
}
