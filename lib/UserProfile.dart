import 'package:flutter/material.dart';
import 'package:insurance_app/MobileInfo.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map;

    final firstName = user["firstName"];
    final lastName = user["lastName"];
    final phone = user["phone"];
    final email = user["email"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('User Profile'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/testimonials-placeholder.png"),
                          radius: 50,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                          'Hi, $firstName',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      'Please edit your profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color.fromRGBO(109, 21, 23, 1),
                    // textColor: Colors.white,
                    onPressed: () {
                      print(user);
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(109, 21, 23, 1)),
                          ),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MobileInfo(),
                                ),
                              )))
                ]))));
  }
}
