import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/common/loading_page.dart';
import 'package:twitter_clone_v1/common/rounded_small_button.dart';
import 'package:twitter_clone_v1/constants/constants.dart';
import 'package:twitter_clone_v1/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone_v1/features/auth/views/login_view.dart';
import 'package:twitter_clone_v1/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone_v1/theme/pallete.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ///note: read() is used when calling functions.
    ///use .notifier to have access to the instance of provider so that u can all methods of that provider.
    ///this is only applicable to StateNotifierProvider.
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  // isLoading() {
  //   return ref.watch(authControllerProvider);
  // }

  @override
  Widget build(BuildContext context) {
    isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: UIConstants.reusableAppBar(),
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31),
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
                      Align(
                        alignment: Alignment.topRight,
                        child: RoundedSmallButton(
                          label: 'Done',
                          onTap: onSignUp,
                        ),
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
