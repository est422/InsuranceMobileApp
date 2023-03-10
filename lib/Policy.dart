import 'package:flutter/material.dart';
import 'package:insurance_app/BottomNavigation.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(109, 21, 23, 1),
        // iconTheme: const IconThemeData(color: Color.fromRGBO(109, 21, 23, 1)),
        title: const Text('Policy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                shadowColor: const Color.fromARGB(255, 8, 0, 0),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(153, 245, 244, 244), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const Text(
                    'Travel insurance',
                    style: TextStyle(
                        color: Color.fromRGBO(109, 21, 23, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                )),
            Card(
              shadowColor: const Color.fromARGB(255, 8, 0, 0),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(153, 245, 244, 244), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Ut ultricies imperdiet sodales. Aliquam fringilla aliquam ex sit amet elementum. Proin bibendum sollicitudin feugiat. Curabitur ut egestas justo, vitae molestie ante. Integer magna purus, commodo in diam nec, pretium auctor sapien. In pulvinar, ipsum eu dignissim facilisis, massa justo varius purus, non dictum elit nibh ut massa. Nam massa erat, aliquet a rutrum eu, sagittis ac nibh. Pellentesque velit dolor, suscipit in ligula a, suscipit rhoncus dui.',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )),
            ),
            Card(
                shadowColor: const Color.fromARGB(255, 8, 0, 0),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(153, 245, 244, 244), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Life insurance',
                    style: TextStyle(
                        color: Color.fromRGBO(109, 21, 23, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                )),
            Card(
              shadowColor: const Color.fromARGB(255, 8, 0, 0),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(153, 245, 244, 244), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Ut ultricies imperdiet sodales. Aliquam fringilla aliquam ex sit amet elementum. Proin bibendum sollicitudin feugiat. Curabitur ut egestas justo, vitae molestie ante. Integer magna purus, commodo in diam nec, pretium auctor sapien. In pulvinar, ipsum eu dignissim facilisis, massa justo varius purus, non dictum elit nibh ut massa. Nam massa erat, aliquet a rutrum eu, sagittis ac nibh. Pellentesque velit dolor, suscipit in ligula a, suscipit rhoncus dui.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0),
                  )),
            ),
            Card(
                shadowColor: const Color.fromARGB(255, 8, 0, 0),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(153, 245, 244, 244), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Group insurance',
                    style: TextStyle(
                        color: Color.fromRGBO(109, 21, 23, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                )),
            Card(
              shadowColor: const Color.fromARGB(255, 8, 0, 0),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(153, 245, 244, 244), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Ut ultricies imperdiet sodales. Aliquam fringilla aliquam ex sit amet elementum. Proin bibendum sollicitudin feugiat. Curabitur ut egestas justo, vitae molestie ante. Integer magna purus, commodo in diam nec, pretium auctor sapien. In pulvinar, ipsum eu dignissim facilisis, massa justo varius purus, non dictum elit nibh ut massa. Nam massa erat, aliquet a rutrum eu, sagittis ac nibh. Pellentesque velit dolor, suscipit in ligula a, suscipit rhoncus dui.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
