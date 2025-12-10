class BlogPostModel {
  final String id;
  final String title;
  final String date;
  final String description;

  const BlogPostModel({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  static const List<BlogPostModel> defaultPosts = [];
}
