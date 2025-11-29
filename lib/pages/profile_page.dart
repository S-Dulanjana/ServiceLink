import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;
  bool darkMode = false;

  static const String profileImageUrl =
      "https://lh3.googleusercontent.com/aida-public/AB6AXuBAyTSu3p8M4a_qurWYdYkUx_uHYHQB0c3Zis44bg_3sZBPKmlkLw4XfxnGSERbFuu5uKECXdle9C1v9LmOD53nqBDnaOdE7RXLlozGxhEV0Y-4JhhI5-_fQq3VWn9RWno3wN86z5yvrx9MsaBw2DKWqBayjqnGSbVmXhDBU08XOEruEuuCZAb7ufdx6ljlUkomGJfLDxLcUaspU3cFCBpRa7XR6ZEG2UXVU7GLpu_z5KBKd6IBaz2gNd1bBbLHX5OFlCnRrRJZMds";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profileHeader(),
            const SizedBox(height: 25),

            _sectionTitle("ACCOUNT"),
            _sectionBox([
              _listTile(Icons.person, "Personal Information"),
              _listTile(Icons.credit_card, "Payment Methods"),
              _listTile(Icons.history, "Service History"),
              _listTile(Icons.lock, "Change Password"),
            ]),

            const SizedBox(height: 20),

            _sectionTitle("SETTINGS & PREFERENCES"),
            _sectionBox([
              _toggleTile(
                icon: Icons.notifications,
                title: "Notifications",
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() => notificationsEnabled = value);
                },
              ),
              _toggleTile(
                icon: Icons.dark_mode,
                title: "Appearance",
                value: darkMode,
                onChanged: (value) {
                  setState(() => darkMode = value);
                },
              ),
            ]),

            const SizedBox(height: 20),

            _sectionTitle("SUPPORT"),
            _sectionBox([
              _listTile(Icons.help, "Help & Support"),
              _listTile(Icons.description, "Terms of Service"),
            ]),

            const SizedBox(height: 25),

            _logoutButton(),
          ],
        ),
      ),
    );
  }

  // PROFILE HEADER
  Widget _profileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: NetworkImage(profileImageUrl),
        ),
        const SizedBox(height: 10),
        const Text(
          "Cameron Williamson",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          "cameron.will@example.com",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.blue.shade100,
            elevation: 0,
          ),
          onPressed: () {},
          child: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  // SECTION TITLE
  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 6),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // SECTION BOX
  Widget _sectionBox(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
      ),
      child: Column(children: children),
    );
  }

  // NORMAL TILE
  Widget _listTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.15),
            child: Icon(icon, color: Colors.blue),
          ),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        _divider(),
      ],
    );
  }

  // TOGGLE TILE
  Widget _toggleTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Column(
      children: [
        SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: Text(title),
          secondary: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.15),
            child: Icon(icon, color: Colors.blue),
          ),
        ),
        _divider(),
      ],
    );
  }

  // DIVIDER
  Widget _divider() {
    return const Divider(height: 1, indent: 72);
  }

  // LOGOUT BUTTON
  Widget _logoutButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.red.shade50,
        foregroundColor: Colors.red,
        elevation: 0,
      ),
      onPressed: () {},
      child: const Text("Log Out"),
    );
  }
}
