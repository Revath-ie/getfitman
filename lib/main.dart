import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const GetFitManApp());
}

class GetFitManApp extends StatelessWidget {
  const GetFitManApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetFitMan',
      theme: ThemeData(
        // The Dark Background Color from the screenshot
        scaffoldBackgroundColor: const Color(0xFF151B29),
        primaryColor: const Color(0xFF3C8AFF),
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3C8AFF),
          secondary: Color(0xFF3C8AFF),
        ),
        // Update inputs to look good on dark background
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1E263C), // Slightly lighter than background
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelStyle: TextStyle(color: Colors.white70),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3C8AFF), // The vivid blue
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Pill shape like screenshot
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}