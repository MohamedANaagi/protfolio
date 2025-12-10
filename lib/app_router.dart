import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'views/main_layout_view.dart';
import 'views/home_view.dart';
import 'views/works_view.dart';
import 'views/contact_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MainLayoutView(child: HomeView()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Fade in animation for home page
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    ),
    GoRoute(
      path: '/works',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MainLayoutView(child: WorksView()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide animation for page transitions
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MainLayoutView(child: ContactView()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide animation for page transitions
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    ),
  ],
);
