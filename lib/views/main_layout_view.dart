import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MainLayoutView extends StatelessWidget {
  final Widget child;
  const MainLayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      // ====== AppBar ======
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 1200
                ? 120
                : screenWidth > 768
                ? 40
                : 16,
          ),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      isMobile ? "M. Ahmed" : "Mohamed Ahmed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 18 : 22,
                        color: const Color(0xFF1F2937),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _navButton(context, "Works", '/works', currentRoute == '/works'),
              SizedBox(width: isMobile ? 4 : 8),
              _navButton(
                context,
                "Contact",
                '/contact',
                currentRoute == '/contact',
              ),
            ],
          ),
        ),
      ),

      // ====== Body ======
      body: Column(
        children: [
          Expanded(child: child),

          // ====== Footer ======
        ],
      ),
    );
  }

  Widget _navButton(
    BuildContext context,
    String label,
    String route,
    bool isActive,
  ) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 20,
            vertical: isMobile ? 10 : 12,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF6366F1).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: isActive
                  ? const Color(0xFF6366F1)
                  : const Color(0xFF4B5563),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
