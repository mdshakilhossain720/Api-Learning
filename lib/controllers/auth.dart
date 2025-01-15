import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);

  // Future<CommonResponse> login(
  //     {required String username, required String password}) async {
  //   state = true;
  //   bool isSuccess = false;
  //   try{
  //     final response=await ref.read()
  //   }
  // }
}
