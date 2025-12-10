class ContactModel {
  final String email;
  final String phone;
  final String location;

  const ContactModel({
    required this.email,
    required this.phone,
    required this.location,
  });

  static const ContactModel defaultContact = ContactModel(
    email: "nmhmd7602@gmail.com",
    phone: "+20 1008669371",
    location: "Cairo, Egypt",
  );
}

class ContactFormModel {
  final String name;
  final String email;
  final String message;

  const ContactFormModel({
    required this.name,
    required this.email,
    required this.message,
  });

  bool get isValid => name.isNotEmpty && email.isNotEmpty && message.isNotEmpty;
}
