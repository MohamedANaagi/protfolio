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
      id: '3',
      title: "Todo App — React Native & Convex",
      date: "2025",
      subtitle: "Mobile Development Project",
      description:
          "A lightweight todo application built with React Native, \nExpo, Convex, and TypeScript, \nfocusing on real-time data syncing and clean component-based UI design.",

      imageUrl: "assets/images/3.jpeg",
      url:
          "https://drive.google.com/drive/folders/1lb0QXEEBmEDBTHh7-fcQMOmi8IuVRWM1?usp=drive_link", // يمكنك إضافة الرابط هنا
    ),
    WorkModel(
      id: '2',
      title: "Mobile App Redesign",
      date: "2024",
      subtitle: "App / UX Case Study",
      description:
          "More placeholder text for the second featured work item. Describe your case study or app redesign here.",
      imageUrl: "assets/images/041fbc18-1b4c-45d6-8a60-943db379779e.JPG",
      url:
          "https://drive.google.com/drive/folders/1lb0QXEEBmEDBTHh7-fcQMOmi8IuVRWM1?usp=drive_link", // يمكنك إضافة الرابط هنا
    ),
  ];
}
