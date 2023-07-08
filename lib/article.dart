import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Article'),
          actions: const [Icon(Icons.more_horiz), SizedBox(width: 20)]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Assets.img.stories.story1
                      .image(width: 38, height: 38, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Richard Gervain',
                        style: themeData.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 0.0, height: 4),
                      const Text(
                        '2m ago',
                        style: TextStyle(color: Color(0xff7B8BB2)),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        color: const Color(0xff376AED),
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.share)),
                    IconButton(
                        // color: themeData.primaryColor,
                        color: const Color(0xff376AED),
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.bookmark))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
