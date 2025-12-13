import 'package:flutter/material.dart';
import '../controllers/blog_controller.dart';
import '../widget/recent_post_card_widget.dart';

class BlogView extends StatelessWidget {
  final BlogController controller = BlogController();

  BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 1200
            ? 120.0
            : screenWidth > 768
            ? 60.0
            : 24.0,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Blog",
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Latest articles and thoughts",
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),
          ...controller.allPosts.asMap().entries.map((entry) {
            final index = entry.key;
            final post = entry.value;
            return Column(
              children: [
                RecentPostCard(
                  title: post.title,
                  date: post.date,
                  description: post.description,
                  width: isMobile
                      ? screenWidth - 48
                      : screenWidth > 1200
                      ? screenWidth - 240
                      : screenWidth - 120,
                  height: isMobile ? 180 : 220,
                ),
                if (index < controller.allPosts.length - 1)
                  SizedBox(height: isMobile ? 20 : 30),
              ],
            );
          }),
        ],
      ),
    );
  }
}
