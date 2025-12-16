import 'package:flutter/material.dart';

class FoodNutritionScreen extends StatefulWidget {
  const FoodNutritionScreen({super.key});

  @override
  State<FoodNutritionScreen> createState() => _FoodNutritionScreenState();
}

class _FoodNutritionScreenState extends State<FoodNutritionScreen> {
  // Example goals (later auto-calculated from profile)
  int calorieGoal = 2000;
  int caloriesConsumed = 1200;

  int proteinGoal = 140;
  int carbsGoal = 220;
  int fatGoal = 60;
  int fiberGoal = 30;

  int proteinConsumed = 90;
  int carbsConsumed = 150;
  int fatConsumed = 40;
  int fiberConsumed = 18;

  final List<String> meals = ["Breakfast", "Lunch", "Dinner", "Snacks"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151B29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151B29),
        elevation: 0,
        title: const Text(
          "Food & Nutrition",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("Daily Calories"),
            _calorieCard(),

            const SizedBox(height: 24),

            _sectionTitle("Macros Progress"),
            _macroBar("Protein", proteinConsumed, proteinGoal, Colors.green),
            _macroBar("Carbs", carbsConsumed, carbsGoal, Colors.orange),
            _macroBar("Fat", fatConsumed, fatGoal, Colors.red),
            _macroBar("Fiber", fiberConsumed, fiberGoal, Colors.blue),

            const SizedBox(height: 30),

            _sectionTitle("Meals"),
            ...meals.map((meal) => _mealCard(meal)).toList(),

            const SizedBox(height: 30),

            _sectionTitle("Suggestions"),
            _suggestionCard(
              "High-Protein Snack",
              "Greek yogurt, boiled eggs, or protein shake",
            ),
            _suggestionCard(
              "Healthy Meal",
              "Grilled chicken, brown rice & vegetables",
            ),
          ],
        ),
      ),
    );
  }

  // ================= UI COMPONENTS =================

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _calorieCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2538),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$caloriesConsumed / $calorieGoal kcal",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: caloriesConsumed / calorieGoal,
            backgroundColor: Colors.white12,
            valueColor: const AlwaysStoppedAnimation(Color(0xFF3C8AFF)),
          ),
        ],
      ),
    );
  }

  Widget _macroBar(String name, int consumed, int goal, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$name: $consumed / $goal g",
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: consumed / goal,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ],
      ),
    );
  }

  Widget _mealCard(String meal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2538),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            meal,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white70),
                onPressed: () {
                  // TODO: Food image scanning (ML later)
                },
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Color(0xFF3C8AFF)),
                onPressed: () {
                  // TODO: Manual food entry
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _suggestionCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2538),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF3C8AFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
