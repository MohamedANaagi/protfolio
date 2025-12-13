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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return MouseRegion(
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 12,
                  vertical: isMobile ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6366F1),
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Flexible(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              height: 1.7,
              color: const Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: isMobile ? 20 : 24),
          if (imageUrl != null)
            SizedBox(
              child: ClickableImage(
                imageUrl: imageUrl!,
                imageHeight: isMobile
                    ? (imageHeight ?? 300) * 0.7
                    : imageHeight,
                imageWidth: imageWidth,
                hasAction: hasAction,
                isMobile: isMobile,
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
          SizedBox(height: isMobile ? 30 : 40),
          Divider(thickness: 1, color: Colors.grey.shade200, height: 1),
          SizedBox(height: isMobile ? 30 : 40),
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
  final bool isMobile;
  final VoidCallback onTap;

  const ClickableImage({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    required this.hasAction,
    this.isMobile = false,
    required this.onTap,
  });

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.isMobile ? 12.0 : 20.0;

    if (!widget.hasAction) {
      return Container(
        height: widget.imageHeight ?? (widget.isMobile ? 300 : 450),
        width: widget.imageWidth ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: widget.isMobile ? 15 : 20,
              offset: Offset(0, widget.isMobile ? 5 : 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade200,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: widget.isMobile ? 48 : 64,
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
              height: widget.imageHeight ?? (widget.isMobile ? 400 : 600),
              width: widget.imageWidth ?? double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: widget.isMobile ? 15 : 20,
                    offset: Offset(0, widget.isMobile ? 5 : 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: widget.isMobile ? 48 : 64,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (_isHovered && !widget.isMobile)
              Positioned(
                right: widget.isMobile ? 12 : 20,
                bottom: widget.isMobile ? 12 : 20,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isMobile ? 16 : 20,
                    vertical: widget.isMobile ? 10 : 12,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.visibility,
                        color: Colors.white,
                        size: widget.isMobile ? 18 : 20,
                      ),
                      SizedBox(width: widget.isMobile ? 6 : 8),
                      Text(
                        "View Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.isMobile ? 14 : 16,
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
