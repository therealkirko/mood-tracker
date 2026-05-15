import 'package:flutter/material.dart';
import 'package:mood/models/mood_model.dart';
import 'package:mood/widgets/mood_face.dart';

class MoodPicker extends StatelessWidget {
  final ValueChanged<MoodType> onMoodSelected;

  const MoodPicker({super.key, required this.onMoodSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MoodType.values.map((mood) {
        return GestureDetector(
          onTap: () => onMoodSelected(mood),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE8E2D8)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoodFace(mood: mood),
                const SizedBox(height: 8),
                Text(mood.label),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
