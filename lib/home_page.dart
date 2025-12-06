import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protfolio/widget/recent_post_card_widget.dart';
import 'package:protfolio/widget/work_item_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===================== SECTION 1 (Profile) =====================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:  AssetImage("assets/images/d.jpeg"),
                ),
                const SizedBox(width: 60),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Mohamed Ahmed", style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    const Text("Computer Science", style: TextStyle(fontSize: 22, color: Colors.grey)),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 400,
                      child: Text(
                        "I am a Flutter Developer and Computer Science graduate. I specialize in building modern, responsive, and high-performance mobile and web applications using Flutter. I enjoy turning ideas into clean, functional, and visually appealing user experiences.",
                        style: TextStyle(fontSize: 18, height: 1.4),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16)),
                      child: const Text("Download Resume", style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 60),

            // ===================== SECTION 2 (Recent Posts Header) =====================
            Row(
              children: [
                const Text("RecentPosts", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(onPressed: () => context.go('/blog'), child: const Text("View All", style: TextStyle(fontSize: 16))),
              ],
            ),

            const SizedBox(height: 20),

            // ===================== SECTION 3 (Posts Cards) =====================
            Row(
              children: const [
                Expanded(child: RecentPostCard(title: "Post Title One", date: "Jan 1, 2025", description: "This is a short description about the post. More text here just to fill the space.")),
                SizedBox(width: 20),
                Expanded(child: RecentPostCard(title: "Post Title Two", date: "Jan 3, 2025", description: "Another placeholder description. This area will contain your blog summary.")),
              ],
            ),

            const SizedBox(height: 60),

            // ===================== SECTION 4 (Featured Works Header) =====================
            const Text("Featured Works", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Work items
            const WorkItem(title: "Designing Dashboards", date: "2025", subtitle: "Dashboard / UI Design", description: "This is some placeholder content about the work. Add more details here to describe the project clearly."),
            const SizedBox(height: 20),
            const WorkItem(title: "Mobile App Redesign", date: "2024", subtitle: "App / UX Case Study", description: "More placeholder text for the second featured work item. Describe your case study or app redesign here."),
            const SizedBox(height: 20),
            const WorkItem(title: "Landing Page UI", date: "2023", subtitle: "Web / Frontend Project", description: "Details about this landing page design project. This is only placeholder text for now."),
          ],
        ),
      ),
    );
  }
}