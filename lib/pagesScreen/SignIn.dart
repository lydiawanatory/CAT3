import 'package:flutter/material.dart';
import 'package:lydia/pagesScreen/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lydia/pagesScreen/firebase_auth.dart';
// Import the GradientContainer
// Import the GradientTextField

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({super.key});

  Future<void> _signIn() async {
    try {
      await firebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var obscureText;
    var obscureText2 = obscureText;
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
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
              GradientTextField(
                controller: _passwordController,
                icon: Icons.lock,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signIn,
                child: const Text('Sign In'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forget-password');
                },
                child: const Text('Forgot Password?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
