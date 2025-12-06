import 'package:flutter/material.dart';
import 'package:protfolio/widget/recent_post_card_widget.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Blog",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),

          // List of RecentPostCards
          RecentPostCard(
            title: "Post Title 1",
            date: "Jan 1, 2025",
            description: "This is a placeholder description for post 1.",
            width: screenWidth - 120, // full width minus padding
            height: 220,
          ),
          const SizedBox(height: 30),
          RecentPostCard(
            title: "Post Title 2",
            date: "Jan 3, 2025",
            description: "This is a placeholder description for post 2.",
            width: screenWidth - 120,
            height: 220,
          ),
          const SizedBox(height: 30),
          RecentPostCard(
            title: "Post Title 3",
            date: "Jan 5, 2025",
            description: "This is a placeholder description for post 3.",
            width: screenWidth - 120,
            height: 220,
          ),
          const SizedBox(height: 30),
          RecentPostCard(
            title: "Post Title 4",
            date: "Jan 7, 2025",
            description: "This is a placeholder description for post 4.",
            width: screenWidth - 120,
            height: 220,
          ),
          const SizedBox(height: 30),
          RecentPostCard(
            title: "Post Title 5",
            date: "Jan 9, 2025",
            description: "This is a placeholder description for post 5.",
            width: screenWidth - 120,
            height: 220,
          ),
        ],
      ),
    );
  }
}
