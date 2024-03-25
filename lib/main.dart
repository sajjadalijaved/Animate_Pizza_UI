import 'package:flutter/material.dart';
import 'package:pizza_animation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFB325),
            secondary: const Color(0xFFFFB325),
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
          primaryColor: const Color(0xFF0A1529),
        ),
        home: const HomeScreen());
  }
}
