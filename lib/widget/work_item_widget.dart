import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkItem extends StatefulWidget {
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
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _titleColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _titleColorAnimation =
        ColorTween(
          begin: const Color(0xFF1F2937),
          end: const Color(0xFF6366F1),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasAction =
        widget.onTap != null || (widget.url != null && widget.url!.isNotEmpty);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return MouseRegion(
      cursor: hasAction ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 32,
                    fontWeight: FontWeight.bold,
                    color:
                        _titleColorAnimation.value ?? const Color(0xFF1F2937),
                    letterSpacing: -0.5,
                  ),
                  child: Text(widget.title),
                ),
                SizedBox(height: isMobile ? 10 : 14),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 12 : 14,
                        vertical: isMobile ? 5 : 7,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF6366F1).withOpacity(0.15),
                            const Color(0xFF8B5CF6).withOpacity(0.15),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF6366F1).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        widget.date,
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF6366F1),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(width: isMobile ? 10 : 14),
                    Flexible(
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 18 : 24),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(isMobile ? 0 : 4),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 17,
                      height: 1.8,
                      color: const Color(0xFF4B5563),
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 24 : 32),
                if (widget.imageUrl != null)
                  ClickableImage(
                    imageUrl: widget.imageUrl!,
                    imageHeight: isMobile
                        ? (widget.imageHeight ?? 300) * 0.7
                        : widget.imageHeight,
                    imageWidth: widget.imageWidth,
                    hasAction: hasAction,
                    isMobile: isMobile,
                    isHovered: _isHovered,
                    onTap: () async {
                      if (widget.onTap != null) {
                        widget.onTap!();
                      } else if (widget.url != null && widget.url!.isNotEmpty) {
                        final uri = Uri.parse(widget.url!);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      }
                    },
                  ),
                SizedBox(height: isMobile ? 32 : 48),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                        Colors.grey.shade200,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 32 : 48),
              ],
            ),
          );
        },
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
  final bool isHovered;
  final VoidCallback onTap;

  const ClickableImage({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    required this.hasAction,
    this.isMobile = false,
    this.isHovered = false,
    required this.onTap,
  });

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _overlayAnimation;
  late Animation<double> _shadowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
    _overlayAnimation = Tween<double>(begin: 0.0, end: 0.3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _shadowAnimation = Tween<double>(begin: 0.1, end: 0.25).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(ClickableImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHovered != oldWidget.isHovered && !widget.isMobile) {
      if (widget.isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.isMobile ? 16.0 : 24.0;
    final imageHeight = widget.imageHeight ?? (widget.isMobile ? 350 : 600);

    if (!widget.hasAction) {
      return Container(
        height: imageHeight,
        width: widget.imageWidth ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: widget.isMobile ? 20 : 30,
              offset: Offset(0, widget.isMobile ? 8 : 12),
              spreadRadius: 0,
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
      onEnter: (_) {
        if (!widget.isMobile) {
          setState(() => _isHovered = true);
          _animationController.forward();
        }
      },
      onExit: (_) {
        if (!widget.isMobile) {
          setState(() => _isHovered = false);
          _animationController.reverse();
        }
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                height: imageHeight,
                width: widget.imageWidth ?? double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_shadowAnimation.value),
                      blurRadius: widget.isMobile ? 25 : 40,
                      offset: Offset(0, widget.isMobile ? 10 : 16),
                      spreadRadius: widget.isMobile ? 0 : 2,
                    ),
                    BoxShadow(
                      color: const Color(
                        0xFF6366F1,
                      ).withOpacity(_overlayAnimation.value * 0.3),
                      blurRadius: widget.isMobile ? 30 : 50,
                      offset: Offset(0, widget.isMobile ? 12 : 18),
                      spreadRadius: widget.isMobile ? 2 : 4,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
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
                      // Gradient overlay on hover
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(_overlayAnimation.value),
                            ],
                          ),
                        ),
                      ),
                      // View button
                      if (_isHovered && !widget.isMobile)
                        Positioned(
                          right: 24,
                          bottom: 24,
                          child: FadeTransition(
                            opacity: _animationController,
                            child: ScaleTransition(
                              scale: _animationController,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF6366F1),
                                      Color(0xFF8B5CF6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF6366F1,
                                      ).withOpacity(0.4),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "View Project",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
