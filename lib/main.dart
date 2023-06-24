import 'package:blog_club/data.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String defaultFontFamily = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryTextColor = Color(0xFF2D4379);
    final Color secondaryTextColor = Color(0xFF0D253C);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          textTheme: TextTheme(
              titleSmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              titleLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: secondaryTextColor)),
          primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    ThemeData myTheme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        //safe Area nazarim chon app bar nadarim miofte zire status bar
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hi, Amir!', style: myTheme.textTheme.titleSmall),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: Text(
                'Explore today’s',
                style: myTheme.textTheme.titleLarge,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 92,
              child: ListView.builder(
                itemCount: stories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(
                    32, 0, 32, 0), //padding az chap & rast asli
                itemBuilder: (context, index) {
                  final story = stories[index];

                  //sakhte har kodom az ajzaye list
                  return Container(
                    width: 68,
                    height: 92,
                    margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: const GradientBoxBorder(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xff376AED),
                                            Color(0xff49B0E2),
                                            Color(0xff9CECFB),
                                          ]),
                                      width: 2)),
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/img/stories/${story.imageFileName}',
                                    width: 54,
                                    height: 54,
                                  )),
                            ),
                            Positioned(
                              //dakhele stack az samte rast cheghad fasele dashte bashe
                              right: 0,
                              bottom: 0,
                              child: Image.asset(
                                'assets/img/icons/${story.iconFileName}',
                                width: 24,
                                height: 24,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(story.name),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
