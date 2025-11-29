import 'package:flutter/material.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      // APP BAR
      appBar: AppBar(
        title: const Text("My Requests"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // BODY
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RequestCard(
            title: "Home Cleaning",
            requestId: "#82415",
            date: "July 20, 2024",
            status: "Completed",
            statusColor: Color(0xFF065F46),
            statusBg: Color(0xFFD1FAE5),
            name: "Jane Doe",
            imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
          ),

          SizedBox(height: 16),

          RequestCard(
            title: "Plumbing Fix",
            requestId: "#82416",
            date: "July 25, 2024",
            status: "In Progress",
            statusColor: Color(0xFF1D4ED8),
            statusBg: Color(0xFFDBEAFE),
            name: "John Smith",
            imageUrl: "https://randomuser.me/api/portraits/men/12.jpg",
          ),

          SizedBox(height: 16),

          RequestCard(
            title: "AC Repair",
            requestId: "#82410",
            date: "July 15, 2024",
            status: "Canceled",
            statusColor: Colors.black54,
            statusBg: Colors.grey,
            faded: true,
          ),
        ],
      ),
    );
  }
}

// =====================
// REQUEST CARD WIDGET
// =====================

class RequestCard extends StatelessWidget {
  final String title;
  final String requestId;
  final String date;
  final String status;
  final Color statusColor;
  final Color statusBg;
  final String? name;
  final String? imageUrl;
  final bool faded;

  const RequestCard({
    super.key,
    required this.title,
    required this.requestId,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.statusBg,
    this.name,
    this.imageUrl,
    this.faded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: faded ? 0.6 : 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Request ID: $requestId",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // DATE
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 6),
                  Text(date, style: const TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 10),
              const Divider(),

              // FOOTER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (name != null && imageUrl != null)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(imageUrl!),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Assigned to",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text("View Details"),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
