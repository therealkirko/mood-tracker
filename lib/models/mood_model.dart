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
}

class MoodEntry {
  final MoodType mood;
  final DateTime timestamp;

  const MoodEntry({required this.mood, required this.timestamp});
}