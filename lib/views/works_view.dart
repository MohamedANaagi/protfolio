import 'package:flutter/material.dart';
import '../controllers/works_controller.dart';
import '../widget/work_item_widget.dart';

class WorksView extends StatelessWidget {
  final WorksController controller = WorksController();

  WorksView({super.key});

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
            "Featured Works",
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "A selection of my recent projects",
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),
          ...controller.allWorks.map(
            (work) => WorkItem(
              imageUrl: work.imageUrl,
              url: work.url,
              title: work.title,
              date: work.date,
              subtitle: work.subtitle,
              description: work.description,
            ),
          ),
        ],
      ),
    );
  }
}
