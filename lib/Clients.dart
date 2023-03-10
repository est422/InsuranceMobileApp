import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insurance_app/BottomNavigation.dart';
import 'package:insurance_app/ClientDetail.dart';
import 'package:insurance_app/models/User.dart';

import 'DrawerNavigationMenu.dart';

// class User {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String phone;
//   final String? email;
//   final String? device;
//   final String? model;
//   final String? createdAt;
//   final int? handsetCost;
//   final String? handsetId;
//   final int? iMEI1;
//   final int? iMEI2;
//   final String? serialNo;
//   final String? platform;
//   final String? hardWare;
//   final int? enteredAmount;
//   final String? selectedPlan;
//   final String? imageUrl;

//   const User(
//       {required this.id,
//       required this.firstName,
//       required this.lastName,
//       required this.phone,
//       required this.email,
//       required this.device,
//       required this.model,
//       required this.createdAt,
//       required this.handsetCost,
//       required this.handsetId,
//       required this.iMEI1,
//       required this.iMEI2,
//       required this.serialNo,
//       required this.platform,
//       required this.hardWare,
//       required this.enteredAmount,
//       required this.selectedPlan,
//       required this.imageUrl});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       firstName: json['FirstName'],
//       lastName: json['LastName'],
//       phone: json['Phone'],
//       email: json['Email'],
//       device: json['Device'],
//       model: json['Model'],
//       createdAt: json['CreatedAt'],
//       handsetCost: json['HandsetCost'],
//       handsetId: json['HandsetId'],
//       iMEI1: json['IMEI1'],
//       iMEI2: json['IMEI2'],
//       serialNo: json['SerialNo'],
//       platform: json['Platform'],
//       hardWare: json['HardWare'],
//       enteredAmount: json['EnteredAmount'],
//       selectedPlan: json['SelectedPlan'],
//       imageUrl: json['ImageUrl'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['FirstName'] = firstName;
//     data['LastName'] = lastName;
//     data['Phone'] = phone;
//     data['Email'] = email;
//     data['Device'] = device;
//     data['Model'] = model;
//     data['CreatedAt'] = createdAt;
//     data['HandsetCost'] = handsetCost;
//     data['HandsetId'] = handsetId;
//     data['IMEI1'] = iMEI1;
//     data['IMEI2'] = iMEI2;
//     data['SerialNo'] = serialNo;
//     data['Platform'] = platform;
//     data['HardWare'] = hardWare;
//     data['EnteredAmount'] = enteredAmount;
//     data['SelectedPlan'] = selectedPlan;
//     data['ImageUrl'] = imageUrl;
//     return data;
//   }
// }

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() {
    return _ClientsState();
  }
}

class _ClientsState extends State<Clients> {
//Applying get request.

  Future<List<User>> getAllUsers() async {
    //replace your restFull API here.
    String url = "https://insurancebackendapi-5yi8.onrender.com/api/users/";
    final response = await http.get(Uri.parse(url));

    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }

    //Creating a list to store input data;
    // List<User> users = [];
    // for (var singleUser in responseData) {
    //   User user = User(
    //     id: singleUser['id'],
    //     firstName: singleUser['FirstName'],
    //     lastName: singleUser['LastName'],
    //     phone: singleUser['Phone'],
    //     email: singleUser['Email'],
    //     device: singleUser['Device'],
    //     model: singleUser['Model'],
    //     createdAt: singleUser['CreatedAt'],
    //     handsetCost: singleUser['HandsetCost'],
    //     handsetId: singleUser['HandsetId'],
    //     iMEI1: singleUser['IMEI1'],
    //     iMEI2: singleUser['IMEI2'],
    //     serialNo: singleUser['SerialNo'],
    //     platform: singleUser['Platform'],
    //     hardWare: singleUser['HardWare'],
    //     enteredAmount: singleUser['EnteredAmount'],
    //     selectedPlan: singleUser['SelectedPlan'],
    //     imageUrl: singleUser['ImageUrl'],
    //   );

    //   //Adding user to the list.
    //   users.add(user);
    // }
    // return users;
  }

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Clients'),
      ),
      endDrawer: const DrawerNavigationMenu(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 400,
          child: FutureBuilder(
            future: getAllUsers(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Container(
                    alignment: Alignment.center,
                    // width: 300,
                    child: Card(
                        child: Column(children: [
                      Stack(children: [
                        SizedBox(
                            height: 500,
                            child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    title: Container(
                                        // padding: const EdgeInsets.all(10.0),
                                        child: Row(children: [
                                      Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text(
                                            'Name:',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                      Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            snapshot.data[index].firstName,
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ))
                                    ])),
                                    subtitle: Row(children: [
                                      Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text(
                                            'Phone Number:',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                      Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            snapshot.data[index].phone,
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ))
                                    ]),
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ClientDetail(),
                                            settings: RouteSettings(arguments: {
                                              "firstName": snapshot
                                                  .data[index].firstName,
                                              "lastName":
                                                  snapshot.data[index].lastName,
                                              "phone":
                                                  snapshot.data[index].phone,
                                              "email":
                                                  snapshot.data[index].email,
                                              "device":
                                                  snapshot.data[index].device,
                                              "model":
                                                  snapshot.data[index].model,
                                              "createdAt": snapshot
                                                  .data[index].createdAt,
                                              "handsetCost": snapshot
                                                  .data[index].handsetCost,
                                              "handsetId": snapshot
                                                  .data[index].handsetId,
                                              "iMEI1":
                                                  snapshot.data[index].iMEI1,
                                              "iMEI2":
                                                  snapshot.data[index].iMEI2,
                                              "serialNo":
                                                  snapshot.data[index].serialNo,
                                              "platform":
                                                  snapshot.data[index].platform,
                                              "hardWare":
                                                  snapshot.data[index].hardWare,
                                              "enteredAmount": snapshot
                                                  .data[index].enteredAmount,
                                              "selectedPlan": snapshot
                                                  .data[index].selectedPlan,
                                              "imageUrl":
                                                  snapshot.data[index].imageUrl,
                                              // "password": password,
                                              // "code": code
                                            })),
                                      );
                                    },
                                  )),
                            ))
                      ])
                    ])));
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
