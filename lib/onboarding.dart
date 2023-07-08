import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int page = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var onBoardingItems = AppDatabase.onBoardingItems;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Assets.img.background.onboarding.image()),
            Container(
              height: 240,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (value) {},
                      itemCount: onBoardingItems.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Column(
                            children: [
                              Text(
                                onBoardingItems[index].title,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                onBoardingItems[index].description,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(fontSizeFactor: 0.9),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                            effect: const JumpingDotEffect(verticalOffset: 4),
                            controller: _pageController,
                            count: onBoardingItems.length),
                        ElevatedButton(
                          onPressed: () {
                            if (page != onBoardingItems.length - 1) {
                              _pageController.animateToPage(page + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            fixedSize:
                                MaterialStateProperty.all(const Size(88, 60)),
                            iconColor:
                                const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: Icon(page == onBoardingItems.length - 1
                              ? CupertinoIcons.check_mark_circled
                              : CupertinoIcons.arrow_right),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
