import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/apis/auth_api.dart';
import 'package:twitter_clone_v1/core/utils.dart';
import 'package:twitter_clone_v1/features/auth/views/login_view.dart';
import 'package:twitter_clone_v1/features/home/home_view.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authAPI = ref.read(authAPIProvider);
  return AuthController(authAPI: authAPI);
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<User?> currentUser() => _authAPI.currentUserAccount();

  ///let assume state = isLoading
  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    var res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(
        context: context,
        content: l.message,
      ),
      (r) {
        showSnackBar(
            context: context, content: 'Account created! Please login.');
        Navigator.push(context, LoginView.route());
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    var res = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(
        context: context,
        content: l.message,
      ),
      (r) {
        Navigator.push(context, HomeView.route());
      },
    );
  }
}
