import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background is set in main.dart, but we can enforce it here too
      backgroundColor: const Color(0xFF151B29),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // 1. TOP TEXT
            const Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 5),

            // 2. LOGO TEXT
            const Text(
              "GetFitMan",
              style: TextStyle(
                color: Color(0xFF3C8AFF), // The exact blue
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 30),

            // 3. MAIN IMAGE AREA (Placeholder for your runner image)


            const SizedBox(height: 30),

            // 4. "Transform to a better you" TEXT
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Transform into a Better You!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 30),

            // 5. SIGN UP BUTTON (Pill Shape)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text("Sign Up For Free"),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 6. LOG IN BUTTON (Text Only)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Color(0xFF3C8AFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Version text
            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.white24, fontSize: 12),
            ),
            
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}