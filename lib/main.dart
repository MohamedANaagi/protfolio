import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'works_page.dart';
import 'blog_page.dart';
import 'contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => const MainLayout(child: HomePage())),
        GoRoute(path: '/works', builder: (_, __) => const MainLayout(child: WorksPage())),
        GoRoute(path: '/blog', builder: (_, __) => const MainLayout(child: BlogPage())),
        GoRoute(path: '/contact', builder: (_, __) => const MainLayout(child: ContactPage())),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ====== AppBar ======
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          color: Colors.white,
          child: Row(
            children: [
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text(
                  "My Portfolio",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
              const Spacer(),
              _navButton(context, "Works", '/works'),
              _navButton(context, "Blog", '/blog'),
              _navButton(context, "Contact", '/contact'),
            ],
          ),
        ),
      ),

      // ====== Body ======
      body: Column(
        children: [
          Expanded(child: child),

          // ====== Footer ======
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook, size: 28, color: Colors.blueAccent),
                    SizedBox(width: 20),
                    Icon(Icons.camera_alt, size: 28, color: Colors.pink),
                    SizedBox(width: 20),
                    Icon(Icons.travel_explore, size: 28, color: Colors.lightBlue),
                    SizedBox(width: 20),
                    Icon(Icons.work, size: 28, color: Colors.blueGrey),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "© 2025 Your Name. All rights reserved.",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => context.go(route),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
