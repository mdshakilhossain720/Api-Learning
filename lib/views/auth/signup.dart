import 'package:flutter/material.dart';

import '../../common/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 12,
              ),
              CustomFormWidget(
                controller: TextEditingController(),
                label: 'password',
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
            ],
          ),
        ));
  }
}
