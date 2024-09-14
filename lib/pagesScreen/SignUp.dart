// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Import the GradientContainer
// Import the GradientTextField

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpPage({super.key});

  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      } // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    var obscureText;
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: GradientContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GradientTextField(
                controller: _emailController,
                icon: Icons.email,
                hintText: 'Email', obscureText: obscureText,
              ),
              const SizedBox(height: 20),
              GradientTextField(
                controller: _passwordController,
                icon: Icons.lock,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
GradientTextField(
    {required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required Object obscureText}) {}

// ignore: non_constant_identifier_names
GradientContainer({required Padding child}) {}

class FirebaseAuth {
  // ignore: duplicate_ignore
  // ignore: prefer_typing_uninitialized_variables
  static var instance;
}
