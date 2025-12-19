import 'package:flutter/material.dart';

class ConnectServicesScreen extends StatefulWidget {
  const ConnectServicesScreen({super.key});

  @override
  State<ConnectServicesScreen> createState() => _ConnectServicesScreenState();
}

class _ConnectServicesScreenState extends State<ConnectServicesScreen> {
  bool isSpotifyConnected = false;
  bool isLetterboxdConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Build Your Profile',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Color(0xFF6A1B9A),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Connect your accounts to find people with similar taste.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 48),
            
            // Spotify Card
            _buildServiceCard(
              title: 'Spotify',
              icon: Icons.music_note,
              gradientColors: [const Color(0xFF1DB954), const Color(0xFF6A1B9A)],
              isConnected: isSpotifyConnected,
              onTap: () {
                setState(() {
                  isSpotifyConnected = !isSpotifyConnected;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isSpotifyConnected ? 'Spotify Connected!' : 'Spotify Disconnected'),
                    backgroundColor: const Color(0xFF1DB954),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 24),
            
            // Letterboxd Card
            _buildServiceCard(
              title: 'Letterboxd',
              icon: Icons.movie,
              gradientColors: [const Color(0xFF40BCF4), const Color(0xFF2196F3)],
              isConnected: isLetterboxdConnected,
              onTap: () {
                setState(() {
                  isLetterboxdConnected = !isLetterboxdConnected;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isLetterboxdConnected ? 'Letterboxd Connected!' : 'Letterboxd Disconnected'),
                    backgroundColor: const Color(0xFF40BCF4),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (isSpotifyConnected || isLetterboxdConnected)
                    ? () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C27B0),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF1A1A2E),
                  disabledForegroundColor: Colors.white38,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    required bool isConnected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors.map((color) => color.withOpacity(isConnected ? 0.8 : 0.5)).toList(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: isConnected ? Border.all(color: const Color(0xFF6A1B9A), width: 3) : null,
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    isConnected ? 'Connected' : 'Tap to connect',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            if (isConnected)
              const Icon(Icons.check_circle, color: Colors.white, size: 24)
            else
              const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }
}
