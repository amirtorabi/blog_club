import 'package:blog_club/data.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'gen/assets.gen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    List<PostData> posts = AppDatabase.posts;

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FF),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            backgroundColor: Color(0xffF4F7FF),
            title: Text('Profile'),
            actions: [
              Icon(Icons.more_horiz),
              SizedBox(width: 32),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Container(
                    // width: 295,
                    height: 284,
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1)),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 84,
                              height: 84,
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                border: GradientBoxBorder(
                                  width: 2,
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xff376AED),
                                        Color(0xff49B0E2),
                                        Color(0xff9CECFB),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: Assets.img.stories.story1
                                    .image(width: 40, height: 40),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@joviedan',
                                      style: themeData.textTheme.displayMedium),
                                  const SizedBox(width: 0.0, height: 4),
                                  Text(
                                    'Jovi Daniel',
                                    style: themeData.textTheme.titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: const Color(0xff0D253C)),
                                  ),
                                  const SizedBox(width: 0.0, height: 8),
                                  const Text(
                                    'UX Designer',
                                    style: TextStyle(
                                        fontFamily: FontFamily.avenir,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff376AED)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 0.0, height: 24),
                        Text(
                          'About me',
                          style: themeData.textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 0.0, height: 8),
                        Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: themeData.textTheme.displayMedium,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 96,
                    left: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.2))
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff2151cd)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: themeData.textTheme.headlineSmall!
                                        .apply(
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                  const SizedBox(width: 0.0, height: 4),
                                  Text(
                                    'Post',
                                    style: themeData.textTheme.bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: themeData.textTheme.headlineSmall!
                                      .apply(
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(width: 0.0, height: 4),
                                Text(
                                  'Following',
                                  style: themeData.textTheme.bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5K',
                                  style: themeData.textTheme.headlineSmall!
                                      .apply(
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(width: 0.0, height: 4),
                                Text(
                                  'Followers',
                                  style: themeData.textTheme.bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    color: themeData.colorScheme.surface),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'My Posts',
                              style: themeData.textTheme.titleLarge,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg(),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < posts.length; i++)
                      Post(
                        post: posts[i],
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
