import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/connect_services_screen.dart';
import 'screens/main_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasteMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: const Color(0xFF1DB954), // Spotify Green
          surface: Colors.black,
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/connect': (context) => const ConnectServicesScreen(),
        '/home': (context) => const MainShell(),
      },
    );
  }
}
