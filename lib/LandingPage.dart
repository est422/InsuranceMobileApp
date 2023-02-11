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
  //viewport as margin left
  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

  //indicator handler
  @override
  void initState() {
    //page controller is always listening
    //every pageview is scrolled sideways it will take the index page
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        print(currentPage);
      });
    });
    super.initState();
  }
  // final PageController _pageController =
  //     PageController(initialPage: 0); // set the initial page you want to show
  // int _activePage = 0; // will hold current active page index value
  // //Create a List Holding all the Pages
  // // final List<Widget> _Pages = [
  // //   Page1(),
  // //   Page2(),
  // //   Page3()
  // // ];

  // @override
  // initState() {
  //   super.initState();
  //   // selectedPage = 0;
  //   // _pageController = PageController(initialPage: selectedPage);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose(); // dispose the PageController
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
    // return Scaffold(
    // body:
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          // height: 200,
          child: PageView(
            //boucingscrollphysics() membuat efek mantul saat discroll ke samping

            physics: BouncingScrollPhysics(),
            controller: _pageController,

            //make pageview scrollable sideways
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(40),
                      alignment: Alignment.center,
                      // height: 400,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/home_insurance_slider4.jpg"),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(25),

          //make dot indicators
          child: Row(
            children: List.generate(
              3,
              (index) {
                return Container(
                  margin: EdgeInsets.only(right: 5),
                  alignment: Alignment.centerLeft,
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? Colors.black : Colors.black12,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
