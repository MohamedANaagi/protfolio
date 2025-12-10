import 'package:flutter/material.dart';
import '../controllers/contact_controller.dart';

class ContactView extends StatelessWidget {
  final ContactController controller = ContactController();

  ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 1200
            ? 120.0
            : screenWidth > 768
            ? 60.0
            : 24.0,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Get In Touch",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "I'd love to hear from you. Feel free to reach out through the contact information below.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 60),

          // Contact Content
          _buildContactInfo(context),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactItem(
          context: context,
          icon: Icons.email,
          title: "Email",
          subtitle: controller.contact.email,
          onTap: () => controller.sendEmail(),
          onCopy: () =>
              controller.copyToClipboard(controller.contact.email, context),
        ),
        const SizedBox(height: 24),
        _contactItem(
          context: context,
          icon: Icons.phone,
          title: "Phone",
          subtitle: controller.contact.phone,
          onTap: () => controller.makePhoneCall(),
          onCopy: () =>
              controller.copyToClipboard(controller.contact.phone, context),
        ),
        const SizedBox(height: 24),
        _contactItem(
          context: context,
          icon: Icons.location_on,
          title: "Location",
          subtitle: controller.contact.location,
          onTap: null,
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF6366F1).withOpacity(0.1),
                const Color(0xFF8B5CF6).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF6366F1).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's work together",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your visions.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
    VoidCallback? onCopy,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: onTap != null
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF6366F1), size: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
          if (onCopy != null)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onCopy,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.copy,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
