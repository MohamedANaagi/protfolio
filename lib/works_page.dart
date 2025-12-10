import 'package:flutter/material.dart';
import 'package:protfolio/widget/work_item_widget.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 1200
            ? 120.0
            : screenWidth > 768
            ? 60.0
            : 24.0,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Works",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "A selection of my recent projects",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 50),

          const WorkItem(
            imageUrl: "assets/images/1.jpeg",
            title: "Meals App",
            date: "2025",
            subtitle: "Flutter • Recipes & Meal Management",
            description:
                "A fully responsive Flutter meals app using flutter_screenutil and google_fonts. Features include go_router navigation, shared_preferences for user settings, and sqflite with path for local recipe storage. The app also integrates onboarding flows and interactive UI elements using dots_indicator and carousel_slider.",
          ),
          const WorkItem(
            imageUrl: "assets/images/041fbc18-1b4c-45d6-8a60-943db379779e.JPG",
            title: "Mobile App Redesign",
            date: "2024",
            subtitle: "App / UX Case Study",
            description:
                "More placeholder text for the second featured work item. Describe your case study or app redesign here.",
          ),
          const WorkItem(
            imageUrl: "assets/images/1.jpeg",
            title: "Landing Page UI",
            date: "2023",
            subtitle: "Web / Frontend Project",
            description:
                "Details about this landing page design project. This is only placeholder text for now.",
          ),
          const WorkItem(
            title: "E-commerce Platform",
            date: "2022",
            subtitle: "Web / Fullstack Project",
            description:
                "This is a placeholder for an e-commerce platform project. Explain features and design approach.",
            imageUrl: "assets/images/1.jpeg",
          ),
        ],
      ),
    );
  }
}
