import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/DeviceInfo.dart';
import 'package:insurance_app/Register.dart';
import 'package:insurance_app/UserInfo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'MobileInfo.dart';
import 'PhoneInput.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  late String phone;
  late String password;
  late bool isLoading = false;
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late int? userAccountId;
  Future<User>? profile;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> _readAccess() async {
    final access = await _storage.read(
        key: 'token',
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (access != null) {
      // setState(() {
      //   auth = access;
      //   // fetchUser(auth);
      // });
      String normalizedSource = base64Url.normalize(access.split(".")[1]);
      var result = utf8.decode(base64Url.decode(normalizedSource));
      Map<String, dynamic> tokenDecoded = json.decode(result);
      setState(() {
        isLoggedIn = true;
        userAccountId = tokenDecoded['Id'];
      });
      // profile = _getProfile(userAccountId);
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

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
    try {
      if (formKey.currentState!.validate()) {
        final http.Response response = await http.post(
          Uri.parse(
              'https://insurancebackendapi-5yi8.onrender.com/api/users/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'phone': phone,
            'password': password,
          }),
        );
        // print('response $response');
        if (response.statusCode == 200) {
          setState(() {
            isLoading = false;
          });
          await _storage.write(
            key: 'token',
            value: jsonDecode(response.body),
            iOptions: _getIOSOptions(),
            aOptions: _getAndroidOptions(),
          );
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserInfo()),
          );
        } else if (response.statusCode == 400) {
          // throw Exception('User login failed!');
          setState(() {
            isLoading = false;
          });
          formKey.currentState?.reset();
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: const Color.fromARGB(255, 252, 251, 251),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 200),
                content: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    child: const Text(
                      "Incorrect Phone or Password",
                      style: TextStyle(
                          color: Color.fromRGBO(109, 21, 23, 1),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          fontSize: 24),
                    ))));
          });
        } else if (response.statusCode == 500) {
          formKey.currentState?.reset();
          setState(() {
            isLoading = false;
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: const Color.fromARGB(255, 252, 251, 251),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 200),
                content: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    child: const Text(
                      "Internal server error",
                      style: TextStyle(
                          color: Color.fromRGBO(109, 21, 23, 1),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          fontSize: 24),
                    ))));
          });
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
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
          child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                // padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0.0),
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                // padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                child: const Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                // obscureText: true,
                validator: validateMobile,
                controller: _phoneNumberController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  phone = value;
                },
                // style: TextStyle(backgroundColor: Colors.grey),
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  labelText: 'Mobile',
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
              TextFormField(
                obscureText: true,
                validator: validatePassword,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  labelText: 'Password',
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
                  // height: 80,
                  // padding: const EdgeInsets.all(2.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    // textColor: Colors.white,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await _submit();
                      formKey.currentState?.reset();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                  )),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(109, 21, 23, 1)),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneInput(),
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
      )),
    );
  }
}
