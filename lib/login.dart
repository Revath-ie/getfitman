import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Explicitly setting background to avoid confusion
      backgroundColor: const Color(0xFF151B29),
      
      appBar: AppBar(
        title: const Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, 
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), 
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // EMAIL
            TextField(
              style: const TextStyle(color: Colors.white), 
              decoration: const InputDecoration(
                labelText: "Email Address",
              ),
            ),

            const SizedBox(height: 20),

            // PASSWORD
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 40),

            // LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Auth Logic
                },
                child: const Text("Log In"),
              ),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Color(0xFF3C8AFF)),
              ),
            )
          ],
        ),
      ),
    );
  }
}