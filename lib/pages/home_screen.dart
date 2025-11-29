import 'package:flutter/material.dart';
import 'package:srevice_link/pages/masseage_page.dart';
import 'package:srevice_link/pages/request_list.dart';
import 'package:srevice_link/pages/services/home_repair_details.dart';
import 'package:srevice_link/pages/services/cleaning_details.dart';
import 'package:srevice_link/pages/services/plumbing_details.dart';
import 'package:srevice_link/pages/services/electrical_details.dart';
import 'package:srevice_link/pages/services/painting_details.dart';
import 'package:srevice_link/pages/services/more_details.dart';

import 'package:srevice_link/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeContent(),
    MyRequestsPage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xFF818CF8),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() => selectedIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "My Requests",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HOME MAIN CONTENT =================
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    final List<String> categories = [
      "Home Repair",
      "Cleaning",
      "Plumbing",
      "Electrical",
      "Painting",
      "More",
    ];

    final List<IconData> icons = [
      Icons.home_repair_service,
      Icons.cleaning_services,
      Icons.plumbing,
      Icons.electrical_services,
      Icons.format_paint,
      Icons.more_horiz,
    ];

    final List<Color> bgColors = [
      Colors.indigo,
      Colors.green,
      Colors.pink,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];

    final List<Widget> pages = [
      HomeRepairDetails(),
      CleaningDetails(),
      PlumbingDetailsPage(),
      ElectricalDetails(),
      PaintingDetails(),
      MoreDetails(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: dark
            ? const Color(0xFF111827)
            : const Color(0xFFF9FAFB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Welcome back,",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Text("Jane Doe", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/women/44.jpg",
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: dark ? Colors.grey.shade900 : Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search for a service...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // HEADING
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            // GRID VIEW
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages[index]),
                        );
                      },
                      child: CategoryTile(
                        title: categories[index],
                        icon: icons[index],
                        color: bgColors[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CATEGORY TILE =================
class CategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryTile({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: dark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withOpacity(dark ? 0.4 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
