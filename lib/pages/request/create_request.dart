import 'package:flutter/material.dart';

class CreateRequestPage extends StatefulWidget {
  const CreateRequestPage({super.key});

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends State<CreateRequestPage> {
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void dispose() {
    serviceController.dispose();
    addressController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark
            ? const Color(0xFF121212)
            : const Color(0xFFF8F9FA),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: const Text("Create Request"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    /// SERVICE DETAILS
                    buildTitle("Service Details"),
                    buildTextArea(
                      controller: serviceController,
                      hint: "e.g., Fix leaking kitchen sink",
                      maxLines: 4,
                      dark: dark,
                    ),

                    const SizedBox(height: 20),

                    /// ADDRESS
                    buildTitle("Address"),
                    buildTextArea(
                      controller: addressController,
                      hint: "Enter your service location address",
                      maxLines: 3,
                      dark: dark,
                    ),

                    const SizedBox(height: 20),

                    /// CONTACT NUMBER
                    buildTitle("Contact Number"),
                    buildTextField(
                      controller: contactController,
                      hint: "07XXXXXXXX",
                      keyboardType: TextInputType.phone,
                      dark: dark,
                    ),

                    const SizedBox(height: 20),

                    /// DATE PICKER
                    buildTitle("Preferred Date"),
                    buildPickerField(
                      hint: selectedDate == null
                          ? "Select date"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      icon: Icons.calendar_today,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );

                        if (picked != null) {
                          setState(() => selectedDate = picked);
                        }
                      },
                      dark: dark,
                    ),

                    const SizedBox(height: 20),

                    /// TIME PICKER
                    buildTitle("Preferred Time"),
                    buildPickerField(
                      hint: selectedTime == null
                          ? "Select time"
                          : selectedTime!.format(context),
                      icon: Icons.schedule,
                      onTap: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime ?? TimeOfDay.now(),
                        );

                        if (picked != null) {
                          setState(() => selectedTime = picked);
                        }
                      },
                      dark: dark,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),

              /// SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A7BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Submit Request",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== UI HELPERS =====

  Widget buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildTextArea({
    required TextEditingController controller,
    required String hint,
    required int maxLines,
    required bool dark,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: dark ? const Color(0xFF1E1E1E) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required TextInputType keyboardType,
    required bool dark,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: dark ? const Color(0xFF1E1E1E) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildPickerField({
    required String hint,
    required IconData icon,
    required VoidCallback onTap,
    required bool dark,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: dark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hint),
            Icon(icon, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // ===== SUBMIT FUNCTION =====

  void submitRequest() {
    if (serviceController.text.isEmpty ||
        addressController.text.isEmpty ||
        contactController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    debugPrint("SERVICE: ${serviceController.text}");
    debugPrint("ADDRESS: ${addressController.text}");
    debugPrint("CONTACT: ${contactController.text}");
    debugPrint("DATE: $selectedDate");
    debugPrint("TIME: ${selectedTime!.format(context)}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Request Submitted Successfully")),
    );
  }
}
