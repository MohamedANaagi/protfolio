import '../models/blog_post_model.dart';

class BlogController {
  List<BlogPostModel> get allPosts => BlogPostModel.defaultPosts;
}
