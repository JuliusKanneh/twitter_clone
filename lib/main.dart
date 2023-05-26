import 'package:flutter/material.dart';
import 'package:twitter_clone_v1/features/auth/views/signup_view.dart';
import 'package:twitter_clone_v1/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: AppTheme.theme,
      home: const SignUpView(),
    );
  }
}
