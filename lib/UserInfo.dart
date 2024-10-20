import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/Category.dart';
import 'package:insurance_app/ChoosePlan.dart';
import 'package:insurance_app/Clients.dart';
import 'package:insurance_app/DrawerNavigationMenu.dart';
import 'package:insurance_app/MobileInfo.dart';
import 'package:insurance_app/TestDevice.dart';
import 'package:insurance_app/main.dart';
import 'package:insurance_app/models/User.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() {
    return _UserInfoState();
  }
}

class _UserInfoState extends State<UserInfo> {
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  late String? auth;
  late bool isLoggedIn = false;
  late bool isLoading = false;
  late int? userAccountId;
  Future<User>? profile;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> _readAccess() async {
    final access = await _storage.read(
        key: 'token',
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    if (access != null) {
      // setState(() {
      //   auth = access;
      //   // fetchUser(auth);
      // });
      String normalizedSource = base64Url.normalize(access.split(".")[1]);
      var result = utf8.decode(base64Url.decode(normalizedSource));
      Map<String, dynamic> tokenDecoded = json.decode(result);
      setState(() {
        isLoggedIn = true;
        userAccountId = tokenDecoded['Id'];
        isLoading = true;
      });
      profile = _getProfile(userAccountId);
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  Future<User> _getProfile(id) async {
    String url =
        'https://insurancebackendapi-5yi8.onrender.com/api/users/user/profile/$id';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      // print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        isLoading = false;
      });
      return User.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Unable to fetch profile from the REST API');
    }
  }

  @override
  void initState() {
    super.initState();
    _readAccess();
    // profile = _getProfile(userAccountId);
  }

  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)!.settings.arguments as Map;

    // final firstName = user["firstName"];
    // final lastName = user["lastName"];
    // final phone = user["phone"];
    // final email = user["email"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
          // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
          title: const Text('User Informaiton'),
        ),
        endDrawer: const DrawerNavigationMenu(),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : FutureBuilder<User>(
                          future: profile,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Center(
                                  child: Column(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/testimonials-placeholder.png"),
                                        radius: 50,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Hi, ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            snapshot.data!.firstName,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])
                                  ],
                                ),
                                Column(children: [
                                  Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                          child: const Text(
                                            'Edit Profile',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    109, 21, 23, 1)),
                                          ),
                                          onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Category(),
                                                ),
                                              )))
                                ]),
                                Card(
                                    shadowColor:
                                        const Color.fromARGB(255, 8, 0, 0),
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                153, 245, 244, 244),
                                            width: 3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(10.0),
                                        child: const Text(
                                          'User Information',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 21, 23, 1)),
                                        ))),
                                Container(
                                    alignment: Alignment.center,
                                    // width: 600,
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Card(
                                      shadowColor:
                                          const Color.fromARGB(255, 8, 0, 0),
                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  153, 245, 244, 244),
                                              width: 3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Column(children: [
                                        ListTile(
                                          title: const Text(
                                            'First Name',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            snapshot.data!.firstName,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'Last Name',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            snapshot.data!.lastName,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'Phone Number',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            snapshot.data!.phone,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                    )),
                                Card(
                                    shadowColor:
                                        const Color.fromARGB(255, 8, 0, 0),
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                153, 245, 244, 244),
                                            width: 3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(10.0),
                                        child: const Text(
                                          'Device Information',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 21, 23, 1)),
                                        ))),
                                Container(
                                    alignment: Alignment.center,
                                    // width: 600,
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Card(
                                        shadowColor:
                                            const Color.fromARGB(255, 8, 0, 0),
                                        shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    153, 245, 244, 244),
                                                width: 3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Column(children: [
                                          ListTile(
                                            title: const Text(
                                              'Device',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.device.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'Model',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.model.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'HandsetCost',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.handsetCost
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'HandsetId',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.handsetId
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'IMEI1',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.iMEI1.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'IMEI2',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.iMEI2.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'HardWare',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.hardWare
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'Platform',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.platform
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'SerialNo',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.serialNo
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'EnteredAmount',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.enteredAmount
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'SelectedPlan',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.selectedPlan
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              'ImageUrl',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              snapshot.data!.imageUrl
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ]))),
                                const SizedBox(height: 10),
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 21, 23, 1)),
                                        ),
                                        onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChoosePlan(),
                                              ),
                                            ))),
                              ]));
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            // By default, show a loading spinner.
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                ]))),
        bottomNavigationBar: const BottomNavigation());
  }
}
