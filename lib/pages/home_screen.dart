import 'package:flutter/material.dart';
import 'package:srevice_link/pages/services/home_repair.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: dark
            ? const Color(0xFF111827)
            : const Color(0xFFF9FAFB),

        // ===================== APP BAR ===================== //
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: const NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCL-1v_xZwAIJgy2KshHIbyX27chs0Oa9LEWqx_BW35zJBcqD1AqQiYyLEVhtCzarVZDSydAtFykxpQWVhgecY1yfxmSq5yXEavmEdQGycV3zLyyzscv6Qyi3SkgcIGU98zWcMYnUsGZ2zNr0FyprRpVU86rA9wKLi5uOQqHl2qmTXTj1CZgYznorECaFiatkaMjOcKszncqzANF9hBhX_jQ3ao2AKOzA92EcEkxm_SZrRHFZcnAlB_gHPc03IkDgeBdNQO48tLchE",
                ),
              ),
            ),
          ],
        ),

        // ===================== BODY ===================== //
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SEARCH BOX
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

              // TITLE
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              // GRID
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeRepairPage(),
                            ),
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

        // ===================== BOTTOM NAV ===================== //
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() => selectedIndex = index);
          },
          selectedItemColor: const Color(0xFF818CF8),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
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

// ===================== CATEGORY TILE ===================== //
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
          // ICON CIRCLE
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
