import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              _buildPageIndicator(
                text: "Meet your coach, \nstart your journey",
                imageAsset: 'assets/onboardingImages/img_background_1.png',
                size: size,
              ),
              _buildPageIndicator(
                text: "Create a workout plan \nto stay fit",
                imageAsset: 'assets/onboardingImages/img_background_2.png',
                size: size,
              ),
              _buildPageIndicator(
                text: "Action is the \nkey to all success",
                imageAsset: 'assets/onboardingImages/img_background_3.png',
                size: size,
              ),
            ],
          ),
          isLastPage
              ? const SizedBox.shrink()
              : Positioned(
                  top: size.height * 0.05,
                  right: size.width * 0.01,
                  child: TextButton(
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: const Text(
                      'skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          Positioned(
              bottom: size.height * 0.03,
              left: size.width * 0.42,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.grey,
                  activeDotColor: Color.fromRGBO(208, 253, 62, 1),
                ),
              ))
        ],
      ),
    );
  }
}

Widget _buildPageIndicator(
    {required String text, required String imageAsset, required var size}) {
  return Stack(
    children: [
      Image.asset(
        imageAsset,
        height: size.height * 0.6,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 0,
        child: Container(
          height: size.height * 0.4,
          width: size.width,
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ],
  );
}
