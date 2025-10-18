import 'package:flutter/material.dart';

void main() {
  runApp(const ModernProfile());
}

class ModernProfile extends StatelessWidget {
  const ModernProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF6FAFB),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00C6A7), Color(0xFF1EAE98)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/image/profile.png'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Florence Einstein B. Matunog",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Flutter App Developer",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _infoCard(Icons.phone, "Phone", "+63 923 423 234"),
                  const SizedBox(height: 10),
                  _infoCard(Icons.email, "Email", "Florenceeinstein.matunog@normi.edu.ph"),
                  const SizedBox(height: 10),
                  _infoCard(Icons.location_on, "Address", "Butuan City, Agusan del Norte"),
                  const SizedBox(height: 25),

                  // About Section
                  _sectionTitle("About Me"),
                  const SizedBox(height: 10),
                  const Text(
                    "I am a passionate Flutter developer who loves creating modern, efficient, and user-friendly applications. I enjoy bringing ideas to life and learning new technologies to improve my craft.",
                    style: TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 25),

                  // Skills Section
                  _sectionTitle("Skills"),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _skillChip("Flutter"),
                      _skillChip("Firebase"),
                      _skillChip("UI/UX Design"),
                      _skillChip("REST APIs"),
                      _skillChip("Dart"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Connect Section
                  _sectionTitle("Connect with Me"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Icons.facebook, Colors.blue),
                      const SizedBox(width: 20),
                      _socialButton(Icons.camera_alt, Colors.purple),
                      const SizedBox(width: 20),
                      _socialButton(Icons.language, Colors.teal),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Info Card Widget
  static Widget _infoCard(IconData icon, String title, String detail) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.teal.withOpacity(0.1),
            child: Icon(icon, color: Colors.teal),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54)),
              Text(
                detail,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Section Title Widget
  static Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Skill Chip Widget
  static Widget _skillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.teal.withOpacity(0.15),
      labelStyle: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
    );
  }

  // Social Button Widget
  static Widget _socialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
