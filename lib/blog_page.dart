import 'package:flutter/material.dart';
import 'package:protfolio/widget/recent_post_card_widget.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

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
            "Blog",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Latest articles and thoughts",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 50),

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
