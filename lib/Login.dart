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
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        key: _formKey,
        child: Column(
          children: <Widget>[
            // const SizedBox(height: 40),
            TextField(
              // obscureText: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
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
            TextField(
              obscureText: true,
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
              onPressed: () async {
                try {
                  final http.Response response = await http.post(
                    Uri.parse(
                        'https://insurancebackendapi-5yi8.onrender.com/api/user/login'),
                    headers: {
                      'Content-Type': 'application/json',
                    },
                    body: jsonEncode({
                      'email': email,
                      'password': password,
                    }),
                  );
                  if (response.statusCode == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MobileInfo()),
                    );
                  } else {
                    throw Exception('User login failed!');
                  }
                  // final user = await _auth.signInWithEmailAndPassword(
                  //     email: email, password: password);
                  // if (user != null) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => const GetQuote()),
                  //   );
                  // }
                } catch (e) {
                  print(e);
                }
              },
              // onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const DeviceInfo()),
              // );
              // },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
