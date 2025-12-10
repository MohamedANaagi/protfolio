import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController {
  final ContactModel contact = ContactModel.defaultContact;

  Future<void> sendEmail() async {
    final uri = Uri.parse('mailto:${contact.email}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> makePhoneCall() async {
    final uri = Uri.parse('tel:${contact.phone}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> copyToClipboard(String text, BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text('Copied: $text'),
            ],
          ),
          backgroundColor: const Color(0xFF6366F1),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<bool> submitContactForm({
    required String name,
    required String email,
    required String message,
    required BuildContext context,
  }) async {
    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      return false;
    }

    // Here you would typically send the form data to a backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Thank you for your message! I\'ll get back to you soon.',
        ),
        backgroundColor: const Color(0xFF6366F1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
    return true;
  }
}
