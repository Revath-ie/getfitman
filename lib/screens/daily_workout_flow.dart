import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'dashboard_screen.dart';
import 'workout_complete_screen.dart';

class DailyWorkoutFlow extends StatelessWidget {
  const DailyWorkoutFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();

    return Scaffold(
      backgroundColor: const Color(0xFF151B29),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Today's Workout"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 1️⃣ Mark workout completed
            appState.completeWorkout();

            // 2️⃣ Go to completion screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WorkoutCompleteScreen()),
            );
          },
          child: const Text("COMPLETE WORKOUT"),
        ),
      ),
    );
  }
}
