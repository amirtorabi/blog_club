import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final categories = AppDatabase.categories;
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
                  Text(
                    'Hi, Amir!',
                    style: myTheme.textTheme.titleMedium,
                  ),
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
            _StoryList(stories: stories, myTheme: myTheme),
            const SizedBox(height: 16),
            const _CategoryList(),
            const PostList(),
            const SizedBox(
              height: 80,
            )
          ],
        )),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return _CategoryItem(
      categories: categories,
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final List<Category> categories;

  const _CategoryItem({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: EdgeInsets.fromLTRB(index == 0 ? 32 : 8, 0,
                index == categories.length - 1 ? 32 : 8, 0),
            child: Stack(
              children: [
                Positioned.fill(
                    top: 100,
                    right: 65,
                    left: 65,
                    bottom: 24,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xaa0D253C),
                          blurRadius: 20,
                        ),
                      ]),
                    )),
                Positioned.fill(
                  child: Container(
                    // width: 236,
                    // height: 400,
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: const LinearGradient(
                          colors: [Color(0xff0D253C), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center),
                      // backgroundBlendMode: BlendMode.color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                          'assets/img/posts/large/${categories[realIndex].imageFileName}',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 48,
                    left: 32,
                    child: Text(
                      categories[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: Colors.white),
                    )),
              ],
            ),
          );
        },
        options: CarouselOptions(
            // height: 700,
            scrollDirection: Axis.horizontal,

            //har item 80% arze safhe ra begirad:
            viewportFraction: 0.8,

            //nesbate tol be arze har item
            aspectRatio: 1.2,

            //by default tamtae item ha ra vasate safhe namayesh midahad k inja man nemikham
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollPhysics: const BouncingScrollPhysics()));
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
      height: 100,
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

class _Story extends StatelessWidget {
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

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(onPressed: () {}, child: const Text('More'))
            ],
          ),
        ),
        ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,

          //height of every single post in list view:
          itemExtent: 141,

          //cahce list view (do cache just in simple and low items list view)
          //dar vaghe miad be tedad kole azaye list view ertefae kol list ro hesab mikone
          //yani bi itemExtent negah mikone mibine andazash 141 hast va kolan 3 ta item dar listview has
          //3*141 mikone mishe ertefaee kole list view. injori tole list view ro moshakhas mikone
          //baraye list haye bozorg khob nist az shrinkWarp estefade konim performance ro payin miare
          shrinkWrap: true,

          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return Post(post: post);
          },
        )
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282FF),
          ),
        ],
      ),
      // height: 149,
      // width: 300,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/img/posts/small/${post.imageFileName}',
                width: 100,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff376AED)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(CupertinoIcons.hand_thumbsup),
                      const SizedBox(width: 4),
                      Text(
                        post.likes,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                      const Icon(CupertinoIcons.clock),
                      Text(
                        post.time,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: post.isBookmarked == true
                            ? const Icon(CupertinoIcons.bookmark_fill)
                            : const Icon(CupertinoIcons.bookmark),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
