import 'package:flutter/material.dart';
import '../../models/mock_data.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Your Stats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Top Artists', Icons.music_note, const Color(0xFF1DB954)),
            const SizedBox(height: 16),
            _buildList(myTopArtists, const Color(0xFF1DB954)),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader('Top Movies', Icons.movie, const Color(0xFF40BCF4)),
            const SizedBox(height: 16),
            _buildList(myTopMovies, const Color(0xFF40BCF4)),
            
            const SizedBox(height: 32),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1DB954).withOpacity(0.2),
                    const Color(0xFF40BCF4).withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    'Taste Profile Analysis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your taste is 60% Melancholic and 40% Sci-Fi. You match best with people who enjoy introspective storytelling and atmospheric soundscapes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildList(List<String> items, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              ListTile(
                leading: Text(
                  '#${index + 1}',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                title: Text(
                  items[index],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              if (index < items.length - 1)
                Divider(color: Colors.grey[800], height: 1),
            ],
          );
        }),
      ),
    );
  }
}
