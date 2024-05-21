import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header
            Image.asset('assets/logo.png'),

            // Form
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Email Field
                  const TextField(
                    decoration: InputDecoration(hintText: 'Email Address'),
                  ),

                  // Password Field
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),

                  // Login/Registration Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Register'),
                      ),
                    ],
                  ),

                  // Forgot Password Link
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ),

            // Google Login/Registration Button
            ElevatedButton.icon(
              onPressed: () async {
                // Implement Google Sign In
              },
              icon: Image.asset('assets/google_logo.png'),
              label: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
