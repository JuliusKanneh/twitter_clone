import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_v1/common/rounded_small_button.dart';
import 'package:twitter_clone_v1/constants/constants.dart';
import 'package:twitter_clone_v1/features/auth/views/login_view.dart';
import 'package:twitter_clone_v1/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone_v1/theme/pallete.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.reusableAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 25),
                AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(label: 'Done'),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: const TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' Login',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              LoginView.route(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
