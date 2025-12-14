class ProfileModel {
  final String name;
  final String title;
  final String description;
  final String imagePath;
  final String resumeUrl;

  const ProfileModel({
    required this.name,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.resumeUrl,
  });

  static const ProfileModel defaultProfile = ProfileModel(
    name: "Mohamed Ahmed Nagi",
    title: "Software Engineer",
    description:
        "I am a Software Engineer with a strong focus on cross-platform mobile development using Flutter and React Native.\n"
        "I build clean, scalable, and high-performance applications, with attention to UI quality, user experience, and modern development practices.\n"
        "I enjoy transforming ideas into functional products that deliver real value to users.",
    imagePath: "assets/images/d.jpeg",
    resumeUrl:
        'https://drive.google.com/file/d/1hIrmtLoavErVho7a3ZnZDHRL4S1vIalG/view?usp=drive_link',
  );
}
