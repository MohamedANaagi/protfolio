class WorkModel {
  final String id;
  final String title;
  final String date;
  final String subtitle;
  final String description;
  final String? imageUrl;
  final String? url;

  const WorkModel({
    required this.id,
    required this.title,
    required this.date,
    required this.subtitle,
    required this.description,
    this.imageUrl,
    this.url,
  });

  static const List<WorkModel> defaultWorks = [
    WorkModel(
      id: '3',
      title: "Todo App — React Native & Convex",
      date: "2025",
      subtitle: "Mobile Development Project",
      description:
          "A lightweight todo application built with React Native, \nExpo, Convex, and TypeScript, \nfocusing on real-time data syncing and clean component-based UI design.",

      imageUrl: "assets/images/3.jpeg",
      url:
          "https://drive.google.com/drive/folders/142mjegxjS1SIkmsgXMB8QBgMCM8Rtt-9?usp=drive_link", // يمكنك إضافة الرابط هنا
    ),
    WorkModel(
      id: '1',
      title: "Meals App",
      date: "2025",
      subtitle: "Flutter • Recipes & Meal Management",
      description:
          "A fully responsive Flutter meals app using flutter_screenutil and google_fonts. Features include go_router navigation, shared_preferences for user settings, and sqflite with path for local recipe storage. The app also integrates onboarding flows and interactive UI elements using dots_indicator and carousel_slider.",
      imageUrl: "assets/images/1.jpeg",
      url:
          "https://drive.google.com/drive/folders/1H4aJX7etf0dlc6Cpc_3IxFgcf70akAjn?usp=drive_link",
    ),
    WorkModel(
      id: '4',
      title: "Pos-High",
      date: "2024",
      subtitle: "Flutter • Cashier & Kitchen Management System",
      description:
          "A comprehensive Point of Sale system for restaurants, built with Flutter, featuring three interconnected apps (Main Cashier, Sub Cashier, and Kitchen Display System). It supports real-time order synchronization, RESTful API integration, offline local storage, and LAN-based device communication, ensuring efficient workflow coordination and reduced operational errors.",
      imageUrl: "assets/images/WhatsApp Image 1447-06-25 at 06.56.00 (2).jpeg",
      url:
          "https://drive.google.com/drive/folders/1iF39txBToJGgrWWpZWRmfG0ygewetvcm?usp=drive_link",
    ),

    WorkModel(
      id: '2',
      title: "E-Commerce App",
      date: "2024",
      subtitle: "Flutter • E-Commerce App",
      description:
          "A mobile shopping app that enables users to browse products, manage carts, complete secure checkouts, track orders in real time, and receive notifications. Built with BLoC (Cubit), RESTful API integration, Dio, Sqflite, Cache, and Firebase to ensure a smooth and scalable user experience.",
      imageUrl: "assets/images/041fbc18-1b4c-45d6-8a60-943db379779e.JPG",
      url:
          "https://www.linkedin.com/posts/mohamed-nagi-920034250_eabrcommerceabrapplication-apis-cache-activity-7249055885887500292-XwVQ?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAD3w0ygBDN_1YiuBwiqtormDCAaJAU_hDkE", // يمكنك إضافة الرابط هنا
    ),
  ];
}
