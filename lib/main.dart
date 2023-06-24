import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
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
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
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
            bodyMedium: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12)),
      ),
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
                  Text('Hi, Amir!', style: myTheme.textTheme.titleMedium),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
              child: Text(
                'Explore today’s',
                style: myTheme.textTheme.headlineMedium,
              ),
            ),
            _StoryList(stories: stories, myTheme: myTheme)
          ],
        )),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
    required this.myTheme,
  });

  final List<StoryData> stories;
  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 92,
      child: ListView.builder(
        itemCount: stories.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(
            32, 0, 32, 0), //padding az chap & rast asli
        itemBuilder: (context, index) {
          final story = stories[index];

          //sakhte har kodom az ajzaye list
          return _Story(story: story, myTheme: myTheme);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {○
  const _Story({
    super.key,
    required this.story,
    required this.myTheme,
  });

  final StoryData story;
  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 100,
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _viewedProfileImage() : _normalProfileImage(),
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
          const SizedBox(height: 8),
          Text(
            story.name,
            style: myTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _normalProfileImage() {
    return Container(
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
      child: _profileImage(),
    );
  }

  Widget _viewedProfileImage() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: const [8, 3],
        radius: const Radius.circular(20),
        color: const Color(0xff7B8BB2),
        padding: const EdgeInsets.all(7),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/img/stories/${story.imageFileName}',
          width: 54,
          height: 54,
        ));
  }
}
