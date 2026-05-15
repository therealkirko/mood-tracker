import 'package:flutter/material.dart';
import 'package:mood/screens/index.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MoodTrackerApp());
}

class MoodTrackerApp extends StatelessWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme()
      ),
      home: const HomeScreen(),
    );
  }
}
