// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lydia/pagesScreen/SignUp.dart';
// Import the GradientContainer
// Import the GradientTextField

class WelcomePage extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();

  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_init_to_null
    var obscureText = null;
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: GradientContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Our App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              GradientTextField(
                controller: _inputController,
                icon: Icons.input,
                hintText: 'Enter something...', obscureText: obscureText,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Text('Get Started'),
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
