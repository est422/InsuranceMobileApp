import 'package:flutter/material.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        // decoration: const BoxDecoration(color: Colors.white),
        child: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: const Text(
            'Its easy',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 42,
              color: Color.fromRGBO(109, 21, 23, 1),
            ),
          ),
        ),
      ),
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/insurance2-number1.png',
              height: 50,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: const Text(
              'Sign Up',
              style: TextStyle(
                  color: Color.fromRGBO(109, 21, 23, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: const Text(
          'Leave your contact information',
          style: TextStyle(
              color: Color.fromRGBO(109, 21, 23, 1),
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/insurance2-number2.png',
              height: 50,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            alignment: Alignment.topLeft,
            child: const Text(
              'Register Your Phone',
              style: TextStyle(
                  color: Color.fromRGBO(109, 21, 23, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: const Text(
          'Automatic Register Your Phone',
          style: TextStyle(
              color: Color.fromRGBO(109, 21, 23, 1),
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/unsurance2-number3.png',
              height: 50,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            alignment: Alignment.topLeft,
            child: const Text(
              'Check Your Phone Hardware',
              style: TextStyle(
                  color: Color.fromRGBO(109, 21, 23, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: const Text(
          'Check your Phone Hardware',
          style: TextStyle(
              color: Color.fromRGBO(109, 21, 23, 1),
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
    ]));
  }
}
