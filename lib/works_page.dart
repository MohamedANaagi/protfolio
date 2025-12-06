import 'package:flutter/material.dart';
import 'package:protfolio/widget/work_item_widget.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Featured Works",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),

          WorkItem(
            title: "Designing Dashboards",
            date: "2025",
            subtitle: "Dashboard / UI Design",
            description: "This is some placeholder content about the work. Add more details here to describe the project clearly.",
            imageHeight: 500,
            imageWidth: 500,
          ),
          SizedBox(height: 30),
          WorkItem(
            title: "Mobile App Redesign",
            date: "2024",
            subtitle: "App / UX Case Study",
            description: "More placeholder text for the second featured work item. Describe your case study or app redesign here.",
            imageHeight: 500,
            imageWidth: 500,
          ),
          SizedBox(height: 30),
          WorkItem(
            title: "Landing Page UI",
            date: "2023",
            subtitle: "Web / Frontend Project",
            description: "Details about this landing page design project. This is only placeholder text for now.",
            imageHeight: 500,
            imageWidth: 500,
          ),
          SizedBox(height: 30),
          WorkItem(
            title: "E-commerce Platform",
            date: "2022",
            subtitle: "Web / Fullstack Project",
            description: "This is a placeholder for an e-commerce platform project. Explain features and design approach.",
            imageHeight: 500,
            imageWidth: 500,
          ),
        ],
      ),
    );
  }
}