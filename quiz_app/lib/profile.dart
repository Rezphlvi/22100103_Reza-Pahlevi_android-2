import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive design
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // Use a Scaffold for basic material design structure
      backgroundColor: Colors.lightBlue, // Dark background for contrast
      body: Center(
        child: SingleChildScrollView(
          // Allows scrolling if content overflows
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: screenSize.width * 0.15,
                backgroundColor: Colors.transparent, //  tidak ada latar putih
                child: ClipOval(
                  //  pastikan tetap berbentuk lingkaran
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.fill, //  penuhi lingkaran, tak ada ruang kosong
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),

              SizedBox(height: screenSize.height * 0.03), // Responsive spacing
              // Name
              const Text(
                'Nama Mahasiswa :',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70, // Slightly less prominent color
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                'Reza Pahlevi', // Static Name
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.02),

              // NPM
              const Text(
                'NPM :',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                '2210010327', // Static NPM
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.04),

              // Additional Static Data
              _buildInfoCard(
                context,
                icon: Icons.email,
                label: 'Email',
                value: 'rezphlvi17@gmail.com',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context,
                icon: Icons.phone,
                label: 'Telepon',
                value: '+62 85246648419',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context,
                icon: Icons.school,
                label: 'Jurusan',
                value: 'Teknik Informatika',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context,
                icon: Icons.calendar_today,
                label: 'Tanggal Lahir',
                value: ' 06 Maret 2003',
                screenSize: screenSize,
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: onBack, // TODO: tambahkan fungsi kembali
                child: const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build consistent info cards
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Size screenSize,
  }) {
    return Container(
      width: screenSize.width * 0.85, // Responsive width
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 7, 82, 123), // Card background color
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow for depth
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
