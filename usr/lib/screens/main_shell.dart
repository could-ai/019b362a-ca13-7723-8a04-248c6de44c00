import 'package:flutter/material.dart';
import 'tabs/discovery_tab.dart';
import 'tabs/stats_tab.dart';
import 'tabs/profile_tab.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const DiscoveryTab(),
    const StatsTab(),
    const ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A2E),
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.white38,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: _selectedIndex == 0
                    ? LinearGradient(colors: [const Color(0xFF6A1B9A), const Color(0xFF2196F3)])
                    : null,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.explore),
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: _selectedIndex == 1
                    ? LinearGradient(colors: [const Color(0xFF9C27B0), const Color(0xFF2196F3)])
                    : null,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bar_chart),
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: _selectedIndex == 2
                    ? LinearGradient(colors: [const Color(0xFF6A1B9A), const Color(0xFF9C27B0)])
                    : null,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
