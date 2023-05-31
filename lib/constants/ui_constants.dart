import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone_v1/constants/constants.dart';
import 'package:twitter_clone_v1/theme/theme.dart';

class UIConstants {
  static reusableAppBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        width: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTapBarPages = [
    Text('News Feed Screen'),
    Text('Search Screen'),
    Text('Notification Screen'),
  ];
}
