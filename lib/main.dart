import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String defaultFontFamily = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('fa'), // Persian
        ],
        locale: const Locale('en'),
        theme: ThemeData(
            snackBarTheme: const SnackBarThemeData(
                backgroundColor: primaryColor,
                contentTextStyle: TextStyle(
                  color: Colors.white,
                )),
            appBarTheme: const AppBarTheme(
                // elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: primaryTextColor),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(const TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            )))),
            colorScheme: const ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: primaryTextColor,
                background: Color(0xffFBFCFF),
                surface: Colors.white,
                onBackground: primaryTextColor),
            textTheme: const TextTheme(
                bodySmall: TextStyle(
                    fontSize: 10,
                    color: Color(0xff0047CC),
                    fontFamily: defaultFontFamily,
                    fontWeight: FontWeight.w600),
                titleMedium: TextStyle(
                    fontFamily: defaultFontFamily,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 18),
                titleLarge: TextStyle(
                    fontFamily: defaultFontFamily,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor),
                headlineMedium: TextStyle(
                    fontFamily: defaultFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: primaryTextColor),
                headlineSmall: TextStyle(
                    fontFamily: defaultFontFamily,
                    fontSize: 20,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w800),
                bodyMedium: TextStyle(
                    fontFamily: defaultFontFamily,
                    color: secondaryTextColor,
                    fontSize: 12),
                displayMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  color: Color(0xff2D4379),
                  fontWeight: FontWeight.w500,
                ))),
        // home: const Stack(
        //   children: [
        //     Positioned.fill(child: HomeScreen()),
        //     Positioned(bottom: 0, left: 0, right: 0, child: NavigationBottom()),
        //   ],
        // ),
        home: const Article());
  }
}

class NavigationBottomItems extends StatelessWidget {
  final String iconName;
  final String titleName;
  final bool isSelected;

  const NavigationBottomItems(
      {super.key,
      required this.iconName,
      required this.titleName,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconName'),
        // Image.asset('${Assets.img.icons}$iconName'),
        const SizedBox(height: 4),
        Text(
          titleName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class NavigationBottom extends StatelessWidget {
  const NavigationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(32, 12, 32, 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NavigationBottomItems(
                          iconName: 'Home.png',
                          isSelected: true,
                          titleName: 'Home'),
                      NavigationBottomItems(
                          iconName: 'Articles.png',
                          isSelected: true,
                          titleName: 'Articles'),
                      SizedBox(width: 16),
                      NavigationBottomItems(
                          iconName: 'Search.png',
                          isSelected: true,
                          titleName: 'Search'),
                      NavigationBottomItems(
                          iconName: 'Menu.png',
                          isSelected: true,
                          titleName: 'Menu'),
                    ]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 2),
                    color: const Color(0xff376AED)),
                child: Assets.img.icons.plus.image(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
