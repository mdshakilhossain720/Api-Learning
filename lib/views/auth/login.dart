import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/custom_textfield.dart';
import '../../controllers/auth.dart';
import '../homepage/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomFormWidget(
                controller: idController,
                label: 'Email or Phone',
                validator: (val) => validatorWithMessage(
                    message: '${'email or phone'} ${'sRequired'}', value: val),
              ),
              SizedBox(
                height: 16,
              ),
              CustomFormWidget(
                controller: passwordController,
                label: 'password',
              ),
              SizedBox(
                height: 50,
              ),
              Consumer(builder: (context, ref, _) {
                return SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print('login screen');
                        var res =
                            await ref.read(authController.notifier).logins(
                                  contact: idController.text,
                                  password: passwordController.text,
                                );
                        if (res.isSuccess) {
                          EasyLoading.showSuccess(res.message);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        } else {
                          EasyLoading.showError('login fail');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow, // Set the background color to yellow
                      foregroundColor: Colors.black, // Set the text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Optional padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Optional rounded corners
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
