import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:insurance_app/UserProfile.dart';
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
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        // alignment: Alignment.centerLeft,
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
                      // 'http://localhost:7000/api/user/create'),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode(
                        {
                          "firstName": firstName,
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
                          builder: (context) => const UserProfile(),
                          settings: RouteSettings(arguments: {
                            "firstName": firstName,
                            "lastName": lastName,
                            "phone": phone,
                            "email": email,
                            // "password": password,
                            // "code": code
                          })),
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
