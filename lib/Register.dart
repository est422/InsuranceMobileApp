import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurance_app/BottomNavigation.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp/otp.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Login.dart';
import 'package:insurance_app/VerifyNumber.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final code = OTP.generateTOTPCodeString(
      'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // final _auth = FirebaseAuth.instance;
  late String firstName;
  late String lastName;
  late String email = "";
  late String password;
  late String confirmPassword;
  late String? phone;
  late bool policy = false;
  late List<String> smsNumber = [];

  // String? validateMobile(String? value) {
  //   if (value!.length != 10) {
  //     return 'Mobile Number must be of 10 digit';
  //   } else {
  //     return null;
  //   }
  // }

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

  // Future<void> _submit() async {
  //   try {
  //     if (_formKey.currentState!.validate()) {
  //       final code = OTP.generateTOTPCodeString(
  //           'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
  //       smsNumber.add(phone.toString());
  //       // String sendResult = await sendSMS(
  //       //         message: code, recipients: smsNumber, sendDirect: true)
  //       //     .catchError((err) {
  //       //   // ignore: avoid_print
  //       //   print(err);
  //       // });
  //       // ignore: avoid_print
  //       // print(sendResult);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => const VerifyNumber(),
  //             settings: RouteSettings(arguments: {
  //               "firstName": firstName,
  //               "lastName": lastName,
  //               "phone": phone,
  //               "email": email,
  //               "password": password,
  //               "price": price,
  //               "code": code
  //             })),
  //       );
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;
    phone = user["phone"];
    final price = user["price"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  controller: _firstNameController,
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
                  controller: _lastNameController,
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
                // TextFormField(
                //   // obscureText: true,
                //   validator: validateMobile,
                //   controller: _phoneNumberController,
                //   keyboardType: TextInputType.number,
                //   onChanged: (value) {
                //     phone = value;
                //   },
                //   decoration: const InputDecoration(
                //     labelText: 'Mobile',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(10.0),
                //       ),
                //       borderSide: BorderSide(
                //         width: 0,
                //         style: BorderStyle.solid,
                //       ),
                //     ),
                //     // errorText: _wrongPassword ? _passwordText : null,
                //   ),
                // ),
                const SizedBox(height: 10),
                TextFormField(
                  // obscureText: true,
                  // textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
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
                Row(
                  children: [
                    Checkbox(
                      value: policy,
                      onChanged: (value) {
                        policy = true;
                      },
                    ),
                    const Text('aggree to terms and poicy'),
                  ],
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color.fromRGBO(109, 21, 23, 1),
                  // textColor: Colors.white,
                  onPressed: () {
                    try {
                      if (_formKey.currentState!.validate()) {
                        final code = OTP.generateTOTPCodeString(
                            'JBSWY3DPEHPK3PXP',
                            DateTime.now().millisecondsSinceEpoch);
                        smsNumber.add(phone.toString());
                        // String sendResult = await sendSMS(
                        //         message: code, recipients: smsNumber, sendDirect: true)
                        //     .catchError((err) {
                        //   // ignore: avoid_print
                        //   print(err);
                        // });
                        // ignore: avoid_print
                        // print(sendResult);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyNumber(),
                              settings: RouteSettings(arguments: {
                                "firstName": firstName,
                                "lastName": lastName,
                                "phone": phone,
                                "email": email,
                                "password": password,
                                "price": price,
                                "code": code
                              })),
                        );
                      }
                    } catch (e) {
                      throw e;
                    }
                  },
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
                            builder: (context) => const Login(),
                          )),
                    )),
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
