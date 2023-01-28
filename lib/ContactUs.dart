import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Phone',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                '138 343 232.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Fax',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                '224 532 111.',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Email',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'noreply@envato.com.',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Working hours',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Monday - Friday \n 800 - 1700',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Saturday \n 900 - 1300',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Address',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Office',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text(
                'Envato \n Level 13, 2 \n Elizabeth Victoria 3000 \n Australia',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
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
