import 'package:flutter/material.dart';
import 'package:flutter_movies_ui/components/custom_outline.dart';
import 'package:flutter_movies_ui/constants.dart';
import 'package:flutter_movies_ui/screens/home_screen.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final pageCount = 3;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              children: List.generate(pageCount, (index) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/Ellipse 1.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.2,
                      right: 0,
                      child: Container(
                        height: 350,
                        width: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/Ellipse 2.png'),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.07,
                          ),
                          CustomOutline(
                            strokeWidth: 4,
                            radius: screenWidth * 0.8,
                            padding: const EdgeInsets.all(4),
                            width: screenWidth * 0.8,
                            height: screenWidth * 0.8,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kPinkColor,
                                  Constants.kPinkColor.withOpacity(0),
                                  Constants.kGreenColor.withOpacity(0.1),
                                  Constants.kGreenColor
                                ],
                                stops: const [
                                  0.2,
                                  0.4,
                                  0.6,
                                  1
                                ]),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomLeft,
                                  image: AssetImage('assets/image 81.png'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.09,
                          ),
                          Text(
                            'Watch movies in\nVirtual Reality',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.kWhiteColor.withOpacity(0.85),
                              fontSize: screenHeight <= 667 ? 18 : 34,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          Text(
                            'Download and watch offline\nwherever you are',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.kWhiteColor.withOpacity(0.75),
                              fontSize: screenHeight <= 667 ? 12 : 16,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          CustomOutline(
                            strokeWidth: 3,
                            radius: 20,
                            padding: const EdgeInsets.all(3),
                            width: 160,
                            height: 38,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kPinkColor,
                                Constants.kGreenColor
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Constants.kPinkColor.withOpacity(0.5),
                                    Constants.kGreenColor.withOpacity(0.5)
                                  ],
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomeScreen();
                                    }),
                                  );
                                }),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Constants.kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PageViewDotIndicator(
                                currentItem: selectedPage,
                                count: pageCount,
                                unselectedColor:
                                    Constants.kWhiteColor.withOpacity(0.1),
                                selectedColor: Constants.kGreenColor,
                                duration: Duration(milliseconds: 200),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
