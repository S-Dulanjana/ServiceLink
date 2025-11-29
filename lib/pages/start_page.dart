import 'package:flutter/material.dart';
import 'package:srevice_link/pages/register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E293B),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Center content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo circle (Icons.handshake)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: 1,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.4),
                            blurRadius: 12,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.handshake,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // App name
                  const Text(
                    "ServiceLink",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Your needs, met with a tap.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Bottom loader animation
            Center(
              child: SizedBox(
                height: 80,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // "Get Start" Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    0xFF6366F1,
                  ).withOpacity(0.8), // light blue bg
                  foregroundColor: Colors.black, // black text
                  minimumSize: const Size(double.infinity, 50), // full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  "Get Start",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
