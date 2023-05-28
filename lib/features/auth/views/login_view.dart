import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/common/rounded_small_button.dart';
import 'package:twitter_clone_v1/constants/constants.dart';
import 'package:twitter_clone_v1/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone_v1/features/auth/views/signup_view.dart';
import 'package:twitter_clone_v1/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone_v1/theme/pallete.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );

  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLogin() {
    ///note: read() is used when calling functions.
    ///use .notifier to have access to the instance of provider so that u can all methods of that provider.
    ///this is only applicable to StateNotifierProvider.
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.reusableAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(31),
            child: Column(
              children: [
                AuthField(controller: emailController, hintText: 'Email'),
                const SizedBox(height: 25),
                AuthField(controller: passwordController, hintText: 'Password'),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    label: 'Done',
                    onTap: onLogin,
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Pallete.blueColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                SignUpView.route(),
                              );
                            },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
