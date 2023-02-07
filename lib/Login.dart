import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/Register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
  late bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.length != 10) {
      return 'Please Enter Your Mobile Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter A Valid Mobile Number';
    }
    return null;
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
          setState(() {
            isLoading = false;
          });
          // ignore: use_build_context_synchronously
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
      ),
      body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                  child: const Text(
                    'Login to your account',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
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
                const SizedBox(height: 15),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color.fromRGBO(109, 21, 23, 1),
                  // textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                  },
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
                            color: const Color.fromRGBO(109, 21, 23, 1)),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          )),
                    )),
                // Loading
                // Positioned(
                isLoading
                    ? Container(
                        // color: Colors.white.withOpacity(0.8),
                        child: const Center(
                          child: CircularProgressIndicator(
                              // valueColor: Color.,
                              ),
                        ),
                      )
                    : Container(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
