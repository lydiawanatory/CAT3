import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lydia/pagesScreen/SignUp.dart';
// Import the GradientContainer
// Import the GradientTextField

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgetPasswordPage({super.key});

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );
    } catch (e) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_init_to_null
    var obscureText = null;
    var obscureText2 = obscureText;
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: GradientContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GradientTextField(
                controller: _emailController,
                icon: Icons.email,
                hintText: 'Email', obscureText: obscureText2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetPassword,
                child: const Text('Send Reset Link'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
