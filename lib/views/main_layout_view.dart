import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MainLayoutView extends StatelessWidget {
  final Widget child;
  const MainLayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

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
            horizontal: MediaQuery.of(context).size.width > 1200 ? 120 : 40,
          ),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      "Mohamed Ahmed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF1F2937),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _navButton(context, "Works", '/works', currentRoute == '/works'),
              const SizedBox(width: 8),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF6366F1).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
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
