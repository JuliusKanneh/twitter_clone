import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/apis/auth_api.dart';
import 'package:twitter_clone_v1/core/utils.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authAPI = ref.read(authAPIProvider);
  return AuthController(authAPI: authAPI);
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

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
        (r) => print(r.email));
  }
}
