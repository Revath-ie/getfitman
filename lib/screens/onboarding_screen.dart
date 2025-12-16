import 'package:flutter/material.dart';
import 'recommended_plan_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();

  String gender = "Male";
  String goal = "Weight Loss";

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController healthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tell us about you"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "This helps us personalize your fitness plan",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 30),

              _inputField("Age", ageController),
              const SizedBox(height: 20),

              _dropdownField(
                label: "Gender",
                value: gender,
                items: ["Male", "Female", "Other"],
                onChanged: (val) => setState(() => gender = val!),
              ),
              const SizedBox(height: 20),

              _inputField("Height (cm)", heightController),
              const SizedBox(height: 20),

              _inputField("Weight (kg)", weightController),
              const SizedBox(height: 20),

              _inputField(
                "Health Conditions (if any)",
                healthController,
                hint: "e.g. knee pain, asthma",
                required: false,
              ),
              const SizedBox(height: 20),

              _dropdownField(
                label: "Main Goal",
                value: goal,
                items: ["Weight Loss", "Weight Gain"],
                onChanged: (val) => setState(() => goal = val!),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HELPERS =================

  Widget _inputField(
    String label,
    TextEditingController controller, {
    String? hint,
    bool required = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: required
          ? (value) {
              if (value == null || value.isEmpty) {
                return "Required";
              }
              return null;
            }
          : null,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }

  Widget _dropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      dropdownColor: const Color(0xFF1E263C),
      decoration: InputDecoration(labelText: label),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final int age = int.parse(ageController.text);
      final double heightCm = double.parse(heightController.text);
      final double weightKg = double.parse(weightController.text);
      final bool hasHealthIssues = healthController.text.isNotEmpty;

      // BMI calculation
      final double heightM = heightCm / 100;
      final double bmi = weightKg / (heightM * heightM);

      // 🧠 SYSTEM DECISION
      String planType = goal; // Weight Loss / Weight Gain
      int totalDays;

      if (age > 45 || hasHealthIssues || bmi >= 28 || bmi < 18.5) {
        totalDays = 120; // 6 months
      } else {
        totalDays = 60; // 3 months
      }

      debugPrint("BMI: $bmi");
      debugPrint("Recommended Plan: $planType - $totalDays days");

      // 🚀 GO TO RECOMMENDED PLAN SCREEN
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              RecommendedPlanScreen(planType: planType, totalDays: totalDays),
        ),
      );
    }
  }
}
