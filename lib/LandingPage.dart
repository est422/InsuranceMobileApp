import 'package:flutter/material.dart';
import 'Register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              'Insure Your Mobile',
              style: TextStyle(
                  color: Color.fromRGBO(109, 21, 23, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color.fromRGBO(109, 21, 23, 1),
            // textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
            alignment: Alignment.topLeft,
            child: const Text(
              'Mobile Phone Insurance',
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
              'Phone Insurance',
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10),
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
            alignment: Alignment.topLeft,
            child: const Text(
              'Mobile Phone Insurance for Samsung to Iphone and Huawei to OnePlus - and all other brands in between - we cover all the major mobile phone handsets old, new and refurbished.',
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10),
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                child: const Text(
                  'Insure your Phone By',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
              ),
              // const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                child: InkWell(
                    child: const Text(
                      'Sign-Up Now',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        )),
              )
            ],
          ),
          // const SizedBox(height: 20),
          // Container(
          //   margin: const EdgeInsets.all(40),
          //   alignment: Alignment.center,
          //   child: MaterialButton(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     color: const Color.fromRGBO(109, 21, 23, 1),
          //     // textColor: Colors.white,
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Register()),
          //       );
          //     },
          //     child: const Text(
          //       'Sign Up',
          //       style: TextStyle(fontSize: 20.0),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
