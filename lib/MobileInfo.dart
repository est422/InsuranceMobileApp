import 'package:flutter/material.dart';
import 'package:insurance_app/VerifyDevice.dart';
import 'VerifyDevice.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileInfo extends StatefulWidget {
  const MobileInfo({super.key});

  @override
  State<MobileInfo> createState() {
    return _MobileInfoState();
  }
}

final Uri _url =
    Uri.parse('https://www.insurance2go.co.uk/your-policy/-claims');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class _MobileInfoState extends State<MobileInfo> {
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
        title: const Text('Insurance Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
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
              margin: const EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
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
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
              alignment: Alignment.topLeft,
              child: const Text(
                'Mobile Phone Insurance for Samsung to Iphone and Huawei to OnePlus - and all other brands in between - we cover all the major mobile phone handsets old, new and refurbished. \n To get started please authenticate your phone details',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromRGBO(109, 21, 23, 1),
                // textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyDevice()),
                  );
                },
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            // const SizedBox(width: 5),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromRGBO(109, 21, 23, 1),
                // textColor: Colors.white,
                onPressed: _launchUrl,
                child: const Text(
                  'Make A Claim',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            )
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
