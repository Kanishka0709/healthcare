import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'edit_profile_page.dart'; // Import the new edit profile page

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              // Top half with blue background
              Container(
                color: const Color(0xFF4B5EFC), // Blue color
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openDrawer(); // Open the drawer
                          },
                        ),
                        const Text(
                          'Pune',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildSearchBar(),
                    const SizedBox(height: 12),
                    const Text(
                      'Find a Doctor for your Health Problem',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom half with white background
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GridView.count(
                    padding: const EdgeInsets.all(12.0),
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _buildServiceCard('General\nDentist', Icons.local_hospital),
                      _buildServiceCard('Skin &\nChild', Icons.health_and_safety),
                      _buildServiceCard('Women\'s\nHealth', Icons.woman),
                      _buildServiceCard('Ear,\nNose & Throat', Icons.hearing),
                      _buildServiceCard('Mental\nHealth', Icons.psychology),
                      _buildServiceCard('More', Icons.more_horiz),
                    ],
                  ),
                ),
              ),
              // Consulted doctors section
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Doctors you have consulted',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildConsultedDoctor('Dr. Anil Soni', 'Dermatologist'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      drawer: _buildDrawer(context), // Add the drawer
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF4B5EFC),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF4B5EFC)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'KANISHKA', // Replace with actual user name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'user@example.com', // Replace with actual user email
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('View and edit profile'),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
            },
          ),
          // Add more options here if needed
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search for clinics and hospitals',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF4B5EFC)),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: const Color(0xFF4B5EFC)),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultedDoctor(String name, String specialty) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF4B5EFC),
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name, style: const TextStyle(fontSize: 14)),
      subtitle: Text(specialty, style: const TextStyle(fontSize: 12)),
    );
  }
} 
