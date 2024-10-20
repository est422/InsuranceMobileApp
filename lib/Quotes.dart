import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'TestDevice.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() {
    return _QuotesState();
  }
}

final Uri _url = Uri.parse('https://www.yenepay.com/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class _QuotesState extends State<Quotes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Quotes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
              alignment: Alignment.topLeft,
              child: const Text(
                'Available with leading mobile carriers and providers.',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
              alignment: Alignment.topLeft,
              child: const Text(
                'Looking for the peace of mind that comes with staying connected to your life even when something happens to your phone? Our cell phone insurance plans are available at many carriers and retailers, including those below. \n Please choose your suitable payment plan',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 22.0),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // const ListTile(
                  //   // leading: Icon(Icons.album),
                  //   title: Text(
                  //     'Half Package',
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 10, 10, 10),
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 24.0),
                  //   ),
                  //   subtitle: Text(
                  //     '60.00 ETB per month',
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 10, 10, 10),
                  //         fontWeight: FontWeight.normal,
                  //         fontSize: 20.0),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('SELECT YOUR EXCESS ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.monetization_on, size: 50.0),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color.fromRGBO(109, 21, 23, 1),
                        // textColor: Colors.white,
                        // onPressed: _launchUrl,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestDevice()),
                          );
                        },
                        child: const Text(
                          '25',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.monetization_on, size: 50.0),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color.fromRGBO(109, 21, 23, 1),
                        // textColor: Colors.white,
                        // onPressed: _launchUrl,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TestDevice()),
                          );
                        },
                        child: const Text(
                          '50',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: const Text('CHOOSE YOUR POLICY TERM ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: const Text('MONTHLY',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            Container(
                              child: const Text('60.00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: const Color.fromRGBO(109, 21, 23, 1),
                              // textColor: Colors.white,
                              // onPressed: _launchUrl,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TestDevice()),
                                );
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              child: const Text('ANNUAL',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            Container(
                              child: const Text('120.00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: const Color.fromRGBO(109, 21, 23, 1),
                              // textColor: Colors.white,
                              // onPressed: _launchUrl,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TestDevice()),
                                );
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  Container(
                    child: const Text('WHATS COVERED',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ),
                  Column(
                    children: [
                      Row(children: [
                        const Icon(Icons.check_circle),
                        Container(
                          child: Text('Accidental Damage'),
                        ),
                      ]),
                      Row(children: [
                        const Icon(Icons.check_circle),
                        Container(
                          child: Text('Mechanical Breakdown'),
                        ),
                      ]),
                      Row(children: [
                        const Icon(Icons.check_circle),
                        Container(
                          child: Text('Malicious Damage'),
                        ),
                      ]),
                      Row(children: [
                        const Icon(Icons.check_circle),
                        Container(
                          child: Text('Liquid Damage'),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            // Card(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const ListTile(
            //         // leading: Icon(Icons.album),
            //         title: Text('Full Package',
            //             style: TextStyle(
            //                 color: Color.fromARGB(255, 10, 10, 10),
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 24.0)),
            //         subtitle: Text(
            //           '120.00 ETB per month',
            //           style: TextStyle(
            //               color: Color.fromARGB(255, 10, 10, 10),
            //               fontWeight: FontWeight.normal,
            //               fontSize: 20.0),
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: <Widget>[
            //           MaterialButton(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12),
            //             ),
            //             color: const Color.fromRGBO(109, 21, 23, 1),
            //             // textColor: Colors.white,
            //             // onPressed: _launchUrl,
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const TestDevice()),
            //               );
            //             },
            //             child: const Text(
            //               'Get Started',
            //               style: TextStyle(color: Colors.white, fontSize: 20.0),
            //             ),
            //           ),
            //           const SizedBox(width: 8),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
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
