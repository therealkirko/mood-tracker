import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/painters/mood_face_painter.dart';

class MoodFace extends StatelessWidget {
  final MoodType? mood;

  const MoodFace({
    super.key,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(80, 80),
      painter: MoodFacePainter(mood: mood),
    );
  }
}