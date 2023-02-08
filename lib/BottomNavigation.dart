import 'package:flutter/material.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/UserProfile.dart';
import 'package:insurance_app/main.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Clients()));
              break;
          }
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
    );
  }
}
