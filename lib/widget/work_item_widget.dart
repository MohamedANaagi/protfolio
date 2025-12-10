import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {
  final String title;
  final String date;
  final String subtitle;
  final String description;
  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final Function()? onTap;

  const WorkItem({
    super.key,
    required this.title,
    required this.date,
    required this.subtitle,
    required this.description,
    this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6366F1),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
              color: Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 24),
          if (imageUrl != null)
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: imageHeight ?? 450,
                width: imageWidth ?? double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 64,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          const SizedBox(height: 40),
          Divider(thickness: 1, color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
