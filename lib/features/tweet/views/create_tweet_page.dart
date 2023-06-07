import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone_v1/common/common.dart';
import 'package:twitter_clone_v1/constants/asset_constants.dart';
import 'package:twitter_clone_v1/core/utils.dart';
import 'package:twitter_clone_v1/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone_v1/theme/pallete.dart';

class TweetView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const TweetView(),
      );
  const TweetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TweetViewState();
}

class _TweetViewState extends ConsumerState<TweetView> {
  List<File> images = [];
  TextEditingController tweetTextController = TextEditingController();

  @override
  void dispose() {
    tweetTextController.dispose();
    super.dispose();
  }

  void onPickImages() async {
    images = await pickImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return currentUser == null
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
              actions: [
                RoundedSmallButton(
                  label: 'Tweet',
                  backgroundColor: Pallete.blueColor,
                  textColor: Pallete.whiteColor,
                  onTap: () {},
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            currentUser.profilePic,
                          ),
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: tweetTextController,
                            decoration: const InputDecoration(
                              hintText: "What's happening?",
                              hintStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 22,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                    if (images.isNotEmpty)
                      CarouselSlider(
                        items: images.map((file) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Image.file(file),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 400,
                          enableInfiniteScroll: false,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.3, color: Pallete.greyColor),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      right: 15,
                      left: 15,
                    ),
                    child: GestureDetector(
                        onTap: onPickImages,
                        child: SvgPicture.asset(AssetsConstants.galleryIcon)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      right: 15,
                      left: 15,
                    ),
                    child: SvgPicture.asset(AssetsConstants.gifIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      right: 15,
                      left: 15,
                    ),
                    child: SvgPicture.asset(AssetsConstants.emojiIcon),
                  ),
                ],
              ),
            ),
          );
  }
}
