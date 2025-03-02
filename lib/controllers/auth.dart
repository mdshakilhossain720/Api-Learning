import 'package:apilearning/model/signupcreadential.dart';
import 'package:apilearning/services/course/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/common/common_response_model.dart';
import '../model/user.dart';

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);

  Future<CommonResponse> logins(
      {required String contact, required String password}) async {
    state = true;
    bool isSuccess = false;
    try {
      final response = await ref
          .read(authServiceProvider)
          .login(contact: contact, password: password);
      state = false;
      if (response.statusCode == 200) {
        isSuccess = true;
        final userInfo = User.fromMap(response.data['data']['user']);
      }
      return CommonResponse(
        isSuccess: isSuccess,
        message: response.data['message'],
      );
    } catch (error) {
      debugPrint(error.toString());
      state = false;
      return CommonResponse(
        isSuccess: isSuccess,
        message: error.toString(),
      );
    } finally {
      state = false;
    }
  }
  // regestration

  Future<CommonResponse> signUp(SignUpCredential signUpCredential) async {
    state = true;
    bool isSuccess = false;
    try {
      final response = await ref
          .read(authServiceProvider)
          .registration(signUpCredential: signUpCredential);
      state = false;
      if (response.statusCode == 201) {
        isSuccess = true;
        final userInfo = User.fromMap(response.data['data']['user']);
        final authToken = response.data['data']['token'];
        //   ref
        //     .read(hiveStorageProvider)
        //     .saveUserInfo(userInfo: userInfo, isGuest: false);
        // ref.read(hiveStorageProvider).saveUserAuthToken(authToken: authToken);
        // ref.read(apiClientProvider).updateToken(token: authToken);
        // ref
        //     .read(apiClientProvider)
        //     .setActiveCode(code: response.data['data']['activation_code']);
      }
      return CommonResponse(
        isSuccess: isSuccess,
        message: response.data['message'],
      );
    } catch (error) {
      debugPrint(error.toString());
      state = false;
      return CommonResponse(
        isSuccess: isSuccess,
        message: error.toString(),
      );
    } finally {
      state = false;
    }
  }
}

final authController = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(ref);
});
