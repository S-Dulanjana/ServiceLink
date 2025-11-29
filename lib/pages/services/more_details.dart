import 'package:flutter/material.dart';

class MoreDetailsPage extends StatelessWidget {
  const MoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About Service Link"),
          centerTitle: true,
        ),

        backgroundColor: dark ? const Color(0xFF121212) : Colors.white,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ APP LOGO / IMAGE
                Center(
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2972/2972557.png",
                    height: 120,
                  ),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    "Service Link",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "Your one-stop solution for home services",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ ABOUT SECTION
                _sectionTitle("About the App"),
                _sectionText(
                  "Service Link is a mobile application built to connect customers "
                  "with professional service providers for home-related services like plumbing, "
                  "electrical work, repair, cleaning, and painting.",
                ),

                const SizedBox(height: 20),

                // ✅ FEATURES
                _sectionTitle("Features"),
                _featureItem("Browse services categorically"),
                _featureItem("Create service requests instantly"),
                _featureItem("Track service status"),
                _featureItem("Message service providers"),
                _featureItem("User profile management"),
                _featureItem("Dark mode support"),

                const SizedBox(height: 20),

                // ✅ CATEGORIES
                _sectionTitle("Available Services"),
                _serviceChip("Home Repair"),
                _serviceChip("Cleaning"),
                _serviceChip("Plumbing"),
                _serviceChip("Electrical"),
                _serviceChip("Painting"),
                _serviceChip("More coming soon..."),

                const SizedBox(height: 20),

                // ✅ SECURITY
                _sectionTitle("Security & Privacy"),
                _sectionText(
                  "Your personal data is protected through secure authentication "
                  "and encrypted storage. We do not share user information with third parties.",
                ),

                const SizedBox(height: 20),

                // ✅ SUPPORT
                _sectionTitle("Support"),
                _sectionText(
                  "If you need assistance, contact service@servicelink.lk "
                  "or use the Help & Support section in the Profile page.",
                ),

                const SizedBox(height: 30),

                // ✅ VERSION
                const Center(
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ SECTION TITLE
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // ✅ SECTION TEXT
  Widget _sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(text, style: const TextStyle(color: Colors.grey)),
    );
  }

  // ✅ FEATURE BULLET
  Widget _featureItem(String text) {
    return ListTile(
      leading: const Icon(Icons.check_circle, color: Colors.green),
      title: Text(text),
      contentPadding: EdgeInsets.zero,
    );
  }

  // ✅ SERVICE CHIP
  Widget _serviceChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Chip(
        avatar: const Icon(Icons.home_repair_service),
        label: Text(text),
      ),
    );
  }
}
