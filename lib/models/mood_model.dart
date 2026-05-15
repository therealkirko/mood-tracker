import 'dart:ui';

enum MoodType { happy, neutral, sad }

extension MoodTypeData on MoodType {
  static MoodType get defaultValue => MoodType.neutral;

  String get label {
    switch (this) {
      case MoodType.happy:
        return 'Happy';
      case MoodType.neutral:
        return 'Okay';
      case MoodType.sad:
        return 'Sad';
    }
  }

  Color get softColor {
    switch (this) {
      case MoodType.happy:
        return const Color(0xFFFBEAD9);
      case MoodType.neutral:
        return const Color(0xFFF1E2E8);
      case MoodType.sad:
        return const Color(0xFFE0E4E8);
    }
  }

class MoodEntry {
  final MoodType mood;
  final DateTime timestamp;

  const MoodEntry({required this.mood, required this.timestamp});
}