import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protfolio/widget/recent_post_card_widget.dart';
import 'package:protfolio/widget/work_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SingleChildScrollView(
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
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF6366F1).withOpacity(0.05),
                    const Color(0xFF8B5CF6).withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
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

            const SizedBox(height: 80),

            // ===================== SECTION 2 (Recent Posts Header) =====================
            Row(
              children: [
                const Text(
                  "Recent Posts",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextButton(
                    onPressed: () => context.go('/blog'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF6366F1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ===================== SECTION 3 (Posts Cards) =====================
            Row(
              children: const [
                Expanded(
                  child: RecentPostCard(
                    title: "Post Title One",
                    date: "Jan 1, 2025",
                    description:
                        "This is a short description about the post. More text here just to fill the space.",
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: RecentPostCard(
                    title: "Post Title Two",
                    date: "Jan 3, 2025",
                    description:
                        "Another placeholder description. This area will contain your blog summary.",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // ===================== SECTION 4 (Featured Works Header) =====================
            Row(
              children: [
                const Text(
                  "Featured Works",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextButton(
                    onPressed: () => context.go('/works'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF6366F1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Featured Works Preview
            WorkItem(
              onTap: () => context.go('/works'),
              title: "Meals App",
              imageUrl: "assets/images/1.jpeg",
              date: "2025",
              subtitle: "Flutter • Recipes & Meal Management",
              description:
                  "A fully responsive Flutter meals app using flutter_screenutil and google_fonts. Features include go_router navigation, shared_preferences for user settings, and sqflite with path for local recipe storage.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.3),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 90,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 85,
          backgroundImage: const AssetImage("assets/images/d.jpeg"),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mohamed Ahmed",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Computer Science • Flutter Developer",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF6366F1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const SizedBox(
          width: 600,
          child: Text(
            "I am a Flutter Developer and Computer Science graduate. I specialize in building modern, responsive, and high-performance mobile and web applications using Flutter. I enjoy turning ideas into clean, functional, and visually appealing user experiences.",
            style: TextStyle(
              fontSize: 18,
              height: 1.7,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
        const SizedBox(height: 32),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton.icon(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final url = Uri.parse(
                'https://drive.google.com/file/d/1TQRXnH5AbJEAZmvsAlsuy2r1vECROnSK/view?usp=drive_link',
              );
              final canOpen = await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
              if (!canOpen) {
                messenger.showSnackBar(
                  SnackBar(
                    content: const Text('Could not launch resume link'),
                    backgroundColor: Colors.red.shade400,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.download, size: 20),
            label: const Text("Download Resume"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }
}




 // Work items
            // WorkItem(
            //   onTap: () {
            //     context.go('/works');
            //   },
            //   title: "Meals App",
            //   imageUrl: "assets/images/1.jpeg",
            //   date: "2025",
            //   subtitle: "Flutter • Recipes & Meal Management",
            //   description:
            //       "A fully responsive Flutter meals app using flutter_screenutil and google_fonts. Features include go_router navigation, shared_preferences for user settings, and sqflite with path for local recipe storage. The app also integrates onboarding flows and interactive UI elements using dots_indicator and carousel_slider.",
            // ),
            // const SizedBox(height: 20),
            // const WorkItem(
            //   imageUrl:
            //       "assets/images/041fbc18-1b4c-45d6-8a60-943db379779e.JPG",
            //   title: "Mobile App Redesign",
            //   date: "2024",
            //   subtitle: "App / UX Case Study",
            //   description:
            //       "More placeholder text for the second featured work item. Describe your case study or app redesign here.",
            // ),
            // const SizedBox(height: 20),
            // const WorkItem(
            //   imageUrl: "assets/images/1.jpeg",
            //   title: "Landing Page UI",
            //   date: "2023",
            //   subtitle: "Web / Frontend Project",
            //   description:
            //       "Details about this landing page design project. This is only placeholder text for now.",
            // ),