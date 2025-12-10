import 'package:flutter/material.dart';
import '../controllers/blog_controller.dart';
import '../widget/recent_post_card_widget.dart';

class BlogView extends StatelessWidget {
  final BlogController controller = BlogController();

  BlogView({super.key});

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
          ...controller.allPosts.asMap().entries.map((entry) {
            final index = entry.key;
            final post = entry.value;
            return Column(
              children: [
                RecentPostCard(
                  title: post.title,
                  date: post.date,
                  description: post.description,
                  width: screenWidth - 120,
                  height: 220,
                ),
                if (index < controller.allPosts.length - 1)
                  const SizedBox(height: 30),
              ],
            );
          }),
        ],
      ),
    );
  }
}
