import 'package:flutter/material.dart';
import 'package:twitter_clone_v1/constants/constants.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.reusableAppBar(),
      body: const Placeholder(),
    );
  }
}
