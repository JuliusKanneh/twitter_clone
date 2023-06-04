import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/common/common.dart';
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
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(currentUserDetailsProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "",
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
