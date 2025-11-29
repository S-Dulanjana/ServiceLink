import 'package:flutter/material.dart';
import 'package:srevice_link/pages/request/create_request.dart';

class HomeRepairDetailsPage extends StatelessWidget {
  const HomeRepairDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: dark ? const Color(0xFF121212) : Colors.white,

        // ✅ FIXED BUTTON AREA
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          color: dark ? Colors.black : Colors.white,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateRequestPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B5CE2),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Create Request",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ IMAGE SECTION
              Stack(
                children: [
                  SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Image.network(
                      "https://t4.ftcdn.net/jpg/00/61/47/39/360_F_61473917_qV9KXySxtMhPxhKZMI43bPutXVU375do.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 5,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),

              // ✅ CONTENT
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: dark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    const Text(
                      "Home Repair & Maintenance",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // RATING
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 6),
                        Text(
                          "4.6",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(195 reviews)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // DESCRIPTION
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "We provide trusted home repair services including door fixing, furniture repair, wall repairs, carpentry, and general maintenance handled by skilled professionals.",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // INFO CARDS
                    Row(
                      children: const [
                        Expanded(
                          child: InfoCard(
                            title: "Starting Price",
                            value: "\$10",
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: InfoCard(
                            title: "Availability",
                            value: "Daily",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // REVIEWS HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Customer Reviews",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("See All", style: TextStyle(color: Colors.indigo)),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ✅ REVIEWS LIST
                    const ReviewTile(
                      name: "John Silva",
                      comment: "Fast and reliable home repair service.",
                      stars: 5,
                    ),
                    const ReviewTile(
                      name: "Dilshan Perera",
                      comment: "The technician was friendly and professional.",
                      stars: 4,
                    ),
                    const ReviewTile(
                      name: "Anu Fernando",
                      comment: "Quick response and reasonable pricing.",
                      stars: 5,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ INFO CARD
class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const Icon(Icons.home_repair_service, color: Color(0xFF5B5CE2)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ REVIEW TILE
class ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final int stars;

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      i < stars ? Icons.star : Icons.star_border,
                      size: 16,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Text(comment, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
