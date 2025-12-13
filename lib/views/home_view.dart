import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controllers/home_controller.dart';
import '../widget/work_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final HomeController controller = HomeController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Blinking animation controller
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _blinkAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    _blinkController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          child: Padding(
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
                // ===================== SECTION 1 (Hero Profile) =====================
                Container(
                  padding: EdgeInsets.all(isMobile ? 24 : 40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF6366F1).withOpacity(0.05),
                        const Color(0xFF8B5CF6).withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            _buildProfileImage(),
                            const SizedBox(height: 30),
                            _buildProfileContent(context),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProfileImage(),
                            const SizedBox(width: 60),
                            Expanded(child: _buildProfileContent(context)),
                          ],
                        ),
                ),

                SizedBox(height: isMobile ? 40 : 80),

                // ===================== SECTION 2 (Featured Works Header) =====================
                Row(
                  children: [
                    Text(
                      "Featured Works",
                      style: TextStyle(
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    const Spacer(),
                    AnimatedBuilder(
                      animation: _blinkAnimation,
                      builder: (context, child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF6366F1,
                                ).withOpacity(_blinkAnimation.value * 0.5),
                                blurRadius: 15 * _blinkAnimation.value,
                                spreadRadius: 3 * _blinkAnimation.value,
                              ),
                            ],
                          ),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: TextButton(
                              onPressed: () => context.go('/works'),
                              style: TextButton.styleFrom(
                                foregroundColor: Color.lerp(
                                  const Color(0xFF6366F1),
                                  const Color(0xFF8B5CF6),
                                  _blinkAnimation.value * 0.3,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 16 : 20,
                                  vertical: isMobile ? 10 : 12,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          color: const Color(0xFF6366F1)
                                              .withOpacity(
                                                _blinkAnimation.value * 0.6,
                                              ),
                                          blurRadius: 8 * _blinkAnimation.value,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 2 : 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: isMobile ? 16 : 18,
                                    color: Color.lerp(
                                      const Color(0xFF6366F1),
                                      const Color(0xFF8B5CF6),
                                      _blinkAnimation.value * 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 20 : 30),

                // Featured Works Preview
                ...controller.featuredWorks.map(
                  (work) => WorkItem(
                    onTap: work.url == null ? () => context.go('/works') : null,
                    title: work.title,
                    imageUrl: work.imageUrl,
                    url: work.url,
                    date: work.date,
                    subtitle: work.subtitle,
                    description: work.description,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final radius = isMobile ? 60.0 : 90.0;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.3),
          width: isMobile ? 3 : 4,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.2),
            blurRadius: isMobile ? 15 : 20,
            spreadRadius: isMobile ? 3 : 5,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius - 5,
          backgroundImage: AssetImage(controller.profile.imagePath),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.profile.name,
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 6 : 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            controller.profile.title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: const Color(0xFF6366F1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            controller.profile.description,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.7,
              color: const Color(0xFF4B5563),
            ),
          ),
        ),
        const SizedBox(height: 32),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton.icon(
            onPressed: () => controller.downloadResume(context),
            icon: Icon(Icons.download, size: isMobile ? 18 : 20),
            label: const Text("Download Resume"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 32,
                vertical: isMobile ? 14 : 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
