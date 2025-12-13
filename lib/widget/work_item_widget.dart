import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkItem extends StatelessWidget {
  final String title;
  final String date;
  final String subtitle;
  final String description;
  final String? imageUrl;
  final String? url;
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
    this.url,
    this.imageHeight,
    this.imageWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasAction = onTap != null || (url != null && url!.isNotEmpty);
    return MouseRegion(
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
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
            SizedBox(
              child: ClickableImage(
                imageUrl: imageUrl!,
                imageHeight: imageHeight,
                imageWidth: imageWidth,
                hasAction: hasAction,
                onTap: () async {
                  if (onTap != null) {
                    onTap!();
                  } else if (url != null && url!.isNotEmpty) {
                    final uri = Uri.parse(url!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  }
                },
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

class ClickableImage extends StatefulWidget {
  final String imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final bool hasAction;
  final VoidCallback onTap;

  const ClickableImage({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    required this.hasAction,
    required this.onTap,
  });

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.hasAction) {
      return Container(
        height: widget.imageHeight ?? 450,
        width: widget.imageWidth ?? double.infinity,
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
            widget.imageUrl,
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
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: widget.imageHeight ?? 600,
              width: widget.imageWidth ?? double.infinity,
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
                  widget.imageUrl,
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
            if (_isHovered)
              Positioned(
                right: 20,
                bottom: 20,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.visibility, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "View Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
