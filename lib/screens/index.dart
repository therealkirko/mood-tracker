import 'package:flutter/material.dart';
import 'package:mood/painters/mood_face_painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(painter: MoodFacePainter()),
        ),
      ),
    );
  }
}