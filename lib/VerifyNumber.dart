import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'Login.dart';
import 'MobileInfo.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() {
    return _VerifyNumberState();
  }
}

class _VerifyNumberState extends State<VerifyNumber> {
  final TextEditingController _verificationCodeController =
      TextEditingController();

  late String verificationCode;
  // late List<String> phone = [];

  // String? validateVerificationCode(String? value) {
  //   if (value!.length < 3) {
  //     return 'Name must be more than 2 charater';
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;

    final firstName = user["firstName"];
    final lastName = user["lastName"];
    final phone = user["phone"];
    final email = user["email"];
    final password = user["password"];
    final code = user["code"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Verify Phone Number'),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'We have sent your verification code to \n Your Phone: $phone',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Sample generated verification code to: \t $code',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: TextFormField(
                // obscureText: true,
                // validator: validateVerificationCode,
                // controller: _verificationCodeController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // verificationCode = code;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Code',
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
            ),
            const SizedBox(height: 10),
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
                          "name": firstName,
                          "lastName": lastName,
                          "email": email,
                          "password": password,
                          "phone": phone
                        },
                      ));
                  if (response.statusCode == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MobileInfo()),
                    );
                  } else {
                    throw Exception('User creation failed!');
                    // print(response);
                  }
                } catch (e) {
                  // ignore: avoid_print
                  print(e);
                }
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
