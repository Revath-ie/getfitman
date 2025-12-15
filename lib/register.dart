import 'package:flutter/material.dart';
import 'onboarding.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF00548F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              
              const Text(
                "Create your account to start your journey.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 30),

              // NAME
              const TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),

              const SizedBox(height: 20),

              // EMAIL
              const TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                ),
              ),

              const SizedBox(height: 20),

              // PASSWORD
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),

              const SizedBox(height: 40),

              // SIGN UP BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
  // TEMP: After successful registration
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const OnboardingScreen(),
    ),
  );
},

                  child: const Text("SIGN UP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}