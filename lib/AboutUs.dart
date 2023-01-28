import 'package:flutter/material.dart';
import 'Register.dart';
import 'Login.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                'Welcome To Nyala Mobile Insurance!',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10.0),
              child: const Text(
                'Nyala Insurance S. C. (NISCO) was established in 1995 pursuant to the enactment of the Insurance Business Licensing and Supervision Proclamation 85/1994 to engage in general insurance business with a subscribed capital of Birr 25 million and paid-up capital of Birr 7 million. Over the course of time NISCO continued to expand its service offerings, distribution channel, and financial capacity. Accordingly, NISCO resumed Life insurance business in August 2005 and Micro-insurance service in 2007.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Currently, NISCO raised its paid up capital to over Birr 600 million and guarantees protection with care to its customers through three pronged services – General Insurance, Long-Term and Micro-insurance solutions with a network of 47 service outlets (33 Service Centers and 14 Contact Offices) distributed all over the country.',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Nyala Insurance is one of the leading private insurance companies in Ethiopia: with strong financial capacity of over Birr 600 million paid up capital professional workforce over 25 years of experience in insurance operations Large and increasing customer base, annual turnover and amount of risk covered Recent trends show that NISCO’s sales performance is growing remarkably, in spite of the ever challenging marketing environment the industry has witnessed.',
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
                'Mobile Insurance!',
                style: TextStyle(
                    color: Color.fromRGBO(109, 21, 23, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'What is the first fear you have when you accidentally drop your phone? Fingers crossed, you hope your screen has not cracked or faced any damage, right? Screen damage seems to be one of the most common damages phones face today. Both in Ethiopia and in the rest of the world. That is why, we have created a mobile insurance product that takes care of just that, efficiently! Whether you have an old or new phone and no matter where you are in the county and regardless of who is using your phone. A mobile insurance by Nyala is a one of a kind online mobile insurance policy, that will always have your back, cover for your phone and ensure your pocket does not face any dents or damages.',
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
