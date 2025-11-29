import 'package:flutter/material.dart';
import 'package:srevice_link/pages/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        // ✅ BACK ARROW ADDED HERE
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: dark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 30),
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Create an account or log in",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // FORM
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // EMAIL FIELD
                      buildInputField(
                        controller: emailController,
                        hint: "Enter your email",
                        label: "Email Address",
                        icon: Icons.mail_outline,
                        obscure: false,
                      ),

                      const SizedBox(height: 25),

                      // PASSWORD FIELD
                      buildInputField(
                        controller: passwordController,
                        hint: "Enter your password",
                        label: "Password",
                        icon: Icons.lock_outline,
                        obscure: obscureText,
                        suffix: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() => obscureText = !obscureText);
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      // REMEMBER + FORGOT
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() => rememberMe = value!);
                                },
                                activeColor: const Color(0xFF818CF8),
                              ),
                              const Text("Remember me"),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(color: Color(0xFF818CF8)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // CONTINUE BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            // TODO: Handle Login
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF818CF8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= INPUT FIELD ================= //
  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool obscure,
    Widget? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            suffixIcon: suffix,
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}
