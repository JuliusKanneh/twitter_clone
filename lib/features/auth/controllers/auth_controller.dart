import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/apis/auth_api.dart';
import 'package:twitter_clone_v1/apis/user_api.dart';
import 'package:twitter_clone_v1/core/utils.dart';
import 'package:twitter_clone_v1/features/auth/views/login_view.dart';
import 'package:twitter_clone_v1/features/home/home_view.dart';
import 'package:twitter_clone_v1/models/user_model.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authAPI = ref.read(authAPIProvider);
  final userAPI = ref.read(userAPIProvider);
  return AuthController(authAPI: authAPI, userAPI: userAPI);
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
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
    //create the user data.
    UserModel userModel = UserModel(
      uid: '\$id',
      email: email,
      name: getUsernameFromEmail(email),
      followers: const [],
      followings: const [],
      bio: '',
      profilePic: '',
      bannerPic: '',
      isTwitterBlue: false,
    );

    state = false;
    res.fold(
      (l) => showSnackBar(context: context, content: l.message),
      (r) async {
        var res2 = await _userAPI.saveUserData(userModel);
        res2.fold(
          (l) {
            showSnackBar(context: context, content: l.message);
          },
          (r) {
            showSnackBar(
                context: context, content: 'Account created! Please login.');
            Navigator.push(context, LoginView.route());
          },
        );
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
