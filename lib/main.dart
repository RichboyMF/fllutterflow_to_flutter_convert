// lib/main.dart
import 'package:flutter/material.dart';
import 'config/theme/theme_config.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Testing Ground',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Respects system theme
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
