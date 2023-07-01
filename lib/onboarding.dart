import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var onBoardingItems = AppDatabase.onBoardingItems;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Assets.img.background.onboarding.image(),
          )),
          Container(
            height: 324,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {},
                    itemCount: onBoardingItems.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(onBoardingItems[index].title),
                          Text(onBoardingItems[index].description),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        effect: const WormEffect(),
                        controller: _pageController,
                        count: onBoardingItems.length),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
