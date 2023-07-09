import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xff376aed),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.onPrimary.withOpacity(0.5),
              ),
            ]),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'flocat action clicked');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(width: 8),
              Text('2.1k',
                  style: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                // floating: true,
                // pinned: true,
                title: Text('Article'),
                actions: [
                  Icon(Icons.more_horiz),
                  SizedBox(width: 20),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          child: Column(
                            children: [
                              Text(
                                'Four Things Every Woman Needs To Know',
                                style: themeData.textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 32),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Assets.img.stories.story1.image(
                                        width: 38,
                                        height: 38,
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Richard Gervain',
                                          style: themeData.textTheme.bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(width: 0.0, height: 4),
                                        const Text(
                                          '2m ago',
                                          style: TextStyle(
                                              color: Color(0xff7B8BB2)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          color: const Color(0xff376AED),
                                          onPressed: () {
                                            showSnackBar(
                                                context, 'Icon share clicked!');
                                          },
                                          icon:
                                              const Icon(CupertinoIcons.share)),
                                      IconButton(
                                          // color: themeData.primaryColor,
                                          color: const Color(0xff376AED),
                                          onPressed: () {
                                            showSnackBar(
                                                context, 'Icon save clicked!');
                                          },
                                          icon: const Icon(
                                              CupertinoIcons.bookmark))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          child: Assets.img.background.singlePost!.image(
                            fit: BoxFit.cover,
                            width: screenWidth,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A man’s sexuality is never your mind responsibility.',
                                style: themeData.textTheme.headlineMedium!
                                    .copyWith(fontSize: 18),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                  'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                                  style: themeData.textTheme.bodyMedium,
                                  textAlign: TextAlign.justify),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: (screenHeight / 8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ],
                )),
              ))
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
