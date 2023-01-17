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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // final _auth = FirebaseAuth.instance;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String confirmPassword;
  late String phone;

  String? validateMobile(String? value) {
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    if (value!.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 charater';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 charater';
    } else if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
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
            MaterialPageRoute(builder: (context) => const Login()),
          );
        } else {
          throw Exception('User creation failed!');
          // print(response);
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
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Welcome User \nSign up to join'),
                  SizedBox(width: 30),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/testimonials-placeholder.png"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                // obscureText: true,
                validator: validateName,
                controller: _nameController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  firstName = value;
                },
                decoration: const InputDecoration(
                  labelText: 'First Name',
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
                // obscureText: true,
                validator: validateName,
                controller: _nameController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  lastName = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Last Name',
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
                // obscureText: true,
                // textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Email (Optional)',
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
              TextFormField(
                // obscureText: true,
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
              const SizedBox(height: 10),
              TextFormField(
                // obscureText: true,
                validator: validateConfirmPassword,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
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
                onPressed: _submit,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(109, 21, 23, 1)),
                    ),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        )),
              )
            ],
          ),
        )),
      ),
    );
  }
}
