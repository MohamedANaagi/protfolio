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
      url: null, // يمكنك إضافة الرابط هنا
    ),
    WorkModel(
      id: '2',
      title: "Mobile App Redesign",
      date: "2024",
      subtitle: "App / UX Case Study",
      description:
          "More placeholder text for the second featured work item. Describe your case study or app redesign here.",
      imageUrl: "assets/images/041fbc18-1b4c-45d6-8a60-943db379779e.JPG",
      url: null, // يمكنك إضافة الرابط هنا
    ),
    WorkModel(
      id: '3',
      title: "Landing Page UI",
      date: "2023",
      subtitle: "Web / Frontend Project",
      description:
          "Details about this landing page design project. This is only placeholder text for now.",
      imageUrl: "assets/images/1.jpeg",
      url: null, // يمكنك إضافة الرابط هنا
    ),
    WorkModel(
      id: '4',
      title: "E-commerce Platform",
      date: "2022",
      subtitle: "Web / Fullstack Project",
      description:
          "This is a placeholder for an e-commerce platform project. Explain features and design approach.",
      imageUrl: "assets/images/1.jpeg",
      url: null, // يمكنك إضافة الرابط هنا
    ),
  ];
}
