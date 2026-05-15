import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/widgets/mood_face.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: MoodType.values.map((mood) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoodFace(mood: mood), // The painter widget
                const SizedBox(height: 12),
                Text(
                  mood.label, // Using your extension
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}