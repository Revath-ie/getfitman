import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart'; // Navigates to Home (Landing) first

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00548F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "GetFitMan",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w900, // Very bold
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}