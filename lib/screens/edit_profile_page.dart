import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Edite Profile", // Replicating the typo as per the image
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0, // Adjusted to match the image
                  child: CircleAvatar(
                    radius: 15, // Slightly larger to match the image
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit, // Changed to edit icon
                      color: Colors.white,
                      size: 15, // Smaller icon to match the image
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Adjusted spacing
          _buildEditableField(label: "User Name", hint: "Nada Ali"),
          _buildEditableField(label: "E-mail", hint: "nada@gmail.com"), // Replicating the typo
          _buildEditableField(label: "Phone", hint: "0123456789"),
          _buildEditableField(label: "Gender", hint: "Famale"), // Replicating the typo
          _buildEditableField(label: "Date of Birth", hint: ""), // Empty as per the image
        ],
      ),
    );
  }

  Widget _buildEditableField({required String label, required String hint}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey, // Lighter gray to match the image
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            initialValue: hint,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.edit,
                size: 16, // Smaller icon to match the image
                color: Colors.grey, // Gray color to match the image
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12, // Adjusted padding for better alignment
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Smaller radius to match the image
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EditProfilePage(),
  ));
}