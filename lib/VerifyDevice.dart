import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/DeviceInfo.dart';

class VerifyDevice extends StatefulWidget {
  const VerifyDevice({super.key});

  @override
  State<VerifyDevice> createState() {
    return _VerifyDeviceState();
  }
}

class _VerifyDeviceState extends State<VerifyDevice> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
          // padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Complete coverage designed for the way you live',
                  style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 15.0, 0, 0),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Drops, spills, and breaks happen to all of us, so we offer protection plans that are actually helpful—for real people like you and me. Here’s what you get:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Cracked screen repair',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  // const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Fixes for defects/failures',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Loss and theft protection',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Accessory coverage',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Accessory coverage',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                    child: const Text(
                      '* Unlimited battery replacement',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Automatic Authenticating your Device',
                  style: TextStyle(fontSize: 20.0)),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromRGBO(109, 21, 23, 1),
                // textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeviceInfo()),
                  );
                },
                child: const Text(
                  'Verify Your Device',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
