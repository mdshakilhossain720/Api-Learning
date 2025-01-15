import 'package:flutter/material.dart';

import '../../common/custom_textfield.dart';

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
        child: Column(
          children: [
            CustomFormWidget(
              controller: idController,
              label: 'Email or Phone',
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
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellow, // Set the background color to yellow
                  foregroundColor: Colors.black, // Set the text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12), // Optional padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Optional rounded corners
                  ),
                ),
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
