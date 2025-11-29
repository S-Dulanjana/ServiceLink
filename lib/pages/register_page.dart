import 'package:flutter/material.dart';
import 'login_page.dart'; // Make sure this exists

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String userType = "Customer";
  bool hidePassword = true;

  // Mock database of registered emails
  final List<String> registeredEmails = [
    "test@example.com",
    "already@registered.com",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: const Text(
                  "Let’s get you started!",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),

              // FULL NAME
              buildInput(
                controller: nameController,
                label: "Full Name",
                hint: "Full Name",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              // EMAIL
              buildInput(
                controller: emailController,
                label: "Email Address",
                hint: "your@email.com",
                icon: Icons.mail_outline,
                keyboard: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // PASSWORD
              buildInput(
                controller: passwordController,
                label: "Password",
                hint: "Enter your password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // USER TYPE
              const Text(
                "I am a...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  userTypeButton("Customer"),
                  const SizedBox(width: 10),
                  userTypeButton("Service Provider"),
                ],
              ),

              const SizedBox(height: 25),

              // REGISTER BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF818CF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: registerUser,
                  child: const Text("Register", style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 15),

              // LOGIN LINK
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already registered?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================
  // INPUT FIELD WIDGET
  // =====================
  Widget buildInput({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword ? hidePassword : false,
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => hidePassword = !hidePassword);
                    },
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ],
    );
  }

  // =====================
  // USER TYPE BUTTON
  // =====================
  Widget userTypeButton(String value) {
    final selected = userType == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => userType = value),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF818CF8) : Colors.transparent,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // =====================
  // REGISTER LOGIC
  // =====================
  void registerUser() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Check required fields
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showError("All fields are required");
      return;
    }

    // Check email format
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      showError("Please enter a valid email address");
      return;
    }

    // Check if email already registered
    if (registeredEmails.contains(email.toLowerCase())) {
      showError("This email is already registered");
      return;
    }

    // If all validations pass
    registeredEmails.add(email.toLowerCase());

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Registration Successful")));

    // Navigate to login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
