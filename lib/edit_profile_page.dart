import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KANISHKA'), // User's name
        backgroundColor: const Color(0xFF4B5EFC),
      ),
      body: SingleChildScrollView( // Allow scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photo upload section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Placeholder for photo upload functionality
                    _showPhotoOptions(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.camera_alt, size: 24, color: Colors.black), // Camera icon
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'KANISHKA', // Replace with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Input fields
            _buildTextField('Contact Number', '+91-8962070925'),
            _buildTextField('Email Id', 'Add email'),
            _buildTextField('Gender', 'Add gender'),
            _buildTextField('Date of Birth', 'yyyy mm dd'),
            _buildTextField('Blood Group', 'Add blood group'),
            _buildTextField('Marital Status', 'Add marital status'),
            _buildTextField('Height', 'Add height'),
            _buildTextField('Weight', 'Add weight'),
            _buildTextField('Emergency Contact', 'Add emergency details'),
            _buildTextField('Location', 'Add details'),

            const SizedBox(height: 20), // Add space before the button

            // Complete profile button
            ElevatedButton(
              onPressed: () {
                // Handle complete profile action
              },
              child: const Text('Complete profile'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width
                backgroundColor: const Color(0xFF4B5EFC), // Button color
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '9% completed', // Progress indicator
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhotoOptions(BuildContext context) {
    // Placeholder for photo upload functionality
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Choose a photo from:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  // Implement camera functionality
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  // Implement gallery functionality
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust padding
        ),
      ),
    );
  }
} 