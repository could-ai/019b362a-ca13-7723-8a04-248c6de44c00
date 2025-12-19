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
      backgroundColor: Colors.black,
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
              color: const Color(0xFF1DB954),
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
              color: const Color(0xFF40BCF4), // Letterboxd Blue/Green/Orange mix - using blue for contrast
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
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor: Colors.white24,
                  disabledForegroundColor: Colors.white38,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
    required Color color,
    required bool isConnected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: isConnected ? Border.all(color: color, width: 2) : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 30),
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
                      color: isConnected ? color : Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            if (isConnected)
              Icon(Icons.check_circle, color: color)
            else
              const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
          ],
        ),
      ),
    );
  }
}
