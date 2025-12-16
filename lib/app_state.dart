import 'package:flutter/material.dart';

enum FitnessGoal { weightLoss, weightGain }

enum PlanDuration { threeMonths, sixMonths }

enum MissedReason { sick, injured, busy, lazy }

class AppState extends ChangeNotifier {
  // ---------- USER SETUP ----------
  FitnessGoal? goal;
  PlanDuration? duration;

  // ---------- PLAN DATA ----------
  int totalLevels = 0;
  int currentLevel = 0; // starts from 0
  int streak = 0;

  // ---------- TIME TRACKING ----------
  DateTime? lastWorkoutDate;

  // ---------- HEALTH FLAGS ----------
  bool recoveryMode = false;

  // ---------- SET PLAN (FROM AI RECOMMENDATION) ----------
  void setPlan({
    required FitnessGoal selectedGoal,
    required PlanDuration selectedDuration,
  }) {
    goal = selectedGoal;
    duration = selectedDuration;

    totalLevels = selectedDuration == PlanDuration.threeMonths ? 60 : 120;
    currentLevel = 0;
    streak = 0;
    recoveryMode = false;

    notifyListeners();
  }

  // ---------- WORKOUT COMPLETION ----------
  void completeWorkout() {
    final today = DateTime.now();

    if (lastWorkoutDate != null &&
        today.difference(lastWorkoutDate!).inDays == 1) {
      streak++;
    } else {
      streak = 1;
    }

    currentLevel++;
    lastWorkoutDate = today;

    notifyListeners();
  }

  // ---------- REST DAY LOGIC ----------
  bool isRestDay() {
    // 5 days workout + 2 days rest
    return streak % 7 == 5 || streak % 7 == 6;
  }

  // ---------- MISSED DAY CHECK ----------
  bool hasMissedWorkout() {
    if (lastWorkoutDate == null) return false;
    return DateTime.now().difference(lastWorkoutDate!).inDays > 1;
  }

  // ---------- HANDLE MISSED REASON ----------
  void handleMissedReason(MissedReason reason) {
    if (reason == MissedReason.sick || reason == MissedReason.injured) {
      recoveryMode = true; // easier workouts
    } else {
      recoveryMode = false;
    }

    notifyListeners();
  }

  // ---------- CURRENT DIFFICULTY ----------
  String get difficulty {
    if (recoveryMode) return "Easy";
    if (currentLevel < totalLevels / 3) return "Easy";
    if (currentLevel < (2 * totalLevels / 3)) return "Medium";
    return "Hard";
  }
}
