import 'package:flutter/material.dart';
import 'workout_plan.dart';

class RecommendedPlanScreen extends StatelessWidget {
  final String planType;
  final int totalDays;

  const RecommendedPlanScreen({
    super.key,
    required this.planType,
    required this.totalDays,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_graph, size: 80, color: Color(0xFF3C8AFF)),
            const SizedBox(height: 30),

            const Text(
              "Your Personalized Plan",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              "$planType Program",
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF3C8AFF),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              totalDays == 60
                  ? "3 Months • Beginner Friendly"
                  : "6 Months • Safe & Progressive",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E263C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _point("AI-recommended plan"),
                  _point("Adaptive difficulty"),
                  _point("Health-aware workouts"),
                  _point("Progressive overload"),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Start My Plan"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WorkoutPlanScreen(
                        totalDays: totalDays,
                        planType: planType,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _point(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
