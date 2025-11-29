import 'package:flutter/material.dart';
import 'package:srevice_link/pages/request/create_request.dart';

class HomeRepairPage extends StatelessWidget {
  const HomeRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // TOP IMAGE WITH BACK BUTTON
                  Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          "https://api.gharpedia.com/wp-content/uploads/2018/08/0602030005-01-Plumbers.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 250,
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
                        top: 10,
                        left: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),

                  // CONTENT
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: dark ? const Color(0xFF121212) : Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TITLE & FAVORITE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                "Professional Plumbing Service",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: dark ? Colors.white : Colors.grey,
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // RATING
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              "4.9",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "(231 reviews)",
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
                          "Expert plumbing solutions for your home. "
                          "From leaky faucets to major pipe repairs, our certified "
                          "professionals handle it all with efficiency and care.",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        // INFO CARDS
                        Row(
                          children: const [
                            Expanded(
                              child: InfoCard(
                                title: "Starting Price",
                                value: "\$49",
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: InfoCard(
                                title: "Availability",
                                value: "Mon-Sat",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 26),

                        // REVIEWS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        const ReviewTile(
                          name: "Sarah L.",
                          comment:
                              "Incredibly fast and professional. Fixed my issue in under an hour!",
                          stars: 5,
                        ),

                        const ReviewTile(
                          name: "Mike R.",
                          comment:
                              "Good service, but a bit pricey. Overall satisfied.",
                          stars: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM BUTTON
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: dark ? Colors.black : Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateRequestPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B5CE2).withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Create Request",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// INFO CARD
class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const Icon(Icons.info, color: Color(0xFF5B5CE2)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
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

// REVIEW TILE
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
                    (index) => Icon(
                      index < stars ? Icons.star : Icons.star_border,
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
