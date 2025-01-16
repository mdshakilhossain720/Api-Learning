import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/custom_textfield.dart';
import '../../controllers/auth.dart';
import '../../model/signupcreadential.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomFormWidget(
                  controller: nameController,
                  label: 'name',
                  validator: (val) => validatorWithMessage(
                      message: '${'username'} ${'sRequired'}', value: val),
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormWidget(
                  controller: emailController,
                  label: 'email',
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormWidget(
                  controller: mobileController,
                  label: 'mobile',
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormWidget(
                  controller: newPassController,
                  label: 'password',
                ),
                SizedBox(
                  height: 24,
                ),
                Consumer(builder: (context, ref, _) {
                  return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              var res = await ref
                                  .read(authController.notifier)
                                  .signUp(SignUpCredential(
                                    firstName: nameController.text,
                                    email: emailController.text,
                                    phoneNumber: mobileController.text,
                                    password: newPassController.text,
                                    confirmPassword: newPassController.text,
                                  ));
                              if (res.isSuccess) {
                                Navigator.pop(context);
                              } else {
                                EasyLoading.showError(res.message);
                              }
                            }
                          },
                          child: Text('Sign Up')));
                }),
              ],
            ),
          ),
        ));
  }
}
