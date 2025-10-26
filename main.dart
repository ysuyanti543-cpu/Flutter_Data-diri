import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil KAI Style',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === Latar belakang gradien seperti KAI Access ===
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)], // ungu ke biru
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 15,
              shadowColor: Colors.black45,
              color: Colors.white.withOpacity(0.85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // FOTO PROFIL DENGAN EFEK LINGKARAN DAN BAYANGAN
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/azhar.jpg',
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.person,
                                  size: 90, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // NAMA
                    const Text(
                      'Budi Azhar',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A00E0),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Mahasiswa Informatika',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 25),
                    Divider(
                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                        thickness: 1),
                    const SizedBox(height: 16),

                    // INFO KONTAK
                    buildInfoRow(Icons.phone, '082130534328'),
                    buildInfoRow(Icons.email, 'budiazhar1922@gmail.com'),
                    buildInfoRow(Icons.location_on, 'Solo, Indonesia'),

                    const SizedBox(height: 25),

                    // TOMBOL SOSIAL MEDIA
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(Icons.facebook, Colors.blue),
                        const SizedBox(width: 16),
                        socialButton(Icons.camera_alt, Colors.purpleAccent),
                        const SizedBox(width: 16),
                        socialButton(Icons.message, Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk baris info kontak
  Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF8E2DE2).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: const Color(0xFF4A00E0), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol media sosial
  Widget socialButton(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, color: color, size: 26),
    );
  }
}
