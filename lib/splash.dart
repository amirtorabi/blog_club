import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.fill)),
          Center(
            child: Assets.img.icons.logo.svg(width: 100),
          )
        ],
      ),
    );
  }
}
