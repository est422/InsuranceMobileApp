import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
import 'package:insurance_app/CameraTest.dart';
import 'package:insurance_app/MobileInfo.dart';

import 'package:insurance_app/Quotes.dart';
import 'package:insurance_app/VerifyDevice.dart';
import 'VerifyDevice.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() {
    return _CategoryState();
  }
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Asset52.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(50),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/testimonials-placeholder.png"),
                                radius: 50,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Welcome User',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                  alignment: Alignment.center,
                                  child: const Text('Choose Insurance Category',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal))),
                            ],
                          ),
                        ),
                        Container(
                          // color: const Color.fromARGB(255, 204, 202, 202),
                          // width: 100,
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          // child: Column(
                          //   children: <Widget>[
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MobileInfo()),
                                        );
                                      },
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/icons/Asset8.png",
                                        ),
                                        radius: 40,
                                      ),
                                    ),
                                    const Text('Home'),
                                  ],
                                ),
                                // Text('Battery'),
                                const SizedBox(width: 25),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MobileInfo()),
                                        );
                                      },
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/icons/Asset10.png",
                                        ),
                                        radius: 40,
                                      ),
                                    ),
                                    const Text('Auto'),
                                  ],
                                ),
                                const SizedBox(width: 25),
                                Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MobileInfo()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/icons/Asset11.png",
                                      ),
                                      radius: 40,
                                    ),
                                  ),
                                  const Text('Life'),
                                ])
                              ]),
                          // ],
                          // ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          // color: const Color.fromARGB(255, 204, 202, 202),
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          // child: Column(
                          // children: <Widget>[
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Text('Vibration'),
                                // const SizedBox(width: 15),
                                Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MobileInfo()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/icons/Asset18.png",
                                      ),
                                      radius: 40,
                                    ),
                                  ),
                                  const Text('Mobile'),
                                ]),
                                const SizedBox(width: 25),
                                Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MobileInfo()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/icons/Asset19.png",
                                      ),
                                      radius: 40,
                                    ),
                                  ),
                                  const Text('Travel'),
                                ]),
                                const SizedBox(width: 25),
                                Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MobileInfo()),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/icons/Asset19.png",
                                      ),
                                      radius: 40,
                                    ),
                                  ),
                                  const Text('More'),
                                ]),
                              ]),
                          // ],
                          // ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
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
