import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  late String name;
  late String email;
  late String password;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Welcome User \nSign up to join'),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/testimonials-placeholder.png"),
                )
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              // obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
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
              // obscureText: true,
              // textAlignVertical: TextAlignVertical.center,
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
                // contentPadding: EdgeInsets.all(30),
                // errorText: _wrongPassword ? _passwordText : null,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              // obscureText: true,
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
            const SizedBox(height: 10),
            TextField(
              // obscureText: true,
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
                          'https://insurancebackendapi-5yi8.onrender.com/api/user/create'),
                      // 'https://localhost:8000/api/user/create'),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode(
                        {
                          "name": name,
                          "email": email,
                          "password": password,
                          "phone": phone
                        },
                      ));
                  if (response.statusCode == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  } else {
                    // throw Exception('User creation failed!');
                    print(response);
                  }
                  // final newUser = await _auth.createUserWithEmailAndPassword(
                  //     email: email, password: password);
                  // if (newUser != null) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => const Login()),
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
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
