import 'package:flutter/material.dart';

class RecentPostCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final double? width;
  final double? height;

  const RecentPostCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 180,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(date, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
