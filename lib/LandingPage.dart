import 'package:flutter/material.dart';
import 'package:insurance_app/PhoneInput.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'Register.dart';
import 'Login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController =
      PageController(initialPage: 0); // set the initial page you want to show
  int _activePage = 0; // will hold current active page index value
  //Create a List Holding all the Pages
  // final List<Widget> _Pages = [
  //   Page1(),
  //   Page2(),
  //   Page3()
  // ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose(); // dispose the PageController
  }

  @override
  initState() {
    super.initState();
    // selectedPage = 0;
    // _pageController = PageController(initialPage: selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    // int _activePage = 0;
    final List<Widget> _pages = [
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.all(40),
      //         alignment: Alignment.center,
      //         height: 400,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               image:
      //                   AssetImage("assets/images/home_insurance_slider4.jpg"),
      //               fit: BoxFit.fill),
      //         ),
      //         // child: const Text(
      //         //   'Get Insured, Lead a Sustinable Life!',
      //         //   style: TextStyle(
      //         //       fontSize: 20, fontWeight: FontWeight.bold),
      //         // ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         child: const Text(
      //           'Get Insured, Lead a Sustinable Life!',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/home_insurance_slider4.jpg"),
                    fit: BoxFit.fill),
              ),
              // child: const Text(
              //   'Get Insured, Lead a Sustinable Life!',
              //   style: TextStyle(
              //       fontSize: 20, fontWeight: FontWeight.bold),
              // ),
            ),
            Container(
              child: const Text(
                'Insure your Mobile Device!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Sign Up and Get Started!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(109, 21, 23, 1)),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneInput(),
                      )),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(109, 21, 23, 1)),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      )),
                ))
          ]),
    ];

    // this list holds all the pages
    // all of them are constructed in the very end of this file for readability
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _activePage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            }),
        //creating dots at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 40,
          child: Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  _pages.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 5,
                            // check if a dot is connected to the current page
                            // if true, give it a different color
                            backgroundColor: _activePage == index
                                ? Color.fromRGBO(109, 21, 23, 1)
                                : Colors.white30,
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ],
    ));

    // child: Stack(
    //   children: [
    //     // the page view
    //     PageView.builder(
    //       controller: _pageController,
    //       onPageChanged: (int page) {
    //         setState(() {
    //           _activePage = page;
    //         });
    //       },
    //       itemCount: _pages.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return _pages[index % _pages.length];
    //       },
    //     ),
    //     // Display the dots indicator
    //     Positioned(
    //       bottom: 0,
    //       left: 0,
    //       right: 0,
    //       height: 100,
    //       child: Container(
    //         color: Colors.black54,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: List<Widget>.generate(
    //               _pages.length,
    //               (index) => Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 10),
    //                     child: InkWell(
    //                       onTap: () {
    //                         _pageController.animateToPage(index,
    //                             duration: const Duration(milliseconds: 300),
    //                             curve: Curves.easeIn);
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 8,
    //                         // check if a dot is connected to the current page
    //                         // if true, give it a different color
    //                         backgroundColor: _activePage == index
    //                             ? Colors.amber
    //                             : Colors.grey,
    //                       ),
    //                     ),
    //                   )),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // child: Column(
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.all(20),
    //       alignment: Alignment.center,
    //       child: const Text(
    //         'Insure Your Mobile',
    //         style: TextStyle(
    //             color: Color.fromRGBO(109, 21, 23, 1),
    //             fontWeight: FontWeight.bold,
    //             fontSize: 24.0),
    //       ),
    //     ),
    //     MaterialButton(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(12),
    //       ),
    //       color: const Color.fromRGBO(109, 21, 23, 1),
    //       // textColor: Colors.white,
    //       onPressed: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const Register()),
    //         );
    //       },
    //       child: const Text(
    //         'Sign Up',
    //         style: TextStyle(fontSize: 20.0, color: Colors.white),
    //       ),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(10.0),
    //       child: InkWell(
    //           child: const Text(
    //             'Log In',
    //             style: TextStyle(
    //                 fontSize: 24.0,
    //                 fontWeight: FontWeight.bold,
    //                 color: const Color.fromRGBO(109, 21, 23, 1)),
    //           ),
    //           onTap: () => Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => const Login()),
    //               )),
    //     ),
    //     Container(
    //       margin: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
    //       alignment: Alignment.topLeft,
    //       child: const Text(
    //         'Mobile Phone Insurance',
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 10, 10, 10),
    //             fontWeight: FontWeight.bold,
    //             fontSize: 24.0),
    //       ),
    //     ),
    //     Container(
    //       margin: const EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
    //       alignment: Alignment.topLeft,
    //       child: const Text(
    //         'Phone Insurance',
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 10, 10, 10),
    //             fontWeight: FontWeight.bold,
    //             fontSize: 22.0),
    //       ),
    //     ),
    //     Container(
    //       margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
    //       alignment: Alignment.topLeft,
    //       child: const Text(
    //         'Mobile Phone Insurance for Samsung to Iphone and Huawei to OnePlus - and all other brands in between - we cover all the major mobile phone handsets old, new and refurbished.',
    //         style: TextStyle(
    //             color: Color.fromARGB(255, 10, 10, 10),
    //             fontWeight: FontWeight.normal,
    //             fontSize: 24.0),
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
    //           child: const Text(
    //             'Insure your Phone By',
    //             style:
    //                 TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
    //           ),
    //         ),
    //         // const SizedBox(width: 5),
    //         Container(
    //           padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
    //           child: InkWell(
    //               child: const Text(
    //                 'Sign-Up Now',
    //                 style: TextStyle(
    //                     fontSize: 24.0, fontWeight: FontWeight.bold),
    //               ),
    //               onTap: () => Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const Register()),
    //                   )),
    //         )
    //       ],
    //     ),
    //   ],
    // ),
  }
}
