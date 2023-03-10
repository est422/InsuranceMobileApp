import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Policy.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp/otp.dart';

import 'package:flutter/material.dart';
import 'package:insurance_app/Login.dart';
import 'package:insurance_app/VerifyNumber.dart';

import 'UserProfile.dart';
import 'main.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final formKeyReg = GlobalKey<FormState>();
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
  late String? email;
  late String password;
  late String confirmPassword;
  late String? phone;
  late bool policy = false;
  late List<String> smsNumber = [];
  late bool isLoading = false;
  late int enteredPrice;

  final storage = const FlutterSecureStorage();

  // String? validateMobile(String? value) {
  //   if (value!.length != 10) {
  //     return 'Mobile Number must be of 10 digit';
  //   } else {
  //     return null;
  //   }
  // }

  String? validateName(String? value) {
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]*$');
    if (value!.length < 3) {
      return 'Name must be more than 2 charater';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Please Enter A Valid Name';
    }
    return null;
  }

  // String? validateEmail(String? value) {
  //   String pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   final RegExp regExp = RegExp(pattern);
  //   if (regExp.hasMatch(value!)) {
  //     return null;
  //   }
  //   return 'Please Enter A Valide Email Address';
  // }

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
  //     if (formKeyReg.currentState!.validate()) {
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
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;
    final phone = user["phone"];
    final price = user["price"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.center,
        child: Form(
          key: formKeyReg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  // width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width / 3,
                          child: const Text('Welcome User \nSign up to join',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20))),
                      // const SizedBox(width: 30),
                      Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 3,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/testimonials-placeholder.png",
                            ),
                            radius: 70,
                          ))
                    ],
                  )),
              const SizedBox(height: 15),
              TextFormField(
                // obscureText: true,
                validator: validateName,
                controller: _firstNameController,
                // keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  firstName = value;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  fillColor: Colors.grey.shade300,
                  filled: true,
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
                // obscureText: true,
                validator: validateName,
                controller: _lastNameController,
                // keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  lastName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  fillColor: Colors.grey.shade300,
                  filled: true,
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
              // const SizedBox(height: 15),
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
              // const SizedBox(height: 15),
              // TextFormField(
              //   // obscureText: true,
              //   // textAlignVertical: TextAlignVertical.center,
              //   keyboardType: TextInputType.emailAddress,
              //   validator: validateEmail,
              //   controller: _emailController,
              //   onChanged: (value) {
              //     email = value;
              //   },
              //   decoration: const InputDecoration(
              //     labelText: 'Email (Optional)',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //       borderSide: BorderSide(
              //         width: 0,
              //         style: BorderStyle.solid,
              //       ),
              //     ),
              //     // contentPadding: EdgeInsets.all(30),
              //     // errorText: _wrongPassword ? _passwordText : null,
              //   ),
              // ),
              const SizedBox(height: 15),
              TextFormField(
                // obscureText: true,
                validator: validatePassword,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                // obscureText: true,
                validator: validateConfirmPassword,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  fillColor: Colors.grey.shade300,
                  filled: true,
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
              // Container(
              //     // padding: const EdgeInsets.all(2),
              //     child: Row(
              //   children: [
              //     Container(
              //         padding: const EdgeInsets.all(5),
              //         child: Checkbox(
              //           value: policy,
              //           onChanged: (value) {
              //             policy = true;
              //           },
              //         )),
              // Container(
              //     padding: const EdgeInsets.all(5),
              //     child: InkWell(
              //       child: const Text('aggree to terms and poicy'),
              //       onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Policy(),
              //           )),
              //     )),
              // ],
              // )),
              const SizedBox(height: 15),
              Container(
                  // alignment: Alignment.center,
                  width: double.infinity,
                  // height: 75,
                  // padding: const EdgeInsets.all(2.0),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: const Color.fromRGBO(109, 21, 23, 1),
                      // textColor: Colors.white,
                      onPressed: () async {
                        try {
                          if (formKeyReg.currentState!.validate()) {
                            // final code = OTP.generateTOTPCodeString(
                            //     'JBSWY3DPEHPK3PXP',
                            //     DateTime.now().millisecondsSinceEpoch);
                            // smsNumber.add(phone.toString());
                            // String sendResult = await sendSMS(
                            //         message: code, recipients: smsNumber, sendDirect: true)
                            //     .catchError((err) {
                            //   // ignore: avoid_print
                            //   print(err);
                            // });
                            // ignore: avoid_print
                            // print(sendResult);
                            setState(() {
                              isLoading = true;
                            });
                            final http.Response response = await http.post(
                                Uri.parse(
                                    'https://insurancebackendapi-5yi8.onrender.com/api/users/create'),
                                // 'http://localhost:7000/api/user/create'),
                                headers: {
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode(
                                  {
                                    "firstName": firstName,
                                    "lastName": lastName,
                                    // "email": email,
                                    "password": password,
                                    "phone": phone,
                                    "enteredPrice": price
                                  },
                                ));
                            // print(response.body);
                            if (response.statusCode == 200) {
                              setState(() {
                                isLoading = false;
                              });
                              formKeyReg.currentState?.reset();
                              await storage.write(
                                key: 'token',
                                value: jsonDecode(response.body),
                                iOptions: _getIOSOptions(),
                                aOptions: _getAndroidOptions(),
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChoosePlan()),
                              );
                            } else if (response.statusCode == 400) {
                              // print(response.body);
                              // formKeyReg.currentState?.reset();
                              setState(() {
                                isLoading = false;
                              });
                              setState(() {
                                isLoading = false;
                              });
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 252, 251, 251),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 200),
                                        content: Container(
                                            alignment: Alignment.center,
                                            width: 200,
                                            height: 50,
                                            child: const Text(
                                              "Unable to create account",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      109, 21, 23, 1),
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 24),
                                            ))));
                              });
                            } else if (response.statusCode == 500) {
                              setState(() {
                                isLoading = false;
                              });
                              formKeyReg.currentState?.reset();
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 252, 251, 251),
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 200),
                                        content: Container(
                                            alignment: Alignment.center,
                                            width: 200,
                                            height: 50,
                                            child: const Text(
                                              "Internal server error",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      109, 21, 23, 1),
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 24),
                                            ))));
                              });
                            }
                          }
                        } catch (e) {
                          print(e);
                          setState(() {
                            isLoading = false;
                          });
                        }
                        formKeyReg.currentState?.reset();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ))),
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
              isLoading
                  ? Container(
                      // color: Colors.white.withOpacity(0.8),
                      child: const Center(
                        child: CircularProgressIndicator(
                            // valueColor: Color.,
                            ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      )),
    );
  }
}
