import 'package:flutter/material.dart';
import 'package:insurance_app/AboutUs.dart';
import 'package:insurance_app/ContactUs.dart';
import 'package:insurance_app/Policy.dart';
import 'package:insurance_app/Register.dart';
import 'mainSection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LandingPage.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: Image.asset('assets/images/insurance2.png', fit: BoxFit.cover),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const ListTile(
                // leading: Icon(Icons.message),
                title: Text('Home'),
              ),
              ListTile(
                // leading: Icon(Icons.account_circle),
                title: const Text('About Us'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: const Text('Policy'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Policy()),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: const Text('Contact Us'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUs()),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: const Text('Sign Up'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              LandingPage(),
              // SizedBox(height: 10),
              MainSection(),
            ],
          ),
        ));
  }
}
