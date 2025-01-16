import 'package:apilearning/services/base_serives/auth.dart';
import 'package:apilearning/utils/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/api_contsant.dart';
import '../../model/signupcreadential.dart';

class AuthService extends Auth {
  final Ref ref;
  AuthService(this.ref);
  @override
  Future<Response> login(
      {required String contact, required String password}) async {
    final response =
        await ref.read(apiClinetProvider).post(AppConstants.loginUrl, data: {
      contact.contains('@') ? 'email' : 'phone': contact,
      'password': password,
    });
    return response;
  }

  @override
  Future<Response> registration(
      {required SignUpCredential signUpCredential}) async {
    final response = await ref.read(apiClinetProvider).post(
          AppConstants.register,
          data: signUpCredential.toMap(),
        );
    return response;
  }
}

final authServiceProvider = Provider((ref) => AuthService(ref));
