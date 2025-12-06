import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {
  final String title;
  final String date;
  final String subtitle;
  final String description;
  final double? imageHeight;
  final double? imageWidth;

  const WorkItem({
    super.key,
    required this.title,
    required this.date,
    required this.subtitle,
    required this.description,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الصورة فوق الكلام
        Container(
          width: imageWidth ?? double.infinity,
          height: imageHeight ?? 250,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 15),
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text('$subtitle • $date', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
        const SizedBox(height: 10),
        Text(description, style: const TextStyle(fontSize: 16, height: 1.4)),
      ],
    );
  }
}
