import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/profile_model.dart';
import '../models/work_model.dart';

class HomeController {
  final ProfileModel profile = ProfileModel.defaultProfile;

  List<WorkModel> get featuredWorks => WorkModel.defaultWorks.take(1).toList();

  Future<void> downloadResume(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final url = Uri.parse(profile.resumeUrl);
    final canOpen = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!canOpen) {
      messenger.showSnackBar(
        SnackBar(
          content: const Text('Could not launch resume link'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }
}
