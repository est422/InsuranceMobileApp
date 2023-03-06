import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:insurance_app/PhoneInput.dart';
import 'Login.dart';
import 'main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //viewport as margin left
  final PageController _pageViewController =
      PageController(initialPage: 0); // set the initial page you want to show
  int _activePage = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  //indicator handler
  @override
  void initState() {
    //page controller is always listening
    //every pageview is scrolled sideways it will take the index page
    // _pageController.addListener(() {
    //   setState(() {
    //     currentPage = _pageController.page!.toDouble();
    //     print(currentPage);
    //   });
    // });
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
    // _pageController.dispose(); // dispose the PageController
  }

  @override
  Widget build(BuildContext context) {
    // int _activePage = 0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {}
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: height / 1.5,
                  // height: 200,
                  width: width / 1.2,
                  // height: 400         width: width / 1.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/NyalaLogo-1.png"),
                        fit: BoxFit.fill),
                  )),
              Container(
                margin: const EdgeInsets.all(5),
                // alignment: Alignment.center,
                child: const Text('Sign Up and Get Started!',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ),
              // Container(
              //     padding: const EdgeInsets.all(5),
              //     child: InkWell(
              //       child: const Text(
              //         'Get Started',
              //         style: TextStyle(
              //             fontSize: 24.0,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromRGBO(109, 21, 23, 1)),
              //       ),
              //       onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const PhoneInput(),
              //           )),
              //     )),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: const Color.fromRGBO(109, 21, 23, 1),
                      // textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhoneInput(),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        // width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        ),
                      ))),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    child: const Text(
                      'LogIn',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(109, 21, 23, 1)),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        )),
                  ))
            ]),
      ),
    ));
    // return Column(
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     // crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Stack(
    //           // mainAxisAlignment: MainAxisAlignment.center,
    //           // crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(
    //                 height: height,
    //                 width: width,
    //                 // alignment: Alignment.center,
    //                 child: PageView.builder(
    //                   controller: _pageViewController,
    //                   itemCount: _pages.length,
    //                   itemBuilder: (BuildContext context, index) {
    //                     return _pages[index % _pages.length];
    //                   },
    //                 )),
    //             Positioned(
    //                 bottom: 0,
    //                 left: 0,
    //                 right: 0,
    //                 height: 40,
    //                 child: Center(
    //                     child: SmoothPageIndicator(
    //                   controller: _pageViewController,
    //                   count: _pages.length,
    //                   effect: const WormEffect(
    //                     dotHeight: 16,
    //                     dotWidth: 16,
    //                     type: WormType.normal,
    //                     activeDotColor: Color.fromRGBO(109, 21, 23, 1),
    //                     dotColor: Colors.grey,
    //                     // strokeWidth: 5,
    //                   ),
    //                 )))
    //           ])
    //     ]);
    // ),
    // Column(
    // mainAxisAlignment: MainAxisAlignment.end,
    // crossAxisAlignment: CrossAxisAlignment.center,
    // children: [
    // Container(
    // padding: const EdgeInsets.all(10),
    //       child: Center(
    //           child: SmoothPageIndicator(
    //         controller: _pageViewController,
    //         count: _pages.length,
    //         effect: const WormEffect(
    //           dotHeight: 16,
    //           dotWidth: 16,
    //           type: WormType.normal,
    //           activeDotColor: Color.fromRGBO(109, 21, 23, 1),
    //           dotColor: Colors.grey,
    //           // strokeWidth: 5,
    //         ),
    //       )))
    // ])
    // ]);
    // will make use of Stack Widget, so that One Widget can we placed on top
    // body: Stack(
    //   children: [
    //     PageView.builder(
    //         controller: _pageViewController,
    //         onPageChanged: (int index) {
    //           setState(() {
    //             _activePage = index;
    //           });
    //         },
    //         itemCount: _pages.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return _pages[index];
    //         }),
    //     //creating dots at bottom
    //     Positioned(
    //       bottom: 0,
    //       left: 0,
    //       right: 0,
    //       height: 40,
    //       child: Container(
    //         color: Colors.black12,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: List<Widget>.generate(
    //               _pages.length,
    //               (index) => Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 8),
    //                     child: InkWell(
    //                       onTap: () {
    //                         _pageViewController.animateToPage(index,
    //                             duration: const Duration(milliseconds: 300),
    //                             curve: Curves.easeIn);
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 5,
    //                         // check if a dot is connected to the current page
    //                         // if true, give it a different color
    //                         backgroundColor: _activePage == index
    //                             ? const Color.fromRGBO(109, 21, 23, 1)
    //                             : Colors.white30,
    //                       ),
    //                     ),
    //                   )),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }
}
