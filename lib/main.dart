import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; 

void main() {
  runApp(const SkincareApp());
}

class SkincareApp extends StatelessWidget { //değişiklik yoksa stateless widget kullanılır
  const SkincareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skincare Katalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}