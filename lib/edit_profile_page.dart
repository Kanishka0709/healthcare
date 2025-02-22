import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Variables to store user input for medical fields
  String allergies = '';
  String currentMedications = '';
  String pastMedications = '';
  String chronicDiseases = '';
  String injuries = '';
  String surgeries = '';

  // Variables to store user input for lifestyle fields
  String smokingHabits = '';
  String alcoholConsumption = '';
  String activityLevel = '';
  String foodPreference = '';
  String occupation = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KANISHKA'), // User's name
          backgroundColor: const Color(0xFF4B5EFC),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Personal'),
              Tab(text: 'Medical'),
              Tab(text: 'Lifestyle'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPersonalTab(context),
            _buildMedicalTab(context),
            _buildLifestyleTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalTab(BuildContext context) {
    return SingleChildScrollView(
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
                  _showPhotoOptions(context);
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.camera_alt, size: 24, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'KANISHKA',
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

          const SizedBox(height: 20),

          // Complete profile button
          ElevatedButton(
            onPressed: () {
              // Handle complete profile action
            },
            child: const Text('Complete profile'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xFF4B5EFC),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '9% completed',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMedicalField(context, 'Allergies', (value) {
            setState(() {
              allergies = value;
            });
          }, allergies),
          _buildMedicalField(context, 'Current Medications', (value) {
            setState(() {
              currentMedications = value;
            });
          }, currentMedications),
          _buildMedicalField(context, 'Past Medications', (value) {
            setState(() {
              pastMedications = value;
            });
          }, pastMedications),
          _buildMedicalField(context, 'Chronic Diseases', (value) {
            setState(() {
              chronicDiseases = value;
            });
          }, chronicDiseases),
          _buildMedicalField(context, 'Injuries', (value) {
            setState(() {
              injuries = value;
            });
          }, injuries),
          _buildMedicalField(context, 'Surgeries', (value) {
            setState(() {
              surgeries = value;
            });
          }, surgeries),
        ],
      ),
    );
  }

  Widget _buildLifestyleTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLifestyleField(context, 'Smoking Habits', (value) {
            setState(() {
              smokingHabits = value;
            });
          }, smokingHabits),
          _buildLifestyleField(context, 'Alcohol Consumption', (value) {
            setState(() {
              alcoholConsumption = value;
            });
          }, alcoholConsumption),
          _buildLifestyleField(context, 'Activity Level', (value) {
            setState(() {
              activityLevel = value;
            });
          }, activityLevel),
          _buildLifestyleField(context, 'Food Preference', (value) {
            setState(() {
              foodPreference = value;
            });
          }, foodPreference),
          _buildLifestyleField(context, 'Occupation', (value) {
            setState(() {
              occupation = value;
            });
          }, occupation),
        ],
      ),
    );
  }

  Widget _buildMedicalField(BuildContext context, String title, Function(String) onUpdate, String currentValue) {
    return GestureDetector(
      onTap: () {
        _showYesNoDialog(context, title, onUpdate);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              currentValue.isNotEmpty ? currentValue : 'Add details',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLifestyleField(BuildContext context, String title, Function(String) onUpdate, String currentValue) {
    return GestureDetector(
      onTap: () {
        _showYesNoDialog(context, title, onUpdate);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              currentValue.isNotEmpty ? currentValue : 'Add details',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  void _showYesNoDialog(BuildContext context, String title, Function(String) onUpdate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you have $title?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _showInputDialog(context, title, onUpdate); // Show input dialog
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showInputDialog(BuildContext context, String title, Function(String) onUpdate) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter details for $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Add details'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onUpdate(controller.text); // Update the value
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _showPhotoOptions(BuildContext context) {
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
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
      ),
    );
  }
} 