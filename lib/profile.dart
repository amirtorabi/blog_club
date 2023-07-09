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
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FF),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Color(0xffF4F7FF),
                title: Text('Profile'),
                actions: [
                  Icon(Icons.more_horiz),
                  SizedBox(width: 32),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(32).copyWith(top: 16),
                    child: Container(
                      width: 295,
                      height: 284,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Column(
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
