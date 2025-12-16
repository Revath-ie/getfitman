import 'package:flutter/material.dart';
import 'daily_workout_flow.dart';

class WorkoutPlanScreen extends StatelessWidget {
  final int totalDays;
  final String planType;

  const WorkoutPlanScreen({
    super.key,
    required this.totalDays,
    required this.planType,
  });

  // TEMP STATE (later from AppState / Firebase)
  final int completedDays = 14;
  final int streak = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151B29),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "$planType Plan",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topInfoCard(),
          const SizedBox(height: 10),
          _levelsTimeline(context),
        ],
      ),
    );
  }

  // 🔹 TOP INFO
  Widget _topInfoCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E263C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow("Plan", "$planType • $totalDays Days"),
            _infoRow("Streak", "$streak Days 🔥"),
            _infoRow("Remaining", "${totalDays - completedDays} Days"),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        "$label: $value",
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }

  // 🔹 LEVEL BUBBLES
  Widget _levelsTimeline(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: totalDays,
        itemBuilder: (context, index) {
          return _dayBubble(
            context,
            day: index + 1,
            isCompleted: index < completedDays,
            isToday: index == completedDays,
            isLocked: index > completedDays,
          );
        },
      ),
    );
  }

  // 🔹 SINGLE BUBBLE
  Widget _dayBubble(
    BuildContext context, {
    required int day,
    required bool isCompleted,
    required bool isToday,
    required bool isLocked,
  }) {
    Color bgColor;
    Widget content;

    if (isCompleted) {
      bgColor = Colors.green.shade700;
      content = const Icon(Icons.check, color: Colors.white);
    } else if (isToday) {
      bgColor = const Color(0xFF3C8AFF);
      content = Text(
        "$day",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      bgColor = Colors.grey.shade800;
      content = const Icon(Icons.lock, color: Colors.white30);
    }

    return GestureDetector(
      onTap: isToday
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DailyWorkoutFlow()),
              );
            }
          : null,
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
                boxShadow: isToday
                    ? [
                        BoxShadow(
                          color: bgColor.withOpacity(0.6),
                          blurRadius: 12,
                        ),
                      ]
                    : [],
              ),
              child: Center(child: content),
            ),
            const SizedBox(height: 6),
            Text(
              "Day $day",
              style: TextStyle(
                color: isToday ? Colors.white : Colors.white38,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
