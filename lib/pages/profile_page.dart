import 'package:flutter/material.dart';
import 'package:srevice_link/pages/home_screen.dart';
import 'package:srevice_link/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;
  bool darkMode = false;

  String userName = "Cameron Williamson";
  String userEmail = "cameron.will@example.com";

  static const String profileImageUrl =
      "https://lh3.googleusercontent.com/aida-public/AB6AXuBAyTSu3p8M4a_qurWYdYkUx_uHYHQB0c3Zis44bg_3sZBPKmlkLw4XfxnGSERbFuu5uKECXdle9C1v9LmOD53nqBDnaOdE7RXLlozGxhEV0Y-4JhhI5-_fQq3VWn9RWno3wN86z5yvrx9MsaBw2DKWqBayjqnGSbVmXhDBU08XOEruEuuCZAb7ufdx6ljlUkomGJfLDxLcUaspU3cFCBpRa7XR6ZEG2UXVU7GLpu_z5KBKd6IBaz2gNd1bBbLHX5OFlCnRrRJZMds";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
    _emailController.text = userEmail;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage when back arrow is clicked
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profileHeader(),
            const SizedBox(height: 25),

            _sectionTitle("ACCOUNT"),
            _sectionBox([
              _editableTile("Full Name", _nameController),
              _editableTile("Email", _emailController, isEmail: true),
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
                  if (darkMode) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Dark Mode Enabled")),
                    );
                  }
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

  Widget _profileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: NetworkImage(profileImageUrl),
        ),
        const SizedBox(height: 10),
        Text(
          userName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(userEmail, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.blue.shade100,
            elevation: 0,
          ),
          onPressed: _editProfileDialog,
          child: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

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
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("$title clicked")));
          },
        ),
        _divider(),
      ],
    );
  }

  Widget _editableTile(
    String title,
    TextEditingController controller, {
    bool isEmail = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.15),
            child: Icon(Icons.edit, color: Colors.blue),
          ),
          title: Text(title),
          subtitle: Text(controller.text),
          trailing: const Icon(Icons.edit),
          onTap: () => _editFieldDialog(title, controller, isEmail),
        ),
        _divider(),
      ],
    );
  }

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

  Widget _divider() {
    return const Divider(height: 1, indent: 72);
  }

  Widget _logoutButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.red.shade50,
        foregroundColor: Colors.red,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text("Log Out"),
    );
  }

  void _editProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                userName = _nameController.text;
                userEmail = _emailController.text;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Profile updated")));
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _editFieldDialog(
    String title,
    TextEditingController controller,
    bool isEmail,
  ) {
    final tempController = TextEditingController(text: controller.text);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: tempController,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => controller.text = tempController.text);
              if (controller == _nameController) userName = controller.text;
              if (controller == _emailController) userEmail = controller.text;
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("$title updated")));
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
